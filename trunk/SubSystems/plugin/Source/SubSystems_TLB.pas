unit SubSystems_TLB;

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
// File generated on 24.10.2008 9:28:54 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\_Phoenix\Delphi\CfgAddons\SubSystems\Source\plugin\Source\SubSystems.tlb (1)
// LIBID: {818C5820-3A18-4876-A0E3-F80194C2A60E}
// LCID: 0
// Helpfile: 
// HelpString: SubSystems
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINXP\system32\stdole2.tlb)
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
  SubSystemsMajorVersion = 1;
  SubSystemsMinorVersion = 0;

  LIBID_SubSystems: TGUID = '{818C5820-3A18-4876-A0E3-F80194C2A60E}';

  IID_IArtbear_ActiveFormX: TGUID = '{B66CECBA-6522-47E2-BA2F-15BC059452EE}';
  DIID_IArtbear_ActiveFormXEvents: TGUID = '{5315EC84-1C4E-4DC3-9AAE-FB20F9AD65E4}';
  DIID_IMDTreeEvents: TGUID = '{1B9B5A3D-A711-45A4-8967-D551D88F3B1B}';
  IID_IMDTree: TGUID = '{EEA91FBB-0AFF-48A0-B20C-B992B47CE7D4}';
  CLASS_Artbear_ActiveFormX: TGUID = '{E7E1848E-EDD5-428D-8160-D7EDFB08DCB5}';
  CLASS_MDTree: TGUID = '{545F0704-4E73-455A-864C-6A31F66F6F6A}';
  IID_IAvailableSubSystems: TGUID = '{A5E54717-9F99-4705-8F7E-74CBE6D788AB}';
  DIID_IAvailableSubSystemsEvents: TGUID = '{A0971EF2-0AF5-4668-87A1-5B94868AAB14}';
  CLASS_AvailableSubSystems: TGUID = '{A89AFCB4-8B8D-4075-841B-BBB9909514C8}';
  IID_IObjectClasses: TGUID = '{CF43233E-C0F9-44EC-8FBB-4713593ED0B6}';
  DIID_IObjectClassesEvents: TGUID = '{B35406B3-B40D-4B04-B811-E1B75B5C853D}';
  CLASS_ObjectClasses: TGUID = '{B982B12F-79DB-45CA-8EB9-880836407196}';
  IID_ICfgList: TGUID = '{C8451E54-30C2-4498-8055-CF6DEC305848}';
  DIID_ICfgListEvents: TGUID = '{A08EC52A-25FC-4568-8A5F-115264020D2A}';
  CLASS_CfgList: TGUID = '{3FA550FF-32B3-456D-9CF7-8ADE57D52287}';
  IID_ITuningMDObj: TGUID = '{02A9ABDA-1F0A-42D0-A3D1-0FABA9AE8A47}';
  DIID_ITuningMDObjEvents: TGUID = '{32E68C6A-C2D9-477B-A051-5CA7FFCE6C7C}';
  CLASS_TuningMDObj: TGUID = '{23B407C3-8CB3-45D4-9119-88323308C592}';
  IID_ITuningSubSystemsList: TGUID = '{22EE02E4-362C-40A6-842A-0733B0E2C04A}';
  DIID_ITuningSubSystemsListEvents: TGUID = '{BA1B2B2C-C42F-493E-843C-A4BE83CB801F}';
  CLASS_TuningSubSystemsList: TGUID = '{D46E6C55-2966-4BBF-8CB2-5FB1CD3457BA}';
  IID_IExtFrmsList: TGUID = '{5E1A3B5E-B655-4261-815A-A254B6BA496A}';
  DIID_IExtFrmsListEvents: TGUID = '{853F8D12-F67A-4F56-B273-52F1F6202B33}';
  CLASS_ExtFrmsList: TGUID = '{34350290-0128-4C1F-AD63-AAD11B298DAE}';
  IID_ILinks: TGUID = '{D6810005-0B06-4237-A5D4-BFBB67171B4A}';
  CLASS_Links: TGUID = '{1612FF6F-6481-4C93-91EA-2C4C03A507E8}';
  IID_ITemplates: TGUID = '{112A3EFD-F673-4733-8C0E-2B7A100BB9F1}';
  DIID_ITemplatesEvents: TGUID = '{EBCBE574-D1CD-470A-AA0E-A0F4DFD56328}';
  CLASS_Templates: TGUID = '{B1403C97-5988-404A-B62A-646CA365A8CD}';
  IID_IToDoList: TGUID = '{5CF7BC99-A70D-4D9C-89DE-BB964456E443}';
  DIID_IToDoListEvents: TGUID = '{9DE1A745-8058-463B-A8CF-F4572BD1B4E8}';
  CLASS_ToDoList: TGUID = '{BB5EECE0-D947-443D-88BD-99B9E4F61103}';
  IID_IOptions: TGUID = '{459394D7-4196-4740-82E8-F2DC5F2193AB}';
  DIID_IOptionsEvents: TGUID = '{6B5B4A7D-2341-497B-9D6A-DBFF625FDBCC}';
  CLASS_Options: TGUID = '{F89D878C-03D5-473F-88E8-44686D870D36}';
  IID_IBookmarks: TGUID = '{5F8C5B17-C9A4-4CDF-A433-43B6EEE30BB3}';
  CLASS_Bookmarks: TGUID = '{76F4A508-144B-40AE-91B8-069344CE2F95}';
  IID_IObjectNote: TGUID = '{7CD12636-8E24-4A39-A190-27CC6B7CEE5F}';
  CLASS_ObjectNote: TGUID = '{EB465BAB-1998-4E82-8FEB-0D47D4C473B1}';
  IID_IObjectNoteList: TGUID = '{7B4D4C4A-B310-4B53-89A2-45876695E681}';
  DIID_IObjectNoteListEvents: TGUID = '{4A8CE050-D96E-47D5-B1F5-CC29A7A5DE1C}';
  CLASS_ObjectNoteList: TGUID = '{E6210CB3-46A2-49EA-A802-A4E168B8C9FD}';
  IID_IRelises: TGUID = '{B6D7C70C-51C8-4662-9E19-8DC25B53E10E}';
  DIID_IRelisesEvents: TGUID = '{A2D05A70-3537-4F0C-92EB-B249C31E7DD7}';
  CLASS_Relises: TGUID = '{ADA17075-BFC5-4221-8DF1-65879C1A25F1}';
  IID_IStatusList: TGUID = '{C684C719-8BB0-4B9B-B624-406F9B9E0818}';
  CLASS_StatusList: TGUID = '{3AD497A4-E167-4EBD-B5E9-A8E2DE0E51FE}';
  IID_ISubconfigs: TGUID = '{2D1B02FC-21E0-4F45-A628-AFB74C13F175}';
  CLASS_Subconfigs: TGUID = '{B740B2EC-5143-4EF1-AA0D-C764CDF7AD5A}';
  IID_IListUsers: TGUID = '{F7D485F5-7358-492B-B965-91521E9265FE}';
  CLASS_ListUsers: TGUID = '{15619558-07B8-486D-AEC7-3B75EC00047E}';
  IID_IListCategoryes: TGUID = '{E814CC90-7779-4819-99D8-B42ACEC4C300}';
  CLASS_ListCategoryes: TGUID = '{9E4CDE43-A936-4ECD-81BF-F14937AE1A65}';
  IID_IListSeriousness: TGUID = '{56978EAB-AD12-4487-9C35-46741E1A0702}';
  CLASS_ListSeriousness: TGUID = '{1282D38D-377B-422B-991C-1329B38BFCDE}';
  IID_IToDoViewColumns: TGUID = '{02D092D6-4AE1-45A6-80EF-A7BDC8E317EF}';
  CLASS_ToDoViewColumns: TGUID = '{66AC75B7-F3B8-4BED-B4A9-0EDA7A6F7111}';
  IID_IMDObjBlocks: TGUID = '{C2D5CB2D-0F99-46B5-AE8C-F75FAEBCA26A}';
  CLASS_MDObjBlocks: TGUID = '{1C244184-5C69-4EA2-AE7F-2A319635DC06}';
  IID_IDBChangesLog: TGUID = '{86BF708D-4073-4D07-B020-53084D22DAC6}';
  CLASS_DBChangesLog: TGUID = '{1832A8BA-7872-42D9-B12B-1F8A75A57EFB}';

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

// Constants for enum TxHelpType
type
  TxHelpType = TOleEnum;
const
  htKeyword = $00000000;
  htContext = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IArtbear_ActiveFormX = interface;
  IArtbear_ActiveFormXDisp = dispinterface;
  IArtbear_ActiveFormXEvents = dispinterface;
  IMDTreeEvents = dispinterface;
  IMDTree = interface;
  IMDTreeDisp = dispinterface;
  IAvailableSubSystems = interface;
  IAvailableSubSystemsDisp = dispinterface;
  IAvailableSubSystemsEvents = dispinterface;
  IObjectClasses = interface;
  IObjectClassesDisp = dispinterface;
  IObjectClassesEvents = dispinterface;
  ICfgList = interface;
  ICfgListDisp = dispinterface;
  ICfgListEvents = dispinterface;
  ITuningMDObj = interface;
  ITuningMDObjDisp = dispinterface;
  ITuningMDObjEvents = dispinterface;
  ITuningSubSystemsList = interface;
  ITuningSubSystemsListDisp = dispinterface;
  ITuningSubSystemsListEvents = dispinterface;
  IExtFrmsList = interface;
  IExtFrmsListDisp = dispinterface;
  IExtFrmsListEvents = dispinterface;
  ILinks = interface;
  ILinksDisp = dispinterface;
  ITemplates = interface;
  ITemplatesDisp = dispinterface;
  ITemplatesEvents = dispinterface;
  IToDoList = interface;
  IToDoListDisp = dispinterface;
  IToDoListEvents = dispinterface;
  IOptions = interface;
  IOptionsDisp = dispinterface;
  IOptionsEvents = dispinterface;
  IBookmarks = interface;
  IBookmarksDisp = dispinterface;
  IObjectNote = interface;
  IObjectNoteDisp = dispinterface;
  IObjectNoteList = interface;
  IObjectNoteListDisp = dispinterface;
  IObjectNoteListEvents = dispinterface;
  IRelises = interface;
  IRelisesDisp = dispinterface;
  IRelisesEvents = dispinterface;
  IStatusList = interface;
  IStatusListDisp = dispinterface;
  ISubconfigs = interface;
  ISubconfigsDisp = dispinterface;
  IListUsers = interface;
  IListUsersDisp = dispinterface;
  IListCategoryes = interface;
  IListCategoryesDisp = dispinterface;
  IListSeriousness = interface;
  IListSeriousnessDisp = dispinterface;
  IToDoViewColumns = interface;
  IToDoViewColumnsDisp = dispinterface;
  IMDObjBlocks = interface;
  IMDObjBlocksDisp = dispinterface;
  IDBChangesLog = interface;
  IDBChangesLogDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Artbear_ActiveFormX = IArtbear_ActiveFormX;
  MDTree = IMDTree;
  AvailableSubSystems = IAvailableSubSystems;
  ObjectClasses = IObjectClasses;
  CfgList = ICfgList;
  TuningMDObj = ITuningMDObj;
  TuningSubSystemsList = ITuningSubSystemsList;
  ExtFrmsList = IExtFrmsList;
  Links = ILinks;
  Templates = ITemplates;
  ToDoList = IToDoList;
  Options = IOptions;
  Bookmarks = IBookmarks;
  ObjectNote = IObjectNote;
  ObjectNoteList = IObjectNoteList;
  Relises = IRelises;
  StatusList = IStatusList;
  Subconfigs = ISubconfigs;
  ListUsers = IListUsers;
  ListCategoryes = IListCategoryes;
  ListSeriousness = IListSeriousness;
  ToDoViewColumns = IToDoViewColumns;
  MDObjBlocks = IMDObjBlocks;
  DBChangesLog = IDBChangesLog;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWideString1 = ^WideString; {*}
  PSYSINT1 = ^SYSINT; {*}


// *********************************************************************//
// Interface: IArtbear_ActiveFormX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B66CECBA-6522-47E2-BA2F-15BC059452EE}
// *********************************************************************//
  IArtbear_ActiveFormX = interface(IDispatch)
    ['{B66CECBA-6522-47E2-BA2F-15BC059452EE}']
    function GetCurrentPage: WideString; safecall;
    function GetSQLConnectionString: WideString; safecall;
    function GetSpecialFolderPath(var SPFolder: WideString): WideString; safecall;
    function GetDBUserNames(var UsersListFile: WideString): WideString; safecall;
    function GetMDTree: IMDTree; safecall;
    function GetAvailableSubSystems: IAvailableSubSystems; safecall;
    function GetCfgList: ICfgList; safecall;
    function GetExtFrmsList: IExtFrmsList; safecall;
    function GetLinks: ILinks; safecall;
    function GetObjectClasses: IObjectClasses; safecall;
    function GetTemplates: ITemplates; safecall;
    function GetToDoList: IToDoList; safecall;
    function GetTuningMDObj: ITuningMDObj; safecall;
    function GetTuningSubSystemsList: ITuningSubSystemsList; safecall;
    function GetOptions: IOptions; safecall;
    function GetBookmarks: IBookmarks; safecall;
    function GetCurrentDBUserNames: WideString; safecall;
    function GetObjectNote: IObjectNote; safecall;
    procedure GoToSheet(const vSheet: WideString); safecall;
    function GetObjectNoteList: IObjectNoteList; safecall;
    function GetRelisesList: IRelises; safecall;
    function GetToDoObjName: WideString; safecall;
    function GetStatusList: IStatusList; safecall;
    function GetSubconfigsList: ISubconfigs; safecall;
    function GetUsersList: IListUsers; safecall;
    function GetListCategoryes: IListCategoryes; safecall;
    function GetListSeriousnes: IListSeriousness; safecall;
    function GetListToDoCols: IToDoViewColumns; safecall;
    procedure CloseDatabase; safecall;
    function GetListMDObjBlocks: IMDObjBlocks; safecall;
    function GetIDFromStr(const vStr: WideString): WideString; safecall;
    function GetDBChangeLog: DBChangesLog; safecall;
    function GetDataConnectionString: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IArtbear_ActiveFormXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B66CECBA-6522-47E2-BA2F-15BC059452EE}
