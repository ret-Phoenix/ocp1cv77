unit Templates;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB,
  Windows, Messages, Graphics, Controls, Forms, Dialogs, SysUtils,
  ExtCtrls, ComCtrls, FormSubSystemsMain,
  Variants,
  DB, ADODB, Menus, formEditCardTemplate, Clipbrd, StdVcl;

{
type
  TData = class
    procedure CopyToClipboard(Controls, Module: string);
  end;
}

type
  MyProcType = function(vPath: PChar): string; stdcall;

type
  TTemplates = class(TAutoObject, IConnectionPointContainer, ITemplates)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ITemplatesEvents;

    frm: TfrmSubSystems;
    List: TTreeView;

    procedure CopyToClipboardText(Controls, Module: string);

    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public

    ImportFileName: WideString;

    procedure Initialize; override;
    constructor CreateObj(frmSS: TfrmSubSystems);
    destructor Destroy;

    procedure Refresh; safecall;
    procedure NewElement; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure NewFolder; safecall;
    procedure OpenCardByID(vId: SYSINT); safecall;
    function GetTreeFldrElems: WideString; safecall;
    function GetTreeFldr: WideString; safecall;

    procedure SetTextToClipboard(vID: SYSINT); safecall;
    function GetTextFromFile(var vFileName: WideString): WideString; safecall;

    function GetTemplateValuetByID(vID: SYSINT;
      const vField: WideString): OleVariant; safecall;
    procedure SetTemplateValueByID(vID: SYSINT; const vField: WideString;
      vFieldValue: OleVariant); safecall;

    procedure FillTreeView(
      vTreeView: TTreeView;
      vDataSet: TDataSet;
      ClearItems: Boolean;
      ItemText: string
      );

  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_ImportFileName: WideString; safecall;
    procedure Set_ImportFileName(const Value: WideString); safecall;
  end;

implementation

uses ComServ;

//------------------------------------------------------------------------------

function SetLastTreeItem(vTree: TTreeView; vParent: Integer): TTreeNode;
var
  i, iid: Integer;
begin
  vTree.Items.BeginUpdate;
  for i := 0 to vTree.Items.Count - 1 do
  begin
    iid := PTreeViewData(vTree.items[i].Data).ID;
    if vParent = iid then
    begin
      vTree.Select(vTree.Items.Item[i]);
      Break;
    end; // if
  end; // for
  vTree.Items.EndUpdate;
  vTree.Selected.Expanded := true;
  Result := vTree.Selected;
end;

function GetResultForNode(node: TTreeNode): string;
var
  Str: string;
begin
  Str := Str + ',' + IntToStr(PTreeViewData(node.Data).ID);
  Result := Str;
end;
//------------------------------------------------------------------------------

function RecurseChilds(node: TTreeNode): string;
begin
  while node <> nil do
  begin
    if node.HasChildren then
    begin
      Result := RecurseChilds(node.GetFirstChild);
    end;
    Result := Result + GetResultForNode(node);
    node := node.GetNextSibling;
  end;
end;
//------------------------------------------------------------------------------

function GetResult(curnode: TTreeNode): string;
begin
  Result := '';
  if curnode = nil then
    Exit;
  Result := RecurseChilds(curnode.GetFirstChild);
end;
//------------------------------------------------------------------------------

procedure TTemplates.FillTreeView(
  vTreeView: TTreeView;
  vDataSet: TDataSet;
  ClearItems: Boolean;
  ItemText: string
  );
var
  i, j, n: Integer;
  vTD: PTreeViewData;
  vValTmp: integer;
  TreeView1: TTreeView;
  LastID: Integer;
label
  Start;

