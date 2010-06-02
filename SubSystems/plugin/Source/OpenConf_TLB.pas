unit OpenConf_TLB;

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
// File generated on 17.06.2005 10:30:59 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\1Cv7715\BIN\config.tlb (1)
// LIBID: {578F85C8-89EB-4CDA-AC7E-8F3BB34E8B54}
// LCID: 0
// Helpfile:
// HelpString: Набор интерфейсов для автоматизации Конфигуратора 1С 7.7
// DepndLst:
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
// Errors:
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of ICfgDocuments.DocFromID changed to 'Type_'
//   Hint: Parameter 'Type' of ICfgDocuments.New changed to 'Type_'
//   Hint: Parameter 'Object' of ISelfScript.AddNamedItem changed to 'Object_'
//   Hint: Parameter 'Type' of ITableDoc.SaveToFileAs changed to 'Type_'
// ************************************************************************ //
// *************************************************************************//
// NOTE:
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties
// which return objects that may need to be explicitly created via a function
// call prior to any access via the property. These items have been disabled
// in order to prevent accidental use from within the object inspector. You
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively
// removing them from the $IFDEF blocks. However, such items must still be
// programmatically created via a method of the appropriate CoClass before
// they can be used.
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, Variants;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  OpenConfMajorVersion = 1;
  OpenConfMinorVersion = 3;

  LIBID_OpenConf: TGUID = '{578F85C8-89EB-4CDA-AC7E-8F3BB34E8B54}';

  IID_IMetaData: TGUID = '{2576069C-DBF4-4B30-A839-36355F461F50}';
  IID_IMetaDataObj: TGUID = '{057D4F98-D060-4AD6-BF96-BB3DD13AA1D7}';
  IID_ITaskDef: TGUID = '{B6B67039-2433-4151-B344-6AD3CE0D4A77}';
  IID_IMetaDataObjProps: TGUID = '{B2AA9FD4-C643-4D40-A0D7-D52BABF55B3D}';
  IID_IMetaDataObjChilds: TGUID = '{5B0CDE51-3BB2-4C60-8AA5-63739FD67873}';
  IID_IMetaDataObjArray: TGUID = '{9F1E178B-C0AD-4D9A-A083-9A952F2BDF31}';
  IID_IType1C: TGUID = '{9F07065B-8434-41C8-BC54-2C64C4E90110}';
  IID_IMigration: TGUID = '{59F10FCA-4E12-4381-9440-B5475A4DDD6D}';
  IID_IConstants: TGUID = '{30869711-4DA3-445E-8607-1953B0850C46}';
  IID_IConstDef: TGUID = '{6ABD59AB-7517-4C6C-9F8D-30A312073AD7}';
  IID_IMetaEnums: TGUID = '{6D5C5F96-05D5-4444-8FBD-3247EA6AC4CA}';
  IID_IMetaEnum: TGUID = '{0A75DAD6-E6F3-4116-862B-133E26BD8377}';
  IID_IMetaEnumVal: TGUID = '{9205EDA0-4587-486E-816D-50E9AA24738D}';
  IID_ICfgWindows: TGUID = '{765E4DA0-4951-11D8-8D5F-ADB28B91F406}';
  IID_ICfgWindow: TGUID = '{6E8F8C6A-B9FB-46FC-AFFA-CB0F7EB93FB9}';
  IID_ICfgDoc: TGUID = '{D1C2BB80-7206-11D8-9FCD-E9053813DA08}';
  IID_IScripts: TGUID = '{1556E6A0-B699-4F77-9496-D745DE374465}';
  IID_IPlugins: TGUID = '{59DE83B2-A571-4A2E-9C84-DA789B5858A6}';
  IID_ICfgDocuments: TGUID = '{16623674-ECAD-484B-A399-751229940CDC}';
  IID_IAllTypedObj: TGUID = '{19484B30-4771-453B-AF31-5EE02DE544D8}';
  IID_ICfgTimer: TGUID = '{04539FB9-4790-4556-9055-DA5D10CFA0A5}';
  IID_IMDWindow: TGUID = '{A0C9C161-59BD-42D4-95ED-0D4275CB820F}';
  IID_IDialogDoc: TGUID = '{2E1CCC5F-1FC5-41A0-9BF7-F4B77033A23C}';
  CLASS_MDWindow: TGUID = '{CFAEDC45-305A-4A97-B21B-89148533EB21}';
  IID_IConfigurator: TGUID = '{FF862867-BB20-44B2-949C-5EA7C09842EE}';
  DIID_IConfigEvents: TGUID = '{FF862868-BB20-44B2-949C-5EA7C09842EE}';
  CLASS_Configurator: TGUID = '{FF862869-BB20-44B2-949C-5EA7C09842EE}';
  IID_IConfigPlugin: TGUID = '{8BDEC9EA-C6F4-4B74-AC73-F3B0ED3B8D4B}';
  CLASS_Scripts: TGUID = '{BF10B93E-EBA9-473F-B5C7-04E138EEE7F3}';
  CLASS_Plugins: TGUID = '{72227927-708F-4B6F-937F-850A34B3035C}';
  CLASS_Type1C: TGUID = '{D3AE2151-3A84-4DF2-B801-43DED99A013D}';
  CLASS_MetaDataObjChilds: TGUID = '{E8855E48-E8A4-48D2-8E50-5E1970331A7B}';
  CLASS_MetaDataObjProps: TGUID = '{8D97B6F5-F5B9-41DB-9193-A921A63BB0F6}';
  CLASS_Migration: TGUID = '{81477568-ABBB-4FF3-9627-E1402985B108}';
  CLASS_MetaDataObj: TGUID = '{B5E36B88-CDA7-4107-82BF-6B20A8158B7A}';
  CLASS_MetaDataObjArray: TGUID = '{8CDA8E20-913A-4EEB-9172-A1569F663E16}';
  IID_ISelfScript: TGUID = '{D7BA8EB5-B237-4323-B971-BCB37BF3D01E}';
  CLASS_SelfScript: TGUID = '{02A7AF19-B1AD-4F20-BE50-D644BB9DDD8F}';
  CLASS_MetaEnumVal: TGUID = '{F40FD0F0-54AF-4FED-89A6-6D4233E282E5}';
  CLASS_MetaEnum: TGUID = '{03A11169-8A38-42D4-9B96-7B788537C3E5}';
  CLASS_MetaEnums: TGUID = '{036E513A-1A68-41F9-8C39-B97E1F8D8627}';
  CLASS_MetaData: TGUID = '{43A6FDE2-747B-44DD-A595-512183EE5BEB}';
  CLASS_TaskDef: TGUID = '{D685F452-6AB6-4E57-B5C2-4C3C9FC9E0D2}';
  CLASS_AllTypedObj: TGUID = '{EA8C84EE-0C03-4C8D-9548-8837F3CD163A}';
  CLASS_ConstDef: TGUID = '{1B100EE6-0A82-40C1-9285-EA329D8FFA9C}';
  CLASS_Constants: TGUID = '{756AFC1E-9A0A-4B8D-A459-97DF55A79C70}';
  CLASS_CfgDoc: TGUID = '{F9F6C920-7206-11D8-9FCD-E9053813DA08}';
  CLASS_CfgDocuments: TGUID = '{30ECB402-4E56-44BD-8E7C-6521EFDB58CE}';
  IID_IWorkBook: TGUID = '{3904CFAC-714B-4241-AF65-5FD6967A065C}';
  CLASS_WorkBook: TGUID = '{46D26A73-3D4C-4EE7-AB1F-26F42E028976}';
  IID_ITextDoc: TGUID = '{DEE7BD6F-1AF8-4DAC-A203-4E27F8C608F7}';
  CLASS_TextDoc: TGUID = '{08B07DC4-919A-4D05-9412-A1CC7F01C4B9}';
  IID_ITableDoc: TGUID = '{CEFB0920-7A8F-11D8-9FCD-D6268C95B908}';
  CLASS_TableDoc: TGUID = '{CEFB0921-7A8F-11D8-9FCD-D6268C95B908}';
  CLASS_DialogDoc: TGUID = '{A1C16C44-ABB4-48DA-A77D-1EA349BBE197}';
  CLASS_CfgWindow: TGUID = '{06C7E522-CBC8-431B-B6AD-C367152FE189}';
  CLASS_CfgWindows: TGUID = '{765E4DA1-4951-11D8-8D5F-ADB28B91F406}';
  CLASS_CfgTimer: TGUID = '{62520E90-FFC6-4A86-94DD-83BBC19435CB}';

  // *********************************************************************//
  // Declaration of Enumerations defined in Type Library
  // *********************************************************************//
  // Constants for enum TypeOfMetaDataObj
type
  TypeOfMetaDataObj = TOleEnum;
const
  tmdConstant = $00000001;
  tmdRefRekv = $00000002;
  tmdReference = $00000003;
  tmdRegIzm = $00000004;
  tmdRegResurs = $00000005;
  tmdRegister = $00000006;
  tmdDocHeadRekv = $00000007;
  tmdDocTableRekv = $00000008;
  tmdDocument = $00000009;
  tmdJDGrafa = $0000000A;
  tmdJournalDoc = $0000000B;
  tmdEnumVal = $0000000C;
  tmdEnum = $0000000D;
  tmdListRefs = $0000000E;
  tmdFormList = $0000000F;
  tmdReport = $00000010;
  tmdTask = $00000011;
  tmdKalendar = $00000012;
  tmdCalcKind = $00000013;
  tmdCalcGroup = $00000014;
  tmdCJRekv = $00000015;
  tmdCalcJournal = $00000016;
  tmdCalcVar = $00000017;
  tmdRegRekv = $00000019;
  tmdCommonRekv = $0000001A;
  tmdAccountChart = $0000001B;
  tmdAccRekv = $0000001C;
  tmdAcount = $0000001E;
  tmdAccountSubc = $0000001F;
  tmdProvRekv = $00000020;
  tmdOperRekv = $00000021;
  tmdSelGraf = $00000022;
  tmdNumbers = $00000023;
  tmdSubconto = $00000024;
  tmdStream = $0000002B;
  tmdRecalcRule = $0000002C;

  // Constants for enum tTypes
type
  tTypes = TOleEnum;
const
  ttVoid = $00000000;
  ttNumber = $00000001;
  ttString = $00000002;
  ttDate = $00000003;
  ttEnum = $0000000A;
  ttReference = $0000000B;
  ttDocument = $0000000C;
  ttKalendar = $0000000D;
  ttCalcKind = $0000000E;
  ttAccnt = $0000000F;
  ttSbcKind = $00000010;
  ttAccntChrt = $00000011;

  // Constants for enum MigrationRules
type
  MigrationRules = TOleEnum;
const
  mrAll = $00000000;
  mrCreate = $00000001;
  mrCreateCentr = $00000002;

  // Constants for enum DocTypes
type
  DocTypes = TOleEnum;
const
  docUnknown = $00000000;
  docWorkBook = $00000001;
  docText = $00000002;
  docTable = $00000003;
  docDEdit = $00000004;

  // Constants for enum mdActions
type
  mdActions = TOleEnum;
const
  mdaSelect = $00000000;
  mdaProps = $00000001;
  mdaEdit = $000083AF;
  mdaEditDescr = $000083B6;
  mdaDelete = $000083AD;
  mdaMoveUp = $000083B1;
  mdaMoveDown = $000083B0;
  mdaOrder = $000083B2;
  mdaTestRefers = $000081F4;

  // Constants for enum CtrlPropsIdx
type
  CtrlPropsIdx = TOleEnum;
const
  cpLeft = $00000000;
  cpTop = $00000001;
  cpWidth = $00000002;
  cpHeight = $00000003;
  cpStrID = $00000004;
  cpTitle = $00000005;
  cpFormul = $00000006;
  cpToolTip = $00000007;
  cpHelpString = $00000008;
  cpLayer = $00000009;
  cpMetaID = $0000000A;
  cpFlags = $0000000B;
  cpFlagsEx = $0000000C;
  cpLinkWith = $0000000D;
  cpFontName = $0000000E;
  cpFontSize = $0000000F;
  cpFontWeight = $00000011;
  cpFontItalic = $00000012;
  cpFontUnderline = $00000013;
  cpFontColor = $00000014;
  cpHotKey = $00000015;
  cpPictID = $00000016;
  cpPictMode = $00000017;

  // Constants for enum FormPropsIdx
