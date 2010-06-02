unit CfgList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, 
  FormSubSystemsMain, ADODB, ComCtrls, OpenConf_TLB, SysUtils,
  Windows, Messages, Dialogs, Controls,
  AvailableSubSystems, ObjectClasses, FormEditCardConfig, StdVcl;

type
  TCfgList = class(TAutoObject, IConnectionPointContainer, ICfgList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ICfgListEvents;

    frm: TfrmSubSystems;
    Config: IConfigurator;
    List: TListView;
    ListSub: TListView;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;

    destructor Destroy; override;

    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);

    procedure Refresh; safecall;
    procedure Add; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure Choice; safecall;
    procedure SetCurrentConfig; safecall;
    procedure SetConfigByName(const vName: WideString); safecall;
    procedure SubEdit; safecall;
    procedure SubRefresh; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;

  end;

implementation

uses ComServ, DB, Forms;
//------------------------------------------------------------------------------

procedure TCfgList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICfgListEvents;
end;
//------------------------------------------------------------------------------

procedure TCfgList.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;
//------------------------------------------------------------------------------

constructor TCfgList.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  Config := vConfig;
  List := frm.ListViewConfigs;
  ListSub := frm.ListViewSubconfigs;
end;
//------------------------------------------------------------------------------

destructor TCfgList.Destroy;
begin
end;
//------------------------------------------------------------------------------

procedure TCfgList.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
  s: string;
  //i: Integer;
begin
  try
    List.Items.Clear;
    Q := frm.RunSQL(nil, 'Select * from Configs Order by Name', 0);
    Q.First;
    while not Q.Eof do
    begin
      LItem := List.Items.Add;
      LItem.Caption := Q.Fields[1].AsString;
      LItem.Data := Pointer(Q.Fields[0].AsInteger);
      LItem.ImageIndex := 58;
      Q.Next;
    end;
    //Choice;
  except
    on E: Exception do
    begin
      s := 'Подсистемы: Обновление списка конфигураций'#13#10 +
        'Возникло исключение:'#13#10 + E.Message;
      frm.Echo(s);
      ShowMessage(s);
    end;

  end;
end;
//------------------------------------------------------------------------------

procedure TCfgList.Add;
var
  Q: TADOQuery;
  vrID: Integer;
  vrClass: WideString;
begin
  Q := frm.RunSQL(nil,'select id from todo where id=0');
  with Q do begin
    close;
    sql.Clear;
    sql.Add('select * from configs where Name = :pCDir');
    Parameters.ParamByName('pCDir').Value := Config.MetaData.TaskDef.Props[0];
    Open;
  end;
  if Q.IsEmpty then
  begin
    vrID := 0;
    vrClass := 'main';
    OpenCard(vrID);
  end
  else
  begin
    ShowMessage('Данная конфигурация уже зарегистрирована!');
  end;
end;
//------------------------------------------------------------------------------

procedure TCfgList.Edit;
var
  vrID: Integer;
  vrClass: WideString;
begin
  if List.Selected <> nil then
  begin
    //List.Selected.EditCaption;
    vrID := Integer(List.Selected.Data);
    vrClass := 'main';
    OpenCard(vrID);
  end;

end;
//------------------------------------------------------------------------------

procedure TCfgList.Delete;
var
  vID: string;