// *********************************************************************//
  IArtbear_ActiveFormXDisp = dispinterface
    ['{B66CECBA-6522-47E2-BA2F-15BC059452EE}']
    function GetCurrentPage: WideString; dispid 253;
    function GetSQLConnectionString: WideString; dispid 260;
    function GetSpecialFolderPath(var SPFolder: WideString): WideString; dispid 263;
    function GetDBUserNames(var UsersListFile: WideString): WideString; dispid 276;
    function GetMDTree: IMDTree; dispid 202;
    function GetAvailableSubSystems: IAvailableSubSystems; dispid 203;
    function GetCfgList: ICfgList; dispid 204;
    function GetExtFrmsList: IExtFrmsList; dispid 205;
    function GetLinks: ILinks; dispid 206;
    function GetObjectClasses: IObjectClasses; dispid 207;
    function GetTemplates: ITemplates; dispid 208;
    function GetToDoList: IToDoList; dispid 209;
    function GetTuningMDObj: ITuningMDObj; dispid 210;
    function GetTuningSubSystemsList: ITuningSubSystemsList; dispid 211;
    function GetOptions: IOptions; dispid 213;
    function GetBookmarks: IBookmarks; dispid 201;
    function GetCurrentDBUserNames: WideString; dispid 212;
    function GetObjectNote: IObjectNote; dispid 214;
    procedure GoToSheet(const vSheet: WideString); dispid 215;
    function GetObjectNoteList: IObjectNoteList; dispid 216;
    function GetRelisesList: IRelises; dispid 217;
    function GetToDoObjName: WideString; dispid 218;
    function GetStatusList: IStatusList; dispid 219;
    function GetSubconfigsList: ISubconfigs; dispid 220;
    function GetUsersList: IListUsers; dispid 221;
    function GetListCategoryes: IListCategoryes; dispid 222;
    function GetListSeriousnes: IListSeriousness; dispid 223;
    function GetListToDoCols: IToDoViewColumns; dispid 224;
    procedure CloseDatabase; dispid 225;
    function GetListMDObjBlocks: IMDObjBlocks; dispid 226;
    function GetIDFromStr(const vStr: WideString): WideString; dispid 227;
    function GetDBChangeLog: DBChangesLog; dispid 228;
    function GetDataConnectionString: WideString; dispid 229;
  end;

// *********************************************************************//
// DispIntf:  IArtbear_ActiveFormXEvents
// Flags:     (4096) Dispatchable
// GUID:      {5315EC84-1C4E-4DC3-9AAE-FB20F9AD65E4}
// *********************************************************************//
  IArtbear_ActiveFormXEvents = dispinterface
    ['{5315EC84-1C4E-4DC3-9AAE-FB20F9AD65E4}']
    procedure OnActivate; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnCreate; dispid 3;
    procedure OnDblClick; dispid 5;
    procedure OnDestroy; dispid 6;
    procedure OnDeactivate; dispid 7;
    procedure OnKeyPress(var Key: Smallint); dispid 11;
    procedure OnPaint; dispid 16;
    procedure OnMDNodeDblClick; dispid 17;
    procedure OnShow; dispid 201;
    procedure OnMDNodeChange; dispid 202;
    procedure OnMDNodeClick; dispid 203;
    procedure OnToDoAdd; dispid 204;
    procedure OnToDoEdit; dispid 205;
    procedure OnToDoDelete; dispid 206;
    procedure OnToDoRefresh; dispid 207;
    procedure OnToDoFilterListChange; dispid 208;
    procedure OnToDoFilterDoneChange; dispid 209;
    procedure OnMDViewChange; dispid 210;
    procedure OnMDSubSystemsListRefresh; dispid 211;
    procedure OnMDTreeFilling; dispid 212;
    procedure OnMDTreeSaveToFile; dispid 213;
    procedure OnMDTreeDeleteErrors; dispid 214;
    procedure OnSubSystemsListSelectAll; dispid 215;
    procedure OnSubSystemsListUnSelectAll; dispid 216;
    procedure OnSubSystemsListInvert; dispid 217;
    procedure OnSubSystemsObjSelectAll; dispid 218;
    procedure OnSubSystemsObjUnSelectAll; dispid 219;
    procedure OnSubSystemsObjInvert; dispid 220;
    procedure OnCfgSubSystemsRefresh; dispid 221;
    procedure OnCfgSubSystemsAdd; dispid 222;
    procedure OnCfgSubSystemsEdit; dispid 223;
    procedure OnCfgSubSystemsDelete; dispid 224;
    procedure OnCfgMDObjRefresh; dispid 225;
    procedure OnCfgExtFrmRefresh; dispid 226;
    procedure OnCfgExtFrmNewFolder; dispid 227;
    procedure OnCfgExtFrmNewFile; dispid 228;
    procedure OnCfgExtFrmEdit; dispid 229;
    procedure OnCfgExtFrmDelete; dispid 230;
    procedure OnConfigsRefresh; dispid 231;
    procedure OnConfigsAdd; dispid 232;
    procedure OnConfigsEdit; dispid 233;
    procedure OnConfigsDelete; dispid 234;
    procedure OnConfigsChoice; dispid 235;
    procedure OnPageShowSubSystem; dispid 236;
    procedure OnPageShowToDo; dispid 237;
    procedure OnPageShowCfg; dispid 238;
    procedure OnPageShowConfigs; dispid 239;
    procedure OnPageShowProps; dispid 240;
    procedure OnPageShowLinks; dispid 241;
    procedure OnPageShowSubSystemObj; dispid 242;
    procedure OnPageShowExplorer; dispid 243;
    procedure OnPageShowSubSystemList; dispid 244;
    procedure OnPageShowMDObjList; dispid 245;
    procedure OnPageShowExtFrmsList; dispid 246;
    procedure OnPageShowAvailableSubSystems; dispid 247;
    procedure OnPageShowMDObjShow; dispid 248;
    procedure OnToDoFilterUserChange; dispid 249;
    procedure OnToDoFilterObjTypeChange; dispid 250;
    procedure OnTemplatesListRefresh; dispid 251;
    procedure OnTemplatesListAdd; dispid 252;
    procedure OnTemplatesListEdit; dispid 253;
    procedure OnTemplatesListDelete; dispid 254;
    procedure OnTemplatesListChangeParent; dispid 255;
    procedure OnTemplatesListNewFolder; dispid 256;
    procedure OnLinksChoiceObj; dispid 257;
    procedure OnShowBookmarks; dispid 258;
    procedure OnMDBtnChoiceClick; dispid 259;
    procedure OnSetSavedOptionsByName; dispid 260;
    procedure OnSaveOptionsByName; dispid 261;
    procedure OnTemplatesSetBuffer; dispid 262;
    procedure OnNoteOpenCard; dispid 263;
    procedure OnNoteDelete; dispid 264;
    procedure OnNoteSaveToFile; dispid 265;
    procedure OnNoteLoadFromFile; dispid 266;
    procedure OnNoteRefresh; dispid 267;
    procedure OnNoteListRefresh; dispid 268;
    procedure OnNoteListOpen; dispid 269;
    procedure OnNoteListDelete; dispid 270;
    procedure OnNoteListSaveToFile; dispid 271;
    procedure OnPageShowObjectNote; dispid 272;
    procedure OnPageShowObjectNoteList; dispid 273;
    procedure OnNoteListDblClick; dispid 274;
    procedure OnTuningMDObjDblClick; dispid 275;
    procedure OnTuningRelisesRefresh; dispid 276;
    procedure OnTuningRelisesAdd; dispid 277;
    procedure OnTuningRelisesEdit; dispid 278;
    procedure OnTuningRelisesDelete; dispid 279;
    procedure OnToDoCardGetObjectName; dispid 280;
    procedure OnStatusListRefresh; dispid 281;
    procedure OnStatusListAdd; dispid 282;
    procedure OnStatusListEdit; dispid 283;
    procedure OnStatusListDelete; dispid 284;
    procedure OnToDoFilterStatusChange; dispid 285;
    procedure OnToDoFilterReliseChange; dispid 286;
    procedure OnToDoFilterConfigChange; dispid 287;
    procedure OnToDoFilterChange; dispid 288;
    procedure OnToDoFilterForReportChange; dispid 289;
    procedure OnToDoFilterSubconfigChange; dispid 290;
    procedure OnAviliableSubsystemsSubconfigChange; dispid 291;
    procedure OnCfgSubSystemsSubconfigChange; dispid 292;
    procedure OnTuningRelisesSubconfigChange; dispid 293;
    procedure OnUsersListRefresh; dispid 294;
    procedure OnUsersListNew; dispid 295;
    procedure OnUsersListEdit; dispid 296;
    procedure OnUsersListDelete; dispid 297;
    procedure OnUsersListDblClick; dispid 298;
    procedure OnUsersListChangeSubConfig; dispid 299;
    procedure OnToDoFilterParentToDoChange; dispid 300;
    procedure OnListCategoryesRefresh; dispid 301;
    procedure OnListCategoryesNew; dispid 302;
    procedure OnListCategoryesEdit; dispid 303;
    procedure OnListCategoryesDelete; dispid 304;
    procedure OnListSeriousnessRefresh; dispid 305;
    procedure OnListSeriousnessNew; dispid 306;
    procedure OnListSeriousnessEdit; dispid 307;
    procedure OnListSeriousnessDelete; dispid 308;
    procedure OnToDoListColsRefresh; dispid 309;
    procedure OnToDoListColsNew; dispid 310;
    procedure OnToDoListColsEdit; dispid 311;
    procedure OnToDoListColsDelete; dispid 312;
    procedure OnToDoObjRefresh; dispid 313;
    procedure OnToDoObjEdit; dispid 314;
    procedure OnToDoObjDelete; dispid 315;
    procedure OnMDObjBlocksRefresh; dispid 316;
    procedure OnMDObjBlocksEdit; dispid 317;
    procedure OnMDObjBlocksDelete; dispid 318;
    procedure OnMDObjBlocksSetBlock; dispid 319;
    procedure OnMDObjBlocksUnSetBlock; dispid 320;
    procedure OnDBChangesGetListByID; dispid 321;
    procedure OnDBChangesAdd; dispid 322;
    procedure OnDBChangesEdit; dispid 323;
    procedure OnDBChangesDelete; dispid 324;
    procedure OnToDoCopy; dispid 325;
    procedure OnToDoCreateChild; dispid 326;
    procedure OnNoteNew; dispid 327;
  end;

// *********************************************************************//
// DispIntf:  IMDTreeEvents
// Flags:     (4096) Dispatchable
// GUID:      {1B9B5A3D-A711-45A4-8967-D551D88F3B1B}
// *********************************************************************//
  IMDTreeEvents = dispinterface
    ['{1B9B5A3D-A711-45A4-8967-D551D88F3B1B}']
  end;

// *********************************************************************//
// Interface: IMDTree
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EEA91FBB-0AFF-48A0-B20C-B992B47CE7D4}
// *********************************************************************//
  IMDTree = interface(IDispatch)
    ['{EEA91FBB-0AFF-48A0-B20C-B992B47CE7D4}']
    procedure Open; safecall;
    procedure Fill; safecall;
    procedure TreeInFile; safecall;
    procedure DeleteAllErros; safecall;
    procedure DeleteCurrentError; safecall;
    function GetTypeViewIndex: SYSINT; safecall;
    procedure SetTypeViewIndex(Ind: SYSINT); safecall;
    function GetNodeClass: SYSINT; safecall;
    function GetCurrentMDObjFullName: WideString; safecall;
    function GetCurrentMDObj: OleVariant; safecall;
    procedure GetMDNodeObjInfo; safecall;
    function ReternFileInfo(const ParamFile: WideString): WideString; safecall;
    procedure GetObjectNote; safecall;
    function ExpandType: SYSINT; safecall;
    function GoToPathInExplorer(const vPath: WideString): SYSINT; safecall;
    function GoToObject(const pName: WideString): SYSINT; safecall;
    procedure FillData; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMDTreeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EEA91FBB-0AFF-48A0-B20C-B992B47CE7D4}
