unit Artbear_ActiveFormImpl1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, ExtFormsTree_TLB, StdVcl, StdCtrls, OpenConf_TLB, ComCtrls,
  ToolWin, ImgList, ShlObj, ShellApi, ExtCtrls, FileCtrl, Menus,
  Mask, Buttons;

const
  ConstPluginName = 'Внешние формы';
  ImgFolder = 0;
  ImgErt = 1;
  ImgMxl = 2;
  ImgTxt = 3;
  ImgOther = 11;
  ImgArc = 12;
  ImgWord = 13;
  ImgExl = 14;
  ImgAcs = 15;
  ImgMD = 16;
  ImgExe = 20;

type

  TTreeeFilesActiveFormX = class(TActiveForm, ExtFormsTree_ActiveFormX, IConfigPlugin)
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheetEFT: TTabSheet;
    TabSheetTuning: TTabSheet;
    ToolBar1: TToolBar;
    btnAddDir: TToolButton;
    btnEdit: TToolButton;
    btnDelDir: TToolButton;
    btnRefresh: TToolButton;
    ListViewDirs: TListView;
    ToolButton1: TToolButton;
    ToolBar2: TToolBar;
    btnFullTreeFiles: TToolButton;
    btnInfo: TToolButton;
    ToolButton8: TToolButton;
    btnNewFolder: TToolButton;
    btnEditName: TToolButton;
    btnDelete: TToolButton;
    ToolButton4: TToolButton;
    btnChoice: TToolButton;
    ToolButton6: TToolButton;
    cbMove: TCheckBox;
    ComboBoxToDoWithSameName: TComboBox;
    TreeView1: TTreeView;
    Image1: TImage;
    ToolBar3: TToolBar;
    cbIBDirFiles: TCheckBox;
    cbObjFromMD: TCheckBox;
    ToolBar4: TToolBar;
    btnGoToBookmarks: TToolButton;
    btnNewBookmark: TToolButton;
    btnDeleteBookmark: TToolButton;
    btnPrevBookmark: TToolButton;
    btnNextBookmark: TToolButton;
    ToolButton11: TToolButton;
    ComboBoxMDViewVariant: TComboBox;
    ToolButton2: TToolButton;
    procedure Button1Click(Sender: TObject);

    //------------------------------------------------------------------------------
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1Compare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);

    procedure btnAddDirClick(Sender: TObject);
    procedure btnDelDirClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFullTreeFilesClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnNewFolderClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditNameClick(Sender: TObject);
    procedure btnChoiceClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure ListViewDirsDblClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnGoToBookmarksClick(Sender: TObject);
    procedure btnNewBookmarkClick(Sender: TObject);
    procedure btnDeleteBookmarkClick(Sender: TObject);
    procedure btnPrevBookmarkClick(Sender: TObject);
    procedure btnNextBookmarkClick(Sender: TObject);

    //------------------------------------------------------------------------------
  private
    { Private declarations }
    FEvents: ExtFormsTree_ActiveFormXEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);

  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_HelpKeyword: WideString; safecall;
    function Get_HelpType: TxHelpType; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_HelpKeyword(const Value: WideString); safecall;
    procedure Set_HelpType(Value: TxHelpType); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    //procedure Run; safecall;
  public
    { Public declarations }
    FConfigurator: IConfigurator;
    vExtFrmsLst: IExtFrmsList;
    vTuningLst: ITuningExtformsList;
    vOptions: IOptions;
    vBookmarks : IBookmarks;

    procedure Initialize; override;
    function GetExtFrmsList: IExtFrmsList; safecall;
    function GetTuningList: ITuningExtformsList; safecall;
    function GetOptions: IOptions; safecall;
    function GetBookmarks: IBookmarks; safecall;

    procedure GoToSheet(const val: WideString); safecall;
    function GetCurrentPage: WideString; safecall;
  private
    FDebugFlag: Boolean;

    { IConfigPlugin }
    function Init(const pConfigurator: IConfigurator; out PluginName: WideString): HResult; stdcall;
    function Done: HResult; stdcall;
    function GetPluginCaps(capNum: PluginCaps; out pResult: OleVariant): HResult; stdcall;
    function DoAction(Action: PluginAction; Param: OleVariant; out pResult: OleVariant): HResult; stdcall;

    { мои собственные}
    procedure Echo(s: string);
    procedure Debug(s: string); overload;
    procedure Debug(title, s: string); overload;
    procedure ErrorMessage(s: string);
