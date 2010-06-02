unit ToDo;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, StdVcl,

  Windows, Messages, Graphics, Controls, Forms, Dialogs, SysUtils,
  OpenConf_TLB, ExtCtrls, ComCtrls, ToolWin, FormSubSystemsMain,
  ImgList, DB, ADODB, FileCtrl, Grids, ValEdit, ShelLAPI, StdCtrls, Variants,
  ShellCtrls, ActnList, Menus, DBGrids, CompDoc, Registry, IniFiles,TuningSubSystemsList,FormEditCardToDo;

type
  TToDo = class(TAutoObject, IConnectionPointContainer, IToDo)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IToDoEvents;

    frm: TfrmSubSystems;
    List: TListView;
    vSSList : TTuningSubSystemsList;
    Config: IConfigurator;



    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    constructor Create(frmSS: TfrmSubSystems);
    destructor Destroy;


    procedure Refresh;
    procedure New;
    procedure Edit;
    procedure Delete;
    function GetDoneFilterIndex: integer;
    procedure SetToDoDoneFilterIndex(var Ind: SYSINT);
    function GetSSIndex: integer;
    procedure SetSSIndex(var Ind: SYSINT);
    procedure OpenCard(var vID: SYSINT);
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ;


procedure TToDo.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
  Met: IMetaDataObj;
  vSubSystems, vCond: string;
  i: integer;
