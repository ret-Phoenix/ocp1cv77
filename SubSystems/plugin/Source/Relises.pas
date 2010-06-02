unit Relises;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, ADODB,
  OpenConf_TLB, FormSubSystemsMain, ComCtrls, FormEditCardRelise, SysUtils,
  Dialogs, Controls;

type
  TRelises = class(TAutoObject, IConnectionPointContainer, IRelises)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IRelisesEvents;

    frm: TfrmSubSystems;
    List: TListView;
    Config: IConfigurator;

    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy;

    procedure Add; safecall;
    procedure Delete; safecall;
    procedure Edit; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
    procedure Refresh; safecall;
    function GetLinksByID(vID: SYSINT): WideString; safecall;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ, DB;

procedure TRelises.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IRelisesEvents;
end;

procedure TRelises.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

constructor TRelises.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewRelises;
  Config := vConfig;
  //  vSSList := TTuningSubSystemsList.CreateObj(frm);
end;

destructor TRelises.Destroy;
begin
end;
//------------------------------------------------------------------------------

procedure TRelises.Add;
var
  i: integer;
begin
  i := 0;
  OpenCard(i);
end;
//------------------------------------------------------------------------------

procedure TRelises.Delete;
var
  Q: TADOQuery;
  vReliseID: string;
begin
  if List.Selected = nil then
    exit;
  vReliseID := IntToStr(Integer(List.Selected.data));
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  Q := FRM.RunSQL(nil, 'select ID from ToDo where ReliseID=' + vReliseID, 0);
  if not Q.IsEmpty then
  begin
    ShowMessage('На данный релиз есть ссылки, сначала удалите их!');

    Q.First;
    while not Q.Eof do
    begin
      frm.Echo('Задача № ' + Q.FieldByName('ID').AsString);
      Q.Next;
    end;

  end
  else
  begin
    frm.RunSQL(nil, 'delete from Relises where ID=' + vReliseID, 1);
  end;
end;
//------------------------------------------------------------------------------

procedure TRelises.Edit;
var
  i: integer;
begin
  if List.Selected = nil then
    exit;
  i := Integer(List.Selected.Data);
  OpenCard(i);
end;
//------------------------------------------------------------------------------

procedure TRelises.OpenCard(var vID: SYSINT);
//var
//  vFileName: string;
begin
  with TfrmEditCardRelise.Create(nil) do
  begin
    frm.RunSQL(QListConfigs, 'select * from configs');
    frm.RunSQL(QListSubconfigs, 'select * from subconfigs');
    frm.RunSQL(QListUsers, 'select * from users');

    frm.RunSQL(QDocument, 'select * from Relises where ID = ' +
      IntToStr(vID));

    if vID = 0 then
    begin
      QDocument.Insert;
      QDocumentConfigID.AsInteger := frm.CurCfg;
      QDocumentSubConfigID.AsInteger := frm.CurSubCfg;
    end;

    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TRelises.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
  vSQLText: string;
  i: integer;
begin
  // обновим список релизов на закладке задач на основной форме
  {
  frm.ComboBoxRelises.Items.BeginUpdate;
  frm.ComboBoxRelises.Items.Clear;
  frm.ComboBoxRelises.Items.Add('Все релизы');
  }
  // обновим основной список
  List.Items.BeginUpdate;
  List.Items.Clear;
  vSQLText := 'select * from Relises where ConfigID=' + IntToStr(frm.CurCfg);
  i := frm.GetItemID(frm.ComboBoxSubconfigsOnRL);
  if i <> 0 then
    vSQLText := vSQLText + ' and ((SubconfigID=' + IntToStr(i) +
      ') or (SubconfigID=0))';

  Q := frm.RunSQL(nil, vSQLText, 0);
  Q.First;
  while not Q.Eof do
  begin
    LItem := List.Items.Add;
    with LItem do
    begin
      Caption := Q.FieldByName('Name').AsString;
      Data := Pointer(Q.FieldByName('ID').AsInteger);
    end;
    with LItem.SubItems do
    begin
      Insert(0, Q.FieldByName('DateLoadPlan').AsString);
      Insert(1, Q.FieldByName('DateLoadReal').AsString);
      Insert(2, frm.GetNameByID(Q.FieldByName('UserPlanID').AsInteger,
        'users'));
      Insert(2, frm.GetNameByID(Q.FieldByName('UserRealID').AsInteger,
        'users'));
    end;
    {
    frm.ComboBoxRelises.Items.Add('(' + Q.FieldByName('ID').AsString + ') ' +
      Q.FieldByName('Name').AsString);
      }
    Q.Next;
  end;
  List.Items.EndUpdate;
  //  frm.ComboBoxRelises.Items.EndUpdate;

end;

function TRelises.GetLinksByID(vID: SYSINT): WideString;
begin
  Result := frm.GetLinksText('ToDo', 'ReliseID', 'ToDo', IntToStr(vID))
end;

initialization
  TAutoObjectFactory.Create(ComServer, TRelises, Class_Relises,
    ciMultiInstance, tmApartment);
end.