// Артур
		procedure OnEFTClickEvent(bFlagNotUsePlaginsMaking: boolean);
// end
  end;

type
  PMyRec = ^TMyRec;
  TMyRec = record
    fext: string;
    FolderName: string;
    FileName: string;
    IsFolder: Integer;
    FromMD: Integer;
  end;

var
  AcNode: TTreeNode;
  AcNode1: TTreeNode;
  vStr: string;
  vVariant: string;
  vDir: string;
  vOptionsFile: string;
  vOptionsLocalFile: string;
  vOptionsPersonalFile: string;
  vPersonalFolder: string;
  vIBFolder: string;
implementation

uses ComObj, ComServ, FormEditPath, ExtFormsList, TuningExtformsList,
  Options,Bookmarks;

{$R *.DFM}

{ TArtbear_ActiveFormX }

procedure TTreeeFilesActiveFormX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_Artbear_ActiveFormXPage); }
end;

procedure TTreeeFilesActiveFormX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ExtFormsTree_ActiveFormXEvents;
  inherited EventSinkChanged(EventSink);
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
// Артур
// end
  //+
  ComboBoxToDoWithSameName.ItemIndex := 1;
  //-
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.Get_Active: WordBool;
begin
  Result := Active;
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TTreeeFilesActiveFormX.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TTreeeFilesActiveFormX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TTreeeFilesActiveFormX.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TTreeeFilesActiveFormX.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TTreeeFilesActiveFormX.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TTreeeFilesActiveFormX.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TTreeeFilesActiveFormX.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TTreeeFilesActiveFormX.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TTreeeFilesActiveFormX.Get_HelpKeyword: WideString;
begin
  Result := WideString(HelpKeyword);
end;

function TTreeeFilesActiveFormX.Get_HelpType: TxHelpType;
begin
  Result := Ord(HelpType);
end;

function TTreeeFilesActiveFormX.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TTreeeFilesActiveFormX.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TTreeeFilesActiveFormX.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TTreeeFilesActiveFormX.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TTreeeFilesActiveFormX.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TTreeeFilesActiveFormX.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TTreeeFilesActiveFormX._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTreeeFilesActiveFormX.ActivateEvent(Sender: TObject);
begin
  //if FEvents <> nil then FEvents.OnActivate;
end;

procedure TTreeeFilesActiveFormX.ClickEvent(Sender: TObject);
begin
  //if FEvents <> nil then FEvents.OnClick;
end;

procedure TTreeeFilesActiveFormX.CreateEvent(Sender: TObject);
begin
  //  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TTreeeFilesActiveFormX.DblClickEvent(Sender: TObject);
begin
  //  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TTreeeFilesActiveFormX.DeactivateEvent(Sender: TObject);
begin
  //  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TTreeeFilesActiveFormX.DestroyEvent(Sender: TObject);
begin
  //  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TTreeeFilesActiveFormX.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  //  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TTreeeFilesActiveFormX.PaintEvent(Sender: TObject);
begin
  //  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TTreeeFilesActiveFormX.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TTreeeFilesActiveFormX.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TTreeeFilesActiveFormX.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TTreeeFilesActiveFormX.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TTreeeFilesActiveFormX.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TTreeeFilesActiveFormX.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TTreeeFilesActiveFormX.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TTreeeFilesActiveFormX.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TTreeeFilesActiveFormX.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TTreeeFilesActiveFormX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTreeeFilesActiveFormX.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TTreeeFilesActiveFormX.Set_HelpKeyword(const Value: WideString);