// *********************************************************************//
  IMDTreeDisp = dispinterface
    ['{EEA91FBB-0AFF-48A0-B20C-B992B47CE7D4}']
    procedure Open; dispid 201;
    procedure Fill; dispid 202;
    procedure TreeInFile; dispid 203;
    procedure DeleteAllErros; dispid 204;
    procedure DeleteCurrentError; dispid 205;
    function GetTypeViewIndex: SYSINT; dispid 206;
    procedure SetTypeViewIndex(Ind: SYSINT); dispid 207;
    function GetNodeClass: SYSINT; dispid 208;
    function GetCurrentMDObjFullName: WideString; dispid 209;
    function GetCurrentMDObj: OleVariant; dispid 210;
    procedure GetMDNodeObjInfo; dispid 211;
    function ReternFileInfo(const ParamFile: WideString): WideString; dispid 212;
    procedure GetObjectNote; dispid 213;
    function ExpandType: SYSINT; dispid 214;
    function GoToPathInExplorer(const vPath: WideString): SYSINT; dispid 215;
    function GoToObject(const pName: WideString): SYSINT; dispid 216;
    procedure FillData; dispid 217;
  end;

// *********************************************************************//
// Interface: IAvailableSubSystems
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A5E54717-9F99-4705-8F7E-74CBE6D788AB}
// *********************************************************************//
  IAvailableSubSystems = interface(IDispatch)
    ['{A5E54717-9F99-4705-8F7E-74CBE6D788AB}']
    procedure ChoiceAll; safecall;
    procedure UnChoiceAll; safecall;
    procedure Invert; safecall;
    procedure Refresh; safecall;
    procedure SetSubSystems(const vStr: WideString); safecall;
    function GetSelectedSubSystemsID: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAvailableSubSystemsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A5E54717-9F99-4705-8F7E-74CBE6D788AB}
// *********************************************************************//
  IAvailableSubSystemsDisp = dispinterface
    ['{A5E54717-9F99-4705-8F7E-74CBE6D788AB}']
    procedure ChoiceAll; dispid 201;
    procedure UnChoiceAll; dispid 202;
    procedure Invert; dispid 203;
    procedure Refresh; dispid 204;
    procedure SetSubSystems(const vStr: WideString); dispid 205;
    function GetSelectedSubSystemsID: WideString; dispid 206;
  end;

// *********************************************************************//
// DispIntf:  IAvailableSubSystemsEvents
// Flags:     (4096) Dispatchable
// GUID:      {A0971EF2-0AF5-4668-87A1-5B94868AAB14}
// *********************************************************************//
  IAvailableSubSystemsEvents = dispinterface
    ['{A0971EF2-0AF5-4668-87A1-5B94868AAB14}']
  end;

// *********************************************************************//
// Interface: IObjectClasses
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CF43233E-C0F9-44EC-8FBB-4713593ED0B6}
// *********************************************************************//
  IObjectClasses = interface(IDispatch)
    ['{CF43233E-C0F9-44EC-8FBB-4713593ED0B6}']
    procedure ChoiceAll; safecall;
    procedure UnChoiceAll; safecall;
    procedure Invert; safecall;
    function GetObjClasses: WideString; safecall;
    procedure SetObjClasses(const vID: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IObjectClassesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CF43233E-C0F9-44EC-8FBB-4713593ED0B6}
// *********************************************************************//
  IObjectClassesDisp = dispinterface
    ['{CF43233E-C0F9-44EC-8FBB-4713593ED0B6}']
    procedure ChoiceAll; dispid 201;
    procedure UnChoiceAll; dispid 202;
    procedure Invert; dispid 203;
    function GetObjClasses: WideString; dispid 204;
    procedure SetObjClasses(const vID: WideString); dispid 205;
  end;

// *********************************************************************//
// DispIntf:  IObjectClassesEvents
// Flags:     (4096) Dispatchable
// GUID:      {B35406B3-B40D-4B04-B811-E1B75B5C853D}
// *********************************************************************//
  IObjectClassesEvents = dispinterface
    ['{B35406B3-B40D-4B04-B811-E1B75B5C853D}']
  end;

// *********************************************************************//
// Interface: ICfgList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C8451E54-30C2-4498-8055-CF6DEC305848}
// *********************************************************************//
  ICfgList = interface(IDispatch)
    ['{C8451E54-30C2-4498-8055-CF6DEC305848}']
    procedure Refresh; safecall;
    procedure Add; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure Choice; safecall;
    procedure SetCurrentConfig; safecall;
    procedure SetConfigByName(const vName: WideString); safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  ICfgListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C8451E54-30C2-4498-8055-CF6DEC305848}
// *********************************************************************//
  ICfgListDisp = dispinterface
    ['{C8451E54-30C2-4498-8055-CF6DEC305848}']
    procedure Refresh; dispid 201;
    procedure Add; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure Choice; dispid 205;
    procedure SetCurrentConfig; dispid 206;
    procedure SetConfigByName(const vName: WideString); dispid 207;
    procedure OpenCard(var vID: SYSINT); dispid 212;
  end;

// *********************************************************************//
// DispIntf:  ICfgListEvents
// Flags:     (4096) Dispatchable
// GUID:      {A08EC52A-25FC-4568-8A5F-115264020D2A}
// *********************************************************************//
  ICfgListEvents = dispinterface
    ['{A08EC52A-25FC-4568-8A5F-115264020D2A}']
  end;

// *********************************************************************//
// Interface: ITuningMDObj
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02A9ABDA-1F0A-42D0-A3D1-0FABA9AE8A47}
// *********************************************************************//
  ITuningMDObj = interface(IDispatch)
    ['{02A9ABDA-1F0A-42D0-A3D1-0FABA9AE8A47}']
    procedure Refresh; safecall;
    procedure Show; safecall;
    procedure Save; safecall;
    function GetCurrentMDObj: OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITuningMDObjDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02A9ABDA-1F0A-42D0-A3D1-0FABA9AE8A47}
// *********************************************************************//
  ITuningMDObjDisp = dispinterface
    ['{02A9ABDA-1F0A-42D0-A3D1-0FABA9AE8A47}']
    procedure Refresh; dispid 201;
    procedure Show; dispid 202;
    procedure Save; dispid 203;
    function GetCurrentMDObj: OleVariant; dispid 204;
  end;

// *********************************************************************//
// DispIntf:  ITuningMDObjEvents
// Flags:     (4096) Dispatchable
// GUID:      {32E68C6A-C2D9-477B-A051-5CA7FFCE6C7C}
// *********************************************************************//
  ITuningMDObjEvents = dispinterface
    ['{32E68C6A-C2D9-477B-A051-5CA7FFCE6C7C}']
  end;

// *********************************************************************//
// Interface: ITuningSubSystemsList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {22EE02E4-362C-40A6-842A-0733B0E2C04A}
// *********************************************************************//
  ITuningSubSystemsList = interface(IDispatch)
    ['{22EE02E4-362C-40A6-842A-0733B0E2C04A}']
    procedure Refresh; safecall;
    procedure New; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    function GetSubSystemNameByID(vID: SYSINT): WideString; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITuningSubSystemsListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {22EE02E4-362C-40A6-842A-0733B0E2C04A}
// *********************************************************************//
  ITuningSubSystemsListDisp = dispinterface
    ['{22EE02E4-362C-40A6-842A-0733B0E2C04A}']
    procedure Refresh; dispid 201;
    procedure New; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    function GetSubSystemNameByID(vID: SYSINT): WideString; dispid 205;
    procedure OpenCard(var vID: SYSINT); dispid 206;
  end;

// *********************************************************************//
// DispIntf:  ITuningSubSystemsListEvents
// Flags:     (4096) Dispatchable
// GUID:      {BA1B2B2C-C42F-493E-843C-A4BE83CB801F}
// *********************************************************************//
  ITuningSubSystemsListEvents = dispinterface
    ['{BA1B2B2C-C42F-493E-843C-A4BE83CB801F}']
  end;

// *********************************************************************//
// Interface: IExtFrmsList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E1A3B5E-B655-4261-815A-A254B6BA496A}
// *********************************************************************//
  IExtFrmsList = interface(IDispatch)
    ['{5E1A3B5E-B655-4261-815A-A254B6BA496A}']
    procedure Refresh; safecall;
    procedure NewFolder; safecall;
    procedure NewFile; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure ShowSubSystems; safecall;
    procedure SaveSubSystems; safecall;
  end;

// *********************************************************************//
// DispIntf:  IExtFrmsListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E1A3B5E-B655-4261-815A-A254B6BA496A}
// *********************************************************************//
  IExtFrmsListDisp = dispinterface
    ['{5E1A3B5E-B655-4261-815A-A254B6BA496A}']
    procedure Refresh; dispid 201;
    procedure NewFolder; dispid 202;
    procedure NewFile; dispid 203;
    procedure Edit; dispid 204;
    procedure Delete; dispid 205;
    procedure ShowSubSystems; dispid 206;
    procedure SaveSubSystems; dispid 207;
  end;

// *********************************************************************//
// DispIntf:  IExtFrmsListEvents
// Flags:     (4096) Dispatchable
// GUID:      {853F8D12-F67A-4F56-B273-52F1F6202B33}
// *********************************************************************//
  IExtFrmsListEvents = dispinterface
    ['{853F8D12-F67A-4F56-B273-52F1F6202B33}']
  end;

// *********************************************************************//
// Interface: ILinks
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D6810005-0B06-4237-A5D4-BFBB67171B4A}
// *********************************************************************//
  ILinks = interface(IDispatch)
    ['{D6810005-0B06-4237-A5D4-BFBB67171B4A}']
    procedure Refresh; safecall;
    procedure ListToText; safecall;
    function GetObj: OleVariant; safecall;
    function GetText: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  ILinksDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D6810005-0B06-4237-A5D4-BFBB67171B4A}
// *********************************************************************//
  ILinksDisp = dispinterface
    ['{D6810005-0B06-4237-A5D4-BFBB67171B4A}']
    procedure Refresh; dispid 201;
    procedure ListToText; dispid 202;
    function GetObj: OleVariant; dispid 203;
    function GetText: WideString; dispid 204;
  end;

// *********************************************************************//
// Interface: ITemplates
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {112A3EFD-F673-4733-8C0E-2B7A100BB9F1}
// *********************************************************************//
  ITemplates = interface(IDispatch)
    ['{112A3EFD-F673-4733-8C0E-2B7A100BB9F1}']
    procedure Refresh; safecall;
    procedure NewElement; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure NewFolder; safecall;
    procedure OpenCardByID(vID: SYSINT); safecall;
    function GetTreeFldrElems: WideString; safecall;
    function GetTreeFldr: WideString; safecall;
    procedure SetTextToClipboard(vID: SYSINT); safecall;
    function GetTextFromFile(var vFileName: WideString): WideString; safecall;
    function Get_ImportFileName: WideString; safecall;
    procedure Set_ImportFileName(const Value: WideString); safecall;
    function GetTemplateValuetByID(vID: SYSINT; const vField: WideString): OleVariant; safecall;
    procedure SetTemplateValueByID(vID: SYSINT; const vField: WideString; vFieldValue: OleVariant); safecall;
    property ImportFileName: WideString read Get_ImportFileName write Set_ImportFileName;
  end;

// *********************************************************************//
// DispIntf:  ITemplatesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {112A3EFD-F673-4733-8C0E-2B7A100BB9F1}
// *********************************************************************//
  ITemplatesDisp = dispinterface
    ['{112A3EFD-F673-4733-8C0E-2B7A100BB9F1}']
    procedure Refresh; dispid 201;
    procedure NewElement; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure NewFolder; dispid 205;
    procedure OpenCardByID(vID: SYSINT); dispid 206;
    function GetTreeFldrElems: WideString; dispid 207;
    function GetTreeFldr: WideString; dispid 208;
    procedure SetTextToClipboard(vID: SYSINT); dispid 209;
    function GetTextFromFile(var vFileName: WideString): WideString; dispid 210;
    property ImportFileName: WideString dispid 211;
    function GetTemplateValuetByID(vID: SYSINT; const vField: WideString): OleVariant; dispid 212;
    procedure SetTemplateValueByID(vID: SYSINT; const vField: WideString; vFieldValue: OleVariant); dispid 213;
  end;

// *********************************************************************//
// DispIntf:  ITemplatesEvents
// Flags:     (4096) Dispatchable
// GUID:      {EBCBE574-D1CD-470A-AA0E-A0F4DFD56328}
// *********************************************************************//
  ITemplatesEvents = dispinterface
    ['{EBCBE574-D1CD-470A-AA0E-A0F4DFD56328}']
  end;