begin
  //****************************************************************************
  // получаем список используемых подсистем
  {
  vSubSystems := '';
  if frm.ComboBoxFilter.ItemIndex = 0 then begin
    for i := 0 to ListViewSubSystems.Items.Count - 1 do begin
      if ListViewSubSystems.Items.Item[i].Checked = True then begin
        if vSubSystems = '' then
          vSubSystems := vSubSystems + IntToStr(Integer(ListViewSubSystems.Items.Item[i].Data))
        else
          vSubSystems := vSubSystems + ',' + IntToStr(Integer(ListViewSubSystems.Items.Item[i].Data));
      end;
    end;
    if vSubSystems <> '' then
      vCond := ' and SubSystemID in (' + vSubSystems + ')';
  end
    else
    vCond := '';
    }
  if frm.ComboBoxDone.ItemIndex = 0 then
    vCond := vCond + ' and (Done=false)';

  if frm.ComboBoxUsers.Text <> '' then
    vCond := vCond + ' and (user=''' + frm.ComboBoxUsers.Text + ''')';

  if frm.ComboBoxObj.Text <> '' then
    vCond := vCond + ' and (ObjType=' + IntToStr(frm.ComboBoxUsers.ItemIndex) + ')';

  //ShowMessage('refresh');
  List.Items.BeginUpdate;
  List.Items.Clear;
  Q := frm.RunSQL(
    nil,
    'select * from ToDo where ConfigID=' + IntToStr(frm.CurCfg) + vCond,
    0);
  q.First;
  while not q.Eof do begin

    LItem := List.Items.Add;
    with LItem do begin
      Caption := Q.FieldByName('Name').AsString;
      Data := Pointer(Q.FieldByName('ID').AsInteger);
      SubItems.Insert(0, Q.FieldByName('Priority').AsString);
      SubItems.Insert(1, vSSList.GetSubSystemNameByID(Q.FieldByName('SubSystemID').AsInteger));
    end;

    Met := frm.GetObjByID(Q.FieldByName('ObjID').AsInteger, Q.FieldByName('ObjType').AsInteger);
    if Met <> nil then
      LItem.SubItems.Insert(2, Met.FullName)
    else begin
      if Q.FieldByName('ObjType').AsInteger >= 0 then
        LItem.SubItems.Insert(2, Config.MetaData.TaskDef.Childs.Name[Q.FieldByName('ObjType').AsInteger, true])
      else
        LItem.SubItems.Insert(2, '');
    end;
    with LItem.SubItems do begin
      Insert(3, Q.FieldByName('DateStart').AsString);
      Insert(4, Q.FieldByName('DateEnd').AsString);
      Insert(5, Q.FieldByName('Complete').AsString);
      Insert(6, Q.FieldByName('Status').AsString);
      Insert(7, Q.FieldByName('User').AsString);
    end;

    if Q.FieldByName('Done').AsBoolean = true then begin
      LItem.ImageIndex := 5;
      LItem.StateIndex := 5;
    end
    else begin
      LItem.ImageIndex := 69;
      LItem.StateIndex := 69;
    end;

    Q.Next;
  end;
  List.Items.EndUpdate;
end;

//------------------------------------------------------------------------------

procedure TToDo.New;
var
  Q: TADOQuery;
  LItem: TListItem;
  MetA: IMetaDataObjChilds;
  i: integer;
  vMenu: TMenuItem;
  vFileName: string;
begin
  with TfrmEditCardToDo.Create(nil) do begin
    vFileName := IncludeTrailingBackslash(Config.IBDir) + 'usrdef\users.usr';
    if FileExists(vFileName) then
      DBComboBox2.Items := frm.ReadUsersList(vFileName);

    PopupMenu1.Items.Clear;
    MetA := Config.MetaData.TaskDef.Childs;
    for i := 0 to MetA.Count - 1 do begin
      vMenu := TMenuItem.Create(PopupMenu1);
      vMenu.Caption := MetA.Name[i, true];
      vMenu.Tag := i;
      vMenu.OnClick := xcx1Click;
      PopupMenu1.Items.Add(vMenu);
    end;

    //ss
    PopupMenuSS.Items.Clear;
    Q := frm.RunSQL(nil, 'select * from SubSystems where ConfigID = ' + IntToStr(frm.CurCfg), 0);
    Q.First;
    while not Q.Eof do begin
      vMenu := TMenuItem.Create(PopupMenuSS);
      vMenu.Caption := Q.FieldValues['Name'];
      vMenu.Tag := Q.FieldByName('ID').asInteger;
      vMenu.OnClick := SubSystems1Click;
      PopupMenuSS.Items.Add(vMenu);
      Q.Next;
    end; // while not Q.Eof do begin

    TreeViewObjKinds.Visible := false;

    with ADOQuery1 do begin
      close;
      SQL.Clear;
      SQL.Add('select * from ToDo where ID=0');
      Connection := frm.SubSystemConnection;
      Open;
      Insert;
    end;
    ADOQuery1ConfigID.AsInteger := frm.CurCfg;
    ADOQuery1ObjType.AsInteger := -1;
    ADOQuery1User.AsString := Config.AppProps[appUserName];

    ShowModal;
  end;
end;
//------------------------------------------------------------------------------

procedure TToDo.Edit;
var
  Q: TADOQuery;
  LItem: TListItem;
  MetA: IMetaDataObjChilds;
  i: integer;
  vMenu: TMenuItem;
  Met: IMetaDataObj;
  vFileName: string;
begin
  if List.Selected = nil then exit;
  i := Integer(List.Selected.Data);
  OpenCard(i);
end;
//------------------------------------------------------------------------------

procedure TToDo.Delete;
begin
  if MessageDlg('”далить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
    exit;
  end;
  frm.RunSQL(nil, 'delete from ToDo where ID=' + IntToStr(Integer(List.Selected.data)), 1);
end;

//------------------------------------------------------------------------------

function TToDo.GetDoneFilterIndex: integer;
begin
  Result := frm.ComboBoxDone.ItemIndex;
end;
//------------------------------------------------------------------------------

procedure TToDo.SetToDoDoneFilterIndex(var Ind: SYSINT);
begin
  frm.ComboBoxDone.ItemIndex := Ind;
end;
//------------------------------------------------------------------------------

function TTodo.GetSSIndex: integer;
begin
  Result := frm.ComboBoxSSFilter.ItemIndex;
end;
//------------------------------------------------------------------------------
//procedure TfrmSubSystems.SetListViewIndex(const vPos: Integer);

procedure TToDo.SetSSIndex(var Ind: SYSINT);
begin
  frm.ComboBoxSSFilter.ItemIndex := Ind;
end;
//------------------------------------------------------------------------------

procedure TToDo.OpenCard(var vID: SYSINT);
var
  i: integer;
  Q: TADOQuery;
  LItem: TListItem;
  MetA: IMetaDataObjChilds;
  vMenu: TMenuItem;
  Met: IMetaDataObj;
  vFileName: string;
begin
  with TfrmEditCardToDo.Create(nil) do begin
    pConf := Config;

    PopupMenu1.Items.Clear;
    MetA := Config.MetaData.TaskDef.Childs;
    for i := 0 to MetA.Count - 1 do begin
      vMenu := TMenuItem.Create(PopupMenu1);
      vMenu.Caption := MetA.Name[i, true];
      vMenu.Tag := i;
      vMenu.OnClick := xcx1Click;
      PopupMenu1.Items.Add(vMenu);
    end;
    TreeViewObjKinds.Visible := false;

    //ss
    PopupMenuSS.Items.Clear;
    Q := frm.RunSQL(nil, 'select * from SubSystems where ConfigID = ' + IntToStr(vID), 0);
    Q.First;
    while not Q.Eof do begin
      vMenu := TMenuItem.Create(PopupMenuSS);
      vMenu.Caption := Q.FieldValues['Name'];
      vMenu.Tag := Q.FieldByName('ID').asInteger;
      vMenu.OnClick := SubSystems1Click;
      PopupMenuSS.Items.Add(vMenu);
      Q.Next;
    end; // while not Q.Eof do begin

    with ADOQuery1 do begin
      close;
      SQL.Clear;
      SQL.Add('select * from ToDo where ID=' + IntToStr(vID));
      Connection := frm.SubSystemConnection;
      Open;
      Edit;
    end;
    LabelSubSystem.Caption := vSSList.GetSubSystemNameByID(ADOQuery1.FieldByName('SubSystemID').AsInteger);
    i := ADOQuery1.FieldByName('ObjType').AsInteger;
    if i <> -1 then begin
      LabelTypeObj.Caption := MetA.Name[i, true];
      Met := frm.GetObjByID(ADOQuery1.FieldByName('ObjID').AsInteger, i);
    end;
    if met <> nil then
      LabelKindObj.Caption := Met.Name;
    //AddMetItems(TreeViewObjKinds, ADOQuery1ObjType.AsInteger, nil, 35);

    vFileName := IncludeTrailingBackslash(Config.IBDir) + 'usrdef\users.usr';
    if FileExists(vFileName) then
      DBComboBox2.Items := frm.ReadUsersList(vFileName);

    ShowModal;
  end;
end;


procedure TToDo.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IToDoEvents;
end;

procedure TToDo.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;

constructor TToDo.Create(frmSS: TfrmSubSystems);
begin
  frm := frmSS;
  List := frm.ListViewToDo;
  vSSList := TTuningSubSystemsList.Create(frm);
end;

destructor TToDo.Destroy;
begin
end;


initialization
  TAutoObjectFactory.Create(ComServer, TToDo, Class_ToDo,
    ciMultiInstance, tmApartment);
end.
