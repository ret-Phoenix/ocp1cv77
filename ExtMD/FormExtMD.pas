unit FormExtMD;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, ExtMD_TLB, StdVcl, ComCtrls, ToolWin, Menus, ImgList,
  OpenConf_TLB, ActnList, StdCtrls;

const
  ConstPluginName = 'ExtMD';

type
  TFileMD = class(TObject)
  public
    MDFile: IMD;
  end;

type
  pTreeData = ^TTreeData;
  TTreeData = record
    FolderClass: string;
    Part: string;
    Module: string;
    ID: string;
  end;

type
  TfrmExtMD = class(TActiveForm, IfrmExtMD, IConfigPlugin)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    TreeViewMD: TTreeView;
    ProgressBar1: TProgressBar;
    ImageListSubSustems: TImageList;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PopupMenuFavorites: TPopupMenu;
    FavoriteMenu: TMenuItem;
    ActionList1: TActionList;
    DocOpen: TAction;
    DocSaveToFile: TAction;
    MDFileOpen: TAction;
    MDFileClose: TAction;
    MDFavorites: TAction;
    btnFavorites: TButton;
    procedure btnFavoritesClick(Sender: TObject);
    procedure TreeViewMDDblClick(Sender: TObject);
    procedure FavoriteMenuClick(Sender: TObject);
    procedure MDFavoritesExecute(Sender: TObject);
    procedure MDFileCloseExecute(Sender: TObject);
    procedure MDFileOpenExecute(Sender: TObject);
    procedure DocSaveToFileExecute(Sender: TObject);
    procedure DocOpenExecute(Sender: TObject);
  private
    { Private declarations }
    FEvents: IfrmExtMDEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);

    procedure GetFavoritesList;
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
      override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }

    FConfigurator: IConfigurator;

    // my
    procedure Echo(s: string);
    function GetCfgNode(vNode: TTreeNode): TTreeNode;
    function GetListUsers: IListUsers; safecall;
    function GetMDFile: IMD; safecall;

    // system
    procedure Initialize; override;

  private
    function Init(const pConfigurator: IConfigurator; out PluginName:
      WideString): HResult; stdcall;
    function Done: HResult; stdcall;
    function GetPluginCaps(capNum: PluginCaps; out pResult: OleVariant):
      HResult;
      stdcall;
    function DoAction(Action: PluginAction; Param: OleVariant; out pResult:
      OleVariant): HResult; stdcall;
  end;

implementation

uses ComObj, ComServ, MD,ListUsers;

{$R *.DFM}

{ TfrmExtMD }

procedure TfrmExtMD.DefinePropertyPages(DefinePropertyPage:
  TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_frmExtMDPage); }
end;

procedure TfrmExtMD.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfrmExtMDEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TfrmExtMD.Initialize;
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
end;

function TfrmExtMD.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfrmExtMD.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TfrmExtMD.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfrmExtMD.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfrmExtMD.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfrmExtMD.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfrmExtMD.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfrmExtMD.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TfrmExtMD.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfrmExtMD.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfrmExtMD.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfrmExtMD.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfrmExtMD.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfrmExtMD.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfrmExtMD.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfrmExtMD.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TfrmExtMD.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfrmExtMD.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfrmExtMD.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TfrmExtMD.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TfrmExtMD.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TfrmExtMD.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfrmExtMD.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfrmExtMD._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmExtMD.AboutBox;
begin
  //ShowfrmExtMDAbout;
end;

procedure TfrmExtMD.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnActivate;
end;

procedure TfrmExtMD.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnClick;
end;

procedure TfrmExtMD.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCreate;
end;

procedure TfrmExtMD.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDblClick;
end;

procedure TfrmExtMD.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDeactivate;
end;

procedure TfrmExtMD.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDestroy;
end;

procedure TfrmExtMD.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then
    FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfrmExtMD.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPaint;
end;

procedure TfrmExtMD.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfrmExtMD.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfrmExtMD.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfrmExtMD.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfrmExtMD.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfrmExtMD.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TfrmExtMD.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfrmExtMD.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfrmExtMD.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfrmExtMD.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmExtMD.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TfrmExtMD.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfrmExtMD.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfrmExtMD.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TfrmExtMD.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfrmExtMD.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfrmExtMD.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TfrmExtMD.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TfrmExtMD.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TfrmExtMD.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
//------------------------------------------------------------------------------
//        my proc and func
//------------------------------------------------------------------------------

// system begin

function TfrmExtMD.Init(const pConfigurator: IConfigurator; out
  PluginName: WideString): HResult;
begin
  FConfigurator := pConfigurator;
  PluginName := ConstPluginName;

  MDFavoritesExecute(btnFavorites);
  Result := S_OK;
end;

function TfrmExtMD.Done: HResult; stdcall;
begin
  //  vReader._Release();
  //  vReader := nil;
  //
  //  vDocFile._Release();
  //  vDocFile := nil;

  FConfigurator := nil;
  Result := S_OK;
end;
//------------------------------------------------------------------------------

function TfrmExtMD.GetPluginCaps(capNum: PluginCaps; out pResult:
  OleVariant): HResult; //stdcall;
begin
  if capNum = capOpenIn then
    pResult := 1;
  Result := S_OK;
end;
//------------------------------------------------------------------------------

function TfrmExtMD.DoAction(Action: PluginAction; Param: OleVariant; out
  pResult: OleVariant): HResult;
  stdcall;
begin
  Result := S_OK;