// *********************************************************************//
// Interface: IToDoList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5CF7BC99-A70D-4D9C-89DE-BB964456E443}
// *********************************************************************//
  IToDoList = interface(IDispatch)
    ['{5CF7BC99-A70D-4D9C-89DE-BB964456E443}']
    procedure Refresh; safecall;
    function New: SYSINT; safecall;
    function Edit: SYSINT; safecall;
    procedure Delete; safecall;
    function OpenCard(vID: SYSINT): SYSINT; safecall;
    function GetSubSystemsByID(vID: SYSINT): WideString; safecall;
    function GetTypeObjByID(vID: SYSINT): WideString; safecall;
    function GetMDObjByID(vID: SYSINT): WideString; safecall;
    procedure SaveToFile(var vFileName: WideString); safecall;
    function GetConditionsViewType: SYSINT; safecall;
    procedure SetConditionsViewType(vVal: SYSINT); safecall;
    function GetListViewType: SYSINT; safecall;
    procedure SetListViewType(vVal: SYSINT); safecall;
    function SelectToDoByID(var vID: SYSINT): SYSINT; safecall;
    function GetSelectedToDoID: SYSINT; safecall;
    function GetMaxListConditionsSize: SYSINT; safecall;
    procedure SetMaxListConditionsSize(var vVal: SYSINT); safecall;
    function GetMaxListChildToDoSize: SYSINT; safecall;
    procedure SetMaxListChildToDoSize(var vVal: SYSINT); safecall;
    procedure ListForObjectRefresh(var vID: SYSINT); safecall;
    procedure ToDoObjEdit; safecall;
    procedure ToDoObjDelete; safecall;
    function CreateChild(vParentID: SYSINT): SYSINT; safecall;
    function CopyByID(vID: SYSINT): SYSINT; safecall;
    function GetConditionText(const ForTree: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IToDoListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5CF7BC99-A70D-4D9C-89DE-BB964456E443}
// *********************************************************************//
  IToDoListDisp = dispinterface
    ['{5CF7BC99-A70D-4D9C-89DE-BB964456E443}']
    procedure Refresh; dispid 201;
    function New: SYSINT; dispid 202;
    function Edit: SYSINT; dispid 203;
    procedure Delete; dispid 204;
    function OpenCard(vID: SYSINT): SYSINT; dispid 209;
    function GetSubSystemsByID(vID: SYSINT): WideString; dispid 210;
    function GetTypeObjByID(vID: SYSINT): WideString; dispid 211;
    function GetMDObjByID(vID: SYSINT): WideString; dispid 212;
    procedure SaveToFile(var vFileName: WideString); dispid 213;
    function GetConditionsViewType: SYSINT; dispid 214;
    procedure SetConditionsViewType(vVal: SYSINT); dispid 215;
    function GetListViewType: SYSINT; dispid 216;
    procedure SetListViewType(vVal: SYSINT); dispid 217;
    function SelectToDoByID(var vID: SYSINT): SYSINT; dispid 218;
    function GetSelectedToDoID: SYSINT; dispid 219;
    function GetMaxListConditionsSize: SYSINT; dispid 220;
    procedure SetMaxListConditionsSize(var vVal: SYSINT); dispid 221;
    function GetMaxListChildToDoSize: SYSINT; dispid 222;
    procedure SetMaxListChildToDoSize(var vVal: SYSINT); dispid 223;
    procedure ListForObjectRefresh(var vID: SYSINT); dispid 224;
    procedure ToDoObjEdit; dispid 225;
    procedure ToDoObjDelete; dispid 226;
    function CreateChild(vParentID: SYSINT): SYSINT; dispid 227;
    function CopyByID(vID: SYSINT): SYSINT; dispid 228;
    function GetConditionText(const ForTree: WideString): WideString; dispid 229;
  end;

// *********************************************************************//
// DispIntf:  IToDoListEvents
// Flags:     (4096) Dispatchable
// GUID:      {9DE1A745-8058-463B-A8CF-F4572BD1B4E8}
// *********************************************************************//
  IToDoListEvents = dispinterface
    ['{9DE1A745-8058-463B-A8CF-F4572BD1B4E8}']
  end;

// *********************************************************************//
// Interface: IOptions
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {459394D7-4196-4740-82E8-F2DC5F2193AB}
// *********************************************************************//
  IOptions = interface(IDispatch)
    ['{459394D7-4196-4740-82E8-F2DC5F2193AB}']
    procedure Show; safecall;
    procedure SaveOptions(const vPath: WideString; const vName: WideString); safecall;
    procedure GetSavedOptions(const vPath: WideString; const vName: WideString); safecall;
    function GetSavedNames(const vPath: WideString): WideString; safecall;
    procedure DeleteSaved(const vPath: WideString; const vName: WideString); safecall;
    procedure SetPlacePanel(vID: SYSINT); safecall;
    function GetPlacePanel: SYSINT; safecall;
    procedure SetTuningSSListPlace(vID: SYSINT); safecall;
    function GetTuningSSListPlace: SYSINT; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOptionsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {459394D7-4196-4740-82E8-F2DC5F2193AB}
// *********************************************************************//
  IOptionsDisp = dispinterface
    ['{459394D7-4196-4740-82E8-F2DC5F2193AB}']
    procedure Show; dispid 201;
    procedure SaveOptions(const vPath: WideString; const vName: WideString); dispid 203;
    procedure GetSavedOptions(const vPath: WideString; const vName: WideString); dispid 204;
    function GetSavedNames(const vPath: WideString): WideString; dispid 202;
    procedure DeleteSaved(const vPath: WideString; const vName: WideString); dispid 205;
    procedure SetPlacePanel(vID: SYSINT); dispid 206;
    function GetPlacePanel: SYSINT; dispid 207;
    procedure SetTuningSSListPlace(vID: SYSINT); dispid 208;
    function GetTuningSSListPlace: SYSINT; dispid 209;
  end;

// *********************************************************************//
// DispIntf:  IOptionsEvents
// Flags:     (4096) Dispatchable
// GUID:      {6B5B4A7D-2341-497B-9D6A-DBFF625FDBCC}
// *********************************************************************//
  IOptionsEvents = dispinterface
    ['{6B5B4A7D-2341-497B-9D6A-DBFF625FDBCC}']
  end;

// *********************************************************************//
// Interface: IBookmarks
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5F8C5B17-C9A4-4CDF-A433-43B6EEE30BB3}
// *********************************************************************//
  IBookmarks = interface(IDispatch)
    ['{5F8C5B17-C9A4-4CDF-A433-43B6EEE30BB3}']
    function GetBookmarks: WideString; safecall;
    procedure Add; safecall;
    procedure Delete; safecall;
    procedure Clear; safecall;
    procedure Next; safecall;
    procedure Previos; safecall;
    procedure GoBookmark(var vName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IBookmarksDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5F8C5B17-C9A4-4CDF-A433-43B6EEE30BB3}
// *********************************************************************//
  IBookmarksDisp = dispinterface
    ['{5F8C5B17-C9A4-4CDF-A433-43B6EEE30BB3}']
    function GetBookmarks: WideString; dispid 201;
    procedure Add; dispid 202;
    procedure Delete; dispid 203;
    procedure Clear; dispid 204;
    procedure Next; dispid 205;
    procedure Previos; dispid 206;
    procedure GoBookmark(var vName: WideString); dispid 207;
  end;

// *********************************************************************//
// Interface: IObjectNote
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7CD12636-8E24-4A39-A190-27CC6B7CEE5F}
// *********************************************************************//
  IObjectNote = interface(IDispatch)
    ['{7CD12636-8E24-4A39-A190-27CC6B7CEE5F}']
    procedure OpenByID(vID: SYSINT); safecall;
    procedure DeleteByID(vID: SYSINT); safecall;
    function GetNoteTextByID(vID: SYSINT): WideString; safecall;
    procedure SetNoteTextByID(vID: SYSINT; const vVal: WideString); safecall;
    function HasNote(vID: SYSINT): SYSINT; safecall;
    procedure SaveToFile(vID: SYSINT; var vFileName: WideString); safecall;
    procedure LoadFromFile(vID: SYSINT; var vFileName: WideString); safecall;
    procedure OpenByRowID(var vID: SYSINT); safecall;
    procedure New; safecall;
  end;

// *********************************************************************//
// DispIntf:  IObjectNoteDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7CD12636-8E24-4A39-A190-27CC6B7CEE5F}
// *********************************************************************//
  IObjectNoteDisp = dispinterface
    ['{7CD12636-8E24-4A39-A190-27CC6B7CEE5F}']
    procedure OpenByID(vID: SYSINT); dispid 201;
    procedure DeleteByID(vID: SYSINT); dispid 202;
    function GetNoteTextByID(vID: SYSINT): WideString; dispid 203;
    procedure SetNoteTextByID(vID: SYSINT; const vVal: WideString); dispid 204;
    function HasNote(vID: SYSINT): SYSINT; dispid 205;
    procedure SaveToFile(vID: SYSINT; var vFileName: WideString); dispid 206;
    procedure LoadFromFile(vID: SYSINT; var vFileName: WideString); dispid 207;
    procedure OpenByRowID(var vID: SYSINT); dispid 208;
    procedure New; dispid 209;
  end;

// *********************************************************************//
// Interface: IObjectNoteList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7B4D4C4A-B310-4B53-89A2-45876695E681}
// *********************************************************************//
  IObjectNoteList = interface(IDispatch)
    ['{7B4D4C4A-B310-4B53-89A2-45876695E681}']
    procedure Refresh; safecall;
    function GetSelectedRowID: SYSINT; safecall;
    function SetSelectedRowID(vID: SYSINT): SYSINT; safecall;
    procedure SaveToFile(var vFileName: WideString); safecall;
    procedure DeleteByRowID(vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IObjectNoteListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7B4D4C4A-B310-4B53-89A2-45876695E681}
// *********************************************************************//
  IObjectNoteListDisp = dispinterface
    ['{7B4D4C4A-B310-4B53-89A2-45876695E681}']
    procedure Refresh; dispid 201;
    function GetSelectedRowID: SYSINT; dispid 202;
    function SetSelectedRowID(vID: SYSINT): SYSINT; dispid 203;
    procedure SaveToFile(var vFileName: WideString); dispid 204;
    procedure DeleteByRowID(vID: SYSINT); dispid 205;
  end;

// *********************************************************************//
// DispIntf:  IObjectNoteListEvents
// Flags:     (4096) Dispatchable
// GUID:      {4A8CE050-D96E-47D5-B1F5-CC29A7A5DE1C}
// *********************************************************************//
  IObjectNoteListEvents = dispinterface
    ['{4A8CE050-D96E-47D5-B1F5-CC29A7A5DE1C}']
  end;

// *********************************************************************//
// Interface: IRelises
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B6D7C70C-51C8-4662-9E19-8DC25B53E10E}
// *********************************************************************//
  IRelises = interface(IDispatch)
    ['{B6D7C70C-51C8-4662-9E19-8DC25B53E10E}']
    procedure Refresh; safecall;
    procedure Add; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
    function GetLinksByID(vID: SYSINT): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRelisesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B6D7C70C-51C8-4662-9E19-8DC25B53E10E}
// *********************************************************************//
  IRelisesDisp = dispinterface
    ['{B6D7C70C-51C8-4662-9E19-8DC25B53E10E}']
    procedure Refresh; dispid 201;
    procedure Add; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure OpenCard(var vID: SYSINT); dispid 205;
    function GetLinksByID(vID: SYSINT): WideString; dispid 206;
  end;

// *********************************************************************//
// DispIntf:  IRelisesEvents
// Flags:     (4096) Dispatchable
// GUID:      {A2D05A70-3537-4F0C-92EB-B249C31E7DD7}
// *********************************************************************//
  IRelisesEvents = dispinterface
    ['{A2D05A70-3537-4F0C-92EB-B249C31E7DD7}']
  end;

// *********************************************************************//
// Interface: IStatusList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C684C719-8BB0-4B9B-B624-406F9B9E0818}
// *********************************************************************//
  IStatusList = interface(IDispatch)
    ['{C684C719-8BB0-4B9B-B624-406F9B9E0818}']
    procedure Refresh; safecall;
    procedure Add; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IStatusListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C684C719-8BB0-4B9B-B624-406F9B9E0818}
// *********************************************************************//
  IStatusListDisp = dispinterface
    ['{C684C719-8BB0-4B9B-B624-406F9B9E0818}']
    procedure Refresh; dispid 201;
    procedure Add; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure OpenCard(var vID: SYSINT); dispid 205;
  end;

// *********************************************************************//
// Interface: ISubconfigs
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2D1B02FC-21E0-4F45-A628-AFB74C13F175}
// *********************************************************************//
  ISubconfigs = interface(IDispatch)
    ['{2D1B02FC-21E0-4F45-A628-AFB74C13F175}']
    procedure Refresh(vCfgID: SYSINT); safecall;
    procedure Add; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure Choice; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
    procedure SetCurrent; safecall;
    function GetLinksByID(vID: SYSINT): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISubconfigsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2D1B02FC-21E0-4F45-A628-AFB74C13F175}
// *********************************************************************//
  ISubconfigsDisp = dispinterface
    ['{2D1B02FC-21E0-4F45-A628-AFB74C13F175}']
    procedure Refresh(vCfgID: SYSINT); dispid 201;
    procedure Add; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure Choice; dispid 205;
    procedure OpenCard(var vID: SYSINT); dispid 206;
    procedure SetCurrent; dispid 207;
    function GetLinksByID(vID: SYSINT): WideString; dispid 209;
  end;

// *********************************************************************//
// Interface: IListUsers
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F7D485F5-7358-492B-B965-91521E9265FE}
// *********************************************************************//
  IListUsers = interface(IDispatch)
    ['{F7D485F5-7358-492B-B965-91521E9265FE}']
    procedure Refresh; safecall;
    function Add: SYSINT; safecall;
    function Edit: SYSINT; safecall;
    function Delete: SYSINT; safecall;
    procedure SetCurrentUser(var vType: SYSINT; var vVal: WideString); safecall;
    function GetCurrentUser(var vType: SYSINT): WideString; safecall;
    function OpenCard(var vID: SYSINT): SYSINT; safecall;
    function GetLinksByID(vID: SYSINT): WideString; safecall;
    function GetEmailByID(var vID: SYSINT): WideString; safecall;
    function GetUserNameByID(vID: SYSINT; vTypeID: SYSINT): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IListUsersDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F7D485F5-7358-492B-B965-91521E9265FE}