type
  FormPropsIdx = TOleEnum;
const
  fpWidth = $00000000;
  fpHeight = $00000001;
  fpToolBar = $00000002;
  fpAutoSize = $00000003;
  fpAutoLayout = $00000004;
  fpUseAutoFont = $00000005;
  fpFontName = $00000006;
  fpFontSize = $00000007;
  fpFontWeight = $00000008;
  fpFontItalic = $00000009;
  fpFontUnderline = $0000000A;
  fpTitle = $0000000B;
  fpFlags = $0000000C;
  fpPictID = $0000000D;
  fpPictMode = $0000000E;
  fpBkColor = $0000000F;

  // Constants for enum MsgLineMarkers
type
  MsgLineMarkers = TOleEnum;
const
  mNone = $00000000;
  mBlueTriangle = $00000001;
  mExclamation = $00000002;
  mExclamation2 = $00000003;
  mExclamation3 = $00000004;
  mInformation = $00000005;
  mBlackErr = $00000006;
  mRedErr = $00000007;
  mMetaData = $00000008;
  mUnderlinedErr = $00000009;

  // Constants for enum ConfigCommands
type
  ConfigCommands = TOleEnum;
const
  cmdOpenConfigWnd = $000081A4;
  cmdLoadMD = $000081B6;
  cmdMergeMD = $000081EC;
  cmdSave = $0000E103;

  // Constants for enum MsgBoxStyles
type
  MsgBoxStyles = TOleEnum;
const
  mbOK = $00000000;
  mbOkCancel = $00000001;
  mbAbortRetryIgnore = $00000002;
  mbYesNoCancel = $00000003;
  mbYesNo = $00000004;
  mbRetryCancel = $00000005;

  // Constants for enum MsgBoxAnswers
type
  MsgBoxAnswers = TOleEnum;
const
  mbaOK = $00000001;
  mbaCancel = $00000002;
  mbaAbort = $00000003;
  mbaRetry = $00000004;
  mbaIgnore = $00000005;
  mbaYes = $00000006;
  mbaNo = $00000007;

  // Constants for enum EventCategories
type
  EventCategories = TOleEnum;
const
  ecSession = $00000000;
  ecAdmin = $00000001;
  ecChangeData = $00000002;
  ecInfo = $00000003;
  ecWarning = $00000004;
  ecError = $00000005;

  // Constants for enum RunAppModes
type
  RunAppModes = TOleEnum;
const
  rmEnterprise = $FFFFFFFF;
  rmDebugger = $00000002;
  rmMonitor = $00000004;

  // Constants for enum AppProperties
type
  AppProperties = TOleEnum;
const
  appBinDir = $00000000;
  appIBDir = $00000001;
  appUserDir = $00000002;
  appTempDir = $00000003;
  appCfgPath = $00000004;
  appDDPath = $00000005;
  appDDSPath = $00000006;
  appDBAPath = $00000007;
  appMDPath = $00000008;
  appLCKPath = $00000009;
  appIBName = $0000000C;
  appUserName = $0000000D;
  appFullUserName = $0000000E;
  appRightName = $00000010;
  appInterfaceName = $00000011;
  appRegSettingsPath = $00000012;

  // Constants for enum PluginCaps
type
  PluginCaps = TOleEnum;
const
  capOpenIn = $00000000;
  capShowMacros = $00000001;
  capIconNum = $00000002;
  capGetMenu = $00000003;

  // Constants for enum PluginAction
type
  PluginAction = TOleEnum;
const
  paMenu = $00000000;

  // Constants for enum TableSaveTypes
type
  TableSaveTypes = TOleEnum;
const
  tbMxl = $00000000;
  tbExc = $00000001;
  tbHtml = $00000002;
  tbText = $00000003;

  // Constants for enum CtrlFlags
type
  CtrlFlags = TOleEnum;
const
  ctrlSkipEnter = $00000004;
  ctrlQuickChoise = $00000008;
  ctrlUseHelpAsTip = $00000010;
  ctrlHaveSelBtn = $00000020;
  ctrlDefaultFont = $00000040;
  ctrlAutoFontColor = $00000080;
  ctrlPictureStretch = $00000100;
  ctrlDisableAutoChoise = $00000200;
  ctrlPictureCenter = $00000400;
  ctrlPictureAspect = $00000800;
  ctrlMultiLine = $00001000;
  ctrlUnVisible = $00002000;
  ctrlDisabled = $00004000;
  ctrlTransparent = $00010000;
  ctrlBorderSimple = $00020000;
  ctrlBorderEtch = $00040000;
  ctrlBorderRaise = $00080000;
  ctrlAutoChoise = $00100000;
  ctrlOnNextRow = $00400000;
  ctrlInThisColumn = $00800000;
  ctrlDontSaveSettings = $01000000;
  ctrlSelList = $02000000;
  ctrlNegativeRed = $04000000;
  ctrlUsePicture = $08000000;
  ctrlDisableEdit = $10000000;