end;

// system end

// tech begin

procedure TfrmExtMD.Echo(s: string);
begin
  FConfigurator.Message(s, mNone);
end;

function TfrmExtMD.GetCfgNode(vNode: TTreeNode): TTreeNode;
begin
  if vNode.Parent <> nil then
  begin
    vNode := GetCfgNode(vNode.Parent);
  end;
  Result := vNode;
end;

// tech end

procedure TfrmExtMD.DocOpenExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vMD: TFileMD;
begin
  if TreeViewMD.Selected = nil then exit;
  vNode := GetCfgNode(TreeViewMD.Selected);
  vMD := TFileMD(vNode.data);
  vMD.MDFile.TextOpen;
end;

procedure TfrmExtMD.DocSaveToFileExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vMD: TFileMD;
  s: widestring;
begin
  if TreeViewMD.Selected = nil then exit;
  s := '';
  vNode := GetCfgNode(TreeViewMD.Selected);
  vMD := TFileMD(vNode.data);
  vMD.MDFile.TextSaveInFile(s);
end;

procedure TfrmExtMD.MDFileOpenExecute(Sender: TObject);
var
  vDocFileLoc: IMD;
  s: WideString;
begin
  if OpenDialog1.Execute(GetActiveWindow) then
  begin
    s := OpenDialog1.FileName;
    vDocFileLoc := TMD.CreateObj(self);
    vDocFileLoc.OpenFile(s);
  end;
end;

procedure TfrmExtMD.MDFileCloseExecute(Sender: TObject);
var
  vCurNode: TTreeNode;
  vMD: TFileMD;
begin
  if MessageDlg('Удалить ветку конфигурации?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vCurNode := TreeViewMD.Selected;
    if vCurNode = nil then
      exit;
    vCurNode := GetCfgNode(TreeViewMD.Selected);
    vMD := TFileMD(vCurNode.data);
    vMD.MDFile.CloseFile;
  end;
end;

procedure TfrmExtMD.GetFavoritesList;
var
  MItem: TMenuItem;
  F: TextFile;
  vFileName: string;
  S, SName, SPath: string;
  vPos: Integer;
begin
  PopupMenuFavorites.Items.Clear;
  vFileName := FConfigurator.BinDir + 'config\data\ExtDMFavorites.lst';
  if FileExists(vFileName) then
  begin
    AssignFile(F, vFileName);
    Reset(F);
    while not EOF(F) do
    begin
      Readln(F, S);
      vPos := Pos(':=', S);
      if vPos <> 0 then
        SName := Copy(S, 0, vPos - 1);
      SPath := Copy(S, vPos + 2, length(S));
      begin
      end;
      MItem := TMenuItem.Create(PopupMenuFavorites);
      with MItem do
      begin
        if SName = '' then
          SName := Trim(SPath);
        Caption := Trim(SName);
        Hint := SPath;
        OnClick := FavoriteMenuClick;
      end;
      PopupMenuFavorites.Items.Add(MItem);
    end;
    CloseFile(F);
  end;
end;


procedure TfrmExtMD.MDFavoritesExecute(Sender: TObject);
begin
//var
//  CtrlRect : TRect;
////  PanelCtrlRect : TRect;
//begin
//  GetFavoritesList;
//  if PopupMenuFavorites.Items.Count = 0 then begin
//    ShowMessage('Избранное пусто!');
//    exit;
//  end;
//  btnFavorites.DropdownMenu := PopupMenuFavorites;
//  //GetWindowRect(btnFavorites.Handle, CtrlRect);
//  GetWindowRect(ToolBar1.Handle, CtrlRect);
//  PopupMenuFavorites.Popup(CtrlRect.Left,CtrlRect.Bottom);
//  //PopupMenuFavorites.Popup(self.Left+btnFavorites.Left,self.Top+btnFavorites.Top);
end;

procedure TfrmExtMD.FavoriteMenuClick(Sender: TObject);
var
  vDocFileLoc: IMD;
  s: WideString;
begin
  s := Trim((Sender as (TMenuItem)).Hint);
  if FileExists(s) then
  begin
    vDocFileLoc := TMD.CreateObj(self);
    vDocFileLoc.OpenFile(s);
  end
  else
  begin
    ShowMessage('Не найден : <' + s + '>');
  end;
  //btnFavorites.DropdownMenu := nil;
end;

procedure TfrmExtMD.TreeViewMDDblClick(Sender: TObject);
begin
  DocOpenExecute(nil);
end;

function TfrmExtMD.GetListUsers: IListUsers;
var
  vDFile: IListUsers;
begin
  vDFile := TListUsers.Create;
  Result := vDFile;
  Result._AddRef;
end;

function TfrmExtMD.GetMDFile: IMD;
var
  vDFile: IMD;
begin
  vDFile := TMD.CreateObj(self);
  Result := vDFile;
  Result._AddRef;
end;

procedure TfrmExtMD.btnFavoritesClick(Sender: TObject);
var
  CtrlRect : TRect;
begin
  GetFavoritesList;
  if PopupMenuFavorites.Items.Count = 0 then begin
    ShowMessage('Избранное пусто!');
    exit;
  end;
  GetWindowRect(btnFavorites.Handle, CtrlRect);
  PopupMenuFavorites.Popup(CtrlRect.Left,CtrlRect.Bottom);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfrmExtMD,
    Class_frmExtMD,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