// *********************************************************************//
  IListUsersDisp = dispinterface
    ['{F7D485F5-7358-492B-B965-91521E9265FE}']
    procedure Refresh; dispid 201;
    function Add: SYSINT; dispid 202;
    function Edit: SYSINT; dispid 203;
    function Delete: SYSINT; dispid 204;
    procedure SetCurrentUser(var vType: SYSINT; var vVal: WideString); dispid 205;
    function GetCurrentUser(var vType: SYSINT): WideString; dispid 206;
    function OpenCard(var vID: SYSINT): SYSINT; dispid 207;
    function GetLinksByID(vID: SYSINT): WideString; dispid 208;
    function GetEmailByID(var vID: SYSINT): WideString; dispid 209;
    function GetUserNameByID(vID: SYSINT; vTypeID: SYSINT): WideString; dispid 210;
  end;

// *********************************************************************//
// Interface: IListCategoryes
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E814CC90-7779-4819-99D8-B42ACEC4C300}
// *********************************************************************//
  IListCategoryes = interface(IDispatch)
    ['{E814CC90-7779-4819-99D8-B42ACEC4C300}']
    procedure Refresh; safecall;
    procedure New; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IListCategoryesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E814CC90-7779-4819-99D8-B42ACEC4C300}
// *********************************************************************//
  IListCategoryesDisp = dispinterface
    ['{E814CC90-7779-4819-99D8-B42ACEC4C300}']
    procedure Refresh; dispid 201;
    procedure New; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure OpenCard(var vID: SYSINT); dispid 205;
  end;

// *********************************************************************//
// Interface: IListSeriousness
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {56978EAB-AD12-4487-9C35-46741E1A0702}
// *********************************************************************//
  IListSeriousness = interface(IDispatch)
    ['{56978EAB-AD12-4487-9C35-46741E1A0702}']
    procedure Refresh; safecall;
    procedure New; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IListSeriousnessDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {56978EAB-AD12-4487-9C35-46741E1A0702}
// *********************************************************************//
  IListSeriousnessDisp = dispinterface
    ['{56978EAB-AD12-4487-9C35-46741E1A0702}']
    procedure Refresh; dispid 201;
    procedure New; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure OpenCard(var vID: SYSINT); dispid 205;
  end;

// *********************************************************************//
// Interface: IToDoViewColumns
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02D092D6-4AE1-45A6-80EF-A7BDC8E317EF}
// *********************************************************************//
  IToDoViewColumns = interface(IDispatch)
    ['{02D092D6-4AE1-45A6-80EF-A7BDC8E317EF}']
    procedure Refresh; safecall;
    procedure New; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IToDoViewColumnsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02D092D6-4AE1-45A6-80EF-A7BDC8E317EF}
// *********************************************************************//
  IToDoViewColumnsDisp = dispinterface
    ['{02D092D6-4AE1-45A6-80EF-A7BDC8E317EF}']
    procedure Refresh; dispid 201;
    procedure New; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure OpenCard(var vID: SYSINT); dispid 205;
  end;

// *********************************************************************//
// Interface: IMDObjBlocks
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C2D5CB2D-0F99-46B5-AE8C-F75FAEBCA26A}
// *********************************************************************//
  IMDObjBlocks = interface(IDispatch)
    ['{C2D5CB2D-0F99-46B5-AE8C-F75FAEBCA26A}']
    function SetBlock(vMDObjID: SYSINT): SYSINT; safecall;
    procedure UnSetBlock(vMDObjID: SYSINT); safecall;
    function Get(vMDObjID: SYSINT; vTypeData: SYSINT): SYSINT; safecall;
    procedure OpenCard(vID: SYSINT; vIdType: SYSINT); safecall;
    function Delete: SYSINT; safecall;
    procedure Refresh; safecall;
    function Edit: SYSINT; safecall;
    procedure ShowBlocks(vVal: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMDObjBlocksDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C2D5CB2D-0F99-46B5-AE8C-F75FAEBCA26A}
// *********************************************************************//
  IMDObjBlocksDisp = dispinterface
    ['{C2D5CB2D-0F99-46B5-AE8C-F75FAEBCA26A}']
    function SetBlock(vMDObjID: SYSINT): SYSINT; dispid 201;
    procedure UnSetBlock(vMDObjID: SYSINT); dispid 202;
    function Get(vMDObjID: SYSINT; vTypeData: SYSINT): SYSINT; dispid 203;
    procedure OpenCard(vID: SYSINT; vIdType: SYSINT); dispid 204;
    function Delete: SYSINT; dispid 205;
    procedure Refresh; dispid 206;
    function Edit: SYSINT; dispid 207;
    procedure ShowBlocks(vVal: SYSINT); dispid 208;
  end;