type

  // *********************************************************************//
  // Forward declaration of types defined in TypeLibrary
  // *********************************************************************//
  IMetaData = interface;
  IMetaDataDisp = dispinterface;
  IMetaDataObj = interface;
  IMetaDataObjDisp = dispinterface;
  ITaskDef = interface;
  ITaskDefDisp = dispinterface;
  IMetaDataObjProps = interface;
  IMetaDataObjPropsDisp = dispinterface;
  IMetaDataObjChilds = interface;
  IMetaDataObjChildsDisp = dispinterface;
  IMetaDataObjArray = interface;
  IMetaDataObjArrayDisp = dispinterface;
  IType1C = interface;
  IType1CDisp = dispinterface;
  IMigration = interface;
  IMigrationDisp = dispinterface;
  IConstants = interface;
  IConstantsDisp = dispinterface;
  IConstDef = interface;
  IConstDefDisp = dispinterface;
  IMetaEnums = interface;
  IMetaEnumsDisp = dispinterface;
  IMetaEnum = interface;
  IMetaEnumDisp = dispinterface;
  IMetaEnumVal = interface;
  IMetaEnumValDisp = dispinterface;
  ICfgWindows = interface;
  ICfgWindowsDisp = dispinterface;
  ICfgWindow = interface;
  ICfgWindowDisp = dispinterface;
  ICfgDoc = interface;
  ICfgDocDisp = dispinterface;
  IScripts = interface;
  IScriptsDisp = dispinterface;
  IPlugins = interface;
  IPluginsDisp = dispinterface;
  ICfgDocuments = interface;
  ICfgDocumentsDisp = dispinterface;
  IAllTypedObj = interface;
  IAllTypedObjDisp = dispinterface;
  ICfgTimer = interface;
  ICfgTimerDisp = dispinterface;
  IMDWindow = interface;
  IMDWindowDisp = dispinterface;
  IDialogDoc = interface;
  IDialogDocDisp = dispinterface;
  IConfigurator = interface;
  IConfiguratorDisp = dispinterface;
  IConfigEvents = dispinterface;
  IConfigPlugin = interface;
  ISelfScript = interface;
  ISelfScriptDisp = dispinterface;
  IWorkBook = interface;
  IWorkBookDisp = dispinterface;
  ITextDoc = interface;
  ITextDocDisp = dispinterface;
  ITableDoc = interface;
  ITableDocDisp = dispinterface;

  // *********************************************************************//
  // Declaration of CoClasses defined in Type Library
  // (NOTE: Here we map each CoClass to its Default Interface)
  // *********************************************************************//
  MDWindow = IMDWindow;
  Configurator = IConfigurator;
  Scripts = IScripts;
  Plugins = IPlugins;
  Type1C = IType1C;
  MetaDataObjChilds = IMetaDataObjChilds;
  MetaDataObjProps = IMetaDataObjProps;
  Migration = IMigration;
  MetaDataObj = IMetaDataObj;
  MetaDataObjArray = IMetaDataObjArray;
  SelfScript = ISelfScript;
  MetaEnumVal = IMetaEnumVal;
  MetaEnum = IMetaEnum;
  MetaEnums = IMetaEnums;
  MetaData = IMetaData;
  TaskDef = ITaskDef;
  AllTypedObj = IAllTypedObj;
  ConstDef = IConstDef;
  Constants = IConstants;
  CfgDoc = ICfgDoc;
  CfgDocuments = ICfgDocuments;
  WorkBook = IWorkBook;
  TextDoc = ITextDoc;
  TableDoc = ITableDoc;
  DialogDoc = IDialogDoc;
  CfgWindow = ICfgWindow;
  CfgWindows = ICfgWindows;
  CfgTimer = ICfgTimer;

  // *********************************************************************//
  // Interface: IMetaData
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {2576069C-DBF4-4B30-A839-36355F461F50}
  // *********************************************************************//
  IMetaData = interface(IDispatch)
    ['{2576069C-DBF4-4B30-A839-36355F461F50}']
    function Get_TaskDef: ITaskDef; safecall;
    function Get_Modified: Smallint; safecall;
    function FindObject(ID: Integer): IMetaDataObj; safecall;
    procedure RefreshMDWnd; safecall;
    function SaveMDToFile(const path: WideString; FireEvent: WordBool): WordBool;
      safecall;
    function Describe: WideString; safecall;
    function Get_LongCopyright: WideString; safecall;
    function Get_ShortCopyright: WideString; safecall;
    procedure SaveMMDS(const path: WideString); safecall;
    function Get_Migration(ID: Integer): IMigration; safecall;
    function Get_Constants: IConstants; safecall;
    function TestRefers(ID: Integer; FindAll: WordBool): IMetaDataObjArray;
      safecall;
    function Get_Enums: IMetaEnums; safecall;
    property TaskDef: ITaskDef read Get_TaskDef;
    property Modified: Smallint read Get_Modified;
    property LongCopyright: WideString read Get_LongCopyright;
    property ShortCopyright: WideString read Get_ShortCopyright;
    property Migration[ID: Integer]: IMigration read Get_Migration;
    property Constants: IConstants read Get_Constants;
    property Enums: IMetaEnums read Get_Enums;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaDataDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {2576069C-DBF4-4B30-A839-36355F461F50}
  // *********************************************************************//
  IMetaDataDisp = dispinterface
    ['{2576069C-DBF4-4B30-A839-36355F461F50}']
    property TaskDef: ITaskDef readonly dispid 1;
    property Modified: Smallint readonly dispid 2;
    function FindObject(ID: Integer): IMetaDataObj; dispid 4;
    procedure RefreshMDWnd; dispid 5;
    function SaveMDToFile(const path: WideString; FireEvent: WordBool): WordBool;
      dispid 6;
    function Describe: WideString; dispid 7;
    property LongCopyright: WideString readonly dispid 8;
    property ShortCopyright: WideString readonly dispid 9;
    procedure SaveMMDS(const path: WideString); dispid 10;
    property Migration[ID: Integer]: IMigration readonly dispid 11;
    property Constants: IConstants readonly dispid 12;
    function TestRefers(ID: Integer; FindAll: WordBool): IMetaDataObjArray;
      dispid 13;
    property Enums: IMetaEnums readonly dispid 14;
  end;

  // *********************************************************************//
  // Interface: IMetaDataObj
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {057D4F98-D060-4AD6-BF96-BB3DD13AA1D7}
  // *********************************************************************//
  IMetaDataObj = interface(IDispatch)
    ['{057D4F98-D060-4AD6-BF96-BB3DD13AA1D7}']
    function Get_WhatIsIt: TypeOfMetaDataObj; safecall;
    function Get_ID: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function Get_Present: WideString; safecall;
    procedure Set_Present(const pVal: WideString); safecall;
    function Get_Descr: WideString; safecall;
    procedure Set_Descr(const pVal: WideString); safecall;
    function IsValid: WordBool; safecall;
    function Get_FullName: WideString; safecall;
    function Get_Props: IMetaDataObjProps; safecall;
    function Get_Childs: IMetaDataObjChilds; safecall;
    function Get_type_: IType1C; safecall;
    procedure Set_type_(const pVal: IType1C); safecall;
    function DescribeObject(WithChilds: WordBool): WideString; safecall;
    function Get_Parent: IMetaDataObj; safecall;
    property WhatIsIt: TypeOfMetaDataObj read Get_WhatIsIt;
    property ID: Integer read Get_ID;
    property Name: WideString read Get_Name write Set_Name;
    property Present: WideString read Get_Present write Set_Present;
    property Descr: WideString read Get_Descr write Set_Descr;
    property FullName: WideString read Get_FullName;
    property Props: IMetaDataObjProps read Get_Props;
    property Childs: IMetaDataObjChilds read Get_Childs;
    property type_: IType1C read Get_type_ write Set_type_;
    property Parent: IMetaDataObj read Get_Parent;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaDataObjDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {057D4F98-D060-4AD6-BF96-BB3DD13AA1D7}
  // *********************************************************************//
  IMetaDataObjDisp = dispinterface
    ['{057D4F98-D060-4AD6-BF96-BB3DD13AA1D7}']
    property WhatIsIt: TypeOfMetaDataObj readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property Present: WideString dispid 3;
    property Descr: WideString dispid 4;
    function IsValid: WordBool; dispid 5;
    property FullName: WideString readonly dispid 7;
    property Props: IMetaDataObjProps readonly dispid 8;
    property Childs: IMetaDataObjChilds readonly dispid 9;
    property type_: IType1C dispid 10;
    function DescribeObject(WithChilds: WordBool): WideString; dispid 11;
    property Parent: IMetaDataObj readonly dispid 12;
  end;

  // *********************************************************************//
  // Interface: ITaskDef
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {B6B67039-2433-4151-B344-6AD3CE0D4A77}
  // *********************************************************************//
  ITaskDef = interface(IMetaDataObj)
    ['{B6B67039-2433-4151-B344-6AD3CE0D4A77}']
    function Get_Language: Integer; safecall;
    procedure Set_Language(pVal: Integer); safecall;
    function Get_ImmediateDelete: WordBool; safecall;
    procedure Set_ImmediateDelete(pVal: WordBool); safecall;
    function Get_Round15_2: WordBool; safecall;
    procedure Set_Round15_2(pVal: WordBool); safecall;
    property Language: Integer read Get_Language write Set_Language;
    property ImmediateDelete: WordBool read Get_ImmediateDelete write
      Set_ImmediateDelete;
    property Round15_2: WordBool read Get_Round15_2 write Set_Round15_2;
  end;

  // *********************************************************************//
  // DispIntf:  ITaskDefDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {B6B67039-2433-4151-B344-6AD3CE0D4A77}
  // *********************************************************************//
  ITaskDefDisp = dispinterface
    ['{B6B67039-2433-4151-B344-6AD3CE0D4A77}']
    property Language: Integer dispid 15;
    property ImmediateDelete: WordBool dispid 16;
    property Round15_2: WordBool dispid 17;
    property WhatIsIt: TypeOfMetaDataObj readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property Present: WideString dispid 3;
    property Descr: WideString dispid 4;
    function IsValid: WordBool; dispid 5;
    property FullName: WideString readonly dispid 7;
    property Props: IMetaDataObjProps readonly dispid 8;
    property Childs: IMetaDataObjChilds readonly dispid 9;
    property type_: IType1C dispid 10;
    function DescribeObject(WithChilds: WordBool): WideString; dispid 11;
    property Parent: IMetaDataObj readonly dispid 12;
  end;

  // *********************************************************************//
  // Interface: IMetaDataObjProps
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {B2AA9FD4-C643-4D40-A0D7-D52BABF55B3D}
  // *********************************************************************//
  IMetaDataObjProps = interface(IDispatch)
    ['{B2AA9FD4-C643-4D40-A0D7-D52BABF55B3D}']
    function Get_item(idx: OleVariant): WideString; safecall;
    function Get_Count: Integer; safecall;
    function Get_Name(idx: OleVariant; Rus: WordBool): WideString; safecall;
    property item[idx: OleVariant]: WideString read Get_item; default;
    property Count: Integer read Get_Count;
    property Name[idx: OleVariant; Rus: WordBool]: WideString read Get_Name;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaDataObjPropsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {B2AA9FD4-C643-4D40-A0D7-D52BABF55B3D}
  // *********************************************************************//
  IMetaDataObjPropsDisp = dispinterface
    ['{B2AA9FD4-C643-4D40-A0D7-D52BABF55B3D}']
    property item[idx: OleVariant]: WideString readonly dispid 0; default;
    property Count: Integer readonly dispid 1;
    property Name[idx: OleVariant; Rus: WordBool]: WideString readonly dispid 2;
  end;

  // *********************************************************************//
  // Interface: IMetaDataObjChilds
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {5B0CDE51-3BB2-4C60-8AA5-63739FD67873}
  // *********************************************************************//
  IMetaDataObjChilds = interface(IDispatch)
    ['{5B0CDE51-3BB2-4C60-8AA5-63739FD67873}']
    function Get_item(idx: OleVariant): IMetaDataObjArray; safecall;
    function Get_Count: Integer; safecall;
    function Get_Name(idx: OleVariant; Rus: WordBool): WideString; safecall;
    property item[idx: OleVariant]: IMetaDataObjArray read Get_item; default;
    property Count: Integer read Get_Count;
    property Name[idx: OleVariant; Rus: WordBool]: WideString read Get_Name;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaDataObjChildsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {5B0CDE51-3BB2-4C60-8AA5-63739FD67873}
  // *********************************************************************//
  IMetaDataObjChildsDisp = dispinterface
    ['{5B0CDE51-3BB2-4C60-8AA5-63739FD67873}']
    property item[idx: OleVariant]: IMetaDataObjArray readonly dispid 0;
      default;
    property Count: Integer readonly dispid 1;
    property Name[idx: OleVariant; Rus: WordBool]: WideString readonly dispid 2;
  end;

  // *********************************************************************//
  // Interface: IMetaDataObjArray
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {9F1E178B-C0AD-4D9A-A083-9A952F2BDF31}
  // *********************************************************************//
  IMetaDataObjArray = interface(IDispatch)
    ['{9F1E178B-C0AD-4D9A-A083-9A952F2BDF31}']
    function Get_item(idx: OleVariant): IMetaDataObj; safecall;
    function Get_Count: Integer; safecall;
    property item[idx: OleVariant]: IMetaDataObj read Get_item; default;
    property Count: Integer read Get_Count;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaDataObjArrayDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {9F1E178B-C0AD-4D9A-A083-9A952F2BDF31}
  // *********************************************************************//
  IMetaDataObjArrayDisp = dispinterface
    ['{9F1E178B-C0AD-4D9A-A083-9A952F2BDF31}']
    property item[idx: OleVariant]: IMetaDataObj readonly dispid 0; default;
    property Count: Integer readonly dispid 2;
  end;

  // *********************************************************************//
  // Interface: IType1C
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {9F07065B-8434-41C8-BC54-2C64C4E90110}
  // *********************************************************************//
  IType1C = interface(IDispatch)
    ['{9F07065B-8434-41C8-BC54-2C64C4E90110}']
    function Get_type_: tTypes; safecall;
    procedure Set_type_(pVal: tTypes); safecall;
    function Get_FullName: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Code: WideString; safecall;
    function Get_ID: Integer; safecall;
    procedure Set_ID(pVal: Integer); safecall;
    function Get_Length: Integer; safecall;
    procedure Set_Length(pVal: Integer); safecall;
    function Get_Precision: Integer; safecall;
    procedure Set_Precision(pVal: Integer); safecall;
    function Get_PositiveOnly: WordBool; safecall;
    procedure Set_PositiveOnly(pVal: WordBool); safecall;
    function Get_NumSeparated: WordBool; safecall;
    procedure Set_NumSeparated(pVal: WordBool); safecall;
    property type_: tTypes read Get_type_ write Set_type_;
    property FullName: WideString read Get_FullName;
    property Name: WideString read Get_Name;
    property Code: WideString read Get_Code;
    property ID: Integer read Get_ID write Set_ID;
    property Length: Integer read Get_Length write Set_Length;
    property Precision: Integer read Get_Precision write Set_Precision;
    property PositiveOnly: WordBool read Get_PositiveOnly write
      Set_PositiveOnly;
    property NumSeparated: WordBool read Get_NumSeparated write
      Set_NumSeparated;
  end;

  // *********************************************************************//
  // DispIntf:  IType1CDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {9F07065B-8434-41C8-BC54-2C64C4E90110}
  // *********************************************************************//
  IType1CDisp = dispinterface
    ['{9F07065B-8434-41C8-BC54-2C64C4E90110}']
    property type_: tTypes dispid 0;
    property FullName: WideString readonly dispid 1;
    property Name: WideString readonly dispid 2;
    property Code: WideString readonly dispid 3;
    property ID: Integer dispid 4;
    property Length: Integer dispid 5;
    property Precision: Integer dispid 6;
    property PositiveOnly: WordBool dispid 7;
    property NumSeparated: WordBool dispid 8;
  end;

  // *********************************************************************//
  // Interface: IMigration
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {59F10FCA-4E12-4381-9440-B5475A4DDD6D}
  // *********************************************************************//
  IMigration = interface(IDispatch)
    ['{59F10FCA-4E12-4381-9440-B5475A4DDD6D}']
    function Get_RuleOfMigration: MigrationRules; safecall;
    procedure Set_RuleOfMigration(pVal: MigrationRules); safecall;
    function Get_AutoRegister: WordBool; safecall;
    procedure Set_AutoRegister(pVal: WordBool); safecall;
    function Get_AdditDBSigns: WideString; safecall;
    procedure Set_AdditDBSigns(const pVal: WideString); safecall;
    property RuleOfMigration: MigrationRules read Get_RuleOfMigration write
      Set_RuleOfMigration;
    property AutoRegister: WordBool read Get_AutoRegister write
      Set_AutoRegister;
    property AdditDBSigns: WideString read Get_AdditDBSigns write
      Set_AdditDBSigns;
  end;

  // *********************************************************************//
  // DispIntf:  IMigrationDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {59F10FCA-4E12-4381-9440-B5475A4DDD6D}
  // *********************************************************************//
  IMigrationDisp = dispinterface
    ['{59F10FCA-4E12-4381-9440-B5475A4DDD6D}']
    property RuleOfMigration: MigrationRules dispid 0;
    property AutoRegister: WordBool dispid 1;
    property AdditDBSigns: WideString dispid 2;
  end;

  // *********************************************************************//
  // Interface: IConstants
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {30869711-4DA3-445E-8607-1953B0850C46}
  // *********************************************************************//
  IConstants = interface(IDispatch)
    ['{30869711-4DA3-445E-8607-1953B0850C46}']
    function Get_item(idx: OleVariant): IConstDef; safecall;
    function Get_Count: Integer; safecall;
    function Get_Name(idx: OleVariant): WideString; safecall;
    function Add(const Name: WideString; const Present: WideString): IConstDef;
      safecall;
    procedure Remove(idx: OleVariant); safecall;
    property item[idx: OleVariant]: IConstDef read Get_item; default;
    property Count: Integer read Get_Count;
    property Name[idx: OleVariant]: WideString read Get_Name;
  end;

  // *********************************************************************//
  // DispIntf:  IConstantsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {30869711-4DA3-445E-8607-1953B0850C46}
  // *********************************************************************//
  IConstantsDisp = dispinterface
    ['{30869711-4DA3-445E-8607-1953B0850C46}']
    property item[idx: OleVariant]: IConstDef readonly dispid 0; default;
    property Count: Integer readonly dispid 1;
    property Name[idx: OleVariant]: WideString readonly dispid 2;
    function Add(const Name: WideString; const Present: WideString): IConstDef;
      dispid 3;
    procedure Remove(idx: OleVariant); dispid 4;
  end;

  // *********************************************************************//
  // Interface: IConstDef
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {6ABD59AB-7517-4C6C-9F8D-30A312073AD7}
  // *********************************************************************//
  IConstDef = interface(IMetaDataObj)
    ['{6ABD59AB-7517-4C6C-9F8D-30A312073AD7}']
    function Get_Periodic: WordBool; safecall;
    procedure Set_Periodic(pVal: WordBool); safecall;
    property Periodic: WordBool read Get_Periodic write Set_Periodic;
  end;

  // *********************************************************************//
  // DispIntf:  IConstDefDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {6ABD59AB-7517-4C6C-9F8D-30A312073AD7}
  // *********************************************************************//
  IConstDefDisp = dispinterface
    ['{6ABD59AB-7517-4C6C-9F8D-30A312073AD7}']
    property Periodic: WordBool dispid 100;
    property WhatIsIt: TypeOfMetaDataObj readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property Present: WideString dispid 3;
    property Descr: WideString dispid 4;
    function IsValid: WordBool; dispid 5;
    property FullName: WideString readonly dispid 7;
    property Props: IMetaDataObjProps readonly dispid 8;
    property Childs: IMetaDataObjChilds readonly dispid 9;
    property type_: IType1C dispid 10;
    function DescribeObject(WithChilds: WordBool): WideString; dispid 11;
    property Parent: IMetaDataObj readonly dispid 12;
  end;

  // *********************************************************************//
  // Interface: IMetaEnums
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {6D5C5F96-05D5-4444-8FBD-3247EA6AC4CA}
  // *********************************************************************//
  IMetaEnums = interface(IDispatch)
    ['{6D5C5F96-05D5-4444-8FBD-3247EA6AC4CA}']
    function Get_Enum(idx: OleVariant): IMetaEnum; safecall;
    function Get_Count: Integer; safecall;
    procedure Remove(idx: OleVariant); safecall;
    function Add(const Name: WideString): IMetaEnum; safecall;
    property Enum[idx: OleVariant]: IMetaEnum read Get_Enum; default;
    property Count: Integer read Get_Count;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaEnumsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {6D5C5F96-05D5-4444-8FBD-3247EA6AC4CA}
  // *********************************************************************//
  IMetaEnumsDisp = dispinterface
    ['{6D5C5F96-05D5-4444-8FBD-3247EA6AC4CA}']
    property Enum[idx: OleVariant]: IMetaEnum readonly dispid 0; default;
    property Count: Integer readonly dispid 1;
    procedure Remove(idx: OleVariant); dispid 2;
    function Add(const Name: WideString): IMetaEnum; dispid 3;
  end;

  // *********************************************************************//
  // Interface: IMetaEnum
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {0A75DAD6-E6F3-4116-862B-133E26BD8377}
  // *********************************************************************//
  IMetaEnum = interface(IMetaDataObj)
    ['{0A75DAD6-E6F3-4116-862B-133E26BD8377}']
    function Get_ValsCount: Integer; safecall;
    function Get_EnumVal(idx: OleVariant): IMetaEnumVal; safecall;
    function Add(const Name: WideString): IMetaEnumVal; safecall;
    procedure Remove(idx: OleVariant); safecall;
    property ValsCount: Integer read Get_ValsCount;
    property EnumVal[idx: OleVariant]: IMetaEnumVal read Get_EnumVal;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaEnumDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {0A75DAD6-E6F3-4116-862B-133E26BD8377}
  // *********************************************************************//
  IMetaEnumDisp = dispinterface
    ['{0A75DAD6-E6F3-4116-862B-133E26BD8377}']
    property ValsCount: Integer readonly dispid 13;
    property EnumVal[idx: OleVariant]: IMetaEnumVal readonly dispid 14;
    function Add(const Name: WideString): IMetaEnumVal; dispid 15;
    procedure Remove(idx: OleVariant); dispid 16;
    property WhatIsIt: TypeOfMetaDataObj readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property Present: WideString dispid 3;
    property Descr: WideString dispid 4;
    function IsValid: WordBool; dispid 5;
    property FullName: WideString readonly dispid 7;
    property Props: IMetaDataObjProps readonly dispid 8;
    property Childs: IMetaDataObjChilds readonly dispid 9;
    property type_: IType1C dispid 10;
    function DescribeObject(WithChilds: WordBool): WideString; dispid 11;
    property Parent: IMetaDataObj readonly dispid 12;
  end;

  // *********************************************************************//
  // Interface: IMetaEnumVal
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {9205EDA0-4587-486E-816D-50E9AA24738D}
  // *********************************************************************//
  IMetaEnumVal = interface(IMetaDataObj)
    ['{9205EDA0-4587-486E-816D-50E9AA24738D}']
    function Get_Title: WideString; safecall;
    procedure Set_Title(const pVal: WideString); safecall;
    property Title: WideString read Get_Title write Set_Title;
  end;

  // *********************************************************************//
  // DispIntf:  IMetaEnumValDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {9205EDA0-4587-486E-816D-50E9AA24738D}
  // *********************************************************************//
  IMetaEnumValDisp = dispinterface
    ['{9205EDA0-4587-486E-816D-50E9AA24738D}']
    property Title: WideString dispid 13;
    property WhatIsIt: TypeOfMetaDataObj readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property Present: WideString dispid 3;
    property Descr: WideString dispid 4;
    function IsValid: WordBool; dispid 5;
    property FullName: WideString readonly dispid 7;
    property Props: IMetaDataObjProps readonly dispid 8;
    property Childs: IMetaDataObjChilds readonly dispid 9;
    property type_: IType1C dispid 10;
    function DescribeObject(WithChilds: WordBool): WideString; dispid 11;
    property Parent: IMetaDataObj readonly dispid 12;
  end;

  // *********************************************************************//
  // Interface: ICfgWindows
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {765E4DA0-4951-11D8-8D5F-ADB28B91F406}
  // *********************************************************************//
  ICfgWindows = interface(IDispatch)
    ['{765E4DA0-4951-11D8-8D5F-ADB28B91F406}']
    function Get_MainWnd: ICfgWindow; safecall;
    function Get_ActiveWnd: ICfgWindow; safecall;
    procedure Set_ActiveWnd(const pVal: ICfgWindow); safecall;
    function Get_FirstWnd: ICfgWindow; safecall;
    function Get_NextWnd(const CurrentWnd: ICfgWindow): ICfgWindow; safecall;
    function Get_PanelVisible(const Caption: WideString): WordBool; safecall;
    procedure Set_PanelVisible(const Caption: WideString; pVal: WordBool);
      safecall;
    property MainWnd: ICfgWindow read Get_MainWnd;
    property ActiveWnd: ICfgWindow read Get_ActiveWnd write Set_ActiveWnd;
    property FirstWnd: ICfgWindow read Get_FirstWnd;
    property NextWnd[const CurrentWnd: ICfgWindow]: ICfgWindow read Get_NextWnd;
    property PanelVisible[const Caption: WideString]: WordBool read
      Get_PanelVisible write Set_PanelVisible;
  end;

  // *********************************************************************//
  // DispIntf:  ICfgWindowsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {765E4DA0-4951-11D8-8D5F-ADB28B91F406}
  // *********************************************************************//
  ICfgWindowsDisp = dispinterface
    ['{765E4DA0-4951-11D8-8D5F-ADB28B91F406}']
    property MainWnd: ICfgWindow readonly dispid 0;
    property ActiveWnd: ICfgWindow dispid 1;
    property FirstWnd: ICfgWindow readonly dispid 2;
    property NextWnd[const CurrentWnd: ICfgWindow]: ICfgWindow readonly dispid
      3;
    property PanelVisible[const Caption: WideString]: WordBool dispid 4;
  end;

  // *********************************************************************//
  // Interface: ICfgWindow
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {6E8F8C6A-B9FB-46FC-AFFA-CB0F7EB93FB9}
  // *********************************************************************//
  ICfgWindow = interface(IDispatch)
    ['{6E8F8C6A-B9FB-46FC-AFFA-CB0F7EB93FB9}']
    function Get_hWnd: Integer; safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const pVal: WideString); safecall;
    function Get_Document: ICfgDoc; safecall;
    procedure Close; safecall;
    function Get_Maximized: WordBool; safecall;
    procedure Set_Maximized(pVal: WordBool); safecall;
    function Get_Minimized: WordBool; safecall;
    procedure Set_Minimized(pVal: WordBool); safecall;
    function Get_Top: Integer; safecall;
    function Get_Left: Integer; safecall;
    function Get_Bottom: Integer; safecall;
    function Get_Right: Integer; safecall;
    procedure Move(Left: Integer; Top: Integer; Right: Integer; Bottom: Integer);
      safecall;
    function Get_ClientWidth: Integer; safecall;
    function Get_ClientHeight: Integer; safecall;
    property hWnd: Integer read Get_hWnd;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Document: ICfgDoc read Get_Document;
    property Maximized: WordBool read Get_Maximized write Set_Maximized;
    property Minimized: WordBool read Get_Minimized write Set_Minimized;
    property Top: Integer read Get_Top;
    property Left: Integer read Get_Left;
    property Bottom: Integer read Get_Bottom;
    property Right: Integer read Get_Right;
    property ClientWidth: Integer read Get_ClientWidth;
    property ClientHeight: Integer read Get_ClientHeight;
  end;

  // *********************************************************************//
  // DispIntf:  ICfgWindowDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {6E8F8C6A-B9FB-46FC-AFFA-CB0F7EB93FB9}
  // *********************************************************************//
  ICfgWindowDisp = dispinterface
    ['{6E8F8C6A-B9FB-46FC-AFFA-CB0F7EB93FB9}']
    property hWnd: Integer readonly dispid 0;
    property Caption: WideString dispid 1;
    property Document: ICfgDoc readonly dispid 2;
    procedure Close; dispid 3;
    property Maximized: WordBool dispid 4;
    property Minimized: WordBool dispid 5;
    property Top: Integer readonly dispid 6;
    property Left: Integer readonly dispid 7;
    property Bottom: Integer readonly dispid 8;
    property Right: Integer readonly dispid 9;
    procedure Move(Left: Integer; Top: Integer; Right: Integer; Bottom: Integer);
      dispid 10;
    property ClientWidth: Integer readonly dispid 11;
    property ClientHeight: Integer readonly dispid 12;
  end;

  // *********************************************************************//
  // Interface: ICfgDoc
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {D1C2BB80-7206-11D8-9FCD-E9053813DA08}
  // *********************************************************************//
  ICfgDoc = interface(IDispatch)
    ['{D1C2BB80-7206-11D8-9FCD-E9053813DA08}']
    function Get_type_: DocTypes; safecall;
    function Get_ID: Integer; safecall;
    function Get_Kind: WideString; safecall;
    function Get_path: WideString; safecall;
    procedure Open; safecall;
    function Get_IsOpen: WordBool; safecall;
    procedure Save; safecall;
    function Get_Name: WideString; safecall;
    property type_: DocTypes read Get_type_;
    property ID: Integer read Get_ID;
    property Kind: WideString read Get_Kind;
    property path: WideString read Get_path;
    property IsOpen: WordBool read Get_IsOpen;
    property Name: WideString read Get_Name;
  end;

  // *********************************************************************//
  // DispIntf:  ICfgDocDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {D1C2BB80-7206-11D8-9FCD-E9053813DA08}
  // *********************************************************************//
  ICfgDocDisp = dispinterface
    ['{D1C2BB80-7206-11D8-9FCD-E9053813DA08}']
    property type_: DocTypes readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Kind: WideString readonly dispid 2;
    property path: WideString readonly dispid 3;
    procedure Open; dispid 4;
    property IsOpen: WordBool readonly dispid 5;
    procedure Save; dispid 6;
    property Name: WideString readonly dispid 7;
  end;

  // *********************************************************************//
  // Interface: IScripts
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {1556E6A0-B699-4F77-9496-D745DE374465}
  // *********************************************************************//
  IScripts = interface(IDispatch)
    ['{1556E6A0-B699-4F77-9496-D745DE374465}']
    function Get_item(idx: OleVariant): IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Load(const path: WideString): IDispatch; safecall;
    procedure ReLoad(idx: OleVariant); safecall;
    procedure UnLoad(idx: OleVariant); safecall;
    function Get_path(idx: OleVariant): WideString; safecall;
    function Get_Name(idx: OleVariant): WideString; safecall;
    function Get_Engine(idx: OleVariant): WideString; safecall;
    property item[idx: OleVariant]: IDispatch read Get_item; default;
    property Count: Integer read Get_Count;
    property path[idx: OleVariant]: WideString read Get_path;
    property Name[idx: OleVariant]: WideString read Get_Name;
    property Engine[idx: OleVariant]: WideString read Get_Engine;
  end;

  // *********************************************************************//
  // DispIntf:  IScriptsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {1556E6A0-B699-4F77-9496-D745DE374465}
  // *********************************************************************//
  IScriptsDisp = dispinterface
    ['{1556E6A0-B699-4F77-9496-D745DE374465}']
    property item[idx: OleVariant]: IDispatch readonly dispid 0; default;
    property Count: Integer readonly dispid 1;
    function Load(const path: WideString): IDispatch; dispid 2;
    procedure ReLoad(idx: OleVariant); dispid 3;
    procedure UnLoad(idx: OleVariant); dispid 4;
    property path[idx: OleVariant]: WideString readonly dispid 5;
    property Name[idx: OleVariant]: WideString readonly dispid 6;
    property Engine[idx: OleVariant]: WideString readonly dispid 7;
  end;

  // *********************************************************************//
  // Interface: IPlugins
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {59DE83B2-A571-4A2E-9C84-DA789B5858A6}
  // *********************************************************************//
  IPlugins = interface(IDispatch)
    ['{59DE83B2-A571-4A2E-9C84-DA789B5858A6}']
    function Get_item(idx: OleVariant): IDispatch; safecall;
    function Get_Count: Integer; safecall;
    procedure LoadPlugin(const From: WideString); safecall;
    function Get_path(idx: OleVariant): WideString; safecall;
    function Get_Name(idx: OleVariant): WideString; safecall;
    property item[idx: OleVariant]: IDispatch read Get_item; default;
    property Count: Integer read Get_Count;
    property path[idx: OleVariant]: WideString read Get_path;
    property Name[idx: OleVariant]: WideString read Get_Name;
  end;

  // *********************************************************************//
  // DispIntf:  IPluginsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {59DE83B2-A571-4A2E-9C84-DA789B5858A6}
  // *********************************************************************//
  IPluginsDisp = dispinterface
    ['{59DE83B2-A571-4A2E-9C84-DA789B5858A6}']
    property item[idx: OleVariant]: IDispatch readonly dispid 0; default;
    property Count: Integer readonly dispid 1;
    procedure LoadPlugin(const From: WideString); dispid 2;
    property path[idx: OleVariant]: WideString readonly dispid 3;
    property Name[idx: OleVariant]: WideString readonly dispid 4;
  end;

  // *********************************************************************//
  // Interface: ICfgDocuments
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {16623674-ECAD-484B-A399-751229940CDC}
  // *********************************************************************//
  ICfgDocuments = interface(IDispatch)
    ['{16623674-ECAD-484B-A399-751229940CDC}']
    function Get_item(const Name: WideString): ICfgDoc; safecall;
    function Open(const path: WideString): ICfgDoc; safecall;
    function DocFromID(ID: Integer; Type_: DocTypes; const path: WideString;
      const Kind: WideString): ICfgDoc; safecall;
    function New(Type_: DocTypes): ICfgDoc; safecall;
    function EnumAllTypedObj: IAllTypedObj; safecall;
    property item[const Name: WideString]: ICfgDoc read Get_item; default;
  end;

  // *********************************************************************//
  // DispIntf:  ICfgDocumentsDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {16623674-ECAD-484B-A399-751229940CDC}
  // *********************************************************************//
  ICfgDocumentsDisp = dispinterface
    ['{16623674-ECAD-484B-A399-751229940CDC}']
    property item[const Name: WideString]: ICfgDoc readonly dispid 0; default;
    function Open(const path: WideString): ICfgDoc; dispid 1;
    function DocFromID(ID: Integer; Type_: DocTypes; const path: WideString;
      const Kind: WideString): ICfgDoc; dispid 2;
    function New(Type_: DocTypes): ICfgDoc; dispid 3;
    function EnumAllTypedObj: IAllTypedObj; dispid 4;
  end;

  // *********************************************************************//
  // Interface: IAllTypedObj
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {19484B30-4771-453B-AF31-5EE02DE544D8}
  // *********************************************************************//
  IAllTypedObj = interface(IDispatch)
    ['{19484B30-4771-453B-AF31-5EE02DE544D8}']
    function Get_item(idx: OleVariant): ICfgDoc; safecall;
    function Get_Count: Integer; safecall;
    function Get_ChildsCount(const Parent: WideString): Integer; safecall;
    function Get_ChildName(const Parent: WideString; idx: Integer): WideString;
      safecall;
    function Get_ObjectCount(const Parent: WideString): Integer; safecall;
    property item[idx: OleVariant]: ICfgDoc read Get_item; default;
    property Count: Integer read Get_Count;
    property ChildsCount[const Parent: WideString]: Integer read
      Get_ChildsCount;
    property ChildName[const Parent: WideString; idx: Integer]: WideString read
      Get_ChildName;
    property ObjectCount[const Parent: WideString]: Integer read
      Get_ObjectCount;
  end;

  // *********************************************************************//
  // DispIntf:  IAllTypedObjDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {19484B30-4771-453B-AF31-5EE02DE544D8}
  // *********************************************************************//
  IAllTypedObjDisp = dispinterface
    ['{19484B30-4771-453B-AF31-5EE02DE544D8}']
    property item[idx: OleVariant]: ICfgDoc readonly dispid 0; default;
    property Count: Integer readonly dispid 1;
    property ChildsCount[const Parent: WideString]: Integer readonly dispid 2;
    property ChildName[const Parent: WideString; idx: Integer]: WideString
      readonly dispid 3;
    property ObjectCount[const Parent: WideString]: Integer readonly dispid 4;
  end;

  // *********************************************************************//
  // Interface: ICfgTimer
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {04539FB9-4790-4556-9055-DA5D10CFA0A5}
  // *********************************************************************//
  ICfgTimer = interface(IDispatch)
    ['{04539FB9-4790-4556-9055-DA5D10CFA0A5}']
    function Get_Time(Num: Integer): Integer; safecall;
    function SetTimer(Interval: Integer; OneTimeOnly: WordBool): Integer;
      safecall;
    procedure KillTimer(TimerID: Integer); safecall;
    function Get_Count: Integer; safecall;
    procedure KillAll; safecall;
    function Get_ID(Num: Integer): Integer; safecall;
    property Time[Num: Integer]: Integer read Get_Time; default;
    property Count: Integer read Get_Count;
    property ID[Num: Integer]: Integer read Get_ID;
  end;

  // *********************************************************************//
  // DispIntf:  ICfgTimerDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {04539FB9-4790-4556-9055-DA5D10CFA0A5}
  // *********************************************************************//
  ICfgTimerDisp = dispinterface
    ['{04539FB9-4790-4556-9055-DA5D10CFA0A5}']
    property Time[Num: Integer]: Integer readonly dispid 0; default;
    function SetTimer(Interval: Integer; OneTimeOnly: WordBool): Integer; dispid
      1;
    procedure KillTimer(TimerID: Integer); dispid 2;
    property Count: Integer readonly dispid 3;
    procedure KillAll; dispid 4;
    property ID[Num: Integer]: Integer readonly dispid 5;
  end;

  // *********************************************************************//
  // Interface: IMDWindow
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {A0C9C161-59BD-42D4-95ED-0D4275CB820F}
  // *********************************************************************//
  IMDWindow = interface(IDispatch)
    ['{A0C9C161-59BD-42D4-95ED-0D4275CB820F}']
    procedure Activate; safecall;
    function Get_TabCount: Integer; safecall;
    function Get_TabName(idx: Integer): WideString; safecall;
    function Get_ActiveTab: Integer; safecall;
    procedure Set_ActiveTab(pVal: Integer); safecall;
    procedure DoAction(const PathInTree: WideString; Action: mdActions);
      safecall;
    function Get_hWnd: Integer; safecall;
    function GetSelected: WideString; safecall;
    property TabCount: Integer read Get_TabCount;
    property TabName[idx: Integer]: WideString read Get_TabName;
    property ActiveTab: Integer read Get_ActiveTab write Set_ActiveTab;
    property hWnd: Integer read Get_hWnd;
  end;

  // *********************************************************************//
  // DispIntf:  IMDWindowDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {A0C9C161-59BD-42D4-95ED-0D4275CB820F}
  // *********************************************************************//
  IMDWindowDisp = dispinterface
    ['{A0C9C161-59BD-42D4-95ED-0D4275CB820F}']
    procedure Activate; dispid 1;
    property TabCount: Integer readonly dispid 2;
    property TabName[idx: Integer]: WideString readonly dispid 3;
    property ActiveTab: Integer dispid 4;
    procedure DoAction(const PathInTree: WideString; Action: mdActions); dispid
      5;
    property hWnd: Integer readonly dispid 6;
    function GetSelected: WideString; dispid 7;
  end;

  // *********************************************************************//
  // Interface: IDialogDoc
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {2E1CCC5F-1FC5-41A0-9BF7-F4B77033A23C}
  // *********************************************************************//
  IDialogDoc = interface(ICfgDoc)
    ['{2E1CCC5F-1FC5-41A0-9BF7-F4B77033A23C}']
    function SaveToFile(const FileName: WideString): WordBool; safecall;
    function LoadFromFile(const FileName: WideString): WordBool; safecall;
    function Get_Stream: WideString; safecall;
    procedure Set_Stream(const pVal: WideString); safecall;
    procedure AddLayer(const Name: WideString; Visible: WordBool); safecall;
    function Get_LayerCount: Integer; safecall;
    function Get_LayerName(idx: Integer): WideString; safecall;
    procedure Set_LayerName(idx: Integer; const pVal: WideString); safecall;
    function Get_LayerVisible(const Name: WideString): WordBool; safecall;
    procedure Set_LayerVisible(const Name: WideString; pVal: WordBool);
      safecall;
    function Get_ActiveLayer: WideString; safecall;
    procedure Set_ActiveLayer(const pVal: WideString); safecall;
    procedure DeleteLayer(const Name: WideString; const CopyControlsTo:
      WideString); safecall;
    procedure MoveLayer(const From: WideString; Down: WordBool); safecall;
    function Get_ctrlCount: Integer; safecall;
    function Get_ctrlType(idx: Integer): WideString; safecall;
    function ctrlUID(idx: Integer): Integer; safecall;
    function ctrlIdx(UID: Integer): Integer; safecall;
    function Get_Selection: WideString; safecall;
    procedure Set_Selection(const pVal: WideString); safecall;
    function Get_ctrlProp(ctrlIdx: Integer; propIdx: CtrlPropsIdx): OleVariant;
      safecall;
    procedure Set_ctrlProp(ctrlIdx: Integer; propIdx: CtrlPropsIdx; pVal:
      OleVariant); safecall;
    function Get_formProp(formPropIdx: FormPropsIdx): OleVariant; safecall;
    procedure Set_formProp(formPropIdx: FormPropsIdx; pVal: OleVariant);
      safecall;
    function Get_ctrlType1C(idx: Integer): IType1C; safecall;
    procedure Set_ctrlType1C(idx: Integer; const pVal: IType1C); safecall;
    property Stream: WideString read Get_Stream write Set_Stream;
    property LayerCount: Integer read Get_LayerCount;
    property LayerName[idx: Integer]: WideString read Get_LayerName write
      Set_LayerName;
    property LayerVisible[const Name: WideString]: WordBool read Get_LayerVisible
      write Set_LayerVisible;
    property ActiveLayer: WideString read Get_ActiveLayer write Set_ActiveLayer;
    property ctrlCount: Integer read Get_ctrlCount;
    property ctrlType[idx: Integer]: WideString read Get_ctrlType;
    property Selection: WideString read Get_Selection write Set_Selection;
    property ctrlProp[ctrlIdx: Integer; propIdx: CtrlPropsIdx]: OleVariant read
      Get_ctrlProp write Set_ctrlProp;
    property formProp[formPropIdx: FormPropsIdx]: OleVariant read Get_formProp
      write Set_formProp;
    property ctrlType1C[idx: Integer]: IType1C read Get_ctrlType1C write
      Set_ctrlType1C;
  end;

  // *********************************************************************//
  // DispIntf:  IDialogDocDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {2E1CCC5F-1FC5-41A0-9BF7-F4B77033A23C}
  // *********************************************************************//
  IDialogDocDisp = dispinterface
    ['{2E1CCC5F-1FC5-41A0-9BF7-F4B77033A23C}']
    function SaveToFile(const FileName: WideString): WordBool; dispid 8;
    function LoadFromFile(const FileName: WideString): WordBool; dispid 9;
    property Stream: WideString dispid 10;
    procedure AddLayer(const Name: WideString; Visible: WordBool); dispid 11;
    property LayerCount: Integer readonly dispid 12;
    property LayerName[idx: Integer]: WideString dispid 13;
    property LayerVisible[const Name: WideString]: WordBool dispid 14;
    property ActiveLayer: WideString dispid 15;
    procedure DeleteLayer(const Name: WideString; const CopyControlsTo:
      WideString); dispid 16;
    procedure MoveLayer(const From: WideString; Down: WordBool); dispid 17;
    property ctrlCount: Integer readonly dispid 18;
    property ctrlType[idx: Integer]: WideString readonly dispid 19;
    function ctrlUID(idx: Integer): Integer; dispid 20;
    function ctrlIdx(UID: Integer): Integer; dispid 21;
    property Selection: WideString dispid 22;
    property ctrlProp[ctrlIdx: Integer; propIdx: CtrlPropsIdx]: OleVariant dispid
      23;
    property formProp[formPropIdx: FormPropsIdx]: OleVariant dispid 24;
    property ctrlType1C[idx: Integer]: IType1C dispid 25;
    property type_: DocTypes readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Kind: WideString readonly dispid 2;
    property path: WideString readonly dispid 3;
    procedure Open; dispid 4;
    property IsOpen: WordBool readonly dispid 5;
    procedure Save; dispid 6;
    property Name: WideString readonly dispid 7;
  end;

  // *********************************************************************//
  // Interface: IConfigurator
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {FF862867-BB20-44B2-949C-5EA7C09842EE}
  // *********************************************************************//
  IConfigurator = interface(IDispatch)
    ['{FF862867-BB20-44B2-949C-5EA7C09842EE}']
    function Get_IBName: WideString; safecall;
    procedure Set_IBName(const pVal: WideString); safecall;
    function Get_IBDir: WideString; safecall;
    function Get_BinDir: WideString; safecall;
    function Get_CommandLine: WideString; safecall;
    procedure Message(const msgLine: WideString; marker: MsgLineMarkers);
      safecall;
    procedure Status(const text: WideString); safecall;
    function OpenOLEForm(const progID: WideString; const Title: WideString):
      IDispatch; safecall;
    function Get_Version: Integer; safecall;
    function Get_MetaData: IMetaData; safecall;
    procedure SendCommand(cmd: ConfigCommands); safecall;
    function IsConfigWndOpen: WordBool; safecall;
    function Get_Plugins: IPlugins; safecall;
    function Get_Scripts: IScripts; safecall;
    function Get_Windows: ICfgWindows; safecall;
    procedure Quit(PromptSave: WordBool); safecall;
    procedure LogMessageWrite(EventCategory: EventCategories; const Message:
      WideString;
      const strEventType: WideString; const Event: WideString); safecall;
    procedure Run1CApp(mode: RunAppModes); safecall;
    function Get_Documents: ICfgDocuments; safecall;
    function Get_CfgTimer: ICfgTimer; safecall;
    function Get_AppProps(idx: AppProperties): WideString; safecall;
    function Get_MDWnd: IMDWindow; safecall;
    function Get_CancelHotKey: WordBool; safecall;
    procedure Set_CancelHotKey(pVal: WordBool); safecall;
    property IBName: WideString read Get_IBName write Set_IBName;
    property IBDir: WideString read Get_IBDir;
    property BinDir: WideString read Get_BinDir;
    property CommandLine: WideString read Get_CommandLine;
    property Version: Integer read Get_Version;
    property MetaData: IMetaData read Get_MetaData;
    property Plugins: IPlugins read Get_Plugins;
    property Scripts: IScripts read Get_Scripts;
    property Windows: ICfgWindows read Get_Windows;
    property Documents: ICfgDocuments read Get_Documents;
    property CfgTimer: ICfgTimer read Get_CfgTimer;
    property AppProps[idx: AppProperties]: WideString read Get_AppProps;
    property MDWnd: IMDWindow read Get_MDWnd;
    property CancelHotKey: WordBool read Get_CancelHotKey write
      Set_CancelHotKey;
  end;

  // *********************************************************************//
  // DispIntf:  IConfiguratorDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {FF862867-BB20-44B2-949C-5EA7C09842EE}
  // *********************************************************************//
  IConfiguratorDisp = dispinterface
    ['{FF862867-BB20-44B2-949C-5EA7C09842EE}']
    property IBName: WideString dispid 1;
    property IBDir: WideString readonly dispid 2;
    property BinDir: WideString readonly dispid 3;
    property CommandLine: WideString readonly dispid 4;
    procedure Message(const msgLine: WideString; marker: MsgLineMarkers); dispid
      5;
    procedure Status(const text: WideString); dispid 6;
    function OpenOLEForm(const progID: WideString; const Title: WideString):
      IDispatch; dispid 8;
    property Version: Integer readonly dispid 9;
    property MetaData: IMetaData readonly dispid 10;
    procedure SendCommand(cmd: ConfigCommands); dispid 11;
    function IsConfigWndOpen: WordBool; dispid 12;
    property Plugins: IPlugins readonly dispid 14;
    property Scripts: IScripts readonly dispid 15;
    property Windows: ICfgWindows readonly dispid 16;
    procedure Quit(PromptSave: WordBool); dispid 17;
    procedure LogMessageWrite(EventCategory: EventCategories; const Message:
      WideString;
      const strEventType: WideString; const Event: WideString); dispid 18;
    procedure Run1CApp(mode: RunAppModes); dispid 19;
    property Documents: ICfgDocuments readonly dispid 20;
    property CfgTimer: ICfgTimer readonly dispid 21;
    property AppProps[idx: AppProperties]: WideString readonly dispid 22;
    property MDWnd: IMDWindow readonly dispid 23;
    property CancelHotKey: WordBool dispid 24;
  end;

  // *********************************************************************//
  // DispIntf:  IConfigEvents
  // Flags:     (4224) NonExtensible Dispatchable
  // GUID:      {FF862868-BB20-44B2-949C-5EA7C09842EE}
  // *********************************************************************//
  IConfigEvents = dispinterface
    ['{FF862868-BB20-44B2-949C-5EA7C09842EE}']
    procedure ConfigWindowCreate; dispid 0;
    procedure AllPluginsInit; dispid 1;
    procedure MetaDataSaved(const FileName: WideString); dispid 2;
    procedure OnMsgBox(const text: WideString; Style: MsgBoxStyles; DefAnswer:
      MsgBoxAnswers;
      var Answer: OleVariant); dispid 3;
    procedure OnFileDialog(Saved: WordBool; const Caption: WideString; const
      Filter: WideString;
      var FileName: OleVariant; var Answer: OleVariant); dispid 4;
    procedure OnDoModal(hWnd: Integer; const Caption: WideString; var Answer:
      OleVariant); dispid 5;
    procedure OnTimer(TimerID: Integer); dispid 6;
    procedure OnIdle; dispid 7;
    procedure OnActivateWindow(const Wnd: ICfgWindow; bActive: WordBool); dispid
      8;
    procedure OnActivateMainWnd(bActive: WordBool); dispid 9;
    procedure OnFileSaved(const Doc: ICfgDoc); dispid 10;
    function OnQueryQuit: WordBool; dispid 11;
    procedure OnQuit; dispid 12;
    procedure OnDialogChange(const Dialog: IDialogDoc); dispid 13;
  end;

  // *********************************************************************//
  // Interface: IConfigPlugin
  // Flags:     (0)
  // GUID:      {8BDEC9EA-C6F4-4B74-AC73-F3B0ED3B8D4B}
  // *********************************************************************//
  IConfigPlugin = interface(IUnknown)
    ['{8BDEC9EA-C6F4-4B74-AC73-F3B0ED3B8D4B}']
    function Init(const pConfigurator: IConfigurator; out PluginName:
      WideString): HResult; stdcall;
    function Done: HResult; stdcall;
    function GetPluginCaps(capNum: PluginCaps; out pResult: OleVariant): HResult;
      stdcall;
    function DoAction(Action: PluginAction; Param: OleVariant; out pResult:
      OleVariant): HResult; stdcall;
  end;

  // *********************************************************************//
  // Interface: ISelfScript
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {D7BA8EB5-B237-4323-B971-BCB37BF3D01E}
  // *********************************************************************//
  ISelfScript = interface(IDispatch)
    ['{D7BA8EB5-B237-4323-B971-BCB37BF3D01E}']
    function Get_Name: WideString; safecall;
    procedure AddNamedItem(const Name: WideString; const Object_: IDispatch;
      AsGlobal: WordBool); safecall;
    property Name: WideString read Get_Name;
  end;

  // *********************************************************************//
  // DispIntf:  ISelfScriptDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {D7BA8EB5-B237-4323-B971-BCB37BF3D01E}
  // *********************************************************************//
  ISelfScriptDisp = dispinterface
    ['{D7BA8EB5-B237-4323-B971-BCB37BF3D01E}']
    property Name: WideString readonly dispid 0;
    procedure AddNamedItem(const Name: WideString; const Object_: IDispatch;
      AsGlobal: WordBool); dispid 1;
  end;

  // *********************************************************************//
  // Interface: IWorkBook
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {3904CFAC-714B-4241-AF65-5FD6967A065C}
  // *********************************************************************//
  IWorkBook = interface(ICfgDoc)
    ['{3904CFAC-714B-4241-AF65-5FD6967A065C}']
    function Get_CountPages: Integer; safecall;
    function Get_NamePage(idx: OleVariant): WideString; safecall;
    procedure Set_NamePage(idx: OleVariant; const pVal: WideString); safecall;
    function Get_Page(idx: OleVariant): ICfgDoc; safecall;
    function Get_ActivePage: OleVariant; safecall;
    procedure Set_ActivePage(pVal: OleVariant); safecall;
    function AddPage(const Name: WideString): ICfgDoc; safecall;
    procedure RemovePage(idx: OleVariant); safecall;
    property CountPages: Integer read Get_CountPages;
    property NamePage[idx: OleVariant]: WideString read Get_NamePage write
      Set_NamePage;
    property Page[idx: OleVariant]: ICfgDoc read Get_Page;
    property ActivePage: OleVariant read Get_ActivePage write Set_ActivePage;
  end;

  // *********************************************************************//
  // DispIntf:  IWorkBookDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {3904CFAC-714B-4241-AF65-5FD6967A065C}
  // *********************************************************************//
  IWorkBookDisp = dispinterface
    ['{3904CFAC-714B-4241-AF65-5FD6967A065C}']
    property CountPages: Integer readonly dispid 8;
    property NamePage[idx: OleVariant]: WideString dispid 9;
    property Page[idx: OleVariant]: ICfgDoc readonly dispid 10;
    property ActivePage: OleVariant dispid 11;
    function AddPage(const Name: WideString): ICfgDoc; dispid 12;
    procedure RemovePage(idx: OleVariant); dispid 13;
    property type_: DocTypes readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Kind: WideString readonly dispid 2;
    property path: WideString readonly dispid 3;
    procedure Open; dispid 4;
    property IsOpen: WordBool readonly dispid 5;
    procedure Save; dispid 6;
    property Name: WideString readonly dispid 7;
  end;

  // *********************************************************************//
  // Interface: ITextDoc
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {DEE7BD6F-1AF8-4DAC-A203-4E27F8C608F7}
  // *********************************************************************//
  ITextDoc = interface(ICfgDoc)
    ['{DEE7BD6F-1AF8-4DAC-A203-4E27F8C608F7}']
    function SaveToFile(const FileName: WideString): WordBool; safecall;
    function LoadFromFile(const FileName: WideString): WordBool; safecall;
    function Get_text: WideString; safecall;
    procedure Set_text(const pVal: WideString); safecall;
    function Get_LineCount: Integer; safecall;
    function Get_LineLen(LineNum: Integer): Integer; safecall;
    function Get_IsModule: WordBool; safecall;
    procedure Set_IsModule(pVal: WordBool); safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(pVal: WordBool); safecall;
    function Get_Range(StartLine: Integer; StartCol: OleVariant; EndLine:
      OleVariant;
      EndCol: OleVariant): WideString; safecall;
    procedure Set_Range(StartLine: Integer; StartCol: OleVariant; EndLine:
      OleVariant;
      EndCol: OleVariant; const pVal: WideString); safecall;
    function Get_SelStartLine: Integer; safecall;
    function Get_SelStartCol: Integer; safecall;
    function Get_SelEndLine: Integer; safecall;
    function Get_SelEndCol: Integer; safecall;
    function Get_CurrentWord: WideString; safecall;
    procedure MoveCaret(LineStart: Integer; ColStart: Integer; LineEnd:
      OleVariant;
      ColEnd: OleVariant); safecall;
    function Get_BookMark(LineNum: Integer): WordBool; safecall;
    procedure Set_BookMark(LineNum: Integer; pVal: WordBool); safecall;
    function NextBookmark(StartLine: Integer): Integer; safecall;
    function PrevBookmark(StartLine: Integer): Integer; safecall;
    procedure ClearAllBookMark; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_CanRedo: WordBool; safecall;
    procedure Undo; safecall;
    procedure Redo; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    procedure Paste; safecall;
    procedure CommentSel; safecall;
    procedure UncommentSel; safecall;
    procedure FormatSel; safecall;
    property text: WideString read Get_text write Set_text;
    property LineCount: Integer read Get_LineCount;
    property LineLen[LineNum: Integer]: Integer read Get_LineLen;
    property IsModule: WordBool read Get_IsModule write Set_IsModule;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property Range[StartLine: Integer; StartCol: OleVariant; EndLine:
      OleVariant; EndCol: OleVariant]: WideString read Get_Range write Set_Range;
    property SelStartLine: Integer read Get_SelStartLine;
    property SelStartCol: Integer read Get_SelStartCol;
    property SelEndLine: Integer read Get_SelEndLine;
    property SelEndCol: Integer read Get_SelEndCol;
    property CurrentWord: WideString read Get_CurrentWord;
    property BookMark[LineNum: Integer]: WordBool read Get_BookMark write
      Set_BookMark;
    property CanUndo: WordBool read Get_CanUndo;
    property CanRedo: WordBool read Get_CanRedo;
  end;

  // *********************************************************************//
  // DispIntf:  ITextDocDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {DEE7BD6F-1AF8-4DAC-A203-4E27F8C608F7}
  // *********************************************************************//
  ITextDocDisp = dispinterface
    ['{DEE7BD6F-1AF8-4DAC-A203-4E27F8C608F7}']
    function SaveToFile(const FileName: WideString): WordBool; dispid 8;
    function LoadFromFile(const FileName: WideString): WordBool; dispid 9;
    property text: WideString dispid 10;
    property LineCount: Integer readonly dispid 11;
    property LineLen[LineNum: Integer]: Integer readonly dispid 12;
    property IsModule: WordBool dispid 13;
    property ReadOnly: WordBool dispid 14;
    property Range[StartLine: Integer; StartCol: OleVariant; EndLine:
      OleVariant; EndCol: OleVariant]: WideString dispid 15;
    property SelStartLine: Integer readonly dispid 16;
    property SelStartCol: Integer readonly dispid 17;
    property SelEndLine: Integer readonly dispid 18;
    property SelEndCol: Integer readonly dispid 19;
    property CurrentWord: WideString readonly dispid 20;
    procedure MoveCaret(LineStart: Integer; ColStart: Integer; LineEnd:
      OleVariant;
      ColEnd: OleVariant); dispid 21;
    property BookMark[LineNum: Integer]: WordBool dispid 22;
    function NextBookmark(StartLine: Integer): Integer; dispid 23;
    function PrevBookmark(StartLine: Integer): Integer; dispid 24;
    procedure ClearAllBookMark; dispid 25;
    property CanUndo: WordBool readonly dispid 26;
    property CanRedo: WordBool readonly dispid 27;
    procedure Undo; dispid 28;
    procedure Redo; dispid 29;
    procedure Cut; dispid 30;
    procedure Copy; dispid 31;
    procedure Paste; dispid 32;
    procedure CommentSel; dispid 33;
    procedure UncommentSel; dispid 34;
    procedure FormatSel; dispid 35;
    property type_: DocTypes readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Kind: WideString readonly dispid 2;
    property path: WideString readonly dispid 3;
    procedure Open; dispid 4;
    property IsOpen: WordBool readonly dispid 5;
    procedure Save; dispid 6;
    property Name: WideString readonly dispid 7;
  end;

  // *********************************************************************//
  // Interface: ITableDoc
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {CEFB0920-7A8F-11D8-9FCD-D6268C95B908}
  // *********************************************************************//
  ITableDoc = interface(ICfgDoc)
    ['{CEFB0920-7A8F-11D8-9FCD-D6268C95B908}']
    function SaveToFile(const FileName: WideString): WordBool; safecall;
    function LoadFromFile(const FileName: WideString): WordBool; safecall;
    function SaveToFileAs(const FileName: WideString; Type_: TableSaveTypes):
      WordBool; safecall;
  end;

  // *********************************************************************//
  // DispIntf:  ITableDocDisp
  // Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
  // GUID:      {CEFB0920-7A8F-11D8-9FCD-D6268C95B908}
  // *********************************************************************//
  ITableDocDisp = dispinterface
    ['{CEFB0920-7A8F-11D8-9FCD-D6268C95B908}']
    function SaveToFile(const FileName: WideString): WordBool; dispid 8;
    function LoadFromFile(const FileName: WideString): WordBool; dispid 9;
    function SaveToFileAs(const FileName: WideString; Type_: TableSaveTypes):
      WordBool; dispid 10;
    property type_: DocTypes readonly dispid 0;
    property ID: Integer readonly dispid 1;
    property Kind: WideString readonly dispid 2;
    property path: WideString readonly dispid 3;
    procedure Open; dispid 4;
    property IsOpen: WordBool readonly dispid 5;
    procedure Save; dispid 6;
    property Name: WideString readonly dispid 7;
  end;

  // *********************************************************************//
  // The Class CoMDWindow provides a Create and CreateRemote method to
  // create instances of the default interface IMDWindow exposed by
  // the CoClass MDWindow. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMDWindow = class
    class function Create: IMDWindow;
    class function CreateRemote(const MachineName: string): IMDWindow;
  end;

  // *********************************************************************//
  // The Class CoConfigurator provides a Create and CreateRemote method to
  // create instances of the default interface IConfigurator exposed by
  // the CoClass Configurator. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoConfigurator = class
    class function Create: IConfigurator;
    class function CreateRemote(const MachineName: string): IConfigurator;
  end;

  // *********************************************************************//
  // The Class CoScripts provides a Create and CreateRemote method to
  // create instances of the default interface IScripts exposed by
  // the CoClass Scripts. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoScripts = class
    class function Create: IScripts;
    class function CreateRemote(const MachineName: string): IScripts;
  end;

  // *********************************************************************//
  // The Class CoPlugins provides a Create and CreateRemote method to
  // create instances of the default interface IPlugins exposed by
  // the CoClass Plugins. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoPlugins = class
    class function Create: IPlugins;
    class function CreateRemote(const MachineName: string): IPlugins;
  end;

  // *********************************************************************//
  // The Class CoType1C provides a Create and CreateRemote method to
  // create instances of the default interface IType1C exposed by
  // the CoClass Type1C. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoType1C = class
    class function Create: IType1C;
    class function CreateRemote(const MachineName: string): IType1C;
  end;

  // *********************************************************************//
  // The Class CoMetaDataObjChilds provides a Create and CreateRemote method to
  // create instances of the default interface IMetaDataObjChilds exposed by
  // the CoClass MetaDataObjChilds. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaDataObjChilds = class
    class function Create: IMetaDataObjChilds;
    class function CreateRemote(const MachineName: string): IMetaDataObjChilds;
  end;

  // *********************************************************************//
  // The Class CoMetaDataObjProps provides a Create and CreateRemote method to
  // create instances of the default interface IMetaDataObjProps exposed by
  // the CoClass MetaDataObjProps. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaDataObjProps = class
    class function Create: IMetaDataObjProps;
    class function CreateRemote(const MachineName: string): IMetaDataObjProps;
  end;

  // *********************************************************************//
  // The Class CoMigration provides a Create and CreateRemote method to
  // create instances of the default interface IMigration exposed by
  // the CoClass Migration. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMigration = class
    class function Create: IMigration;
    class function CreateRemote(const MachineName: string): IMigration;
  end;

  // *********************************************************************//
  // The Class CoMetaDataObj provides a Create and CreateRemote method to
  // create instances of the default interface IMetaDataObj exposed by
  // the CoClass MetaDataObj. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaDataObj = class
    class function Create: IMetaDataObj;
    class function CreateRemote(const MachineName: string): IMetaDataObj;
  end;

  // *********************************************************************//
  // The Class CoMetaDataObjArray provides a Create and CreateRemote method to
  // create instances of the default interface IMetaDataObjArray exposed by
  // the CoClass MetaDataObjArray. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaDataObjArray = class
    class function Create: IMetaDataObjArray;
    class function CreateRemote(const MachineName: string): IMetaDataObjArray;
  end;

  // *********************************************************************//
  // The Class CoSelfScript provides a Create and CreateRemote method to
  // create instances of the default interface ISelfScript exposed by
  // the CoClass SelfScript. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoSelfScript = class
    class function Create: ISelfScript;
    class function CreateRemote(const MachineName: string): ISelfScript;
  end;

  // *********************************************************************//
  // The Class CoMetaEnumVal provides a Create and CreateRemote method to
  // create instances of the default interface IMetaEnumVal exposed by
  // the CoClass MetaEnumVal. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaEnumVal = class
    class function Create: IMetaEnumVal;
    class function CreateRemote(const MachineName: string): IMetaEnumVal;
  end;

  // *********************************************************************//
  // The Class CoMetaEnum provides a Create and CreateRemote method to
  // create instances of the default interface IMetaEnum exposed by
  // the CoClass MetaEnum. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaEnum = class
    class function Create: IMetaEnum;
    class function CreateRemote(const MachineName: string): IMetaEnum;
  end;

  // *********************************************************************//
  // The Class CoMetaEnums provides a Create and CreateRemote method to
  // create instances of the default interface IMetaEnums exposed by
  // the CoClass MetaEnums. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaEnums = class
    class function Create: IMetaEnums;
    class function CreateRemote(const MachineName: string): IMetaEnums;
  end;

  // *********************************************************************//
  // The Class CoMetaData provides a Create and CreateRemote method to
  // create instances of the default interface IMetaData exposed by
  // the CoClass MetaData. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoMetaData = class
    class function Create: IMetaData;
    class function CreateRemote(const MachineName: string): IMetaData;
  end;

  // *********************************************************************//
  // The Class CoTaskDef provides a Create and CreateRemote method to
  // create instances of the default interface ITaskDef exposed by
  // the CoClass TaskDef. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoTaskDef = class
    class function Create: ITaskDef;
    class function CreateRemote(const MachineName: string): ITaskDef;
  end;

  // *********************************************************************//
  // The Class CoAllTypedObj provides a Create and CreateRemote method to
  // create instances of the default interface IAllTypedObj exposed by
  // the CoClass AllTypedObj. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoAllTypedObj = class
    class function Create: IAllTypedObj;
    class function CreateRemote(const MachineName: string): IAllTypedObj;
  end;

  // *********************************************************************//
  // The Class CoConstDef provides a Create and CreateRemote method to
  // create instances of the default interface IConstDef exposed by
  // the CoClass ConstDef. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoConstDef = class
    class function Create: IConstDef;
    class function CreateRemote(const MachineName: string): IConstDef;
  end;

  // *********************************************************************//
  // The Class CoConstants provides a Create and CreateRemote method to
  // create instances of the default interface IConstants exposed by
  // the CoClass Constants. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoConstants = class
    class function Create: IConstants;
    class function CreateRemote(const MachineName: string): IConstants;
  end;

  // *********************************************************************//
  // The Class CoCfgDoc provides a Create and CreateRemote method to
  // create instances of the default interface ICfgDoc exposed by
  // the CoClass CfgDoc. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoCfgDoc = class
    class function Create: ICfgDoc;
    class function CreateRemote(const MachineName: string): ICfgDoc;
  end;

  // *********************************************************************//
  // The Class CoCfgDocuments provides a Create and CreateRemote method to
  // create instances of the default interface ICfgDocuments exposed by
  // the CoClass CfgDocuments. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoCfgDocuments = class
    class function Create: ICfgDocuments;
    class function CreateRemote(const MachineName: string): ICfgDocuments;
  end;

  // *********************************************************************//
  // The Class CoWorkBook provides a Create and CreateRemote method to
  // create instances of the default interface IWorkBook exposed by
  // the CoClass WorkBook. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoWorkBook = class
    class function Create: IWorkBook;
    class function CreateRemote(const MachineName: string): IWorkBook;
  end;

  // *********************************************************************//
  // The Class CoTextDoc provides a Create and CreateRemote method to
  // create instances of the default interface ITextDoc exposed by
  // the CoClass TextDoc. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoTextDoc = class
    class function Create: ITextDoc;
    class function CreateRemote(const MachineName: string): ITextDoc;
  end;

  // *********************************************************************//
  // The Class CoTableDoc provides a Create and CreateRemote method to
  // create instances of the default interface ITableDoc exposed by
  // the CoClass TableDoc. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoTableDoc = class
    class function Create: ITableDoc;
    class function CreateRemote(const MachineName: string): ITableDoc;
  end;

  // *********************************************************************//
  // The Class CoDialogDoc provides a Create and CreateRemote method to
  // create instances of the default interface IDialogDoc exposed by
  // the CoClass DialogDoc. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoDialogDoc = class
    class function Create: IDialogDoc;
    class function CreateRemote(const MachineName: string): IDialogDoc;
  end;

  // *********************************************************************//
  // The Class CoCfgWindow provides a Create and CreateRemote method to
  // create instances of the default interface ICfgWindow exposed by
  // the CoClass CfgWindow. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoCfgWindow = class
    class function Create: ICfgWindow;
    class function CreateRemote(const MachineName: string): ICfgWindow;
  end;

  // *********************************************************************//
  // The Class CoCfgWindows provides a Create and CreateRemote method to
  // create instances of the default interface ICfgWindows exposed by
  // the CoClass CfgWindows. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoCfgWindows = class
    class function Create: ICfgWindows;
    class function CreateRemote(const MachineName: string): ICfgWindows;
  end;

  // *********************************************************************//
  // The Class CoCfgTimer provides a Create and CreateRemote method to
  // create instances of the default interface ICfgTimer exposed by
  // the CoClass CfgTimer. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoCfgTimer = class
    class function Create: ICfgTimer;
    class function CreateRemote(const MachineName: string): ICfgTimer;
  end;

