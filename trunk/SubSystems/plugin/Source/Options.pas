unit Options;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, FormOptions,
  FormSubSystemsMain, SysUtils, IniFiles, AvailableSubSystems, ObjectClasses,
  Dialogs, Windows, Messages, Controls, Forms, ComCtrls, StdVcl;

type
  TOptions = class(TAutoObject, IConnectionPointContainer, IOptions)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IOptionsEvents;

    frm: TfrmSubSystems;
    vAvlSS: TAvailableSubSystems;
    vObjCls: TObjectClasses;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;

    constructor CreateObj(frmSS: TfrmSubSystems);
    destructor Destroy;

    procedure Show; safecall;
    procedure SaveOptions(const vPath, vName: WideString); safecall;
    procedure GetSavedOptions(const vPath, vName: WideString); safecall;
    function GetSavedNames(const vPath: WideString): WideString; safecall;
    procedure DeleteSaved(const vPath: WideString; const vName: WideString);
      safecall;
    procedure SetPlacePanel(vID: SYSINT); safecall;
    function GetPlacePanel: SYSINT; safecall;
    procedure SetTuningSSListPlace(vID: SYSINT); safecall;
    function GetTuningSSListPlace: sysint safecall;

  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ;

procedure TOptions.Show; safecall;
var
  frmOpt: TfrmOptions;
  t: TStringList;
  I: Integer;
  vTab, vMD: WideString;
  //CanDone: Boolean;