// *********************************************************************//
// Interface: IDBChangesLog
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {86BF708D-4073-4D07-B020-53084D22DAC6}
// *********************************************************************//
  IDBChangesLog = interface(IDispatch)
    ['{86BF708D-4073-4D07-B020-53084D22DAC6}']
    procedure GetListByMDObj(vID: SYSINT); safecall;
    procedure Add; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure OpenCard(vID: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IDBChangesLogDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {86BF708D-4073-4D07-B020-53084D22DAC6}
// *********************************************************************//
  IDBChangesLogDisp = dispinterface
    ['{86BF708D-4073-4D07-B020-53084D22DAC6}']
    procedure GetListByMDObj(vID: SYSINT); dispid 201;
    procedure Add; dispid 202;
    procedure Edit; dispid 203;
    procedure Delete; dispid 204;
    procedure OpenCard(vID: SYSINT); dispid 205;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TArtbear_ActiveFormX
// Help String      : Artbear_ActiveFormX Control
// Default Interface: IArtbear_ActiveFormX
// Def. Intf. DISP? : No
// Event   Interface: IArtbear_ActiveFormXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TArtbear_ActiveFormXOnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TArtbear_ActiveFormX = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TArtbear_ActiveFormXOnKeyPress;
    FOnPaint: TNotifyEvent;
    FOnMDNodeDblClick: TNotifyEvent;
    FOnShow: TNotifyEvent;
    FOnMDNodeChange: TNotifyEvent;
    FOnMDNodeClick: TNotifyEvent;
    FOnToDoAdd: TNotifyEvent;
    FOnToDoEdit: TNotifyEvent;
    FOnToDoDelete: TNotifyEvent;
    FOnToDoRefresh: TNotifyEvent;
    FOnToDoFilterListChange: TNotifyEvent;
    FOnToDoFilterDoneChange: TNotifyEvent;
    FOnMDViewChange: TNotifyEvent;
    FOnMDSubSystemsListRefresh: TNotifyEvent;
    FOnMDTreeFilling: TNotifyEvent;
    FOnMDTreeSaveToFile: TNotifyEvent;
    FOnMDTreeDeleteErrors: TNotifyEvent;
    FOnSubSystemsListSelectAll: TNotifyEvent;
    FOnSubSystemsListUnSelectAll: TNotifyEvent;
    FOnSubSystemsListInvert: TNotifyEvent;
    FOnSubSystemsObjSelectAll: TNotifyEvent;
    FOnSubSystemsObjUnSelectAll: TNotifyEvent;
    FOnSubSystemsObjInvert: TNotifyEvent;
    FOnCfgSubSystemsRefresh: TNotifyEvent;
    FOnCfgSubSystemsAdd: TNotifyEvent;
    FOnCfgSubSystemsEdit: TNotifyEvent;
    FOnCfgSubSystemsDelete: TNotifyEvent;
    FOnCfgMDObjRefresh: TNotifyEvent;
    FOnCfgExtFrmRefresh: TNotifyEvent;
    FOnCfgExtFrmNewFolder: TNotifyEvent;
    FOnCfgExtFrmNewFile: TNotifyEvent;
    FOnCfgExtFrmEdit: TNotifyEvent;
    FOnCfgExtFrmDelete: TNotifyEvent;
    FOnConfigsRefresh: TNotifyEvent;
    FOnConfigsAdd: TNotifyEvent;
    FOnConfigsEdit: TNotifyEvent;
    FOnConfigsDelete: TNotifyEvent;
    FOnConfigsChoice: TNotifyEvent;
    FOnPageShowSubSystem: TNotifyEvent;
    FOnPageShowToDo: TNotifyEvent;
    FOnPageShowCfg: TNotifyEvent;
    FOnPageShowConfigs: TNotifyEvent;
    FOnPageShowProps: TNotifyEvent;
    FOnPageShowLinks: TNotifyEvent;
    FOnPageShowSubSystemObj: TNotifyEvent;
    FOnPageShowExplorer: TNotifyEvent;
    FOnPageShowSubSystemList: TNotifyEvent;
    FOnPageShowMDObjList: TNotifyEvent;
    FOnPageShowExtFrmsList: TNotifyEvent;
    FOnPageShowAvailableSubSystems: TNotifyEvent;
    FOnPageShowMDObjShow: TNotifyEvent;
    FOnToDoFilterUserChange: TNotifyEvent;
    FOnToDoFilterObjTypeChange: TNotifyEvent;
    FOnTemplatesListRefresh: TNotifyEvent;
    FOnTemplatesListAdd: TNotifyEvent;
    FOnTemplatesListEdit: TNotifyEvent;
    FOnTemplatesListDelete: TNotifyEvent;
    FOnTemplatesListChangeParent: TNotifyEvent;
    FOnTemplatesListNewFolder: TNotifyEvent;
    FOnLinksChoiceObj: TNotifyEvent;
    FOnShowBookmarks: TNotifyEvent;
    FOnMDBtnChoiceClick: TNotifyEvent;
    FOnSetSavedOptionsByName: TNotifyEvent;
    FOnSaveOptionsByName: TNotifyEvent;
    FOnTemplatesSetBuffer: TNotifyEvent;
    FOnNoteOpenCard: TNotifyEvent;
    FOnNoteDelete: TNotifyEvent;
    FOnNoteSaveToFile: TNotifyEvent;
    FOnNoteLoadFromFile: TNotifyEvent;
    FOnNoteRefresh: TNotifyEvent;
    FOnNoteListRefresh: TNotifyEvent;
    FOnNoteListOpen: TNotifyEvent;
    FOnNoteListDelete: TNotifyEvent;
    FOnNoteListSaveToFile: TNotifyEvent;
    FOnPageShowObjectNote: TNotifyEvent;
    FOnPageShowObjectNoteList: TNotifyEvent;
    FOnNoteListDblClick: TNotifyEvent;
    FOnTuningMDObjDblClick: TNotifyEvent;
    FOnTuningRelisesRefresh: TNotifyEvent;
    FOnTuningRelisesAdd: TNotifyEvent;
    FOnTuningRelisesEdit: TNotifyEvent;
    FOnTuningRelisesDelete: TNotifyEvent;
    FOnToDoCardGetObjectName: TNotifyEvent;
    FOnStatusListRefresh: TNotifyEvent;
    FOnStatusListAdd: TNotifyEvent;
    FOnStatusListEdit: TNotifyEvent;
    FOnStatusListDelete: TNotifyEvent;
    FOnToDoFilterStatusChange: TNotifyEvent;
    FOnToDoFilterReliseChange: TNotifyEvent;
    FOnToDoFilterConfigChange: TNotifyEvent;
    FOnToDoFilterChange: TNotifyEvent;
    FOnToDoFilterForReportChange: TNotifyEvent;
    FOnToDoFilterSubconfigChange: TNotifyEvent;
    FOnAviliableSubsystemsSubconfigChange: TNotifyEvent;
    FOnCfgSubSystemsSubconfigChange: TNotifyEvent;
    FOnTuningRelisesSubconfigChange: TNotifyEvent;
    FOnUsersListRefresh: TNotifyEvent;
    FOnUsersListNew: TNotifyEvent;
    FOnUsersListEdit: TNotifyEvent;
    FOnUsersListDelete: TNotifyEvent;
    FOnUsersListDblClick: TNotifyEvent;
    FOnUsersListChangeSubConfig: TNotifyEvent;
    FOnToDoFilterParentToDoChange: TNotifyEvent;
    FOnListCategoryesRefresh: TNotifyEvent;
    FOnListCategoryesNew: TNotifyEvent;
    FOnListCategoryesEdit: TNotifyEvent;
    FOnListCategoryesDelete: TNotifyEvent;
    FOnListSeriousnessRefresh: TNotifyEvent;
    FOnListSeriousnessNew: TNotifyEvent;
    FOnListSeriousnessEdit: TNotifyEvent;
    FOnListSeriousnessDelete: TNotifyEvent;
    FOnToDoListColsRefresh: TNotifyEvent;
    FOnToDoListColsNew: TNotifyEvent;
    FOnToDoListColsEdit: TNotifyEvent;
    FOnToDoListColsDelete: TNotifyEvent;
    FOnToDoObjRefresh: TNotifyEvent;
    FOnToDoObjEdit: TNotifyEvent;
    FOnToDoObjDelete: TNotifyEvent;
    FOnMDObjBlocksRefresh: TNotifyEvent;
    FOnMDObjBlocksEdit: TNotifyEvent;
    FOnMDObjBlocksDelete: TNotifyEvent;
    FOnMDObjBlocksSetBlock: TNotifyEvent;
    FOnMDObjBlocksUnSetBlock: TNotifyEvent;
    FOnDBChangesGetListByID: TNotifyEvent;
    FOnDBChangesAdd: TNotifyEvent;
    FOnDBChangesEdit: TNotifyEvent;
    FOnDBChangesDelete: TNotifyEvent;
    FOnToDoCopy: TNotifyEvent;
    FOnToDoCreateChild: TNotifyEvent;
    FOnNoteNew: TNotifyEvent;
    FIntf: IArtbear_ActiveFormX;
    function  GetControlInterface: IArtbear_ActiveFormX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetCurrentPage: WideString;
    function GetSQLConnectionString: WideString;
    function GetSpecialFolderPath(var SPFolder: WideString): WideString;
    function GetDBUserNames(var UsersListFile: WideString): WideString;
    function GetMDTree: IMDTree;
    function GetAvailableSubSystems: IAvailableSubSystems;
    function GetCfgList: ICfgList;
    function GetExtFrmsList: IExtFrmsList;
    function GetLinks: ILinks;
    function GetObjectClasses: IObjectClasses;
    function GetTemplates: ITemplates;
    function GetToDoList: IToDoList;
    function GetTuningMDObj: ITuningMDObj;
    function GetTuningSubSystemsList: ITuningSubSystemsList;
    function GetOptions: IOptions;
    function GetBookmarks: IBookmarks;
    function GetCurrentDBUserNames: WideString;
    function GetObjectNote: IObjectNote;
    procedure GoToSheet(const vSheet: WideString);
    function GetObjectNoteList: IObjectNoteList;
    function GetRelisesList: IRelises;
    function GetToDoObjName: WideString;
    function GetStatusList: IStatusList;
    function GetSubconfigsList: ISubconfigs;
    function GetUsersList: IListUsers;
    function GetListCategoryes: IListCategoryes;
    function GetListSeriousnes: IListSeriousness;
    function GetListToDoCols: IToDoViewColumns;
    procedure CloseDatabase;
    function GetListMDObjBlocks: IMDObjBlocks;
    function GetIDFromStr(const vStr: WideString): WideString;
    function GetDBChangeLog: DBChangesLog;
    function GetDataConnectionString: WideString;
    property  ControlInterface: IArtbear_ActiveFormX read GetControlInterface;
    property  DefaultInterface: IArtbear_ActiveFormX read GetControlInterface;
  published
    property Anchors;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TArtbear_ActiveFormXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnMDNodeDblClick: TNotifyEvent read FOnMDNodeDblClick write FOnMDNodeDblClick;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
    property OnMDNodeChange: TNotifyEvent read FOnMDNodeChange write FOnMDNodeChange;
    property OnMDNodeClick: TNotifyEvent read FOnMDNodeClick write FOnMDNodeClick;
    property OnToDoAdd: TNotifyEvent read FOnToDoAdd write FOnToDoAdd;
    property OnToDoEdit: TNotifyEvent read FOnToDoEdit write FOnToDoEdit;
    property OnToDoDelete: TNotifyEvent read FOnToDoDelete write FOnToDoDelete;
    property OnToDoRefresh: TNotifyEvent read FOnToDoRefresh write FOnToDoRefresh;
    property OnToDoFilterListChange: TNotifyEvent read FOnToDoFilterListChange write FOnToDoFilterListChange;
    property OnToDoFilterDoneChange: TNotifyEvent read FOnToDoFilterDoneChange write FOnToDoFilterDoneChange;
    property OnMDViewChange: TNotifyEvent read FOnMDViewChange write FOnMDViewChange;
    property OnMDSubSystemsListRefresh: TNotifyEvent read FOnMDSubSystemsListRefresh write FOnMDSubSystemsListRefresh;
    property OnMDTreeFilling: TNotifyEvent read FOnMDTreeFilling write FOnMDTreeFilling;
    property OnMDTreeSaveToFile: TNotifyEvent read FOnMDTreeSaveToFile write FOnMDTreeSaveToFile;
    property OnMDTreeDeleteErrors: TNotifyEvent read FOnMDTreeDeleteErrors write FOnMDTreeDeleteErrors;
    property OnSubSystemsListSelectAll: TNotifyEvent read FOnSubSystemsListSelectAll write FOnSubSystemsListSelectAll;
    property OnSubSystemsListUnSelectAll: TNotifyEvent read FOnSubSystemsListUnSelectAll write FOnSubSystemsListUnSelectAll;
    property OnSubSystemsListInvert: TNotifyEvent read FOnSubSystemsListInvert write FOnSubSystemsListInvert;
    property OnSubSystemsObjSelectAll: TNotifyEvent read FOnSubSystemsObjSelectAll write FOnSubSystemsObjSelectAll;
    property OnSubSystemsObjUnSelectAll: TNotifyEvent read FOnSubSystemsObjUnSelectAll write FOnSubSystemsObjUnSelectAll;
    property OnSubSystemsObjInvert: TNotifyEvent read FOnSubSystemsObjInvert write FOnSubSystemsObjInvert;
    property OnCfgSubSystemsRefresh: TNotifyEvent read FOnCfgSubSystemsRefresh write FOnCfgSubSystemsRefresh;
    property OnCfgSubSystemsAdd: TNotifyEvent read FOnCfgSubSystemsAdd write FOnCfgSubSystemsAdd;
    property OnCfgSubSystemsEdit: TNotifyEvent read FOnCfgSubSystemsEdit write FOnCfgSubSystemsEdit;
    property OnCfgSubSystemsDelete: TNotifyEvent read FOnCfgSubSystemsDelete write FOnCfgSubSystemsDelete;
    property OnCfgMDObjRefresh: TNotifyEvent read FOnCfgMDObjRefresh write FOnCfgMDObjRefresh;
    property OnCfgExtFrmRefresh: TNotifyEvent read FOnCfgExtFrmRefresh write FOnCfgExtFrmRefresh;
    property OnCfgExtFrmNewFolder: TNotifyEvent read FOnCfgExtFrmNewFolder write FOnCfgExtFrmNewFolder;
    property OnCfgExtFrmNewFile: TNotifyEvent read FOnCfgExtFrmNewFile write FOnCfgExtFrmNewFile;
    property OnCfgExtFrmEdit: TNotifyEvent read FOnCfgExtFrmEdit write FOnCfgExtFrmEdit;
    property OnCfgExtFrmDelete: TNotifyEvent read FOnCfgExtFrmDelete write FOnCfgExtFrmDelete;
    property OnConfigsRefresh: TNotifyEvent read FOnConfigsRefresh write FOnConfigsRefresh;
    property OnConfigsAdd: TNotifyEvent read FOnConfigsAdd write FOnConfigsAdd;
    property OnConfigsEdit: TNotifyEvent read FOnConfigsEdit write FOnConfigsEdit;
    property OnConfigsDelete: TNotifyEvent read FOnConfigsDelete write FOnConfigsDelete;
    property OnConfigsChoice: TNotifyEvent read FOnConfigsChoice write FOnConfigsChoice;
    property OnPageShowSubSystem: TNotifyEvent read FOnPageShowSubSystem write FOnPageShowSubSystem;
    property OnPageShowToDo: TNotifyEvent read FOnPageShowToDo write FOnPageShowToDo;
    property OnPageShowCfg: TNotifyEvent read FOnPageShowCfg write FOnPageShowCfg;
    property OnPageShowConfigs: TNotifyEvent read FOnPageShowConfigs write FOnPageShowConfigs;
    property OnPageShowProps: TNotifyEvent read FOnPageShowProps write FOnPageShowProps;
    property OnPageShowLinks: TNotifyEvent read FOnPageShowLinks write FOnPageShowLinks;
    property OnPageShowSubSystemObj: TNotifyEvent read FOnPageShowSubSystemObj write FOnPageShowSubSystemObj;
    property OnPageShowExplorer: TNotifyEvent read FOnPageShowExplorer write FOnPageShowExplorer;
    property OnPageShowSubSystemList: TNotifyEvent read FOnPageShowSubSystemList write FOnPageShowSubSystemList;
    property OnPageShowMDObjList: TNotifyEvent read FOnPageShowMDObjList write FOnPageShowMDObjList;
    property OnPageShowExtFrmsList: TNotifyEvent read FOnPageShowExtFrmsList write FOnPageShowExtFrmsList;
    property OnPageShowAvailableSubSystems: TNotifyEvent read FOnPageShowAvailableSubSystems write FOnPageShowAvailableSubSystems;
    property OnPageShowMDObjShow: TNotifyEvent read FOnPageShowMDObjShow write FOnPageShowMDObjShow;
    property OnToDoFilterUserChange: TNotifyEvent read FOnToDoFilterUserChange write FOnToDoFilterUserChange;
    property OnToDoFilterObjTypeChange: TNotifyEvent read FOnToDoFilterObjTypeChange write FOnToDoFilterObjTypeChange;
    property OnTemplatesListRefresh: TNotifyEvent read FOnTemplatesListRefresh write FOnTemplatesListRefresh;
    property OnTemplatesListAdd: TNotifyEvent read FOnTemplatesListAdd write FOnTemplatesListAdd;
    property OnTemplatesListEdit: TNotifyEvent read FOnTemplatesListEdit write FOnTemplatesListEdit;
    property OnTemplatesListDelete: TNotifyEvent read FOnTemplatesListDelete write FOnTemplatesListDelete;
    property OnTemplatesListChangeParent: TNotifyEvent read FOnTemplatesListChangeParent write FOnTemplatesListChangeParent;
    property OnTemplatesListNewFolder: TNotifyEvent read FOnTemplatesListNewFolder write FOnTemplatesListNewFolder;
    property OnLinksChoiceObj: TNotifyEvent read FOnLinksChoiceObj write FOnLinksChoiceObj;
    property OnShowBookmarks: TNotifyEvent read FOnShowBookmarks write FOnShowBookmarks;
    property OnMDBtnChoiceClick: TNotifyEvent read FOnMDBtnChoiceClick write FOnMDBtnChoiceClick;
    property OnSetSavedOptionsByName: TNotifyEvent read FOnSetSavedOptionsByName write FOnSetSavedOptionsByName;
    property OnSaveOptionsByName: TNotifyEvent read FOnSaveOptionsByName write FOnSaveOptionsByName;
    property OnTemplatesSetBuffer: TNotifyEvent read FOnTemplatesSetBuffer write FOnTemplatesSetBuffer;
    property OnNoteOpenCard: TNotifyEvent read FOnNoteOpenCard write FOnNoteOpenCard;
    property OnNoteDelete: TNotifyEvent read FOnNoteDelete write FOnNoteDelete;
    property OnNoteSaveToFile: TNotifyEvent read FOnNoteSaveToFile write FOnNoteSaveToFile;
    property OnNoteLoadFromFile: TNotifyEvent read FOnNoteLoadFromFile write FOnNoteLoadFromFile;
    property OnNoteRefresh: TNotifyEvent read FOnNoteRefresh write FOnNoteRefresh;
    property OnNoteListRefresh: TNotifyEvent read FOnNoteListRefresh write FOnNoteListRefresh;
    property OnNoteListOpen: TNotifyEvent read FOnNoteListOpen write FOnNoteListOpen;
    property OnNoteListDelete: TNotifyEvent read FOnNoteListDelete write FOnNoteListDelete;
    property OnNoteListSaveToFile: TNotifyEvent read FOnNoteListSaveToFile write FOnNoteListSaveToFile;
    property OnPageShowObjectNote: TNotifyEvent read FOnPageShowObjectNote write FOnPageShowObjectNote;
    property OnPageShowObjectNoteList: TNotifyEvent read FOnPageShowObjectNoteList write FOnPageShowObjectNoteList;
    property OnNoteListDblClick: TNotifyEvent read FOnNoteListDblClick write FOnNoteListDblClick;
    property OnTuningMDObjDblClick: TNotifyEvent read FOnTuningMDObjDblClick write FOnTuningMDObjDblClick;
    property OnTuningRelisesRefresh: TNotifyEvent read FOnTuningRelisesRefresh write FOnTuningRelisesRefresh;
    property OnTuningRelisesAdd: TNotifyEvent read FOnTuningRelisesAdd write FOnTuningRelisesAdd;
    property OnTuningRelisesEdit: TNotifyEvent read FOnTuningRelisesEdit write FOnTuningRelisesEdit;
    property OnTuningRelisesDelete: TNotifyEvent read FOnTuningRelisesDelete write FOnTuningRelisesDelete;
    property OnToDoCardGetObjectName: TNotifyEvent read FOnToDoCardGetObjectName write FOnToDoCardGetObjectName;
    property OnStatusListRefresh: TNotifyEvent read FOnStatusListRefresh write FOnStatusListRefresh;
    property OnStatusListAdd: TNotifyEvent read FOnStatusListAdd write FOnStatusListAdd;
    property OnStatusListEdit: TNotifyEvent read FOnStatusListEdit write FOnStatusListEdit;
    property OnStatusListDelete: TNotifyEvent read FOnStatusListDelete write FOnStatusListDelete;
    property OnToDoFilterStatusChange: TNotifyEvent read FOnToDoFilterStatusChange write FOnToDoFilterStatusChange;
    property OnToDoFilterReliseChange: TNotifyEvent read FOnToDoFilterReliseChange write FOnToDoFilterReliseChange;
    property OnToDoFilterConfigChange: TNotifyEvent read FOnToDoFilterConfigChange write FOnToDoFilterConfigChange;
    property OnToDoFilterChange: TNotifyEvent read FOnToDoFilterChange write FOnToDoFilterChange;
    property OnToDoFilterForReportChange: TNotifyEvent read FOnToDoFilterForReportChange write FOnToDoFilterForReportChange;
    property OnToDoFilterSubconfigChange: TNotifyEvent read FOnToDoFilterSubconfigChange write FOnToDoFilterSubconfigChange;
    property OnAviliableSubsystemsSubconfigChange: TNotifyEvent read FOnAviliableSubsystemsSubconfigChange write FOnAviliableSubsystemsSubconfigChange;
    property OnCfgSubSystemsSubconfigChange: TNotifyEvent read FOnCfgSubSystemsSubconfigChange write FOnCfgSubSystemsSubconfigChange;
    property OnTuningRelisesSubconfigChange: TNotifyEvent read FOnTuningRelisesSubconfigChange write FOnTuningRelisesSubconfigChange;
    property OnUsersListRefresh: TNotifyEvent read FOnUsersListRefresh write FOnUsersListRefresh;
    property OnUsersListNew: TNotifyEvent read FOnUsersListNew write FOnUsersListNew;
    property OnUsersListEdit: TNotifyEvent read FOnUsersListEdit write FOnUsersListEdit;
    property OnUsersListDelete: TNotifyEvent read FOnUsersListDelete write FOnUsersListDelete;
    property OnUsersListDblClick: TNotifyEvent read FOnUsersListDblClick write FOnUsersListDblClick;
    property OnUsersListChangeSubConfig: TNotifyEvent read FOnUsersListChangeSubConfig write FOnUsersListChangeSubConfig;
    property OnToDoFilterParentToDoChange: TNotifyEvent read FOnToDoFilterParentToDoChange write FOnToDoFilterParentToDoChange;
    property OnListCategoryesRefresh: TNotifyEvent read FOnListCategoryesRefresh write FOnListCategoryesRefresh;
    property OnListCategoryesNew: TNotifyEvent read FOnListCategoryesNew write FOnListCategoryesNew;
    property OnListCategoryesEdit: TNotifyEvent read FOnListCategoryesEdit write FOnListCategoryesEdit;
    property OnListCategoryesDelete: TNotifyEvent read FOnListCategoryesDelete write FOnListCategoryesDelete;
    property OnListSeriousnessRefresh: TNotifyEvent read FOnListSeriousnessRefresh write FOnListSeriousnessRefresh;
    property OnListSeriousnessNew: TNotifyEvent read FOnListSeriousnessNew write FOnListSeriousnessNew;
    property OnListSeriousnessEdit: TNotifyEvent read FOnListSeriousnessEdit write FOnListSeriousnessEdit;
    property OnListSeriousnessDelete: TNotifyEvent read FOnListSeriousnessDelete write FOnListSeriousnessDelete;
    property OnToDoListColsRefresh: TNotifyEvent read FOnToDoListColsRefresh write FOnToDoListColsRefresh;
    property OnToDoListColsNew: TNotifyEvent read FOnToDoListColsNew write FOnToDoListColsNew;
    property OnToDoListColsEdit: TNotifyEvent read FOnToDoListColsEdit write FOnToDoListColsEdit;
    property OnToDoListColsDelete: TNotifyEvent read FOnToDoListColsDelete write FOnToDoListColsDelete;
    property OnToDoObjRefresh: TNotifyEvent read FOnToDoObjRefresh write FOnToDoObjRefresh;
    property OnToDoObjEdit: TNotifyEvent read FOnToDoObjEdit write FOnToDoObjEdit;
    property OnToDoObjDelete: TNotifyEvent read FOnToDoObjDelete write FOnToDoObjDelete;
    property OnMDObjBlocksRefresh: TNotifyEvent read FOnMDObjBlocksRefresh write FOnMDObjBlocksRefresh;
    property OnMDObjBlocksEdit: TNotifyEvent read FOnMDObjBlocksEdit write FOnMDObjBlocksEdit;
    property OnMDObjBlocksDelete: TNotifyEvent read FOnMDObjBlocksDelete write FOnMDObjBlocksDelete;
    property OnMDObjBlocksSetBlock: TNotifyEvent read FOnMDObjBlocksSetBlock write FOnMDObjBlocksSetBlock;
    property OnMDObjBlocksUnSetBlock: TNotifyEvent read FOnMDObjBlocksUnSetBlock write FOnMDObjBlocksUnSetBlock;
    property OnDBChangesGetListByID: TNotifyEvent read FOnDBChangesGetListByID write FOnDBChangesGetListByID;
    property OnDBChangesAdd: TNotifyEvent read FOnDBChangesAdd write FOnDBChangesAdd;
    property OnDBChangesEdit: TNotifyEvent read FOnDBChangesEdit write FOnDBChangesEdit;
    property OnDBChangesDelete: TNotifyEvent read FOnDBChangesDelete write FOnDBChangesDelete;
    property OnToDoCopy: TNotifyEvent read FOnToDoCopy write FOnToDoCopy;
    property OnToDoCreateChild: TNotifyEvent read FOnToDoCreateChild write FOnToDoCreateChild;
    property OnNoteNew: TNotifyEvent read FOnNoteNew write FOnNoteNew;
  end;

// *********************************************************************//
// The Class CoMDTree provides a Create and CreateRemote method to          
// create instances of the default interface IMDTree exposed by              
// the CoClass MDTree. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMDTree = class
    class function Create: IMDTree;
    class function CreateRemote(const MachineName: string): IMDTree;
  end;

// *********************************************************************//
// The Class CoAvailableSubSystems provides a Create and CreateRemote method to          
// create instances of the default interface IAvailableSubSystems exposed by              
// the CoClass AvailableSubSystems. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAvailableSubSystems = class
    class function Create: IAvailableSubSystems;
    class function CreateRemote(const MachineName: string): IAvailableSubSystems;
  end;

// *********************************************************************//
// The Class CoObjectClasses provides a Create and CreateRemote method to          
// create instances of the default interface IObjectClasses exposed by              
// the CoClass ObjectClasses. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjectClasses = class
    class function Create: IObjectClasses;
    class function CreateRemote(const MachineName: string): IObjectClasses;
  end;

// *********************************************************************//
// The Class CoCfgList provides a Create and CreateRemote method to          
// create instances of the default interface ICfgList exposed by              
// the CoClass CfgList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCfgList = class
    class function Create: ICfgList;
    class function CreateRemote(const MachineName: string): ICfgList;
  end;

// *********************************************************************//
// The Class CoTuningMDObj provides a Create and CreateRemote method to          
// create instances of the default interface ITuningMDObj exposed by              
// the CoClass TuningMDObj. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTuningMDObj = class
    class function Create: ITuningMDObj;
    class function CreateRemote(const MachineName: string): ITuningMDObj;
  end;

// *********************************************************************//
// The Class CoTuningSubSystemsList provides a Create and CreateRemote method to          
// create instances of the default interface ITuningSubSystemsList exposed by              
// the CoClass TuningSubSystemsList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTuningSubSystemsList = class
    class function Create: ITuningSubSystemsList;
    class function CreateRemote(const MachineName: string): ITuningSubSystemsList;
  end;

// *********************************************************************//
// The Class CoExtFrmsList provides a Create and CreateRemote method to          
// create instances of the default interface IExtFrmsList exposed by              
// the CoClass ExtFrmsList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoExtFrmsList = class
    class function Create: IExtFrmsList;
    class function CreateRemote(const MachineName: string): IExtFrmsList;
  end;

// *********************************************************************//
// The Class CoLinks provides a Create and CreateRemote method to          
// create instances of the default interface ILinks exposed by              
// the CoClass Links. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLinks = class
    class function Create: ILinks;
    class function CreateRemote(const MachineName: string): ILinks;
  end;

// *********************************************************************//
// The Class CoTemplates provides a Create and CreateRemote method to          
// create instances of the default interface ITemplates exposed by              
// the CoClass Templates. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTemplates = class
    class function Create: ITemplates;
    class function CreateRemote(const MachineName: string): ITemplates;
  end;

// *********************************************************************//
// The Class CoToDoList provides a Create and CreateRemote method to          
// create instances of the default interface IToDoList exposed by              
// the CoClass ToDoList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoToDoList = class
    class function Create: IToDoList;
    class function CreateRemote(const MachineName: string): IToDoList;
  end;

// *********************************************************************//
// The Class CoOptions provides a Create and CreateRemote method to          
// create instances of the default interface IOptions exposed by              
// the CoClass Options. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOptions = class
    class function Create: IOptions;
    class function CreateRemote(const MachineName: string): IOptions;
  end;

// *********************************************************************//
// The Class CoBookmarks provides a Create and CreateRemote method to          
// create instances of the default interface IBookmarks exposed by              
// the CoClass Bookmarks. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBookmarks = class
    class function Create: IBookmarks;
    class function CreateRemote(const MachineName: string): IBookmarks;
  end;

// *********************************************************************//
// The Class CoObjectNote provides a Create and CreateRemote method to          
// create instances of the default interface IObjectNote exposed by              
// the CoClass ObjectNote. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjectNote = class
    class function Create: IObjectNote;
    class function CreateRemote(const MachineName: string): IObjectNote;
  end;

// *********************************************************************//
// The Class CoObjectNoteList provides a Create and CreateRemote method to          
// create instances of the default interface IObjectNoteList exposed by              
// the CoClass ObjectNoteList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjectNoteList = class
    class function Create: IObjectNoteList;
    class function CreateRemote(const MachineName: string): IObjectNoteList;
  end;

// *********************************************************************//
// The Class CoRelises provides a Create and CreateRemote method to          
// create instances of the default interface IRelises exposed by              
// the CoClass Relises. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRelises = class
    class function Create: IRelises;
    class function CreateRemote(const MachineName: string): IRelises;
  end;

// *********************************************************************//
// The Class CoStatusList provides a Create and CreateRemote method to          
// create instances of the default interface IStatusList exposed by              
// the CoClass StatusList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoStatusList = class
    class function Create: IStatusList;
    class function CreateRemote(const MachineName: string): IStatusList;
  end;

// *********************************************************************//
// The Class CoSubconfigs provides a Create and CreateRemote method to          
// create instances of the default interface ISubconfigs exposed by              
// the CoClass Subconfigs. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSubconfigs = class
    class function Create: ISubconfigs;
    class function CreateRemote(const MachineName: string): ISubconfigs;
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

// *********************************************************************//
// The Class CoListCategoryes provides a Create and CreateRemote method to          
// create instances of the default interface IListCategoryes exposed by              
// the CoClass ListCategoryes. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoListCategoryes = class
    class function Create: IListCategoryes;
    class function CreateRemote(const MachineName: string): IListCategoryes;
  end;

// *********************************************************************//
// The Class CoListSeriousness provides a Create and CreateRemote method to          
// create instances of the default interface IListSeriousness exposed by              
// the CoClass ListSeriousness. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoListSeriousness = class
    class function Create: IListSeriousness;
    class function CreateRemote(const MachineName: string): IListSeriousness;
  end;

// *********************************************************************//
// The Class CoToDoViewColumns provides a Create and CreateRemote method to          
// create instances of the default interface IToDoViewColumns exposed by              
// the CoClass ToDoViewColumns. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoToDoViewColumns = class
    class function Create: IToDoViewColumns;
    class function CreateRemote(const MachineName: string): IToDoViewColumns;
  end;

// *********************************************************************//
// The Class CoMDObjBlocks provides a Create and CreateRemote method to          
// create instances of the default interface IMDObjBlocks exposed by              
// the CoClass MDObjBlocks. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMDObjBlocks = class
    class function Create: IMDObjBlocks;
    class function CreateRemote(const MachineName: string): IMDObjBlocks;
  end;

// *********************************************************************//
// The Class CoDBChangesLog provides a Create and CreateRemote method to          
// create instances of the default interface IDBChangesLog exposed by              
// the CoClass DBChangesLog. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDBChangesLog = class
    class function Create: IDBChangesLog;
    class function CreateRemote(const MachineName: string): IDBChangesLog;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TArtbear_ActiveFormX.InitControlData;
const
  CEventDispIDs: array [0..135] of DWORD = (
    $00000001, $00000002, $00000003, $00000005, $00000006, $00000007,
    $0000000B, $00000010, $00000011, $000000C9, $000000CA, $000000CB,
    $000000CC, $000000CD, $000000CE, $000000CF, $000000D0, $000000D1,
    $000000D2, $000000D3, $000000D4, $000000D5, $000000D6, $000000D7,
    $000000D8, $000000D9, $000000DA, $000000DB, $000000DC, $000000DD,
    $000000DE, $000000DF, $000000E0, $000000E1, $000000E2, $000000E3,
    $000000E4, $000000E5, $000000E6, $000000E7, $000000E8, $000000E9,
    $000000EA, $000000EB, $000000EC, $000000ED, $000000EE, $000000EF,
    $000000F0, $000000F1, $000000F2, $000000F3, $000000F4, $000000F5,
    $000000F6, $000000F7, $000000F8, $000000F9, $000000FA, $000000FB,
    $000000FC, $000000FD, $000000FE, $000000FF, $00000100, $00000101,
    $00000102, $00000103, $00000104, $00000105, $00000106, $00000107,
    $00000108, $00000109, $0000010A, $0000010B, $0000010C, $0000010D,
    $0000010E, $0000010F, $00000110, $00000111, $00000112, $00000113,
    $00000114, $00000115, $00000116, $00000117, $00000118, $00000119,
    $0000011A, $0000011B, $0000011C, $0000011D, $0000011E, $0000011F,
    $00000120, $00000121, $00000122, $00000123, $00000124, $00000125,
    $00000126, $00000127, $00000128, $00000129, $0000012A, $0000012B,
    $0000012C, $0000012D, $0000012E, $0000012F, $00000130, $00000131,
    $00000132, $00000133, $00000134, $00000135, $00000136, $00000137,
    $00000138, $00000139, $0000013A, $0000013B, $0000013C, $0000013D,
    $0000013E, $0000013F, $00000140, $00000141, $00000142, $00000143,
    $00000144, $00000145, $00000146, $00000147);
  CControlData: TControlData2 = (
    ClassID: '{E7E1848E-EDD5-428D-8160-D7EDFB08DCB5}';
    EventIID: '{5315EC84-1C4E-4DC3-9AAE-FB20F9AD65E4}';
    EventCount: 136;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$00000000*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TArtbear_ActiveFormX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IArtbear_ActiveFormX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TArtbear_ActiveFormX.GetControlInterface: IArtbear_ActiveFormX;
begin
  CreateControl;
  Result := FIntf;
end;

function TArtbear_ActiveFormX.GetCurrentPage: WideString;
begin
  Result := DefaultInterface.GetCurrentPage;
end;

function TArtbear_ActiveFormX.GetSQLConnectionString: WideString;
begin
  Result := DefaultInterface.GetSQLConnectionString;
end;

function TArtbear_ActiveFormX.GetSpecialFolderPath(var SPFolder: WideString): WideString;
begin
  Result := DefaultInterface.GetSpecialFolderPath(SPFolder);
end;

function TArtbear_ActiveFormX.GetDBUserNames(var UsersListFile: WideString): WideString;
begin
  Result := DefaultInterface.GetDBUserNames(UsersListFile);
end;

function TArtbear_ActiveFormX.GetMDTree: IMDTree;
begin
  Result := DefaultInterface.GetMDTree;
end;

function TArtbear_ActiveFormX.GetAvailableSubSystems: IAvailableSubSystems;
begin
  Result := DefaultInterface.GetAvailableSubSystems;
end;

function TArtbear_ActiveFormX.GetCfgList: ICfgList;
begin
  Result := DefaultInterface.GetCfgList;
end;

function TArtbear_ActiveFormX.GetExtFrmsList: IExtFrmsList;
begin
  Result := DefaultInterface.GetExtFrmsList;
end;

function TArtbear_ActiveFormX.GetLinks: ILinks;
begin
  Result := DefaultInterface.GetLinks;
end;

function TArtbear_ActiveFormX.GetObjectClasses: IObjectClasses;
begin
  Result := DefaultInterface.GetObjectClasses;
end;

function TArtbear_ActiveFormX.GetTemplates: ITemplates;
begin
  Result := DefaultInterface.GetTemplates;
end;

function TArtbear_ActiveFormX.GetToDoList: IToDoList;
begin
  Result := DefaultInterface.GetToDoList;
end;

function TArtbear_ActiveFormX.GetTuningMDObj: ITuningMDObj;
begin
  Result := DefaultInterface.GetTuningMDObj;
end;

function TArtbear_ActiveFormX.GetTuningSubSystemsList: ITuningSubSystemsList;
begin
  Result := DefaultInterface.GetTuningSubSystemsList;
end;

function TArtbear_ActiveFormX.GetOptions: IOptions;
begin
  Result := DefaultInterface.GetOptions;
end;

function TArtbear_ActiveFormX.GetBookmarks: IBookmarks;
begin
  Result := DefaultInterface.GetBookmarks;
end;

function TArtbear_ActiveFormX.GetCurrentDBUserNames: WideString;
begin
  Result := DefaultInterface.GetCurrentDBUserNames;
end;

function TArtbear_ActiveFormX.GetObjectNote: IObjectNote;
begin
  Result := DefaultInterface.GetObjectNote;
end;

procedure TArtbear_ActiveFormX.GoToSheet(const vSheet: WideString);
begin
  DefaultInterface.GoToSheet(vSheet);
end;

function TArtbear_ActiveFormX.GetObjectNoteList: IObjectNoteList;
begin
  Result := DefaultInterface.GetObjectNoteList;
end;

function TArtbear_ActiveFormX.GetRelisesList: IRelises;
begin
  Result := DefaultInterface.GetRelisesList;
end;

function TArtbear_ActiveFormX.GetToDoObjName: WideString;
begin
  Result := DefaultInterface.GetToDoObjName;
end;

function TArtbear_ActiveFormX.GetStatusList: IStatusList;
begin
  Result := DefaultInterface.GetStatusList;
end;

function TArtbear_ActiveFormX.GetSubconfigsList: ISubconfigs;
begin
  Result := DefaultInterface.GetSubconfigsList;
end;

function TArtbear_ActiveFormX.GetUsersList: IListUsers;
begin
  Result := DefaultInterface.GetUsersList;
end;

function TArtbear_ActiveFormX.GetListCategoryes: IListCategoryes;
begin
  Result := DefaultInterface.GetListCategoryes;
end;

function TArtbear_ActiveFormX.GetListSeriousnes: IListSeriousness;
begin
  Result := DefaultInterface.GetListSeriousnes;
end;

function TArtbear_ActiveFormX.GetListToDoCols: IToDoViewColumns;
begin
  Result := DefaultInterface.GetListToDoCols;
end;

procedure TArtbear_ActiveFormX.CloseDatabase;
begin
  DefaultInterface.CloseDatabase;
end;

function TArtbear_ActiveFormX.GetListMDObjBlocks: IMDObjBlocks;
begin
  Result := DefaultInterface.GetListMDObjBlocks;
end;

function TArtbear_ActiveFormX.GetIDFromStr(const vStr: WideString): WideString;
begin
  Result := DefaultInterface.GetIDFromStr(vStr);
end;

function TArtbear_ActiveFormX.GetDBChangeLog: DBChangesLog;
begin
  Result := DefaultInterface.GetDBChangeLog;
end;

function TArtbear_ActiveFormX.GetDataConnectionString: WideString;
begin
  Result := DefaultInterface.GetDataConnectionString;
end;

class function CoMDTree.Create: IMDTree;
begin
  Result := CreateComObject(CLASS_MDTree) as IMDTree;
end;

class function CoMDTree.CreateRemote(const MachineName: string): IMDTree;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MDTree) as IMDTree;
end;

class function CoAvailableSubSystems.Create: IAvailableSubSystems;
begin
  Result := CreateComObject(CLASS_AvailableSubSystems) as IAvailableSubSystems;
end;

class function CoAvailableSubSystems.CreateRemote(const MachineName: string): IAvailableSubSystems;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AvailableSubSystems) as IAvailableSubSystems;
end;