implementation

uses ComObj;

class function CoMDWindow.Create: IMDWindow;
begin
  Result := CreateComObject(CLASS_MDWindow) as IMDWindow;
end;

class function CoMDWindow.CreateRemote(const MachineName: string): IMDWindow;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MDWindow) as IMDWindow;
end;

class function CoConfigurator.Create: IConfigurator;
begin
  Result := CreateComObject(CLASS_Configurator) as IConfigurator;
end;

class function CoConfigurator.CreateRemote(const MachineName: string):
  IConfigurator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Configurator) as
    IConfigurator;
end;

class function CoScripts.Create: IScripts;
begin
  Result := CreateComObject(CLASS_Scripts) as IScripts;
end;

class function CoScripts.CreateRemote(const MachineName: string): IScripts;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Scripts) as IScripts;
end;

class function CoPlugins.Create: IPlugins;
begin
  Result := CreateComObject(CLASS_Plugins) as IPlugins;
end;

class function CoPlugins.CreateRemote(const MachineName: string): IPlugins;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Plugins) as IPlugins;
end;

class function CoType1C.Create: IType1C;
begin
  Result := CreateComObject(CLASS_Type1C) as IType1C;
end;

class function CoType1C.CreateRemote(const MachineName: string): IType1C;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Type1C) as IType1C;
end;

