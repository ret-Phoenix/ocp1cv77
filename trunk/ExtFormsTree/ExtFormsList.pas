unit ExtFormsList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ComObj, ActiveX, AxCtrls, Classes, ExtFormsTree_TLB, StdVcl,
  Artbear_ActiveFormImpl1, StdCtrls, ComCtrls, SysUtils,
  OpenConf_TLB, ShellApi,Controls, Forms, Dialogs, FileCtrl;

type
  TExtFrmsList = class(TAutoObject, IConnectionPointContainer, IExtFrmsList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IExtFrmsListEvents;

    frm: TTreeeFilesActiveFormX;
    List: TTreeView;

    procedure FindFiles(
      vParentNodeGrp: TTreeNode;
      StartFolder, Mask: string;
      ScanSubFolders: Boolean = True
      );
    function GetMetView(vObj: IMetaDataObj): string;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    constructor CreateObj(frmEF: TTreeeFilesActiveFormX);
    destructor Destroy;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;

    procedure Choice; safecall;
    procedure Delete; safecall;
    procedure Edit; safecall;
    procedure Fill; safecall;
    procedure Info; safecall;
    procedure NewFolder; safecall;
    function ReternFileInfo(const ParamFile: WideString): WideString; safecall;

  end;

implementation

uses ComServ;
//------------------------------------------------------------------------------
function TExtFrmsList.GetMetView(vObj: IMetaDataObj): string;
begin
  {
  Идентификатор
  Идентификатор + синоним
  Идентификатор + ID
  Идентификатор + синоним + ID
  }
  case frm.ComboBoxMDViewVariant.ItemIndex of
    0: Result := vObj.Name;
    1: Result := vObj.Name + ' [' + vObj.Present + ']';
    2: Result := vObj.Name + ' [' + IntToStr(vObj.ID) + ']';
    3: Result := vObj.Name + ' [' + vObj.Present + '] - ' + IntToStr(vObj.ID);
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IExtFrmsListEvents;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;
//------
// служебные
//---
//------------------------------------------------------------------------------

function CreateData(vFolder, vName, vfext: string; vIsFolder, vFromMD: integer): PMyRec;
var
  MyRecPtr: PMyRec;
begin
  New(MyRecPtr);
  MyRecPtr.FolderName := IncludeTrailingBackslash(vFolder);
  MyRecPtr.FileName := vName;
  MyRecPtr.fext := vfext;
  MyRecPtr.ISFolder := vIsFolder;
  MyRecPtr.FromMD := vFromMD;
  Result := MyRecPtr;
end;
//------------------------------------------------------------------------------

function GetFileSize(FileName: string): Integer;
var
  FS: TFileStream;
begin
  try
    FS := TFileStream.Create(Filename, fmOpenRead);
  except
    Result := -1;
  end;
  if Result <> -1 then Result := FS.Size;
  FS.Free;
end;
//------------------------------------------------------------------------------

procedure SendToRecycleBin(FileName: string);
var
  SHF: TSHFileOpStruct;
begin
  try
    with SHF do begin
      Wnd := Application.Handle;
      wFunc := FO_DELETE;
      pFrom := PChar(FileName + #0 + #0);
      fFlags := FOF_ALLOWUNDO // Preserves undo information, if possible.
      or FOF_SILENT //  Does not display a progress dialog box.
      or FOF_NOCONFIRMATION; //  Responds with "yes to all" for any dialog box that is displayed.
      pTo := '';
      fAnyOperationsAborted := false;
      hNameMappings := nil;
      lpszProgressTitle := 'qwer';
    end;
    SHFileOperation(SHF);
  except
    // to do : generate error
  end;
end;
//------------------------------------------------------------------------------

function Like(AString, Pattern: string): boolean;
var
  i, n, n1, n2: integer;
  p1, p2: pchar;
label
  match, nomatch;
begin
  AString := UpperCase(AString);
  Pattern := UpperCase(Pattern);
  n1 := Length(AString);
  n2 := Length(Pattern);
  if n1 < n2 then
    n := n1
  else
    n := n2;
  p1 := pchar(AString);
  p2 := pchar(Pattern);
  for i := 1 to n do begin
    if p2^ = '*' then goto match;
    if (p2^ <> '?') and (p2^ <> p1^) then goto nomatch;
    inc(p1);
    inc(p2);
  end;
  if n1 > n2 then begin
    nomatch:
    Result := False;
    exit;
  end
  else if n1 < n2 then begin
    for i := n1 + 1 to n2 do begin
      if not (p2^ in ['*', '?']) then goto nomatch;
      inc(p2);
    end;
  end;
  match:
  Result := True;
end;
//------------------------------------------------------------------------------

function MatchesSpec(const FileName, Specification: string): boolean;
var
  SName, SExt, FName, FExt: string;
begin
  FName := ExtractFileName(FileName);
  SName := ExtractFileName(Specification);
  FExt := ExtractFileExt(FName);
  SExt := ExtractFileExt(SName);
  SetLength(FName, Length(FName) - Length(FExt));
  SetLength(SName, Length(SName) - Length(SExt));
  if SName = '' then SName := '*';
  if SExt = '' then SExt := '.*';
  if FExt = '' then FExt := '.';
  Result := Like(FName, SName) and Like(FExt, SExt);
end;
//------------------------------------------------------------------------------

function MatchesMask(Name: string; Mask: string): Boolean;
var
  t: TStringList;
  I: Integer;
begin
  t := TStringList.create; //создаём класс
  t.text := stringReplace(Mask, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do begin
    if MatchesSpec(Name, T[i]) then begin
      Result := True;
      exit;
    end;
  end;
  Result := False;
end;

//------------------------------------------------------------------------------

function _GetParentNode(StartFolder: string; MyNode: TTreeNode): TTreeNode;
begin
  try
    if MyNode.Parent <> nil then begin
      if PMyRec(MyNode.Data).FolderName = StartFolder then
        Result := MyNode;
      if PMyRec(MyNode.Data).FolderName <> StartFolder then
        Result := _GetParentNode(StartFolder, MyNode.Parent);
    end
    else
      Result := MyNode;
  except
    // nothing
    Result := nil;
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.FindFiles(
  vParentNodeGrp: TTreeNode;
  StartFolder, Mask: string;
  ScanSubFolders: Boolean = True
  );
var
  SearchRec: TSearchRec;
  FindResult: Integer;
  MyRecPtr: PMyRec;
  vParent: TTreeNode;
  vImgID: Integer;
  My: TTreeNode;
  vExt, vExtArc: string;
begin
  try
    vExtArc := '.zip,.rar,.arj,1.part*';
    StartFolder := IncludeTrailingBackslash(StartFolder);
    FindResult := FindFirst(StartFolder + '*.*', faAnyFile, SearchRec);
    try
      while FindResult = 0 do
        with SearchRec do begin
          if (Attr and faDirectory) <> 0 then begin
            if ScanSubFolders and (Name <> '.') and (Name <> '..') then begin
              if StartFolder = vDir then begin
                AcNode1 := List.Items.AddChildObject(vParentNodeGrp, Name, CreateData(StartFolder + Name, Name, '', 1, 0));
                AcNode := AcNode1;
                AcNode.ImageIndex := ImgFolder;
              end;
              if StartFolder <> vDir then begin
                vParent := _GetParentNode(StartFolder, AcNode);
                AcNode1 := List.Items.AddChildObject(vParent, Name, CreateData(StartFolder + Name, Name, '', 1, 0));
                AcNode := AcNode1;
                AcNode.ImageIndex := ImgFolder;
                AcNode.SelectedIndex := ImgFolder;
              end;
              FindFiles(vParentNodeGrp, StartFolder + Name, Mask, ScanSubFolders);
            end
          end
          else begin // file
            if MatchesMask(Name, Mask) = True then begin
              vExt := LowerCase(ExtractFileExt(Name));
              //            FConfigurator.Message('|' + vExt + '|',mNone);
              vImgID := ImgOther;
              if Pos(vExt, vExtArc) > 0 then vImgID := ImgArc;
              if vExt = '.doc' then vImgID := ImgWord;
              if vExt = '.xls' then vImgID := ImgExl;
              if vExt = '.mdb' then vImgID := ImgAcs;
              if vExt = '.efd' then vImgID := ImgTxt;
              if vExt = '.txt' then vImgID := ImgTxt;
              if vExt = '.ert' then vImgID := ImgErt;
              if vExt = '.mxl' then vImgID := ImgMxl;
              if vExt = '.prm' then vImgID := ImgTxt;
              if vExt = '.md' then vImgID := ImgMD;
              if vExt = '.exe' then vImgID := ImgExe;
              if vExt = '' then vExt := '.';

              if StartFolder <> vDir then begin
                vParent := _GetParentNode(StartFolder, AcNode);
                My := List.Items.AddChildObject(vParent, Name, CreateData(StartFolder, Name, vExt, 0, 0));
                My.ImageIndex := vImgID;
                My.SelectedIndex := vImgID;
              end;

              if StartFolder = vDir then begin
                My := List.Items.AddChildObject(vParentNodeGrp, Name, CreateData(StartFolder, Name, vExt, 0, 0));
                My.ImageIndex := vImgID;
                My.SelectedIndex := vImgID;
              end;
            end;
          end;
          FindResult := FindNext(SearchRec);
        end;
    finally
      FindClose(SearchRec); //!
    end;
  finally
    //List.EndUpdate;
  end;
end;
//----
// конец служебные
//---
//------------------------------------------------------------------------------

procedure TExtFrmsList.Choice;
var
  Node: TTreeNode;
  vDoc: CfgDoc;
  s: string;
  ext: string;
  Ext1C: string;
begin
  Node := List.Selected;
  if Node = nil then
    exit;

  if Node.ImageIndex = ImgFolder then
    exit;

  if (PMyRec(Node.Data).FromMD = 1) then begin
    frm.FConfigurator.Documents[PMyRec(Node.Data).FileName].Open();
    exit;
  end;

  s := PMyRec(Node.Data).FolderName + PMyRec(Node.Data).FileName;
  ext := LowerCase(ExtractFileExt(s));
  Ext1C := '.ert,.mxl,.efd,.txt,.prm,.spl';
  if (Pos(ext, Ext1C) > 0) then begin
    vDoc := frm.FConfigurator.Documents.Open(s);
    vDoc.Open();
  end
  else begin
    ShellExecute(
      frm.handle,
      'open',
      pchar(s),
      '',
      PChar(PMyRec(Node.Data).FolderName),
      SW_SHOWNORMAL
      );
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Delete;
var
  s: string;
begin
  if List.Selected <> nil then begin
    if MessageDlg('Удалить запись?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      if List.Selected.ImageIndex = 0 then
        SendToRecycleBin(ExcludeTrailingBackslash(PMyRec(List.Selected.Data).FolderName))
      else
        SendToRecycleBin(
          PMyRec(List.Selected.Data).FolderName
          + PMyRec(List.Selected.Data).FileName
          );
      List.Selected.Delete;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Edit;
var
  SHF: TSHFileOpStruct;
  s: string;
  Node: TTreeNode;
  vOldPos, vNewPos, CurName: string;
  i: Integer;
begin
  try
    Node := List.Selected;

    if Node = nil then
      exit;

    if PMyRec(Node.Data).FromMD = 1 then begin
      //frm.FConfigurator.MDWnd.OpenObject('',mdaProps);
      exit;
    end;

    i := Node.AbsoluteIndex;

    CurName := PMyRec(Node.Data).FileName;
    s := InputBox('Название', 'Введити имя', CurName);
    if Node.ImageIndex <> ImgFolder then begin
      vOldPos := PMyRec(Node.Data).FolderName + PMyRec(Node.Data).FileName;
      if s <> CurName then
        vNewPos := PMyRec(Node.Data).FolderName + s;
    end;
    if Node.ImageIndex = ImgFolder then begin
      vOldPos := ExcludeTrailingBackslash(PMyRec(Node.Data).FolderName);
      if s <> CurName then begin
        vNewPos := PMyRec(Node.Data).FolderName;
        vNewPos := ExcludeTrailingBackslash(vNewPos);
        vNewPos := ExtractFileDir(vNewPos);
        //vNewPos := IncludeTrailingBackslash(vNewPos);
        vNewPos := vNewPos + '\' + s;
        ShowMessage(vNewPos);
        //        exit;
      end;
    end;

    with SHF do begin
      Wnd := Application.Handle;
      wFunc := FO_RENAME;

      fFlags := FOF_ALLOWUNDO // Preserves undo information, if possible.
      or FOF_SILENT //  Does not display a progress dialog box.
      or FOF_NOCONFIRMATION; //  Responds with "yes to all" for any dialog box that is displayed.

      pFrom := PChar(vOldPos + #0);
      pTo := PChar(vNewPos);

      fAnyOperationsAborted := false;
      hNameMappings := nil;
      lpszProgressTitle := 'идет обработка ...';
    end;
    SHFileOperation(SHF);
    Fill;
    List.Select(List.Items.Item[i]);
  except
    // to do : generate error
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Fill;
var
  InFile: TextFile;
  S: string;
  vName: string;
  vPath: string;
  vFindPos: Integer;
  vParentNodeGrp, Node: TTreeNode;
  MyRecPtr: PMyRec;
  i: Integer;
  Met: IMetaDataObjArray;
begin
  try
    frm.btnRefreshClick(frm.btnRefresh); //!
    List.Items.BeginUpdate();
    List.Items.Clear();
    List.SortType := stNone;
    for i := 0 to frm.ListViewDirs.Items.Count - 1 do begin //!
      vDir := IncludeTrailingBackslash(frm.ListViewDirs.Items[i].SubItems[0]); //!
      vName := frm.ListViewDirs.Items[i].Caption; //!
      New(MyRecPtr);
      MyRecPtr.FolderName := vDir;
      MyRecPtr.FileName := vName;
      MyRecPtr.IsFolder := 1;
      vParentNodeGrp := List.Items.AddObject(nil, vName, MyRecPtr);
      vParentNodeGrp.ImageIndex := 0;
      vParentNodeGrp.SelectedIndex := 0;
      FindFiles(vParentNodeGrp, vDir, frm.ListViewDirs.Items[i].SubItems[1], True); //!
    end;
    if frm.cbIBDirFiles.Checked then begin
      vDir := frm.FConfigurator.IBDir;
      vName := frm.FConfigurator.MetaData.TaskDef.Name;
      New(MyRecPtr);
      MyRecPtr.FolderName := vDir;
      MyRecPtr.FileName := vName;
      MyRecPtr.IsFolder := 1;
      vParentNodeGrp := List.Items.AddObject(nil, vName, MyRecPtr);
      vParentNodeGrp.ImageIndex := 0;
      vParentNodeGrp.SelectedIndex := 0;
      FindFiles(vParentNodeGrp, vDir, '*.*', True);
    end;

    if frm.cbObjFromMD.Checked then begin
      // отчеты
      vParentNodeGrp := List.Items.AddObject(nil, 'Отчеты', CreateData('', '', '', 1, 1));
      Met := frm.FConfigurator.MetaData.TaskDef.Childs[5];
      for i := 0 to Met.Count - 1 do begin
        Node := list.items.AddChildObject(vParentNodeGrp,GetMetView(Met.item[i]), CreateData('', 'Отчет.' + Met.item[i].Name + '.Форма', '', 0, 1));
        Node.ImageIndex := ImgErt;
        Node.SelectedIndex := ImgErt;
      end;
      // обработки
      vParentNodeGrp := List.Items.AddObject(nil, 'Обработки', CreateData('', '', '', 1, 1));
      Met := frm.FConfigurator.MetaData.TaskDef.Childs[6];
      for i := 0 to Met.Count - 1 do begin
        Node := list.items.AddChildObject(vParentNodeGrp,GetMetView(Met.item[i]), CreateData('', 'Обработка.' + Met.item[i].Name + '.Форма', '', 0, 1));
        Node.ImageIndex := ImgErt;
        Node.SelectedIndex := ImgErt;
      end;
    end;
    List.SortType := stData;
    List.Items.EndUpdate();
  except
    //
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Info;
var
  i: Integer;
  s, vFileName: string;
begin
  if List.Selected = nil then exit;

  if PMyRec(List.Selected.Data).FromMD = 1 then
    exit;

  if List.Selected.ImageIndex = 0 then
    exit
  else
    vFileName := PMyRec(List.Selected.Data).FolderName + PMyRec(List.Selected.Data).FileName;

  s := vFileName + #13#10 + 'Дата последнего изменения: ' + DateTimeToStr(FileDateToDateTime(FileAge(vFileName)));
  s := s + #13#10 + 'Размер файла: ' + IntToStr(GetFileSize(vFileName));
  ShowMessage(s);
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.NewFolder;
var
  s, vFolder: string;
begin
  if List.Selected = nil then exit;

  s := InputBox('Новый каталог', 'Имя каталога', '');
  vFolder := PMyRec(List.Selected.Data).FolderName;
  if s <> '' then begin
    if CreateDir(vFolder + s) = false then begin
      ShowMessage('Не могу создать каталог: ' + vFolder + s);
    end;
  end;
end;
//------------------------------------------------------------------------------

constructor TExtFrmsList.CreateObj(frmEF: TTreeeFilesActiveFormX);
begin
  inherited Create;
  frm := frmEF;
  List := frm.TreeView1;
end;
//------------------------------------------------------------------------------

destructor TExtFrmsList.Destroy;
begin
end;
//------------------------------------------------------------------------------

function TExtFrmsList.ReternFileInfo(
  const ParamFile: WideString): WideString;
begin
  if PMyRec(list.Selected.Data).FromMD = 1 then begin
    Result := PMyRec(list.Selected.Data).FileName;
  end
  else begin
    if AnsiLowerCase(ParamFile) = 'dir' then
      Result := PMyRec(list.Selected.Data).FolderName;
    if AnsiLowerCase(ParamFile) = 'name' then
      Result := PMyRec(list.Selected.Data).FileName;
    if AnsiLowerCase(ParamFile) = 'ext' then
      Result := PMyRec(list.Selected.Data).fext;
    if AnsiLowerCase(ParamFile) = 'isfolder' then
      Result := IntToStr(PMyRec(list.Selected.Data).IsFolder);
    if AnsiLowerCase(ParamFile) = 'frommd' then
      Result := IntToStr(PMyRec(list.Selected.Data).FromMD);
    if AnsiLowerCase(ParamFile) = 'lastedit' then
      Result := DateTimeToStr(FileDateToDateTime(FileAge(PMyRec(List.Selected.Data).FolderName + PMyRec(List.Selected.Data).FileName)));
    if AnsiLowerCase(ParamFile) = 'size' then
      Result := IntToStr(GetFileSize(PMyRec(List.Selected.Data).FolderName + PMyRec(List.Selected.Data).FileName))
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TExtFrmsList, Class_ExtFrmsList,
    ciMultiInstance, tmApartment);
end.