begin
  //CanDone := false;
  frmOpt := TfrmOptions.Create(nil);
  with frmOpt do
  begin
    if frm.TabSheetToDo.TabVisible then
      todo.Checked := true;
    if frm.TabSheetTuning.TabVisible then
      tuning.Checked := true;
    if frm.TabSheetConfs.TabVisible then
      confs.Checked := true;
    if frm.TabSheetTemplates.TabVisible then
      templates.Checked := true;
    if frm.TabSheetProps.TabVisible then
      props.Checked := true;
    if frm.TabSheetLinks.TabVisible then
      links.Checked := true;
    if frm.TabSheetSSObj.TabVisible then
      ssobj.Checked := true;
    if frm.TabSheetExpl.TabVisible then
      expl.Checked := true;
    if frm.TabSheetAvailableSubSystems.TabVisible then
      AvlbSS.Checked := true;
    if frm.TabSheetShowMDObj.TabVisible then
      ObjShowing.Checked := true;
    if frm.TabSheetNote.TabVisible then
      NoteShowing.Checked := true;
    if frm.TabSheetNoteList.TabVisible then
      NoteListShowing.Checked := true;
    if frm.tsToDoObj.TabVisible then
      cbToDoObj.Checked := true;
    if frm.tsMDObjBlocks.TabVisible then
      cbMDObjBlocks.Checked := true;
    if frm.tsEditLog.TabVisible then
      chkLogList.Checked := true;

    ComboBoxPlacePanel.ItemIndex := frm.PanelPlace;
    ComboBoxSS.ItemIndex := frm.PanelSSPlace;

    rgMetadataView.ItemIndex := frm.MDTreeViewMode;

    ShowModal;
  end;
  if frm.MDTreeViewMode <> frmOpt.rgMetadataView.ItemIndex then
  begin
    frm.MDTreeViewMode := frmOpt.rgMetadataView.ItemIndex;
    frm.vMDTree.Fill;
  end;

  frm.VisTabs := frmOpt.vSelectedTabs;
  frm.HideAllTabs;
  t := TStringList.create; //создаём класс
  t.text := stringReplace(frmOpt.vSelectedTabs, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    vTab := T[i];
    frm.GoToSheet(vTab);
  end;
  vMD := 'subsystems';
  frm.GoToSheet(vMD);
  // установить положение панелей
  frm.PanelPlace := frmOpt.vPlacePanel;
  SetPlacePanel(frm.PanelPlace);

  frm.PanelSSPlace := frmOpt.vPlacePanelSS;
  SetTuningSSListPlace(frm.PanelSSPlace);
  frmOpt.Free;

end;
//------------------------------------------------------------------------------

procedure TOptions.SaveOptions(const vPath, vName: WideString);
var
  Gameini: TIniFile;
  vFolder: WideString;
  vPathL, vNameL: string;
  j: Integer;
begin
  vFolder := 'Personal';

  if vPath = '' then
    vPathL := IncludeTrailingBackslash(frm.FConfigurator.IBDir) +
      'SubSystems.ini'
  else
    vPathL := vPath;

  if vName = '' then
    vNameL := 'Last'
  else
    vNameL := vName;

  Gameini := TIniFile.Create(vPathL);
  with GameIni do
  begin
    WriteInteger(vNameL, 'TreeViewVariant', frm.ComboBoxView.ItemIndex);
    WriteString(vNameL, 'VisTabs', frm.VisTabs);
    WriteInteger(vNameL, 'PanelSSPlace', frm.PanelSSPlace);
    WriteInteger(vNameL, 'PanelPlace', frm.PanelPlace);
    WriteString(vNameL, 'SubSystemsID', vAvlSS.GetSelectedSubSystemsID); //!
    WriteString(vNameL, 'ObjClasses', vObjCls.GetObjClasses);
    WriteInteger(vNameL, 'MDTreeViewMode', frm.MDTreeViewMode);

    for j := 1 to frm.ListConditions.RowCount - 1 do
    begin
      WriteString(vNameL, frm.ListConditions.Keys[j],
        frm.ListConditions.Values[frm.ListConditions.Keys[j]]);
    end;

    {
      WriteInteger(vNameL, 'ToDoSSFilter', frm.ComboBoxSSFilter.ItemIndex);
      WriteInteger(vNameL, 'ToDoDoneStatus', frm.ComboBoxDone.ItemIndex);
      WriteString(vNameL, 'ToDoUserName', frm.ComboBoxUsers.Text);
      WriteInteger(vNameL, 'ToDoObjType', frm.ComboBoxObj.ItemIndex);
      WriteInteger(vNameL, 'SortColumn', frm.SortColumn);
      WriteInteger(vNameL, 'ToDoListType', frm.vToDoLst.GetListViewType);
     }

    Free;
  end;
  //ShowMessage('sav opt' + vAvlSS.GetSelectedSubSystemsID);
end;
//------------------------------------------------------------------------------

procedure TOptions.GetSavedOptions(const vPath, vName: WideString);
var
  MyIniFile: TIniFile;
  vFolder, SSIDs, ObjClass, vTab: WideString;
  t: TStringList;
  I: integer;
  vPathL, vNameL: string;
  j: Integer;
begin
  vFolder := 'Personal';
  if vPath = '' then
    vPathL := IncludeTrailingBackslash(frm.FConfigurator.IBDir) +
      'SubSystems.ini'
  else
    vPathL := vPath;

  if vName = '' then
    vNameL := 'Last'
  else
    vNameL := vName;

  MyIniFile := TIniFile.Create(vPathL);
  with MyIniFile do
  begin

    frm.ComboBoxView.ItemIndex := ReadInteger(vNameL, 'TreeViewVariant',
      frm.ComboBoxView.ItemIndex);
    frm.VisTabs := ReadString(vNameL, 'VisTabs', frm.VisTabs); //+
    frm.PanelSSPlace := ReadInteger(vNameL, 'PanelSSPlace', frm.PanelSSPlace);
    //+
    frm.PanelPlace := ReadInteger(vNameL, 'PanelPlace', frm.PanelPlace); //+
    SSIDs := ReadString(vNameL, 'SubSystemsID', vAvlSS.GetSelectedSubSystemsID);
    //+
    ObjClass := ReadString(vNameL, 'ObjClasses', vObjCls.GetObjClasses);

    frm.MDTreeViewMode := ReadInteger(vNameL, 'MDTreeViewMode', 0);

    for j := 1 to frm.ListConditions.RowCount - 1 do
    begin
      frm.ListConditions.Values[frm.ListConditions.Keys[j]] :=
        ReadString(vNameL, frm.ListConditions.Keys[j], '');
    end;

    {
    frm.ComboBoxSSFilter.ItemIndex := ReadInteger(vNameL, 'ToDoSSFilter', frm.ComboBoxSSFilter.ItemIndex);
    frm.ComboBoxDone.ItemIndex := ReadInteger(vNameL, 'ToDoDoneStatus', frm.ComboBoxDone.ItemIndex);
    frm.ComboBoxUsers.Text := ReadString(vNameL, 'ToDoUserName', frm.ComboBoxUsers.Text);
    frm.ComboBoxObj.ItemIndex := ReadInteger(vNameL, 'ToDoObjType', frm.ComboBoxObj.ItemIndex);
    frm.SortColumn := ReadInteger(vNameL, 'SortColumn', frm.SortColumn);
    }
    //frm.vToDoLst.SetListViewType(ReadInteger(vNameL, 'ToDoListType', 0));

    MyIniFile.Free;
  end;

  // запомним как последнее
  vNameL := 'Last';
  SaveOptions(vPath, vNameL);

  t := TStringList.create; //создаём класс
  t.text := stringReplace(frm.VisTabs, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    vTab := T[i];
    frm.GoToSheet(vTab);
  end;

  vAvlSS.Refresh;
  vAvlSS.SetSubSystems(SSIDs);

  vObjCls.SetObjClasses(ObjClass);

  SetPlacePanel(frm.PanelPlace);
  SetTuningSSListPlace(frm.PanelSSPlace);

  frm.ListViewToDo.AlphaSort;

  vTab := 'subsystems';
  frm.GoToSheet(vTab);

end;
//------------------------------------------------------------------------------

function TOptions.GetSavedNames(const vPath: WideString): WideString; safecall;
var
  AppIni: TIniFile;
  vStrings: TStringList;
  vPathL: string;
begin
  if vPath = '' then
    vPathL := IncludeTrailingBackslash(frm.FConfigurator.IBDir) +
      'SubSystems.ini'
  else
    vPathL := vPath;

  vStrings := TStringList.Create;
  AppIni := TIniFile.Create(vPathL);
  AppIni.ReadSections(vStrings);
  Result := vStrings.Text;
end;
//------------------------------------------------------------------------------

procedure TOptions.DeleteSaved(const vPath: WideString; const vName:
  WideString);
  safecall;
var
  AppIni: TIniFile;
  vPathL: string;
begin

  if vName = '' then
  begin
    ShowMessage('Укажите имя удаляемой настройки');
    exit;
  end;

  if vPath = '' then
    vPathL := IncludeTrailingBackslash(frm.FConfigurator.IBDir) +
      'SubSystems.ini'
  else
    vPathL := vPath;
  AppIni := TIniFile.Create(vPathL);
  AppIni.EraseSection(vName);
end;
//------------------------------------------------------------------------------

procedure TOptions.SetPlacePanel(vID: SYSINT);
begin
  {
  Доп информация на закладке метаданных
  Доп информация на закладке метаданных внизу
  Доп информация на основной панели
  }
  //ShowMessage(IntTostr(vID));

  if vID = 0 then
  begin // справа
    frm.TabSheetProps.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetLinks.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetSSObj.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetExpl.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetAvailableSubSystems.PageControl :=
      frm.PageControlSubSystemsProps;
    frm.TabSheetShowMDObj.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetNote.PageControl := frm.PageControlSubSystemsProps;
    frm.tsToDoObj.PageControl := frm.PageControlSubSystemsProps;
    //    frm.tsMDObjBlocks.PageControl := frm.PageControlSubSystemsProps;
    frm.tsEditLog.PageControl := frm.PageControlSubSystemsProps;

    frm.Panel2.Align := alRight;
    if frm.VisibleTabsEx then
      frm.Panel2.Width := 312
    else
      frm.Panel2.Width := 1;
  end;

  if vID = 1 then
  begin // снизу
    frm.TabSheetProps.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetLinks.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetSSObj.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetExpl.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetAvailableSubSystems.PageControl :=
      frm.PageControlSubSystemsProps;
    frm.TabSheetShowMDObj.PageControl := frm.PageControlSubSystemsProps;
    frm.TabSheetNote.PageControl := frm.PageControlSubSystemsProps;
    frm.tsToDoObj.PageControl := frm.PageControlSubSystemsProps;
    //    frm.tsMDObjBlocks.PageControl := frm.PageControlSubSystemsProps;
    frm.tsEditLog.PageControl := frm.PageControlSubSystemsProps;

    frm.Panel2.Align := alBottom;
    //Panel2.Width := TreeViewMetadata.Width;
    if frm.VisibleTabsEx then
      frm.Panel2.Height := 250
    else
      frm.Panel2.Height := 1;
    frm.Splitter3.Align := alBottom;
  end;
  if vID = 2 then
  begin // общая панель
    frm.TabSheetProps.PageControl := frm.PageControlSubSystems;
    frm.TabSheetLinks.PageControl := frm.PageControlSubSystems;
    frm.TabSheetSSObj.PageControl := frm.PageControlSubSystems;
    frm.TabSheetExpl.PageControl := frm.PageControlSubSystems;
    frm.TabSheetAvailableSubSystems.PageControl := frm.PageControlSubSystems;
    frm.TabSheetShowMDObj.PageControl := frm.PageControlSubSystems;
    frm.TabSheetNote.PageControl := frm.PageControlSubSystems;
    frm.tsToDoObj.PageControl := frm.PageControlSubSystems;
    //    frm.tsMDObjBlocks.PageControl := frm.PageControlSubSystems;
    frm.tsEditLog.PageControl := frm.PageControlSubSystems;

    if frm.Panel2.Align = alRight then
    begin
      frm.Panel2.Width := 1;
    end;
    if frm.Panel2.Align = alBottom then
    begin
      frm.Panel2.Height := 1;
    end;
  end;

  frm.PanelPlace := vID;
  //TabSheetAvailableSubSystems.Show;
  //TabSheetShowMDObj.show;
  //pPage.Show;
end;
//------------------------------------------------------------------------------

function TOptions.GetPlacePanel: SYSINT;
begin
  Result := frm.PanelPlace;
end;
//------------------------------------------------------------------------------

procedure TOptions.SetTuningSSListPlace(vID: SYSINT);
begin
  if vID = 1 then
  begin
    frm.ListViewConfigMetadata.Align := alBottom;
    frm.ListViewConfigMetadata.Height := 150;
    frm.Splitter2.Align := alBottom;
  end;

  if vID = 0 then
  begin
    frm.ListViewConfigMetadata.Align := alRight;
    frm.ListViewConfigMetadata.Width := 50;
    frm.Splitter2.Align := alRight;
  end;
  frm.PanelSSPlace := vID;
end;
//------------------------------------------------------------------------------

function TOptions.GetTuningSSListPlace: integer;
begin
  Result := frm.PanelSSPlace;
end;
//------------------------------------------------------------------------------

constructor TOptions.CreateObj(frmSS: TfrmSubSystems);
begin
  inherited Create;
  frm := frmSS;
  vAvlSS := TAvailableSubSystems.CreateObj(frm, frm.ListViewSubSystems);
  vObjCls := TObjectClasses.CreateObj(frm, frm.ListViewObj);
end;
//------------------------------------------------------------------------------

destructor TOptions.Destroy;
begin
end;

procedure TOptions.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IOptionsEvents;
end;

procedure TOptions.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TOptions, Class_Options,
    ciMultiInstance, tmApartment);
end.