class function CoMetaDataObjChilds.Create: IMetaDataObjChilds;
begin
  Result := CreateComObject(CLASS_MetaDataObjChilds) as IMetaDataObjChilds;
end;

class function CoMetaDataObjChilds.CreateRemote(const MachineName: string):
  IMetaDataObjChilds;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaDataObjChilds) as
    IMetaDataObjChilds;
end;

class function CoMetaDataObjProps.Create: IMetaDataObjProps;
begin
  Result := CreateComObject(CLASS_MetaDataObjProps) as IMetaDataObjProps;
end;

class function CoMetaDataObjProps.CreateRemote(const MachineName: string):
  IMetaDataObjProps;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaDataObjProps) as
    IMetaDataObjProps;
end;

class function CoMigration.Create: IMigration;
begin
  Result := CreateComObject(CLASS_Migration) as IMigration;
end;

class function CoMigration.CreateRemote(const MachineName: string): IMigration;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Migration) as IMigration;
end;

class function CoMetaDataObj.Create: IMetaDataObj;
begin
  Result := CreateComObject(CLASS_MetaDataObj) as IMetaDataObj;
end;

class function CoMetaDataObj.CreateRemote(const MachineName: string):
  IMetaDataObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaDataObj) as
    IMetaDataObj;
end;