begin
  if vTreeView.Selected = nil then
    LastID := 0
  else
    LastID := vTreeView.Selected.Index;

  vTreeView.Items.BeginUpdate;

  TreeView1 := TTreeView.Create(nil);
  TreeView1.Visible := False;
  TreeView1.Parent := vTreeView.Parent;

  TreeView1.Items.Clear;
  if ClearItems then
    vTreeView.Items.Clear;

  vDataSet.First;
  while not vDataSet.Eof do
  begin

    New(vTD);
    vTD.id := vDataSet.FieldByName('id').AsInteger;
    vTD.parentid := vDataSet.FieldByName('parentid').AsInteger;
    vTD.name := vDataSet.FieldByName('name').AsString;
    if vDataSet.FieldByName('IsFolder').AsBoolean = true then
      vTD.ImgFolder := GrfFldr
    else if vDataSet.FieldByName('IsModule').AsBoolean then
      vTD.ImgFolder := GrfRecTxt
    else
      vTD.ImgFolder := GrfRecFrm;
    vTD.find := 0;

    TreeView1.Items.AddObject(nil, vDataSet.FieldByName('Name').AsString, vTD);
    vDataSet.Next;

  end;
  //    if ClearItems then begin
  New(vTD);
  vTD.id := 0;
  vTD.parentid := 0;
  frm.GrfNode(vTreeView.Items.AddObject(nil, ItemText, vTD), GrfFldr);
  //  end;
  Start:
  //
  //
  //
  for i := 0 to TreeView1.Items.Count - 1 do
  begin
    New(vTD);
    vTD.id := PTreeViewData(TreeView1.Items.Item[i].Data).ID;
    vTD.parentid := PTreeViewData(TreeView1.Items.Item[i].Data).parentID;
    vTD.name := PTreeViewData(TreeView1.Items.Item[i].Data).name;
    vTD.find := 0; //PTreeViewData(TreeView1.Items.Item[0].Data)^.find;
    vTD.ImgFolder := PTreeViewData(TreeView1.Items.Item[i].Data).ImgFolder;

    if vTD.parentID = 0 then
    begin
      vTD.find := 1;
      PTreeViewData(TreeView1.Items.Item[i].Data).find := 1;
      frm.GrfNode(vTreeView.Items.AddChildObject(vTreeView.Items.Item[0],
        vTD.name, vTD), vTD.ImgFolder);
    end
    else
    begin
      for j := 0 to vTreeView.Items.Count - 1 do
      begin
        vValTmp := PTreeViewData(vTreeView.Items.Item[j].Data).ID;
        if vValTmp = vTD.parentID then
        begin
          vTD.find := 1;
          PTreeViewData(TreeView1.Items.Item[i].Data).find := 1;
          frm.GrfNode(vTreeView.Items.AddChildObject(vTreeView.Items.Item[j],
            vTD.name, vTD), vTD.ImgFolder);
          break;
        end;
      end;
    end; // if
  end; // for
  //
  j := TreeView1.Items.Count;
  n := -1;
  for i := 0 to j - 1 do
  begin
    inc(n);
    if PTreeViewData(TreeView1.Items.Item[n].Data).find = 1 then
    begin
      TreeView1.Items.item[n].Delete;
      j := j - 1;
      n := n - 1;
      if n = j then
        break;
    end;
  end;
  if TreeView1.Items.Count > 0 then
    goto Start;
  TreeView1.Destroy;
  vTreeView.Select(vTreeView.Items.Item[lastID]);
  vTreeView.Items.EndUpdate;
end;
//------------------------------------------------------------------------------

procedure TTemplates.Refresh;
var
  vID: integer;
begin
  if List.Selected <> nil then
    vID := PTreeViewData(List.Selected.Data).ID
  else
    vID := 0;
  FillTreeView(List, frm.RunSQL(nil,
    'select id,ParentID,IsFolder,IsModule,Name from Templates', 0), true,
    'Шаблоны');
  SetLastTreeItem(List, vID);
end;

procedure TTemplates.NewElement;
var
  vID: integer;
begin
  if List.Selected = nil then
    exit;
  if List.Selected.ImageIndex = GrfFldr then
    vID := PTreeViewData(List.Selected.Data).ID
  else
    vID := PTreeViewData(List.Selected.Data).ParentID;

  with TfrmEditCardTemplate.Create(nil) do
  begin
    frmSS := frm;
    with ADOQuery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from Templates where ID=0');
      Connection := frm.SubSystemConnection;
      Open;
      Insert;
    end;
    ADOQuery1IsFolder.AsBoolean := false;
    ADOQuery1IsModule.AsBoolean := false;
    ADOQuery1ParentID.AsInteger := vID;
    ShowModal;
  end;
end;
//------------------------------------------------------------------------------

procedure TTemplates.Edit;
var
  vName: string;
  lParams: TStringList;
begin
  if List.Selected = nil then
    exit;
  if List.Selected.ImageIndex = GrfFldr then
  begin
    vName := Trim(InputBox('Шаблон', 'Название шаблона', List.Selected.Text));
    if vName <> List.Selected.Text then
    begin
      lParams := TStringList.Create;
      lParams.Add(vName);
      lParams.Add(IntToStr(PTreeViewData(List.Selected.Data).ID));
      frm.RunSQL(nil, 'Update Templates set Name = :pName where ID= :pID', 1,
        lParams);
    end;
  end
  else
  begin
    with TfrmEditCardTemplate.Create(nil) do
    begin
      frmSS := frm;
      with ADOQuery1 do
      begin
        close;
        SQL.Clear;
        SQL.Add('select * from Templates where ID=' +
          IntToStr(PTreeViewData(List.Selected.Data).ID));
        Connection := frm.SubSystemConnection;
        Open;
      end;
      ShowModal;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TTemplates.OpenCardByID(vId: SYSINT);
