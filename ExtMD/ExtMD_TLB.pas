unit ExtMD_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 02.11.2005 13:08:34 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Phoenix\Delphi\CfgAddons\ExtMD\ExtMD.tlb (1)
// LIBID: {22BEC3D2-1F10-43A6-A341-B00E37ADE836}
// LCID: 0
// Helpfile: 
// HelpString: ExtMD Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ExtMDMajorVersion = 1;
  ExtMDMinorVersion = 0;

  LIBID_ExtMD: TGUID = '{22BEC3D2-1F10-43A6-A341-B00E37ADE836}';

  IID_IfrmExtMD: TGUID = '{9964CBD9-BD81-431A-B1FA-778CECA55AF6}';
  DIID_IfrmExtMDEvents: TGUID = '{348CF76F-F5CE-4A39-A1A6-7C42920246B1}';
  CLASS_frmExtMD: TGUID = '{3FA40C42-7D2C-4217-91F5-4D37F38B698E}';
  IID_IMD: TGUID = '{077A3445-8076-4BCA-A15B-2401C5FF1FA2}';
  CLASS_MD: TGUID = '{1206D2F3-5FD4-4B5B-B937-7AD28244E2B2}';
  IID_IListUsers: TGUID = '{2BF3F019-2B96-4652-8385-298669D2550C}';
  CLASS_ListUsers: TGUID = '{87BA7305-D10E-4B08-8E41-C54259D76601}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

// Constants for enum TxPopupMode
type
  TxPopupMode = TOleEnum;
const
  pmNone = $00000000;
  pmAuto = $00000001;
  pmExplicit = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IfrmExtMD = interface;
  IfrmExtMDDisp = dispinterface;
  IfrmExtMDEvents = dispinterface;
  IMD = interface;
  IMDDisp = dispinterface;
  IListUsers = interface;
  IListUsersDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  frmExtMD = IfrmExtMD;
  MD = IMD;
  ListUsers = IListUsers;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPUserType1 = ^IFontDisp; {*}
  PWideString1 = ^WideString; {*}