class function CoMetaDataObjArray.Create: IMetaDataObjArray;
begin
  Result := CreateComObject(CLASS_MetaDataObjArray) as IMetaDataObjArray;
end;

class function CoMetaDataObjArray.CreateRemote(const MachineName: string):
  IMetaDataObjArray;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaDataObjArray) as
    IMetaDataObjArray;
end;

class function CoSelfScript.Create: ISelfScript;
begin
  Result := CreateComObject(CLASS_SelfScript) as ISelfScript;
end;

class function CoSelfScript.CreateRemote(const MachineName: string):
  ISelfScript;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SelfScript) as ISelfScript;
end;

class function CoMetaEnumVal.Create: IMetaEnumVal;
begin
  Result := CreateComObject(CLASS_MetaEnumVal) as IMetaEnumVal;
end;

class function CoMetaEnumVal.CreateRemote(const MachineName: string):
  IMetaEnumVal;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaEnumVal) as
    IMetaEnumVal;
end;

class function CoMetaEnum.Create: IMetaEnum;
begin
  Result := CreateComObject(CLASS_MetaEnum) as IMetaEnum;
end;

class function CoMetaEnum.CreateRemote(const MachineName: string): IMetaEnum;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaEnum) as IMetaEnum;
end;

class function CoMetaEnums.Create: IMetaEnums;
begin
  Result := CreateComObject(CLASS_MetaEnums) as IMetaEnums;