begin
  if List.Selected = nil then
    exit;

  if MessageDlg('Удалить конфигурацию?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vID := IntToStr(Integer(List.Selected.data));

    frm.RunSQL(nil,
      'Delete from SubSystemObjects where SubSystemID in (Select ID from SubSystems where ConfigID=' + vID
      + ') ', 1);
    frm.RunSQL(nil, 'Delete from SubSystems where ConfigID = ' + vId, 1);
    frm.RunSQL(nil, 'Delete from subconfigs where ConfigID = ' + vId, 1);
    frm.RunSQL(nil, 'Delete from Configs where ID = ' + vId, 1);
  end;
end;
//------------------------------------------------------------------------------

procedure TCfgList.Choice;
var
  CurItem: TListItem;
  i: Integer;
begin
  CurItem := List.Selected;
  if CurItem = nil then
    Exit;
  CurItem.ImageIndex := 13;
  frm.CurCfg := Integer(List.Selected.Data);
  for i := 0 to List.Items.Count - 1 do
  begin
    if CurItem <> List.Items.Item[i] then
      List.Items.Item[i].ImageIndex := 58;
  end;
  frm.ListConditions.Values['Конфигурация'] := '(' + IntToStr(frm.CurCfg) + ') '
    + List.Selected.Caption;
  frm.vRelisesList.Refresh;
  frm.vSubcfg.Refresh(frm.CurCfg);
end;
//------------------------------------------------------------------------------

procedure TCfgList.SetCurrentConfig;
var
  i: integer;
  s: string;
begin
  try
    Refresh;
    for i := 0 to List.Items.Count - 1 do
    begin
      if List.Items.Item[i].Caption = Config.MetaData.TaskDef.Props[0] then
      begin
        List.Items.Item[i].Selected := True;
        Choice;
      end;
    end;
  except
    on E: Exception do
    begin
      s := 'Подсистемы: Установка текущей конфигурации'#13#10 +
        'Возникло исключение:'#13#10 + E.Message;
      frm.Echo(s);
      ShowMessage(s);
    end;
  end;

end;
//------------------------------------------------------------------------------

procedure TCfgList.SetConfigByName(const vName: WideString);
  safecall;
var
  i: integer;
begin
  Refresh;
  for i := 0 to List.Items.Count - 1 do
  begin
    if List.Items.Item[i].Caption = vName then
    begin
      List.Items.Item[i].Selected := True;
      Choice;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TCfgList.SubEdit;
var
  vrID: Integer;
  vrClass: WideString;
begin
  if ListSub.Selected <> nil then
  begin
    vrID := Integer(ListSub.Selected.data);
    vrClass := 'sub';
    OpenCard(vrID);
  end;
end;
//------------------------------------------------------------------------------

procedure TCfgList.SubRefresh;
var
  Q: TADOQuery;
  LItem: TListItem;
  s: string;
 // i: Integer;
begin
  try
    {
    frm.ComboBoxSubconfigs.Items.BeginUpdate;
    frm.ComboBoxSubconfigs.Items.Clear;
    frm.ComboBoxSubconfigs.Items.Add('Все подконфигурации');
    }
    List.Items.Clear;
    Q := frm.RunSQL(nil, 'Select * from Subconfigs Order by Name', 0);
    Q.First;
    while not Q.Eof do
    begin
      LItem := List.Items.Add;
      LItem.Caption := Q.Fields[1].AsString;
      LItem.SubItems.Insert(0, Q.Fields[2].AsString);
      LItem.Data := Pointer(Q.Fields[0].AsInteger);
      LItem.ImageIndex := 58;
      //      frm.ComboBoxSubconfigs.Items.Add('(' + Q.FieldByName('ID').AsString + ') '
      //        + Q.FieldByName('Name').AsString);
      if Config.IBDir = Q.FieldByName('Path').AsString then
      begin
        //i := Q.RecNo;
        frm.CurSubCfg := Q.FieldByName('ID').AsInteger;
      end;
      Q.Next;
    end;
    {
    frm.ComboBoxSubconfigs.ItemIndex := i;
    frm.ComboBoxSubconfigs.Items.EndUpdate;
    }
  except
    on E: Exception do
    begin
      s := 'Подсистемы: Обновление списка подконфигураций'#13#10 +
        'Возникло исключение:'#13#10 + E.Message;
      frm.Echo(s);
      ShowMessage(s);
    end;

  end;
end;
//------------------------------------------------------------------------------

procedure TCfgList.OpenCard(var vID: SYSINT);
//var
  //Q: TADOQuery;
 // LItem: TListItem;
//  s: string;
  //i: Integer;
begin
  with TfrmEditCardConfig.Create(nil) do
  begin
    frm.RunSQL(QDocument, 'select * from configs where ID=' + IntToStr(vID));

    if vID = 0 then
    begin
      QDocument.Insert;
      QDocumentName.AsString := Config.MetaData.TaskDef.Props[0];
    end
    else
      QDocument.edit;

    ShowModal;
    Free;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TCfgList, Class_CfgList,
    ciMultiInstance, tmApartment);
end.