begin
  HelpKeyword := string(Value);
end;

procedure TTreeeFilesActiveFormX.Set_HelpType(Value: TxHelpType);
begin
  HelpType := THelpType(Value);
end;

procedure TTreeeFilesActiveFormX.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TTreeeFilesActiveFormX.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TTreeeFilesActiveFormX.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TTreeeFilesActiveFormX.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TTreeeFilesActiveFormX.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
{
procedure TTreeeFilesActiveFormX.Run;
var s: WideString;
  v:OleVariant;
begin
    s := 'код';
//  v := s;
//  if FEvents <> nil then FEvents.Method1(v);
//  s := v;
  if FEvents <> nil then FEvents.Method1(s);
  Echo('после '+s);
end;
}

procedure TTreeeFilesActiveFormX.Echo(s: string);
begin
  FConfigurator.Message(s, mNone);
end;

procedure TTreeeFilesActiveFormX.ErrorMessage(s: string);
begin
  FConfigurator.Message(s, mRedErr);
end;

procedure TTreeeFilesActiveFormX.Debug(s: string);
begin
  if FDebugFlag then
    Echo(s);
end;

procedure TTreeeFilesActiveFormX.Debug(title, s: string);
begin
  if FDebugFlag then
    Echo(title + '-' + s);
end;

{ IConfigPlugin }

function TTreeeFilesActiveFormX.Init(const pConfigurator: IConfigurator; out PluginName: WideString): HResult;
var
  t: TStringList;
  ppidl: PItemIDList;
  buf: array[1..MAX_PATH] of char;
begin
  FConfigurator := pConfigurator;
  PluginName := ConstPluginName;
  FDebugFlag := False;
  FDebugFlag := True;
  vOptionsFile := ExtractFileDir(FConfigurator.BinDir) + '\Config\ExtFormsTree.txt'; //ExtractFileDir(FConfigurator.Plugins.path[0]) + '\ExtFormsTree.txt';
  vOptionsLocalFile := ExtractFileDir(FConfigurator.IBDir) + '\ExtFormsTree.txt';

  vExtFrmsLst := TExtFrmsList.CreateObj(self);
  vTuningLst := TTuningExtformsList.CreateObj(self);
  vOptions := TOptions.CreateObj(self);
  vBookmarks := TBookmarks.CreateObj(self); 

  SHGetSpecialFolderLocation(Handle, CSIDL_PERSONAL, ppidl);
  SHGetPathFromIDList(ppidl, @buf);
  vPersonalFolder := StrPas(@buf);
  //ShowMessage(StrPas(@buf));
  vOptionsPersonalFile := vPersonalFolder + '\ExtFormsTree.txt';

  vIBFolder := FConfigurator.IBDir;

  btnRefreshClick(btnRefresh);
  btnFullTreeFilesClick(btnFullTreeFiles);
  //
  Result := S_OK;
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.GetTuningList: ITuningExtformsList;
begin
  Result := vTuningLst;
  Result._AddRef; // без этой строки не освобождается память
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.GetExtFrmsList: IExtFrmsList;
begin
  Result := vExtFrmsLst;
  Result._AddRef; // без этой строки не освобождается память
end;
//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.GetOptions: IOptions;
begin
  Result := vOptions;
  Result._AddRef; // без этой строки не освобождается память
end;
//------------------------------------------------------------------------------
function TTreeeFilesActiveFormX.GetBookmarks: IBookmarks;
begin
  Result := vBookmarks;
  Result._AddRef; // без этой строки не освобождается память
end;

//------------------------------------------------------------------------------

function TTreeeFilesActiveFormX.Done: HResult; stdcall;
begin
  FConfigurator := nil;
  Result := S_OK;
end;
//------------------------------------------------------------------------------
function TTreeeFilesActiveFormX.GetPluginCaps(capNum: PluginCaps; out pResult: OleVariant): HResult; //stdcall;
begin
  if capNum = capOpenIn then
    pResult := 1;
  Result := S_OK;