end;

class function CoMetaEnums.CreateRemote(const MachineName: string): IMetaEnums;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaEnums) as IMetaEnums;
end;

class function CoMetaData.Create: IMetaData;
begin
  Result := CreateComObject(CLASS_MetaData) as IMetaData;
end;

class function CoMetaData.CreateRemote(const MachineName: string): IMetaData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MetaData) as IMetaData;
end;

class function CoTaskDef.Create: ITaskDef;
begin
  Result := CreateComObject(CLASS_TaskDef) as ITaskDef;
end;

class function CoTaskDef.CreateRemote(const MachineName: string): ITaskDef;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TaskDef) as ITaskDef;
end;

class function CoAllTypedObj.Create: IAllTypedObj;
begin
  Result := CreateComObject(CLASS_AllTypedObj) as IAllTypedObj;
end;

class function CoAllTypedObj.CreateRemote(const MachineName: string):
  IAllTypedObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AllTypedObj) as
    IAllTypedObj;
end;

class function CoConstDef.Create: IConstDef;
begin
  Result := CreateComObject(CLASS_ConstDef) as IConstDef;
end;

class function CoConstDef.CreateRemote(const MachineName: string): IConstDef;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ConstDef) as IConstDef;
end;

class function CoConstants.Create: IConstants;
begin
  Result := CreateComObject(CLASS_Constants) as IConstants;