class function CoObjectClasses.Create: IObjectClasses;
begin
  Result := CreateComObject(CLASS_ObjectClasses) as IObjectClasses;
end;

class function CoObjectClasses.CreateRemote(const MachineName: string): IObjectClasses;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjectClasses) as IObjectClasses;
end;

class function CoCfgList.Create: ICfgList;
begin
  Result := CreateComObject(CLASS_CfgList) as ICfgList;
end;

class function CoCfgList.CreateRemote(const MachineName: string): ICfgList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CfgList) as ICfgList;
end;

class function CoTuningMDObj.Create: ITuningMDObj;
begin
  Result := CreateComObject(CLASS_TuningMDObj) as ITuningMDObj;
end;

class function CoTuningMDObj.CreateRemote(const MachineName: string): ITuningMDObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TuningMDObj) as ITuningMDObj;
end;

class function CoTuningSubSystemsList.Create: ITuningSubSystemsList;
begin
  Result := CreateComObject(CLASS_TuningSubSystemsList) as ITuningSubSystemsList;
end;

class function CoTuningSubSystemsList.CreateRemote(const MachineName: string): ITuningSubSystemsList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TuningSubSystemsList) as ITuningSubSystemsList;
end;

class function CoExtFrmsList.Create: IExtFrmsList;
begin
  Result := CreateComObject(CLASS_ExtFrmsList) as IExtFrmsList;
