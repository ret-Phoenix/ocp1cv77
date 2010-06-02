unit StatusList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, ADODB,
  OpenConf_TLB, FormSubSystemsMain, ComCtrls, SysUtils, Dialogs, Controls,
  FormEditCardStatus, StdVcl;

type
  TStatusList = class(TAutoObject, IStatusList)
  private
    frm: TfrmSubSystems;
    List: TListView;
    //vSSList: TTuningSubSystemsList;
    Config: IConfigurator;
  public
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy;

    procedure Delete; safecall;
    procedure Edit; safecall;
    procedure Add; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
    procedure Refresh; safecall;

  end;

implementation

uses ComServ;

constructor TStatusList.CreateObj(frmSS: TfrmSubSystems; vConfig:
  IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewStatuses;
  Config := vConfig;
end;

destructor TStatusList.Destroy;
begin
end;

procedure TStatusList.Delete;
var
  Q: TADOQuery;
  vStatusID: string;
begin
  if List.Selected = nil then
    exit;
  vStatusID := IntToStr(Integer(List.Selected.data));
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  Q := FRM.RunSQL(nil, 'select ID from ToDo where StatusID=' + vStatusID, 0);
  if not Q.IsEmpty then
  begin
    ShowMessage('На данный статус есть ссылки, сначала удалите их!');

    Q.First;
    while not Q.Eof do
    begin
      frm.Echo('Задача № ' + Q.FieldByName('ID').AsString);
      Q.Next;
    end;

  end
  else
  begin
    frm.RunSQL(nil, 'delete from Statuses where ID=' + vStatusID, 1);
  end;
end;

procedure TStatusList.Edit;
var
  i: integer;
begin
  if List.Selected = nil then
    exit;
  i := Integer(List.Selected.Data);
  OpenCard(i);
end;

procedure TStatusList.Add;
var
  i: integer;
begin
  i := 0;
  OpenCard(i);
end;

procedure TStatusList.OpenCard(var vID: SYSINT);
begin
  with TfrmEditCardStatus.Create(nil) do
  begin

    with QDocument do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from Statuses where ID=' + IntToStr(vID));
      Connection := frm.SubSystemConnection;
      Open;
      if vID = 0 then
        Insert
      else
        Edit;
    end;
    ShowModal;
    Free;
  end;

end;

procedure TStatusList.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
begin
  // обновим список на закладке задач на основной форме
  {
  frm.ComboBoxStatus.Items.BeginUpdate;
  frm.ComboBoxStatus.Items.Clear;
  frm.ComboBoxStatus.Items.Add('Все статусы');
  }
  // обновим основной список
  List.Items.BeginUpdate;
  List.Items.Clear;
  Q := frm.RunSQL(nil, 'select * from Statuses', 0);
  Q.First;
  while not Q.Eof do
  begin
    LItem := List.Items.Add;
    with LItem do
    begin
      Caption := Q.FieldByName('ID').AsString;
      Data := Pointer(Q.FieldByName('ID').AsInteger);
    end;
    with LItem.SubItems do
    begin
      Insert(0, Q.FieldByName('Name').AsString);
    end;
    //frm.ComboBoxStatus.Items.Add('(' + Q.FieldByName('ID').AsString + ') ' + Q.FieldByName('Name').AsString);
    Q.Next;
  end;
  List.Items.EndUpdate;
  //frm.ComboBoxStatus.Items.EndUpdate;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TStatusList, Class_StatusList,
    ciMultiInstance, tmApartment);
end.