// *********************************************************************//
// Interface: IfrmExtMD
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9964CBD9-BD81-431A-B1FA-778CECA55AF6}
// *********************************************************************//
  IfrmExtMD = interface(IDispatch)
    ['{9964CBD9-BD81-431A-B1FA-778CECA55AF6}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function GetMDFile: IMD; safecall;
    function GetListUsers: IListUsers; safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property PopupMode: TxPopupMode read Get_PopupMode write Set_PopupMode;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property UseDockManager: WordBool read Get_UseDockManager write Set_UseDockManager;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
  end;

// *********************************************************************//
// DispIntf:  IfrmExtMDDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9964CBD9-BD81-431A-B1FA-778CECA55AF6}
// *********************************************************************//
  IfrmExtMDDisp = dispinterface
    ['{9964CBD9-BD81-431A-B1FA-778CECA55AF6}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property PopupMode: TxPopupMode dispid 212;
    property ScreenSnap: WordBool dispid 213;
    property SnapBuffer: Integer dispid 214;
    property DockSite: WordBool dispid 215;
    property DoubleBuffered: WordBool dispid 216;
    property AlignDisabled: WordBool readonly dispid 217;
    property VisibleDockClientCount: Integer readonly dispid 218;
    property UseDockManager: WordBool dispid 219;
    property Enabled: WordBool dispid -514;
    function GetMDFile: IMD; dispid 220;
    function GetListUsers: IListUsers; dispid 221;
  end;

// *********************************************************************//
// DispIntf:  IfrmExtMDEvents
// Flags:     (4096) Dispatchable
// GUID:      {348CF76F-F5CE-4A39-A1A6-7C42920246B1}
// *********************************************************************//
  IfrmExtMDEvents = dispinterface
    ['{348CF76F-F5CE-4A39-A1A6-7C42920246B1}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
  end;

// *********************************************************************//
// Interface: IMD
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {077A3445-8076-4BCA-A15B-2401C5FF1FA2}
// *********************************************************************//
  IMD = interface(IDispatch)
    ['{077A3445-8076-4BCA-A15B-2401C5FF1FA2}']
    procedure OpenFile(var vFileName: WideString); safecall;
    procedure CloseFile; safecall;
    function GetRightsNamesList: WideString; safecall;
    function GetInterfacesNamesList: WideString; safecall;
    procedure TextOpen; safecall;
    procedure TextSaveInFile(var vFileName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMDDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {077A3445-8076-4BCA-A15B-2401C5FF1FA2}
// *********************************************************************//
  IMDDisp = dispinterface
    ['{077A3445-8076-4BCA-A15B-2401C5FF1FA2}']
    procedure OpenFile(var vFileName: WideString); dispid 201;
    procedure CloseFile; dispid 202;
    function GetRightsNamesList: WideString; dispid 203;
    function GetInterfacesNamesList: WideString; dispid 204;
    procedure TextOpen; dispid 205;
    procedure TextSaveInFile(var vFileName: WideString); dispid 206;
  end;

// *********************************************************************//
// Interface: IListUsers
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2BF3F019-2B96-4652-8385-298669D2550C}
// *********************************************************************//
  IListUsers = interface(IDispatch)
    ['{2BF3F019-2B96-4652-8385-298669D2550C}']
    procedure OpenFile(var vFileName: WideString); safecall;
    procedure CloseFile; safecall;
    function ReadNamesList: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IListUsersDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2BF3F019-2B96-4652-8385-298669D2550C}
// *********************************************************************//
  IListUsersDisp = dispinterface
    ['{2BF3F019-2B96-4652-8385-298669D2550C}']
    procedure OpenFile(var vFileName: WideString); dispid 201;
    procedure CloseFile; dispid 202;
    function ReadNamesList: WideString; dispid 203;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TfrmExtMD
// Help String      : frmExtMD Control
// Default Interface: IfrmExtMD
// Def. Intf. DISP? : No
// Event   Interface: IfrmExtMDEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TfrmExtMDOnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TfrmExtMD = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TfrmExtMDOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IfrmExtMD;
    function  GetControlInterface: IfrmExtMD;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetMDFile: IMD;
    function GetListUsers: IListUsers;
    property  ControlInterface: IfrmExtMD read GetControlInterface;
    property  DefaultInterface: IfrmExtMD read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property PopupMode: TOleEnum index 212 read GetTOleEnumProp write SetTOleEnumProp;
    property ScreenSnap: WordBool index 213 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 214 read GetIntegerProp write SetIntegerProp;
    property DockSite: WordBool index 215 read GetWordBoolProp write SetWordBoolProp;
    property DoubleBuffered: WordBool index 216 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 217 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 218 read GetIntegerProp;
    property UseDockManager: WordBool index 219 read GetWordBoolProp write SetWordBoolProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property  ParentColor;
    property  ParentFont;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TfrmExtMDOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

// *********************************************************************//
// The Class CoMD provides a Create and CreateRemote method to          
// create instances of the default interface IMD exposed by              
// the CoClass MD. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMD = class
    class function Create: IMD;
    class function CreateRemote(const MachineName: string): IMD;
  end;

// *********************************************************************//
// The Class CoListUsers provides a Create and CreateRemote method to          
// create instances of the default interface IListUsers exposed by              
// the CoClass ListUsers. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoListUsers = class
    class function Create: IListUsers;
    class function CreateRemote(const MachineName: string): IListUsers;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TfrmExtMD.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{3FA40C42-7D2C-4217-91F5-4D37F38B698E}';
    EventIID: '{348CF76F-F5CE-4A39-A1A6-7C42920246B1}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$00000000*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TfrmExtMD.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IfrmExtMD;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TfrmExtMD.GetControlInterface: IfrmExtMD;
begin
  CreateControl;
  Result := FIntf;
end;

function TfrmExtMD.GetMDFile: IMD;
begin
  Result := DefaultInterface.GetMDFile;
end;

function TfrmExtMD.GetListUsers: IListUsers;
begin
  Result := DefaultInterface.GetListUsers;
end;

class function CoMD.Create: IMD;
begin
  Result := CreateComObject(CLASS_MD) as IMD;
end;

class function CoMD.CreateRemote(const MachineName: string): IMD;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MD) as IMD;
end;

class function CoListUsers.Create: IListUsers;
begin
  Result := CreateComObject(CLASS_ListUsers) as IListUsers;
end;

class function CoListUsers.CreateRemote(const MachineName: string): IListUsers;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ListUsers) as IListUsers;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TfrmExtMD]);
end;

end.