end;
//------------------------------------------------------------------------------
function TTreeeFilesActiveFormX.DoAction(Action: PluginAction; Param: OleVariant; out pResult: OleVariant): HResult; stdcall;
begin
  Result := S_OK;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.Button1Click(Sender: TObject);
begin
  // Run;
end;
//------------------------------------------------------------------------------
{
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
}
procedure TTreeeFilesActiveFormX.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  Node, SelNode: TTreeNode;
begin
  Node := TreeView1.GetNodeAt(x, y);
  Accept := (Sender = Source) and (Node <> nil);
  if not Accept then
    Exit;
  SelNode := Treeview1.Selected;
  while (Node.Parent <> nil) and (Node <> SelNode) do begin
    Node := Node.Parent;
    if Node = SelNode then
      Accept := False;
  end;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Node, SelNode: TTreeNode;
  vOldPos, vNewPos: string;

  OpStruc: TSHFileOpStruct;
  frombuf, tobuf: array[0..128] of Char;

  PopupMenuDragNDrop: TPopupMenu;
  MenuItem: TMenuItem;
  S: string;
  I: Integer;
begin
  Node := TreeView1.GetNodeAt(X, Y);
  i := Node.AbsoluteIndex;
  if Node = nil then
    Exit;

  if Node.ImageIndex <> 0 then
    Node := Node.Parent;

  SelNode := TreeView1.Selected;

  if Node = SelNode then
    exit;

  SelNode.MoveTo(Node, naAddChild);

  if SelNode.ImageIndex <> ImgFolder then begin
    vOldPos := PMyRec(SelNode.Data).FolderName + PMyRec(SelNode.Data).FileName;
    vNewPos := PMyRec(Node.Data).FolderName + PMyRec(SelNode.Data).FileName;
  end;
  if SelNode.ImageIndex = ImgFolder then begin
    vOldPos := PMyRec(SelNode.Data).FolderName;
    vNewPos := PMyRec(Node.Data).FolderName;
  end;

  with OpStruc do begin
    Wnd := Handle;

    if cbMove.Checked then
      wFunc := FO_MOVE
    else
      wFunc := FO_COPY;

    pFrom := pchar(vOldPos + #0);
    pTo := pchar(vNewPos);

    case ComboBoxToDoWithSameName.ItemIndex of
      0: fFlags := FOF_NOCONFIRMMKDIR or FOF_NOCONFIRMATION;
      1: fFlags := FOF_NOCONFIRMMKDIR or FOF_RENAMEONCOLLISION;
    end;

    fAnyOperationsAborted := False;
    hNameMappings := nil;
    lpszProgressTitle := nil;
    ShFileOperation(OpStruc);
  end;
  btnFullTreeFilesClick(sender);
  TreeView1.Select(TreeView1.Items.Item[i]);
  PageControl1.ActivePage := TabSheetTuning;
  PageControl1.ActivePage := TabSheetEFT;
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
{
function GetIndCount(MyNode: TTreeNode; vCount: Integer): Integer;
var
  i: Integer;
begin
  try
    Result := vCount;
    if MyNode.Parent = nil then begin
      vCount := vCount + MyNode.Index;
      Result := vCount;
    end
    else begin
      vCount := vCount + MyNode.Index;
      Result := GetIndCount(MyNode.Parent, vCount + 1);
    end;
  except
    // nothing
  end;
end;
}
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.TreeView1Compare(Sender: TObject; Node1, Node2: TTreeNode;
  Data: Integer; var Compare: Integer);
var
  vDop: Boolean;
begin
  vDop := PMyRec(Node2.Data).fext < PMyRec(Node1.Data).fext;
  Compare := Integer(vDop) //Integer(PMyRec(Node2.Data).fext) - Integer(PMyRec(Node1.Data).fext);
end;
//------------------------------------------------------------------------------
{
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
}
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnAddDirClick(Sender: TObject);
begin
  vTuningLst.NewParh;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnDelDirClick(Sender: TObject);
begin
  vTuningLst.DeletePath;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnRefreshClick(Sender: TObject);
begin
  vTuningLst.Refresh;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnFullTreeFilesClick(Sender: TObject);
begin
  vExtFrmsLst.Fill;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnInfoClick(Sender: TObject);
begin
  vExtFrmsLst.Info;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnNewFolderClick(Sender: TObject);
begin
  vExtFrmsLst.NewFolder;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnDeleteClick(Sender: TObject);
begin
  vExtFrmsLst.Delete;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnEditNameClick(Sender: TObject);
begin
  vExtFrmsLst.Edit;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnChoiceClick(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnEFTChoiceBtnClick;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.ToolButton5Click(Sender: TObject);
begin
  with TfrmEditPath.Create(nil) do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.btnEditClick(Sender: TObject);
begin
  vTuningLst.EditPath;
end;
//------------------------------------------------------------------------------

procedure TTreeeFilesActiveFormX.ListViewDirsDblClick(Sender: TObject);
begin
  btnEditClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TTreeeFilesActiveFormX.GoToSheet(const val: WideString);
begin
  if AnsiLowerCase(val) = 'eft' then
    PageControl1.ActivePage := TabSheetEFT;
  if AnsiLowerCase(val) = 'tuning' then
    PageControl1.ActivePage := TabSheetTuning;
end;
//------------------------------------------------------------------------------
function TTreeeFilesActiveFormX.GetCurrentPage: widestring;
begin
  if PageControl1.ActivePage = TabSheetEFT then
    Result := 'eft';
  if PageControl1.ActivePage = TabSheetTuning then
    Result := 'tuning';
end;
//------------------------------------------------------------------------------
procedure TTreeeFilesActiveFormX.TreeView1Click(Sender: TObject);
// Артур
var bFlagNotUsePlaginsMaking: boolean;
begin
	bFlagNotUsePlaginsMaking := false
  if FEvents <> nil then
  	OnEFTClickEvent(bFlagNotUsePlaginsMaking);

  if bFlagNotUsePlaginsMaking then
  	//действия уже выполнены в скрипте !
  else
  	; // действия должны быть выполнены в плагине !
// end
end;
//------------------------------------------------------------------------------
procedure TTreeeFilesActiveFormX.TreeView1DblClick(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnEFTDblClick;
end;
//------------------------------------------------------------------------------
procedure TTreeeFilesActiveFormX.TreeView1CustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if cdsSelected in State then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsBold];
end;

procedure TTreeeFilesActiveFormX.btnGoToBookmarksClick(Sender: TObject);
begin
if FEvents <> nil then FEvents.OnBookmarksShow;
end;

procedure TTreeeFilesActiveFormX.btnNewBookmarkClick(Sender: TObject);
begin
  vBookmarks.Add;
end;

procedure TTreeeFilesActiveFormX.btnDeleteBookmarkClick(Sender: TObject);
begin
  vBookmarks.Delete;
end;

procedure TTreeeFilesActiveFormX.btnPrevBookmarkClick(Sender: TObject);
begin
  vBookmarks.Previos;
end;

procedure TTreeeFilesActiveFormX.btnNextBookmarkClick(Sender: TObject);
begin
  vBookmarks.Next;
end;

// Артур
procedure TTreeeFilesActiveFormX.OnEFTClickEvent(bFlagNotUsePlaginsMaking: boolean);
var v: OleVariant; s:string;
begin
  v := bFlagNotUsePlaginsMaking;
	try
    if FEvents <> nil then begin
      FEvents.OnEFTClick(v); // только Olevariant - иначе скрипт не сможет изменить это значение !
	    bFlagNotUsePlaginsMaking := v;
    end;
  except
      on E:Exception do begin
        bFlagNotUsePlaginsMaking := false;
        s := 'Возникло исключение:'#13#10+E.Message;
      	Debug(s);
  		end;
  end;
end;
// end

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TTreeeFilesActiveFormX,
    CLASS_iExtFormsTree_ActiveFormX,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmSingle);
end.