end;

class function CoConstants.CreateRemote(const MachineName: string): IConstants;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Constants) as IConstants;
end;

class function CoCfgDoc.Create: ICfgDoc;
begin
  Result := CreateComObject(CLASS_CfgDoc) as ICfgDoc;
end;

class function CoCfgDoc.CreateRemote(const MachineName: string): ICfgDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CfgDoc) as ICfgDoc;
end;

class function CoCfgDocuments.Create: ICfgDocuments;
begin
  Result := CreateComObject(CLASS_CfgDocuments) as ICfgDocuments;
end;

class function CoCfgDocuments.CreateRemote(const MachineName: string):
  ICfgDocuments;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CfgDocuments) as
    ICfgDocuments;
end;

class function CoWorkBook.Create: IWorkBook;
begin
  Result := CreateComObject(CLASS_WorkBook) as IWorkBook;
end;

class function CoWorkBook.CreateRemote(const MachineName: string): IWorkBook;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WorkBook) as IWorkBook;
end;

class function CoTextDoc.Create: ITextDoc;
begin
  Result := CreateComObject(CLASS_TextDoc) as ITextDoc;
end;

class function CoTextDoc.CreateRemote(const MachineName: string): ITextDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TextDoc) as ITextDoc;
end;

class function CoTableDoc.Create: ITableDoc;
begin
  Result := CreateComObject(CLASS_TableDoc) as ITableDoc;
end;

class function CoTableDoc.CreateRemote(const MachineName: string): ITableDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TableDoc) as ITableDoc;
end;

class function CoDialogDoc.Create: IDialogDoc;
begin
  Result := CreateComObject(CLASS_DialogDoc) as IDialogDoc;
end;

class function CoDialogDoc.CreateRemote(const MachineName: string): IDialogDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DialogDoc) as IDialogDoc;
end;

class function CoCfgWindow.Create: ICfgWindow;
begin
  Result := CreateComObject(CLASS_CfgWindow) as ICfgWindow;
end;

class function CoCfgWindow.CreateRemote(const MachineName: string): ICfgWindow;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CfgWindow) as ICfgWindow;
end;

class function CoCfgWindows.Create: ICfgWindows;
begin
  Result := CreateComObject(CLASS_CfgWindows) as ICfgWindows;
end;

class function CoCfgWindows.CreateRemote(const MachineName: string):
  ICfgWindows;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CfgWindows) as ICfgWindows;
end;

class function CoCfgTimer.Create: ICfgTimer;
begin
  Result := CreateComObject(CLASS_CfgTimer) as ICfgTimer;
end;

class function CoCfgTimer.CreateRemote(const MachineName: string): ICfgTimer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CfgTimer) as ICfgTimer;
end;

end.