begin
  with TfrmEditCardTemplate.Create(nil) do
  begin
    frmSS := frm;
    with ADOQuery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from Templates where ID=' + IntToStr(vID));
      Connection := frm.SubSystemConnection;
      Open;
    end;
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TTemplates.Delete;
var
  vGrpIds: string;
begin
  if MessageDlg('Удалить шаблон?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  if List.Selected = nil then
    exit;
  if List.Selected.ImageIndex <> GrfFldr then
    frm.RunSQL(nil, 'delete from Templates where ID=' +
      IntToStr(PTreeViewData(List.Selected.Data).ID), 1)
  else
  begin
    vGrpIds := IntToStr(PTreeViewData(List.Selected.Data).ID) +
      GetResult(List.Selected);
    frm.RunSQL(nil, 'delete from Templates where ParentID in(' + vGrpIds + ')',
      1);
    frm.RunSQL(nil, 'delete from Templates where ID in(' + vGrpIds + ')', 1);
  end;
end;
//------------------------------------------------------------------------------

procedure TTemplates.NewFolder;
var
  vName: string;
  vID: string;
  lParams: TStringList;
begin
  if List.Selected = nil then
    exit;
  if List.Selected.ImageIndex = GrfFldr then
    vID := IntToStr(PTreeViewData(List.Selected.Data).ID)
  else
    vID := IntToStr(PTreeViewData(List.Selected.Data).ParentID);

  vName := InputBox('Шаблон', 'Новая группа шаблонов', '');
  if vName <> '' then
  begin
    lParams := TStringList.Create;
    lParams.Add(Trim(vName));
    ShowMessage('Insert INTO Templates (IsFolder, parentID, name) Values (' + frm.DBTrue +
      ',' + vID + ', :pName');
    frm.RunSQL(nil,
      'Insert INTO Templates (IsFolder, parentID, name) Values (' + frm.DBTrue +
      ',' + vID + ', :pName)', 1, lParams);
  end;
end;
//------------------------------------------------------------------------------

function TTemplates.GetTreeFldrElems: WideString;
const
  TabChar = #9;
  EndOfLine = #13#10;
var
  i: Integer;
  ANode: TTreeNode;
  NodeStr: string;
  Count: integer;
  vEl: string;
  vResStr: string;
begin
  vResStr := '';
  if Count > 0 then
  begin
    ANode := List.Items.GetFirstNode;
    while ANode <> nil do
    begin
      if ANode.ImageIndex <> GrfFldr then
      begin
        if ANode.ImageIndex = GrfRecTxt then
          vEl := '(' + IntToStr(PTreeViewData(ANode.Data).ID) + ') '
        else
          vEl := '(' + IntToStr(PTreeViewData(ANode.Data).ID) + ') [ФОРМА] '
      end
      else
        vEl := '';
      NodeStr := '';
      for i := 0 to ANode.Level - 1 do
        NodeStr := NodeStr + TabChar;
      NodeStr := NodeStr + vEl + ANode.Text + EndOfLine;
      vResStr := vResStr + NodeStr;
      ANode := ANode.GetNext;
    end;
  end;
  Result := vResStr;
end;

function TTemplates.GetTreeFldr: WideString;
const
  TabChar = #9;
  EndOfLine = #13#10;
var
  i: Integer;
  ANode: TTreeNode;
  NodeStr: string;
  Count: integer;
  vEl: string;
  vResStr: string;
begin
  vResStr := '';
  if Count > 0 then
  begin
    ANode := List.Items.GetFirstNode;
    while ANode <> nil do
    begin
      if ANode.ImageIndex = GrfFldr then
        vEl := '(' + IntToStr(PTreeViewData(ANode.Data).ID) + ') '
      else
        vEl := '';
      NodeStr := '';
      for i := 0 to ANode.Level - 1 do
        if ANode.ImageIndex = GrfFldr then
          NodeStr := NodeStr + TabChar
        else
          NodeStr := '';

      if ANode.ImageIndex = GrfFldr then
        NodeStr := NodeStr + vEl + ANode.Text + EndOfLine;
      vResStr := vResStr + NodeStr;
      ANode := ANode.GetNext;
    end;
  end;
  Result := vResStr;
end;

//------------------------------------------------------------------------------

procedure TTemplates.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITemplatesEvents;
end;

procedure TTemplates.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

constructor TTemplates.CreateObj(frmSS: TfrmSubSystems);
begin
  inherited Create;
  frm := frmSS;
  List := frm.TreeViewTemplates;
end;

destructor TTemplates.Destroy;
begin
end;

procedure TTemplates.SetTextToClipboard(vID: SYSINT);
var
  Q: TADOQuery;
  St: string;
begin
  if vID = 0 then
    vID := PTreeViewData(List.Selected.Data).ID;
  Q := frm.RunSQL(nil, 'Select IsFolder,IsModule,Note from Templates where ID='
    + IntToStr(vID), 0);
  st := Q.Fields[2].AsString;
  if Q.Fields[0].AsBoolean then
    exit;
  if Q.Fields[1].AsBoolean then
    CopyToClipboardText('', st)
  else
    CopyToClipboardText(st, '');
end;

function ExecuteProgramAndWaitForExit(
  const FileName: string;
  const Params: string = '';
  const DefaultDir: string = '';
  ShowCmd: Integer = SW_Normal
  ): Cardinal;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  NewParams: string;
  P: PChar;
  Res: LongBool;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := sizeof(TStartupInfo);

  //  NewParams:=Params;
  if Length(FileName) > 0 then
    NewParams := FileName;
  if Length(Params) > 0 then
    NewParams := NewParams + ' ' + Params;
  if Length(DefaultDir) = 0 then
    P := nil
  else
    P := PChar(DefaultDir);
  Res := CreateProcess(nil, PChar(NewParams), nil, nil, False,
    0, nil, P,
    StartupInfo, ProcessInfo);
  //  writeln(GetLastError);
  if not Res then
  begin
    Result := 0;
    Exit;
  end;
  //processterminate

  Result := WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
  GetExitCodeProcess(ProcessInfo.hProcess, Result);
  CloseHandle(ProcessInfo.hProcess);
  CloseHandle(ProcessInfo.hThread);

end;

function TTemplates.GetTextFromFile(var vFileName: WideString): WideString;
var
  F: TextFile;
  vFileStr: string;
  vStr: WideString;
begin
  if FileExists(vFileName) then
  begin
    AssignFile(F, vFileName);
    Reset(F);
    while not EOF(F) do
    begin
      Readln(F, vFileStr);
      vStr := vStr + vFileStr;
    end;
    CloseFile(F);
    Result := vStr;
  end
  else
  begin
    Result := '';
  end;
end;

procedure TTemplates.CopyToClipboardText(Controls, Module: string);
var
  Data: Thandle;
  DataPTR: Pointer;
  stP: PString;
  S: string;
begin
  try
    Data := GlobalAlloc(GMEM_MOVEABLE, Length(string(Controls)));
    DataPtr := GlobalLock(Data);
    stP := @Controls[1];
    try
      Move(stP^, DataPtr^, Length(string(Controls)));
      Clipboard.Open;
      Clipboard.SetAsHandle(CF_DDGData, Data);
      Clipboard.AsText := Module;
      Clipboard.Close;
    finally
      GlobalUnlock(Data);
    end;
  except
    on E: Exception do
    begin
      GlobalFree(Data);
      s := 'Подсистемы, ошибка в процедуре CopyToClipboardText'#13#10
        + E.Message;
      ShowMessage(s);
    end;
  end;
end;

{
procedure TData.CopyToClipboard(Controls, Module: string);
var
  Data: Thandle;
  DataPTR: Pointer;
  stP: PString;
begin
  Data := GlobalAlloc(GMEM_MOVEABLE, Length(string(Controls)));
  try
    DataPtr := GlobalLock(Data);
    stP := @Controls[1];
    try
      Move(stP^, DataPtr^, Length(string(Controls)));
      Clipboard.Open;
      Clipboard.SetAsHandle(CF_DDGData, Data);
      Clipboard.AsText := Module;
      Clipboard.Close;
    finally
      GlobalUnlock(Data);
    end;
  except
    GlobalFree(Data);
    raise;
  end;
end;
}

function TTemplates.Get_ImportFileName: WideString;
begin
  Result := ImportFileName;
end;

procedure TTemplates.Set_ImportFileName(const Value: WideString);
begin
  ImportFileName := Value;
end;

function TTemplates.GetTemplateValuetByID(vID: SYSINT;
  const vField: WideString): OleVariant;
begin
  Result := frm.RunSQL(nil, 'Select ' + vField + ' from Templates where ID=' +
    IntToStr(vID), 0).Fields[0].Value;
end;

procedure TTemplates.SetTemplateValueByID(vID: SYSINT; const vField: WideString;
  vFieldValue: OleVariant);
var
  Q: TADOQuery;
begin
  Q := frm.RunSQL(nil, 'Select * from Templates where ID=' + IntToStr(vID), 0);
  Q.Edit;
  Q.FieldByName(vField).Value := vFieldValue;
  Q.Post;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTemplates, Class_Templates,
    ciMultiInstance, tmApartment);
end.