end;

class function CoExtFrmsList.CreateRemote(const MachineName: string): IExtFrmsList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ExtFrmsList) as IExtFrmsList;
end;

class function CoLinks.Create: ILinks;
begin
  Result := CreateComObject(CLASS_Links) as ILinks;
end;

class function CoLinks.CreateRemote(const MachineName: string): ILinks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Links) as ILinks;
end;

class function CoTemplates.Create: ITemplates;
begin
  Result := CreateComObject(CLASS_Templates) as ITemplates;
end;

class function CoTemplates.CreateRemote(const MachineName: string): ITemplates;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Templates) as ITemplates;
end;

class function CoToDoList.Create: IToDoList;
begin
  Result := CreateComObject(CLASS_ToDoList) as IToDoList;
end;

class function CoToDoList.CreateRemote(const MachineName: string): IToDoList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ToDoList) as IToDoList;
end;

class function CoOptions.Create: IOptions;
begin
  Result := CreateComObject(CLASS_Options) as IOptions;
end;

class function CoOptions.CreateRemote(const MachineName: string): IOptions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Options) as IOptions;
end;

class function CoBookmarks.Create: IBookmarks;
begin
  Result := CreateComObject(CLASS_Bookmarks) as IBookmarks;
end;

class function CoBookmarks.CreateRemote(const MachineName: string): IBookmarks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Bookmarks) as IBookmarks;
end;

class function CoObjectNote.Create: IObjectNote;
begin
  Result := CreateComObject(CLASS_ObjectNote) as IObjectNote;
end;

class function CoObjectNote.CreateRemote(const MachineName: string): IObjectNote;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjectNote) as IObjectNote;
end;

class function CoObjectNoteList.Create: IObjectNoteList;
begin
  Result := CreateComObject(CLASS_ObjectNoteList) as IObjectNoteList;
end;

class function CoObjectNoteList.CreateRemote(const MachineName: string): IObjectNoteList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjectNoteList) as IObjectNoteList;
end;

class function CoRelises.Create: IRelises;
begin
  Result := CreateComObject(CLASS_Relises) as IRelises;
end;

class function CoRelises.CreateRemote(const MachineName: string): IRelises;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Relises) as IRelises;
end;

class function CoStatusList.Create: IStatusList;
begin
  Result := CreateComObject(CLASS_StatusList) as IStatusList;
end;

class function CoStatusList.CreateRemote(const MachineName: string): IStatusList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_StatusList) as IStatusList;
end;

class function CoSubconfigs.Create: ISubconfigs;
begin
  Result := CreateComObject(CLASS_Subconfigs) as ISubconfigs;
end;

class function CoSubconfigs.CreateRemote(const MachineName: string): ISubconfigs;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Subconfigs) as ISubconfigs;
end;

class function CoListUsers.Create: IListUsers;
begin
  Result := CreateComObject(CLASS_ListUsers) as IListUsers;
end;

class function CoListUsers.CreateRemote(const MachineName: string): IListUsers;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ListUsers) as IListUsers;
end;

class function CoListCategoryes.Create: IListCategoryes;
begin
  Result := CreateComObject(CLASS_ListCategoryes) as IListCategoryes;
end;

class function CoListCategoryes.CreateRemote(const MachineName: string): IListCategoryes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ListCategoryes) as IListCategoryes;
end;

class function CoListSeriousness.Create: IListSeriousness;
begin
  Result := CreateComObject(CLASS_ListSeriousness) as IListSeriousness;
end;

class function CoListSeriousness.CreateRemote(const MachineName: string): IListSeriousness;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ListSeriousness) as IListSeriousness;
end;

class function CoToDoViewColumns.Create: IToDoViewColumns;
begin
  Result := CreateComObject(CLASS_ToDoViewColumns) as IToDoViewColumns;
end;

class function CoToDoViewColumns.CreateRemote(const MachineName: string): IToDoViewColumns;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ToDoViewColumns) as IToDoViewColumns;
end;

class function CoMDObjBlocks.Create: IMDObjBlocks;
begin
  Result := CreateComObject(CLASS_MDObjBlocks) as IMDObjBlocks;
end;

class function CoMDObjBlocks.CreateRemote(const MachineName: string): IMDObjBlocks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MDObjBlocks) as IMDObjBlocks;
end;

class function CoDBChangesLog.Create: IDBChangesLog;
begin
  Result := CreateComObject(CLASS_DBChangesLog) as IDBChangesLog;
end;

class function CoDBChangesLog.CreateRemote(const MachineName: string): IDBChangesLog;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DBChangesLog) as IDBChangesLog;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TArtbear_ActiveFormX]);
end;

end.
