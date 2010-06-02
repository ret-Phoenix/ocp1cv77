unit FormSubSystemsMain;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, ActiveX,
  AxCtrls, OpenConf_TLB, ExtCtrls, ComCtrls, ToolWin, SubSystems_TLB,
  ImgList, DB, ADODB, Grids, ValEdit, StdCtrls, Variants, Commctrl, Menus,
  ActnList, ShellCtrls, CompDoc, Registry, ComObj, Clipbrd, treelist;

const
  ConstPluginName = 'Подсистемы';
  DDGData = '1S DIALOG EDITOR';

type // for columns list
  PLRec = ^TLRec;
  TLRec = record
    Position: Integer;
    FName: string;
  end;

type // for templates
  PTreeViewData = ^TTreeViewData;
  TTreeViewData = record
    id: Integer;
    parentid: Integer;
    name: string;
    find: Integer;
    ImgFolder: Integer;
  end;

type // for MDTree
  PMyRec = ^TMyRec;
  TMyRec = record
    //  ID : Integer;
    ObjType: Integer;
    ObjKind: Integer;
    DocType: Integer;
    OpenStr: string;
    MDObj: IMetaDataObj;

    fext: string;
    FolderName: string;
    FileName: string;
    IsFolder: Integer;

    BlockID: Integer;

    //IsBookmark : Boolean;

  end;
type
  TfrmSubSystems = class(TActiveForm, IArtbear_ActiveFormX, IConfigPlugin)
    ImageListSubSustems: TImageList;
    SubSystemConnection: TADOConnection;
    PageControlSubSystems: TPageControl;
    TabSheetMainSubSystems: TTabSheet;
    TabSheetTuning: TTabSheet;
    TabSheetConfs: TTabSheet;
    tvMetadata: TTreeView;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    btnFullSubSystemObj: TToolButton;
    ToolButton3: TToolButton;
    btnShowSaveTreeInFile: TToolButton;
    Panel2: TPanel;
    Splitter3: TSplitter;
    ToolBar3: TToolBar;
    btnAddCfg: TToolButton;
    btnEditCfg: TToolButton;
    btnDelCfg: TToolButton;
    ListViewConfigs: TListView;
    ToolButton5: TToolButton;
    btnRefreshCfg: TToolButton;
    ToolButton8: TToolButton;
    btnChoiceCfg: TToolButton;
    ToolButton4: TToolButton;
    ListViewConfigMetadata: TListView;
    Splitter2: TSplitter;
    PageControlConfig: TPageControl;
    TabSheetMetObj: TTabSheet;
    ToolBar2: TToolBar;
    BtnrefreshMetadataTree: TToolButton;
    TreeViewConfigMatadata: TTreeView;
    TabSheetExtFrms: TTabSheet;
    ListViewExtForms: TListView;
    ToolBar6: TToolBar;
    btnExtFrmsRefresh: TToolButton;
    ToolButton12: TToolButton;
    btnExtFrmsNewFolder: TToolButton;
    btnExtFrmsNewFile: TToolButton;
    btnExtFrmsEditPath: TToolButton;
    btnExtFrmsDeleteRecord: TToolButton;
    TabSheetConfData: TTabSheet;
    ToolBar7: TToolBar;
    btnRefreshSubSystems: TToolButton;
    btnAddSubSystem: TToolButton;
    btnEditSubSystem: TToolButton;
    ListViewSubSystemsList: TListView;
    btnDelSubSystem: TToolButton;
    ToolButton14: TToolButton;
    btnDelErrors: TToolButton;
    ActionList1: TActionList;
    MetRefreshSubSystemsList: TAction;
    MetFillMetadataTree: TAction;
    MetShowSubSystemsObj: TAction;
    MetSaveTreeInFile: TAction;
    MetDelErrors: TAction;
    MetChoiceAllSubSystems: TAction;
    MetUnChoiceAllSubSystems: TAction;
    MetInvertSubSystems: TAction;
    MetChoiceAllObj: TAction;
    MetUnChoiceAllObj: TAction;
    MetInvertObj: TAction;
    CfgRefreshSubSystemsList: TAction;
    CfgNewSubSystem: TAction;
    CfgEditSubSystem: TAction;
    CfgDelSubSystem: TAction;
    CfgMetRefreshList: TAction;
    CfgMetShowSubSystems: TAction;
    CfgMetSaveSubSystems: TAction;
    ExtFrmRefresh: TAction;
    ExtFrmNewFolder: TAction;
    ExtFrmNewFile: TAction;
    ExtFrmEdit: TAction;
    ExtFrmDel: TAction;
    ExtFrmShowSubSystems: TAction;
    ExtFrmSaveSubSystems: TAction;
    CfgRefreshList: TAction;
    CfgAdd: TAction;
    CfgEdit: TAction;
    CfgDel: TAction;
    CfgChoice: TAction;
    ChoiceTreeItem: TAction;
    ToolButton2: TToolButton;
    TabSheetToDo: TTabSheet;
    ToolBar8: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ListViewToDo: TListView;
    ToDoRefresh: TAction;
    ToDoAdd: TAction;
    ToDoEdit: TAction;
    ToDoDelete: TAction;
    PopupMenu1: TPopupMenu;
    ComboBoxView: TComboBox;
    ToolButton9: TToolButton;
    LinksRefresh: TAction;
    LinksToText: TAction;
    TabSheetTemplates: TTabSheet;
    TreeViewTemplates: TTreeView;
    ToolBar10: TToolBar;
    ToolButton1: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    TemplatesRefresh: TAction;
    TemplatesAdd: TAction;
    TemplatesEdit: TAction;
    TemplatesDelete: TAction;
    TemplatesChangeParent: TAction;
    ToolButton27: TToolButton;
    TempaltesNewFolder: TAction;
    PanelDetails: TPanel;
    ToolButton6: TToolButton;
    btnDelCurrentError: TToolButton;
    MetDelCurrentError: TAction;
    ShowOptionsWnd: TAction;
    NewObj: TAction;
    DeleteObj: TAction;
    ToolButton25: TToolButton;
    ToolButton28: TToolButton;
    ShowBookmarks: TAction;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    SaveOptionsByName: TAction;
    SetOptionsByName: TAction;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    BookmarkNew: TAction;
    BookmarkDelete: TAction;
    BookmarkNext: TAction;
    BookmarkPrevios: TAction;
    ToolButton35: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ToolButton26: TToolButton;
    TemplatesSetBuffer: TAction;
    NoteOpenCard: TAction;
    NoteDelete: TAction;
    NoteSaveFile: TAction;
    NoteLoadFromFile: TAction;
    NoteRefreshCurrent: TAction;
    NoteListRefresh: TAction;
    NoteListOpen: TAction;
    NoteListDelete: TAction;
    NoteListSaveToFile: TAction;
    TabSheetNoteList: TTabSheet;
    ToolBar12: TToolBar;
    ToolButton42: TToolButton;
    ToolButton43: TToolButton;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ListViewLNotesList: TListView;
    PanelHeader: TPanel;
    TabSheetRelises: TTabSheet;
    ToolBar13: TToolBar;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    ToolButton50: TToolButton;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ListViewRelises: TListView;
    ReliseAdd: TAction;
    ReliseEdit: TAction;
    ReliseDelete: TAction;
    ReliseRefresh: TAction;
    PageControlSubSystemsProps: TPageControl;
    TabSheetProps: TTabSheet;
    Splitter5: TSplitter;
    PropsValueListEditor: TValueListEditor;
    Memo1: TMemo;
    TabSheetLinks: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    TreeViewLinks: TTreeView;
    TabSheetSSObj: TTabSheet;
    ListViewIncludeSubSystems: TListView;
    TabSheetExpl: TTabSheet;
    TabSheetAvailableSubSystems: TTabSheet;
    ListViewSubSystems: TListView;
    ToolBar4: TToolBar;
    ToolButton20: TToolButton;
    ToolButton7: TToolButton;
    btnSelectAllSubSystems: TToolButton;
    btnUnselectAllSubSystems: TToolButton;
    btnInvertSelectionSubSystems: TToolButton;
    TabSheetShowMDObj: TTabSheet;
    ListViewObj: TListView;
    ToolBar5: TToolBar;
    btnSelectAllObj: TToolButton;
    btnUnselectAllObj: TToolButton;
    btnInvertSelectionAllObj: TToolButton;
    TabSheetNote: TTabSheet;
    MemoNote: TMemo;
    ToolBar11: TToolBar;
    ToolButton37: TToolButton;
    ToolButton41: TToolButton;
    ToolButton36: TToolButton;
    ToolButton40: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    PanelCaption: TPanel;
    TabSheetStatuses: TTabSheet;
    ToolBar14: TToolBar;
    ToolButton53: TToolButton;
    ToolButton54: TToolButton;
    ToolButton55: TToolButton;
    ToolButton56: TToolButton;
    ToolButton57: TToolButton;
    ListViewStatuses: TListView;
    StatusesAdd: TAction;
    StatusesRefresh: TAction;
    StatusesEdit: TAction;
    StatusesDelete: TAction;
    Splitter1: TSplitter;
    ListViewSubconfigs: TListView;
    ToolBar15: TToolBar;
    ToolButton58: TToolButton;
    ToolButton59: TToolButton;
    ToolButton60: TToolButton;
    ToolButton61: TToolButton;
    ToolButton62: TToolButton;
    SubConfAdd: TAction;
    SubConfEdit: TAction;
    SubConfDelete: TAction;
    SubConfRefresh: TAction;
    ToolButton63: TToolButton;
    ToolButton64: TToolButton;
    SubConfChoice: TAction;
    ToolButton65: TToolButton;
    ComboBoxSubconfigsOnSSL: TComboBox;
    ComboBoxSubconfigsOnRL: TComboBox;
    ToolButton67: TToolButton;
    ComboBoxSubconfigsOnASL: TComboBox;
    ToolButton66: TToolButton;
    TabSheetUsers: TTabSheet;
    ToolBar16: TToolBar;
    ToolButton68: TToolButton;
    ToolButton69: TToolButton;
    ToolButton70: TToolButton;
    ToolButton71: TToolButton;
    ToolButton72: TToolButton;
    ListViewUsers: TListView;
    UsersRefresh: TAction;
    UsersNew: TAction;
    UsersEdit: TAction;
    UsersDelete: TAction;
    ToolButton73: TToolButton;
    ComboBoxSubconfigsOnUL: TComboBox;
    Label10: TLabel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar17: TToolBar;
    ToolButton74: TToolButton;
    ToolButton75: TToolButton;
    ToolButton76: TToolButton;
    ToolButton77: TToolButton;
    ToolButton78: TToolButton;
    ListViewSeriousness: TListView;
    ListViewCategoryes: TListView;
    ToolBar18: TToolBar;
    ToolButton79: TToolButton;
    ToolButton80: TToolButton;
    ToolButton81: TToolButton;
    ToolButton82: TToolButton;
    ToolButton83: TToolButton;
    CategoryRefresh: TAction;
    CategoryDelete: TAction;
    CategoryNew: TAction;
    CategoryEdit: TAction;
    SeriousnesRefresh: TAction;
    SeriousnesNew: TAction;
    SeriousnesEdit: TAction;
    SeriousnesDelete: TAction;
    Label16: TLabel;
    Splitter4: TSplitter;
    Splitter6: TSplitter;
    TabSheet3: TTabSheet;
    ToolBar19: TToolBar;
    ToolButton84: TToolButton;
    ToolButton85: TToolButton;
    ToolButton86: TToolButton;
    ToolButton87: TToolButton;
    ToolButton88: TToolButton;
    ListViewToDoViewColumns: TListView;
    ToDoListColRefresh: TAction;
    ToDoListColNew: TAction;
    ToDoListColEdit: TAction;
    ToDoListColDelete: TAction;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ListViewToDoCols: TListView;
    ListConditions: TValueListEditor;
    ToolBar20: TToolBar;
    btnUp: TToolButton;
    btnDown: TToolButton;
    ImageListToDoList: TImageList;
    pnlChildToDo: TPanel;
    TreeViewSubToDo: TTreeView;
    pnlChildToDoCaption: TPanel;
    tsToDoObj: TTabSheet;
    ToolBar21: TToolBar;
    ToolButton89: TToolButton;
    ToolButton90: TToolButton;
    ToolButton91: TToolButton;
    ToolButton92: TToolButton;
    tvToDoObj: TTreeView;
    actToDoObjRefresh: TAction;
    actToDoObjEdit: TAction;
    actToDoObjDelete: TAction;
    ImageListButtonsManagment: TImageList;
    tsMDObjBlocks: TTabSheet;
    ToolBar22: TToolBar;
    ToolButton93: TToolButton;
    ToolButton94: TToolButton;
    ToolButton95: TToolButton;
    ToolButton96: TToolButton;
    lvMDObjBlocks: TListView;
    actMDBlocksRefresh: TAction;
    actMDBlocsEdit: TAction;
    actMDBlocksDelete: TAction;
    ilBlocks: TImageList;
    qryTmp: TADOQuery;
    tsEditLog: TTabSheet;
    ToolBar23: TToolBar;
    lvDBChanges: TListView;
    ToolButton98: TToolButton;
    ToolButton99: TToolButton;
    ToolButton100: TToolButton;
    ToolButton101: TToolButton;
    ToolButton97: TToolButton;
    actDBCnahgeGetByMDObj: TAction;
    actDBChangeAdd: TAction;
    actDBChangeEdit: TAction;
    actDBChangeDelete: TAction;
    ImageList1: TImageList;
    ToolButton102: TToolButton;
    ToolButton103: TToolButton;
    ToolButton104: TToolButton;
    ToDoCopy: TAction;
    ToDoCreateChild: TAction;
    btn1: TToolButton;
    actMetExpandType: TAction;
    btn2: TToolButton;
    actNoteNew: TAction;
    TreeViewMetadata: TTreeList;
    procedure ComboBoxParentToDoDropDown(Sender: TObject);
    procedure ComboBoxRelisesChange(Sender: TObject);
    procedure ComboBoxConfigsChange(Sender: TObject);
    procedure ComboBoxStatusChange(Sender: TObject);
    procedure ListViewToDoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PanelCaptionClick(Sender: TObject);
    procedure ListViewRelisesDblClick(Sender: TObject);
    procedure ReliseDeleteExecute(Sender: TObject);
    procedure ReliseEditExecute(Sender: TObject);
    procedure ReliseAddExecute(Sender: TObject);
    procedure ReliseRefreshExecute(Sender: TObject);
    procedure PanelHeaderClick(Sender: TObject);
    procedure TreeViewConfigMatadataDblClick(Sender: TObject);
    procedure ListViewLNotesListDblClick(Sender: TObject);
    procedure TabSheetNoteListShow(Sender: TObject);
    procedure NoteListSaveToFileExecute(Sender: TObject);
    procedure NoteListDeleteExecute(Sender: TObject);
    procedure NoteListOpenExecute(Sender: TObject);
    procedure NoteListRefreshExecute(Sender: TObject);
    procedure NoteRefreshCurrentExecute(Sender: TObject);
    procedure NoteLoadFromFileExecute(Sender: TObject);
    procedure NoteSaveFileExecute(Sender: TObject);
    procedure NoteDeleteExecute(Sender: TObject);
    procedure NoteOpenCardExecute(Sender: TObject);
    procedure TabSheetNoteShow(Sender: TObject);
    procedure ToolButton37Click(Sender: TObject);
    procedure TemplatesSetBufferExecute(Sender: TObject);
    //+

    function RunSQL(Q: TADOQuery; T: string; CommandGo: Integer = 0; pParams:
      TStringList = nil): TADOQuery;

    //procedure AddMetItems(vTree: TTreeView; Num: Integer; Parent: TTreeNode; Img: Integer);
    procedure ShowSubSystems(vList: TListView; vKind: Integer; vRef, vField,
      vValue: string);
    procedure SaveSubSystems(vList: TListView; vTreeNode: TTreeNode);
    function GetObjByID(vID, vType: Integer): IMetaDataObj;
    procedure CreateNodes();
    procedure tvMetadataDblClick(Sender: TObject);
    procedure ListViewConfigsEdited(Sender: TObject; Item: TListItem; var S:
      string);
    procedure tvMetadataClick(Sender: TObject);
    procedure tvMetadataCompare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);
    procedure PropsValueListEditorClick(Sender: TObject);
    //procedure FullListSubSystems(vList: TListView);
    procedure FullListSubSystems(vList: TListView; vCfgID: Integer = 0;
      vSubcongID: Integer = 0);
    procedure ListViewSubSystemsListEdited(Sender: TObject; Item: TListItem; var
      S: string);
    procedure TabSheetSSObjShow(Sender: TObject);
    procedure ShellTreeView1DblClick(Sender: TObject);
    procedure MetFillMetadataTreeExecute(Sender: TObject);
    procedure MetShowSubSystemsObjExecute(Sender: TObject);
    procedure MetSaveTreeInFileExecute(Sender: TObject);
    procedure MetDelErrorsExecute(Sender: TObject);
    procedure MetChoiceAllSubSystemsExecute(Sender: TObject);
    procedure MetUnChoiceAllSubSystemsExecute(Sender: TObject);
    procedure MetInvertSubSystemsExecute(Sender: TObject);
    procedure MetChoiceAllObjExecute(Sender: TObject);
    procedure MetUnChoiceAllObjExecute(Sender: TObject);
    procedure MetInvertObjExecute(Sender: TObject);
    procedure CfgRefreshListExecute(Sender: TObject);
    procedure CfgAddExecute(Sender: TObject);
    procedure CfgEditExecute(Sender: TObject);
    procedure CfgDelExecute(Sender: TObject);
    procedure CfgChoiceExecute(Sender: TObject);
    procedure CfgMetRefreshListExecute(Sender: TObject);
    procedure CfgMetShowSubSystemsExecute(Sender: TObject);
    procedure CfgMetSaveSubSystemsExecute(Sender: TObject);
    procedure ExtFrmRefreshExecute(Sender: TObject);
    procedure ExtFrmNewFolderExecute(Sender: TObject);
    procedure ExtFrmNewFileExecute(Sender: TObject);
    procedure ExtFrmEditExecute(Sender: TObject);
    procedure ExtFrmDelExecute(Sender: TObject);
    procedure ExtFrmSaveSubSystemsExecute(Sender: TObject);
    procedure CfgRefreshSubSystemsListExecute(Sender: TObject);
    procedure CfgNewSubSystemExecute(Sender: TObject);
    procedure CfgEditSubSystemExecute(Sender: TObject);
    procedure CfgDelSubSystemExecute(Sender: TObject);
    procedure MetRefreshSubSystemsListExecute(Sender: TObject);
    procedure TreeViewConfigMatadataClick(Sender: TObject);
    procedure ListViewExtFormsClick(Sender: TObject);
    procedure tvMetadataChange(Sender: TObject; Node: TTreeNode);
    procedure ChoiceTreeItemExecute(Sender: TObject);
    procedure TreeViewConfigMatadataChange(Sender: TObject; Node: TTreeNode);
    procedure ToDoRefreshExecute(Sender: TObject);
    procedure ToDoAddExecute(Sender: TObject);
    procedure ToDoEditExecute(Sender: TObject);
    procedure ToDoDeleteExecute(Sender: TObject);
    procedure ListViewToDoCustomDrawItem(Sender: TCustomListView; Item:
      TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListViewToDoDblClick(Sender: TObject);

    //function GetMetID(Num: integer; vName: string): string;
    procedure TabSheetLinksShow(Sender: TObject);
    procedure LinksRefreshExecute(Sender: TObject);
    procedure LinksToTextExecute(Sender: TObject);
    procedure ListViewConfigMetadataMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ListViewToDoColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure ListViewToDoCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ComboBoxSSFilterChange(Sender: TObject);
    procedure ComboBoxDoneChange(Sender: TObject);
    procedure ComboBoxViewChange(Sender: TObject);
    procedure TabSheetMainSubSystemsShow(Sender: TObject);
    procedure TabSheetToDoShow(Sender: TObject);
    procedure TabSheetTuningShow(Sender: TObject);
    procedure TabSheetConfsShow(Sender: TObject);
    procedure TabSheetPropsShow(Sender: TObject);
    procedure TabSheetExplShow(Sender: TObject);
    procedure TabSheetConfDataShow(Sender: TObject);
    procedure TabSheetMetObjShow(Sender: TObject);
    procedure TabSheetExtFrmsShow(Sender: TObject);
    procedure TabSheetAvailableSubSystemsShow(Sender: TObject);
    procedure TabSheetShowMDObjShow(Sender: TObject);
    procedure ComboBoxUsersChange(Sender: TObject);
    procedure ComboBoxObjChange(Sender: TObject);
    procedure ActiveFormActivate(Sender: TObject);
    procedure TemplatesRefreshExecute(Sender: TObject);
    procedure TemplatesAddExecute(Sender: TObject);
    procedure TemplatesEditExecute(Sender: TObject);
    procedure TemplatesDeleteExecute(Sender: TObject);
    procedure TemplatesChangeParentExecute(Sender: TObject);
    procedure TempaltesNewFolderExecute(Sender: TObject);

    procedure TreeViewTemplatesDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TreeViewTemplatesDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure TreeViewTemplatesDblClick(Sender: TObject);
    procedure MetDelCurrentErrorExecute(Sender: TObject);
    procedure ShowOptionsWndExecute(Sender: TObject);
    procedure ExtFrmShowSubSystemsExecute(Sender: TObject);
    procedure ToolButton28Click(Sender: TObject);
    procedure NewObjExecute(Sender: TObject);
    procedure DeleteObjExecute(Sender: TObject);
    procedure TreeViewLinksDblClick(Sender: TObject);
    procedure ShowBookmarksExecute(Sender: TObject);
    procedure SetOptionsByNameExecute(Sender: TObject);
    procedure SaveOptionsByNameExecute(Sender: TObject);
    procedure BookmarkNewExecute(Sender: TObject);
    procedure BookmarkDeleteExecute(Sender: TObject);
    procedure BookmarkNextExecute(Sender: TObject);
    procedure BookmarkPreviosExecute(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure StatusesRefreshExecute(Sender: TObject);
    procedure StatusesAddExecute(Sender: TObject);
    procedure StatusesEditExecute(Sender: TObject);
    procedure StatusesDeleteExecute(Sender: TObject);
    procedure ListViewStatusesDblClick(Sender: TObject);
    procedure SubConfAddExecute(Sender: TObject);
    procedure SubConfEditExecute(Sender: TObject);
    procedure SubConfDeleteExecute(Sender: TObject);
    procedure SubConfRefreshExecute(Sender: TObject);
    procedure ListViewSubconfigsDblClick(Sender: TObject);
    procedure SubConfChoiceExecute(Sender: TObject);
    procedure ListViewConfigsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListViewSubSystemsListDblClick(Sender: TObject);
    procedure ComboBoxForReportChange(Sender: TObject);
    procedure ComboBoxSubconfigsChange(Sender: TObject);
    procedure ComboBoxSubconfigsOnASLChange(Sender: TObject);
    procedure ListViewConfigsDblClick(Sender: TObject);
    procedure UsersRefreshExecute(Sender: TObject);
    procedure UsersNewExecute(Sender: TObject);
    procedure UsersEditExecute(Sender: TObject);
    procedure UsersDeleteExecute(Sender: TObject);
    procedure ListViewUsersDblClick(Sender: TObject);
    procedure ComboBoxSubconfigsOnULChange(Sender: TObject);

    function GetNameByID(vID: SYSINT; vStr: string): WideString;
    function GetLinksText(vTable, vField, vType, vID: string): string;
    procedure CategoryNewExecute(Sender: TObject);
    procedure CategoryEditExecute(Sender: TObject);
    procedure CategoryDeleteExecute(Sender: TObject);
    procedure CategoryRefreshExecute(Sender: TObject);
    procedure SeriousnesRefreshExecute(Sender: TObject);
    procedure SeriousnesNewExecute(Sender: TObject);
    procedure SeriousnesEditExecute(Sender: TObject);
    procedure SeriousnesDeleteExecute(Sender: TObject);
    procedure ListViewSeriousnessDblClick(Sender: TObject);
    procedure ListViewCategoryesDblClick(Sender: TObject);
    procedure ListConditionsGetPickList(Sender: TObject;
      const KeyName: string; Values: TStrings);
    procedure ListViewToDoChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure TreeViewSubToDoExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeViewSubToDoDblClick(Sender: TObject);
    procedure ToDoListColRefreshExecute(Sender: TObject);
    procedure ToDoListColNewExecute(Sender: TObject);
    procedure ToDoListColEditExecute(Sender: TObject);
    procedure ToDoListColDeleteExecute(Sender: TObject);
    procedure ListViewToDoViewColumnsDblClick(Sender: TObject);
    procedure ListConditionsStringsChange(Sender: TObject);
    procedure ListViewToDoColsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure tvMetadataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnlChildToDoCaptionClick(Sender: TObject);
    procedure actToDoObjRefreshExecute(Sender: TObject);
    procedure actToDoObjEditExecute(Sender: TObject);
    procedure actToDoObjDeleteExecute(Sender: TObject);
    procedure tvToDoObjExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvToDoObjDblClick(Sender: TObject);
    procedure actMDBlocksRefreshExecute(Sender: TObject);
    procedure actMDBlocsEditExecute(Sender: TObject);
    procedure actMDBlocksDeleteExecute(Sender: TObject);
    procedure lvMDObjBlocksDblClick(Sender: TObject);
    procedure tvMetadataAdvancedCustomDrawItem(
      Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
    procedure actDBCnahgeGetByMDObjExecute(Sender: TObject);
    procedure actDBChangeAddExecute(Sender: TObject);
    procedure actDBChangeEditExecute(Sender: TObject);
    procedure actDBChangeDeleteExecute(Sender: TObject);
    procedure lvDBChangesDblClick(Sender: TObject);
    procedure ToDoCopyExecute(Sender: TObject);
    procedure ToDoCreateChildExecute(Sender: TObject);
    procedure actMetExpandTypeExecute(Sender: TObject);

    function DBTrue(): string;
    function DBFalse(): string;
    function DBInvCom(): string;
    procedure actNoteNewExecute(Sender: TObject);
    procedure tvMetadataExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    //-
  private
    { Private declarations }

    MDTreeEvents: IMDTreeEvents;

    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    //+
    procedure ShowEvent(Sender: TObject);
    procedure ChoiceNodeEvent(Sender: TObject);

    procedure OnMDSubSystemsListRefreshEvent(Sender: TObject);
    procedure OnMDNodeClickEvent(InScript: Boolean = true);
    //-

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
    procedure Run; safecall;
    //function GetSubSystemNameByID(vID: Integer): string; safecall;
  public
    { Public declarations }
    // переменные классов
    vAvSS: iAvailableSubSystems;
    vCfgLst: iCfgList;
    vExtFrmsLst: iExtFrmsList;
    vLinks: iLinks;
    vMDTree: iMDTree;
    vObjClasses: iObjectClasses;
    vTemplates: iTemplates;
    vToDoLst: iToDoList;
    vTuningMDObj: iTuningMDObj;
    vTuningSSLst: iTuningSubSystemsList;
    vOptions: IOptions;
    vBookmarks: IBookmarks;
    vNote: IObjectNote;
    vNoteList: IObjectNoteList;
    vRelisesList: IRelises;
    vStatusList: IStatusList;
    vSubcfg: ISubConfigs;
    vUsersList: IListUsers;
    vListCategoryes: IListCategoryes;
    vListSeriousnes: IListSeriousness;
    vListToDoCols: IToDoViewColumns;
    vMDObjBlocks: IMDObjBlocks;
    vDBChangesLog: IDBChangesLog;
    //vHistory : IHistory;

    SMetaDataObj: IMetaDataObj;
    FConfigurator: IConfigurator;

    VisTabs: string;
    //InfoPlace: Integer;
    PanelSSPlace: Integer;
    PanelPlace: Integer;
    CurCfg: Integer;
    CurSubCfg: Integer;
    CurUser: Integer;
    SortColumn: Integer;
    MDTreeViewMode : Integer;

    FEvents: IArtbear_ActiveFormXEvents;

    vToDoObjName: string;

    vShowBlocks: Integer;

    procedure Initialize; override;

    procedure MetSubSystemsObjShow; safecall;
    function VisibleTabsEx: Boolean;

    procedure Echo(s: string);
    procedure GrfNode(vNode: TTreeNode; vImg: Integer);
    function CreateData(vMDObj: IMetaDataObj; vObjType, vObjKind, vDocType:
      Integer; vOpenStr: string): PMyRec;
    procedure ToDoMarks(vList: TListView; vVar: Integer);
    function ReadUsersList(const fileName: string): TStringList;
    procedure HideAllTabs(); safecall;
    function CreateObjLItem(vList: TListView; vName: string; vID: Integer):
      TListItem;

    function GetSQLConnectionString: WideString; safecall;
    procedure ShowSubsystemByObj; safecall;

    procedure GoToSheet(const vSheet: WideString); safecall;
    function GetCurrentPage: WideString; safecall;

    function GetSpecialFolderPath(var SPFolder: WideString): WideString;
      safecall;
    function GetCurrentDBUserNames: WideString; safecall;
    function GetDBUserNames(var UsersListFile: WideString): WideString;
      safecall;

    // возвращаем экземпляры классов для скриптов
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
    function GetObjectNote: IObjectNote; safecall;
    function GetObjectNoteList: IObjectNoteList; safecall;
    function GetRelisesList: IRelises; safecall;
    function GetStatusList: IStatusList; safecall;
    function GetSubconfigsList: ISubconfigs; safecall;
    function GetUsersList: IListUsers; safecall;
    function GetListCategoryes: IListCategoryes; safecall;
    function GetListSeriousnes: IListSeriousness; safecall;
    function GetListToDoCols: IToDoViewColumns; safecall;
    function GetListMDObjBlocks: IMDObjBlocks; safecall;
    function GetDBChangeLog: IDBChangesLog; safecall;

    //function GetHistory: IHistory;  safecall;

    function GetToDoObjName: WideString; safecall;
    function GetItemID(vList: TComboBox): Integer;

    function GetItemsForList(Q: TADOQuery): TStrings;
    //function GetIDFromStr(vStr: WideString): WideString; safecall;
    function GetIDFromStr(const vStr: WideString): WideString; safecall;

    procedure FillListToDoCols(vList: TListView; vID: Integer);
    procedure AddColItem(vList: TListView; vField, vPresent, vVal: string);

    procedure CloseDatabase; safecall;
    function GetDataConnectionString(): WideString; safecall;

    function ifstr(pVal1,pVal2 : string): string;

  private

    FDebugFlag: Boolean;
    FDoInplugin: Boolean;

    //vTest: TTest;
    { IConfigPlugin }
    function Init(const pConfigurator: IConfigurator; out PluginName:
      WideString): HResult; stdcall;
    function Done: HResult; stdcall;
    function GetPluginCaps(capNum: PluginCaps; out pResult: OleVariant):
      HResult;
      stdcall;
    function DoAction(Action: PluginAction; Param: OleVariant; out pResult:
      OleVariant): HResult; stdcall;

    { мои собственные}

    procedure Debug(s: string); overload;
    procedure Debug(title, s: string); overload;
    //procedure ErrorMessage(s: string);
  end;
var
  vOptionsFile: string;
  CF_DDGData: Word;

  // переменные отвечающие за корневые объекты дерева конфигурации
  vNodeConsts, vNodeRefs, vNodeDocs, vNodeJournals, vNodeEnums,
    vNodeReps, vNodeCalcVars, vNodeAccLists, vNodeSubcnts, vNodeOper,
    vNodeProv, vNodeRegs, vNodeCJ, vNodeKindCalcs, vNodeGprCalcs,
    vNodeCalndars, vNodeNums, vNodePosled, vNodeGrfOtb, vNodeObrec,
    vNodeRulesCalc, vNodeRecAccLst, vNodeFrmAcclSt, vNodeOperation,
    vNodeRecOper, vNodeRecProv, vNodeGrfJO, vNodeFrmJO, vNodeFrmPorv,
    vErNode: TTreeNode;

const
  iDocForm = 0;
  iRecForm = 1;
  iNoteForm = 2;
  iObj = 100;
  //
  GrfConsts = 28;
  GrfConst = 29; //!
  GrfConstPeriod = 76; //!

  GrfRefs = 30;
  GrfRef = 31;

  GrfDocs = 32;
  GrfDoc = 33;
  GrfObRecs = 34;
  GrfObRec = 35;

  GrfJrns = 36;
  GrfJrn = 37;
  GrfJrnGrOtb = 38;

  GrfEnums = 39; //!
  GrfEnum = 40; //!

  GrfReps = 41;
  GrfRep = 42;
  GrfRepTMD = 122;

  GrfCalcVars = 43;
  GrfCalcVar = 44; //!
  GrfCalcVarTMD = 123; //!

  GrfAccLists = 45;
  GrfAccList = 46;

  GrfSubcnts = 126;
  GrfSubcnt = 127;

  GrfOpers = 62;
  GrfProv = 63;

  GrfRegs = 47;
  GrfReg = 48;
  GrfRegIzm = 49;
  GrfRegRess = 50;
  GrfRegRecs = 35;
  GrfRegRec = 24;

  GrfCJs = 51;
  GrfCJ = 52;

  GrfKindCalcs = 53;
  GrfKindCalc = 54;
  GrfKindCalcTMD = 124;

  GrfGrpCalc = 55;

  GrfCalndars = 56;
  GrfCalndar = 57;

  GrfFrmEdit = 67;
  GrfFrmNote = 68;
  GrfFldr = 4;
  GrfElement = 69;
  GrfFrmList = 67;
  GrfFrmModule = 18;

  GrfFrmEditTMD = 120;
  GrfFrmModuleTMD = 121;

  GrfRecPeriod = 74;
  GrfRecSort = 75;
  GrfRecFilter = 73;

  GrfRecFrm = 85;
  GrfRecTxt = 86;

  GrfSubCfgUnChoice = 91;
  GrfSubCfgChoice = 92;

  GrfBlock = 1;
  GrfBlockEdit = 0;

  GrfDocFldHdr = 117;
  GrfDocFldDtl = 118;
  GrfDocExtFrmFld = 125;

  GrfDocFldChild = 87;
  GrfRefFldChild = 119;

  GrfTMDForm = 128;
  GrfTMDModule = 129;
  GrfTMDObj = 130;

implementation

uses
  ComServ,
  SysUtils,

  ConvUtils,
  AvailableSubSystems,
  CfgList,
  ExtFrmsList,
  Links,
  MDTree,
  ObjectClasses,
  Templates,
  ToDoList,
  TuningMDObj,
  TuningSubSystemsList,
  Options,

  Bookmarks,
  //FormEditCardObjectNote,
  ObjectNoteList,
  ObjectNote,
  Relises,
  StatusList,
  Subconfigs,
  ListUsers,
  ListCategoryes,
  ListSeriousness,
  ToDoViewColumns,
  MDObjBlocks,
  DBChangesLog;
//istory;

{$R *.DFM}

procedure TfrmSubSystems.DefinePropertyPages(DefinePropertyPage:
  TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_Artbear_ActiveFormXPage); }
end;

procedure TfrmSubSystems.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IArtbear_ActiveFormXEvents;
  MDTreeEvents := EventSink as IMDTreeEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TfrmSubSystems.Initialize;
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
  OnShow := ShowEvent;
end;

function TfrmSubSystems.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfrmSubSystems.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TfrmSubSystems.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfrmSubSystems.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfrmSubSystems.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfrmSubSystems.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfrmSubSystems.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfrmSubSystems.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfrmSubSystems.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfrmSubSystems.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfrmSubSystems.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfrmSubSystems.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfrmSubSystems.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfrmSubSystems.Get_HelpKeyword: WideString;
begin
  Result := WideString(HelpKeyword);
end;

function TfrmSubSystems.Get_HelpType: TxHelpType;
begin
  Result := Ord(HelpType);
end;

function TfrmSubSystems.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfrmSubSystems.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfrmSubSystems.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfrmSubSystems.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfrmSubSystems.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfrmSubSystems.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfrmSubSystems._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmSubSystems.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnActivate;
end;

//+

procedure TfrmSubSystems.ShowEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnShow;
end;

procedure TfrmSubSystems.ChoiceNodeEvent(Sender: TObject);
begin
  //  if FEvents <> nil then FEvents.OnChoiceNode;
end;

//-

procedure TfrmSubSystems.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnClick;
end;

procedure TfrmSubSystems.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCreate;
end;

procedure TfrmSubSystems.DblClickEvent(Sender: TObject);
begin
  //if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfrmSubSystems.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDeactivate;
end;

procedure TfrmSubSystems.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDestroy;
end;

procedure TfrmSubSystems.KeyPressEvent(Sender: TObject;
  var Key: Char);
//var
  //TempKey: Smallint;
begin
  {
    TempKey := Smallint(Key);
    if FEvents <> nil then FEvents.OnKeyPress(TempKey);
    Key := Char(TempKey);
    }
end;

procedure TfrmSubSystems.PaintEvent(Sender: TObject);
begin
  //if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfrmSubSystems.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfrmSubSystems.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfrmSubSystems.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfrmSubSystems.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfrmSubSystems.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfrmSubSystems.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfrmSubSystems.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfrmSubSystems.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfrmSubSystems.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfrmSubSystems.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmSubSystems.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TfrmSubSystems.Set_HelpKeyword(const Value: WideString);
begin
  HelpKeyword := string(Value);
end;

procedure TfrmSubSystems.Set_HelpType(Value: TxHelpType);
begin
  HelpType := THelpType(Value);
end;

procedure TfrmSubSystems.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfrmSubSystems.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfrmSubSystems.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfrmSubSystems.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfrmSubSystems.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TfrmSubSystems.Run;
var
  sc_1: Variant;
begin
  sc_1 := FConfigurator.Scripts.item['NavigationTools'];
  if VarType(sc_1) = varDispatch then
    sc_1.GoToMDTreeItem('Документ.Заказ', 0)
  else
    ShowMessage('not');
end;

procedure TfrmSubSystems.Echo(s: string);
begin
  FConfigurator.Message(s, mNone);
end;

{
procedure TfrmSubSystems.ErrorMessage(s: string);
begin
  FConfigurator.Message(s, mRedErr);
end;
}

procedure TfrmSubSystems.Debug(s: string);
begin
  try
    if FDebugFlag then
      Echo(s);
  finally
    //
  end;
end;

procedure TfrmSubSystems.Debug(title, s: string);
begin
  if FDebugFlag then
    Echo(title + '-' + s);
end;

{ IConfigPlugin }

//------------------------------------------------------------------------------

function TfrmSubSystems.CreateObjLItem(vList: TListView; vName: string; vID:
  Integer): TListItem;
var
  //vData: PMyRec;
  LItem: TListItem;
begin
  LItem := vList.Items.add;
  LItem.Caption := vName;
  //New(vData);
  //vData.ObjType := vID;
  LItem.Data := Pointer(vID);
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.CreateData(vMDObj: IMetaDataObj; vObjType, vObjKind,
  vDocType: Integer; vOpenStr: string): PMyRec;
var
  vData: PMyRec;
  //Q: TADOQuery;
begin
  New(vData);
  vData.MDObj := vMDObj;
  vData.ObjType := vObjType;
  vData.ObjKind := vObjKind;
  vData.DocType := vDocType;
  vData.OpenStr := vOpenStr;
  vData.BlockID := 0;

  Result := vData;
end;
//------------------------------------------------------------------------------

procedure fromStringToList(str: string; List: TStringList);
var
  i: LongInt;
  index: byte;
  StrVid: string;
begin
  StrVid := '';
  index := 0;
  for i := 1 to Length(str) do
  begin
    if index >= 2 then
    begin
      if (index = 2) and (Copy(Str, i, 1) = '}') then
        //nothing
      else
        StrVid := StrVid + Copy(Str, i, 1);
    end;

    if Copy(Str, i, 1) = '{' then
      index := index + 1
    else if Copy(Str, i, 1) = '}' then
      index := index - 1;

    if (index = 1) and (Length(StrVid) > 0) then
    begin
      List.Add(StrVid);
      StrVid := '';
    end;
  end;

end;
//------------------------------------------------------------------------------

procedure fromStringWithSeparatorToList(str: string; const Separ: string; List:
  TStringList);
var
  i: integer;
  StrVid: string;
begin
  StrVid := '';
  i := 1;
  while i <= Length(str) do
  begin
    if Copy(str, i, Length(Separ)) = Separ then
    begin
      i := i + Length(Separ);
      List.Add(StrVid);
      StrVid := '';
    end
    else
    begin
      StrVid := StrVid + Copy(str, i, 1);
      i := i + 1;
    end;
  end;
  if Length(StrVid) > 0 then
    List.Add(StrVid);
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.ReadUsersList(const fileName: string): TStringList;
var
  Root: TRootStorage;
  StorStream: TStorageStream;
  ReadBytes: LongInt;
  Name: string;
  n: integer;
  buffer: array[0..100] of char;
  UsersList: TStringList;
  ParamList: TStringList;
begin
  UsersList := TStringList.Create;
  UsersList.Clear;
  Result := UsersList;
  if not FileExists(fileName) then
    exit;

  if (fileName <> '') and FileIsCompoundDoc(fileName) then
  begin
    Root := TRootStorage.Create(fileName, amRead, smDenyWrite, tmTransacted,
      false);
    StorStream := TStorageStream.Create('Container.Contents', Root, amRead,
      false);
    if StorStream.Seek(0, 2) > 0 then
    begin
      StorStream.Seek(0, 0);
      repeat
        ReadBytes := StorStream.Read(buffer, 100);
        for n := 0 to ReadBytes - 1 do
          Name := Name + buffer[n];
      until ReadBytes <> 100;
    end;
    StorStream.Destroy;
    root.Free;
    if Length(Name) > 0 then
    begin
      fromStringToList(Name, UsersList);
      ParamList := TStringList.Create;
      for n := 0 to UsersList.Count - 1 do
      begin
        Name := UsersList.Strings[n];
        ParamList.Clear;
        fromStringWithSeparatorToList(Name, ',', ParamList);
        if ParamList.Count > 2 then
        begin
          //Берем третий параметр, Это у нас имя юзера
          Name := ParamList.Strings[2];
          Name := Copy(Name, 2, Length(Name) - 2);
          UsersList.Strings[n] := Name;
        end;
      end;
      UsersList.Sort;
    end;
  end;
  Result := UsersList;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.HideAllTabs();
begin
  TabSheetMainSubSystems.TabVisible := true;
  TabSheetToDo.TabVisible := false;
  TabSheetTuning.TabVisible := false;
  TabSheetConfs.TabVisible := false;
  TabSheetTemplates.TabVisible := false;
  TabSheetProps.TabVisible := false;
  TabSheetLinks.TabVisible := false;
  TabSheetSSObj.TabVisible := false;
  TabSheetExpl.TabVisible := false;
  TabSheetAvailableSubSystems.TabVisible := false;
  TabSheetShowMDObj.TabVisible := false;
  TabSheetNote.TabVisible := false;
  TabSheetNoteList.TabVisible := false;
  tsToDoObj.TabVisible := false;
  tsMDObjBlocks.TabVisible := false;
  tsEditLog.TabVisible := false;
  // последние 3 это закладки другого компонента
  //TabSheetExtFrms.TabVisible := false;
  //TabSheetConfData.TabVisible := false;
  //TabSheetMetObj.TabVisible := false;
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.Init(const pConfigurator: IConfigurator; out PluginName:
  WideString): HResult;
var
  i, j: Integer;
  s: string;
  //SL, FL: TStrings;
  //vToDoDone,
  //vModuleDone: boolean;
  F: TextFile;
  vConStr: string;
  //MetA: IMetaDataObjChilds;
  //Q, vQ: TADOQuery;
begin
  FConfigurator := pConfigurator;
  PluginName := ConstPluginName;

  // создаем экземпляры классов, чтобы вызыывать их методы в плагине
  vAvSS := TAvailableSubSystems.CreateObj(self, ListViewSubSystems);
  vCfgLst := TCfgList.CreateObj(self, pConfigurator);
  vExtFrmsLst := TExtFrmsList.CreateObj(self);
  vLinks := TLinks.CreateObj(self, pConfigurator);
  vMDTree := TMDTree.CreateObj(self, FConfigurator);
  vObjClasses := TObjectClasses.CreateObj(self, ListViewObj);
  vTemplates := TTemplates.CreateObj(self);
  vToDoLst := TToDoList.CreateObj(self, FConfigurator);
  vTuningMDObj := TTuningMDObj.CreateObj(self, FConfigurator,
    TreeViewConfigMatadata);
  vTuningSSLst := TTuningSubSystemsList.CreateObj(self);
  vOptions := TOptions.CreateObj(self);
  vBookmarks := TBookmarks.CreateObj(self);
  vNote := TObjectNote.CreateObj(self);
  vNoteList := TObjectNoteList.CreateObj(self);
  vRelisesList := TRelises.CreateObj(self, pConfigurator);
  vStatusList := TStatusList.CreateObj(self, pConfigurator);
  vSubcfg := TSubconfigs.CreateObj(self, pConfigurator, vCfgLst);
  vUsersList := TListUsers.CreateObj(self, pConfigurator);
  vMDObjBlocks := TMDObjBlocks.CreateObj(Self);
  vDBChangesLog := TDBChangesLog.CreateObj(Self);

  vListCategoryes := TListCategoryes.CreateObj(self, pConfigurator);
  vListSeriousnes := TListSeriousness.CreateObj(self, pConfigurator);
  vListToDoCols := TToDoViewColumns.CreateObj(self, pConfigurator);

  //vHistory := THistory.CreateObj(self, pConfigurator);

  FDebugFlag := False;
  SubSystemConnection.Close;
  vConStr := FConfigurator.BinDir + 'config\SubSystemsData.ini';
  if FileExists(vConStr) then
  begin
    AssignFile(F, vConStr);
    Reset(F);
    Readln(F, S);
    CloseFile(F);
  end
  else

    s := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
      + FConfigurator.BinDir +
      'config\SubSystemsData.mdb;Persist Security Info=False';

  {
s := 'Provider=Microsoft.Jet.OLEDB.4.0;'
+ 'User ID=Admin;Data Source=' + FConfigurator.BinDir
+ 'config\SubSystemsData.mdb;'
+ 'Mode=Share Deny None;Extended Properties="";' +
'Persist Security Info=False;Jet OLEDB:System database="";'
+ 'Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";'
+ 'Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;'
+ 'Jet OLEDB:Global Partial Bulk Ops=2;'
+ 'Jet OLEDB:Global Bulk Transactions=1;'
+ 'Jet OLEDB:New Database Password="";'
+ 'Jet OLEDB:Create System Database=False;'
+ 'Jet OLEDB:Encrypt Database=False;'
+ 'Jet OLEDB:Don''t Copy Locale on Compact=False;'
+ 'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';
}
  SubSystemConnection.ConnectionString := trim(s);
  SubSystemConnection.Open;

  CreateObjLItem(ListViewObj, 'Константы', 0);
  CreateObjLItem(ListViewObj, 'Справочники', 1);
  CreateObjLItem(ListViewObj, 'Документы', 2);
  CreateObjLItem(ListViewObj, 'Журналы документов', 3);
  CreateObjLItem(ListViewObj, 'Перечисления', 4);
  CreateObjLItem(ListViewObj, 'Отчеты', 5);
  CreateObjLItem(ListViewObj, 'Обработки', 6);
  CreateObjLItem(ListViewObj, 'Планы счетов', 17);
  CreateObjLItem(ListViewObj, 'Виды субконто', 18);
  CreateObjLItem(ListViewObj, 'Операция', 21);
  CreateObjLItem(ListViewObj, 'Проводка', 24);
  CreateObjLItem(ListViewObj, 'Регистры', 7);
  CreateObjLItem(ListViewObj, 'Журналы расчетов', 11);
  CreateObjLItem(ListViewObj, 'Виды расчетов', 9);
  CreateObjLItem(ListViewObj, 'Группы расчетов', 10);
  CreateObjLItem(ListViewObj, 'Календари', 8);

  ComboBoxView.ItemIndex := 0;
  //ComboBoxSSFilter.ItemIndex := 0;
  //ComboBoxDone.ItemIndex := 0;

  for i := 0 to ListViewObj.Items.Count - 1 do
  begin
    ListViewObj.Items.Item[i].Checked := True;
  end;
  CfgRefreshListExecute(CfgRefreshList);
  for i := 0 to ListViewConfigs.Items.Count - 1 do
  begin
    if ListViewConfigs.Items.Item[i].Caption =
      FConfigurator.MetaData.TaskDef.Props[0] then
    begin
      ListViewConfigs.Items.Item[i].Selected := True;
      CfgChoiceExecute(CfgChoice);
    end;
  end;

  MetRefreshSubSystemsListExecute(MetRefreshSubSystemsList);

  //  SL := TStringList.Create;
  //  FL := TStringList.Create;

  for j := 0 to ListConditions.RowCount - 4 do
  begin
    ListConditions.ItemProps[j].EditStyle := esPickList;
  end;

  HideAllTabs;

  PanelHeader.Tag := 0;
  PanelHeader.OnClick(nil);

  pnlChildToDoCaption.Tag := 0;
  pnlChildToDoCaption.OnClick(nil);

  //vHistory.Refresh;
  vRelisesList.Refresh;
  vUsersList.Refresh;

  Result := S_OK;
end;

//******************************************************************************
//******************************************************************************
//******************************************************************************
//                          события
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetRefreshSubSystemsListExecute(Sender: TObject);
var
  s: string;
begin
  if FEvents <> nil then
  begin
    try
      FEvents.OnMDSubSystemsListRefresh;
    except
      on E: Exception do
      begin
        s := 'Подсистемы: вызов обработчиков события OnMDNodeDblClick неудачен'#13#10
          +
          'Возникло исключение:'#13#10 + E.Message;
        Echo(s);
      end;
    end;
  end
  else
  begin
    //ShowMessage('в скрипте нету!');
    //vAvSS.Refresh;
  end;
end;

//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetFillMetadataTreeExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDTreeFilling;

end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetSaveTreeInFileExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDTreeSaveToFile;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetDelErrorsExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDTreeDeleteErrors;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetChoiceAllSubSystemsExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSubSystemsListSelectAll;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetUnChoiceAllSubSystemsExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSubSystemsListUnSelectAll;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetInvertSubSystemsExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSubSystemsListInvert;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetChoiceAllObjExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSubSystemsObjSelectAll;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetUnChoiceAllObjExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSubSystemsObjUnSelectAll;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetInvertObjExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSubSystemsObjInvert;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgRefreshListExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnConfigsRefresh;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgAddExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnConfigsAdd;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnConfigsEdit;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgDelExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnConfigsDelete;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgChoiceExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnConfigsChoice;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgMetRefreshListExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgMDObjRefresh;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ExtFrmRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgExtFrmRefresh;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ExtFrmNewFolderExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgExtFrmNewFolder;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ExtFrmNewFileExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgExtFrmNewFile;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ExtFrmEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgExtFrmEdit;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ExtFrmDelExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgExtFrmDelete;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgRefreshSubSystemsListExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgSubSystemsRefresh;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgNewSubSystemExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgSubSystemsAdd;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgEditSubSystemExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgSubSystemsEdit;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgDelSubSystemExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgSubSystemsDelete;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.tvMetadataChange(Sender: TObject;
  Node: TTreeNode);
begin
  if FEvents <> nil then
    FEvents.OnMDNodeChange;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ChoiceTreeItemExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDBtnChoiceClick;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ToDoRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoRefresh;
end;

procedure TfrmSubSystems.ToDoAddExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoAdd;
end;

procedure TfrmSubSystems.ToDoEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoEdit;
end;

procedure TfrmSubSystems.ToDoDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoDelete;
end;

//------------------------------------------------------------------------------

procedure TfrmSubSystems.ComboBoxViewChange(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDViewChange;
end;

procedure TfrmSubSystems.TabSheetMainSubSystemsShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowSubSystem;
end;

procedure TfrmSubSystems.TabSheetToDoShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowToDo;
end;

procedure TfrmSubSystems.TabSheetTuningShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowCfg;
end;

procedure TfrmSubSystems.TabSheetConfsShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowConfigs;
end;

procedure TfrmSubSystems.TabSheetPropsShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowProps;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.TabSheetLinksShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowLinks;
end;

procedure TfrmSubSystems.TabSheetSSObjShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowSubSystemObj;
end;

procedure TfrmSubSystems.TabSheetExplShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowExplorer;
end;

procedure TfrmSubSystems.TabSheetConfDataShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowSubSystemList;
end;

procedure TfrmSubSystems.TabSheetMetObjShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowMDObjList;
end;

procedure TfrmSubSystems.TabSheetExtFrmsShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowExtFrmsList;
end;

//------------------------------------------------------------------------------

procedure TfrmSubSystems.TabSheetAvailableSubSystemsShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowAvailableSubSystems;
end;

procedure TfrmSubSystems.TabSheetShowMDObjShow(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnPageShowMDObjShow;
  end;
end;

//******************************************************************************

procedure TfrmSubSystems.ComboBoxConfigsChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterConfigChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxRelisesChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterReliseChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxSSFilterChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterListChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxDoneChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterDoneChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxStatusChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterStatusChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxUsersChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterParentToDoChange;
    //FEvents.OnToDoFilterUserChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxObjChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterObjTypeChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxForReportChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterForReportChange;
  end;
end;

procedure TfrmSubSystems.ComboBoxSubconfigsChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnToDoFilterChange;
    FEvents.OnToDoFilterSubconfigChange;
  end;
end;
//******************************************************************************

procedure TfrmSubSystems.TemplatesRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesListRefresh;
end;

procedure TfrmSubSystems.TemplatesAddExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesListAdd;
end;

procedure TfrmSubSystems.TemplatesEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesListEdit;
end;

procedure TfrmSubSystems.TemplatesDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesListDelete;
end;

procedure TfrmSubSystems.TemplatesChangeParentExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesListChangeParent;
end;

procedure TfrmSubSystems.TemplatesSetBufferExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesSetBuffer;
end;

//------------------------------------------------------------------------------

procedure TfrmSubSystems.LinksRefreshExecute(Sender: TObject);
begin
  vLinks.Refresh;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.LinksToTextExecute(Sender: TObject);
begin
  vLinks.ListToText;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.TempaltesNewFolderExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesListNewFolder;
end;
//------------------------------------------------------------------------------
//            конец событий
//------------------------------------------------------------------------------

function TfrmSubSystems.Done: HResult; stdcall;
begin
  FConfigurator := nil;
  Result := S_OK;
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetPluginCaps(capNum: PluginCaps; out pResult:
  OleVariant): HResult; //stdcall;
begin
  if capNum = capOpenIn then
    pResult := 1;
  Result := S_OK;
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.DoAction(Action: PluginAction; Param: OleVariant; out
  pResult: OleVariant): HResult; stdcall;
begin
  Result := S_OK;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.GrfNode(vNode: TTreeNode; vImg: Integer);
begin
  vNode.ImageIndex := vImg;
  vNode.SelectedIndex := vImg;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CreateNodes();
var
  vTreeItems: TTreeNodes;
begin
  // создаем ветки дерева, прописываем ссылки на них в списке
  // необходимо чтобы отображать конкретные типы данных
  // отображение будет вестить исходя их корневых объектов дерева конфигурации
  vTreeItems := TreeViewMetadata.Items;
  vNodeConsts := vTreeItems.AddObject(nil, 'Константы', Pointer(0));
  GrfNode(vNodeConsts, GrfConsts);
  vNodeRefs := vTreeItems.AddObject(nil, 'Справочники', Pointer(1));
  GrfNode(vNodeRefs, GrfRefs);
  vNodeDocs := vTreeItems.AddObject(nil, 'Документы', Pointer(2));
  GrfNode(vNodeDocs, GrfDocs);
  vNodeNums := vTreeItems.AddChildObject(vNodeDocs, 'Нумератор',
    Pointer(12));
  GrfNode(vNodeNums, GrfDocs);
  vNodePosled := vTreeItems.AddChildObject(vNodeDocs,
    'Последовательность', Pointer(13));
  GrfNode(vNodePosled, GrfDocs);
  vNodeObrec := vTreeItems.AddChildObject(vNodeDocs,
    'Общие реквизиты', Pointer(15));
  GrfNode(vNodeObrec, GrfObRecs);
  vNodeJournals := vTreeItems.AddObject(nil,
    'Журналы документов', Pointer(3));
  GrfNode(vNodeJournals, GrfJrns);
  vNodeGrfOtb := vTreeItems.AddChildObject(vNodeJournals,
    'Графы отбора', Pointer(14));
  GrfNode(vNodeGrfOtb, GrfObRecs);
  vNodeEnums := vTreeItems.AddObject(nil, 'Перечисления',
    Pointer(4));
  GrfNode(vNodeEnums, GrfEnums);
  vNodeReps := vTreeItems.AddObject(nil, 'Отчеты', Pointer(5));
  GrfNode(vNodeReps, GrfReps);
  vNodeCalcVars := vTreeItems.AddObject(nil, 'Обработки', Pointer(6));
  GrfNode(vNodeCalcVars, GrfCalcVars);
  vNodeRegs := vTreeItems.AddObject(nil, 'Регистры', Pointer(7));
  GrfNode(vNodeRegs, GrfRegs);
  vNodeCalndars := vTreeItems.AddObject(nil, 'Календари', Pointer(8));
  GrfNode(vNodeCalndars, GrfCalndars);
  vNodeKindCalcs := vTreeItems.AddObject(nil, 'Виды расчетов',
    Pointer(9));
  GrfNode(vNodeKindCalcs, GrfKindCalcs);
  vNodeRulesCalc := vTreeItems.AddChildObject(vNodeKindCalcs,
    'Правила пересчета', Pointer(16));
  GrfNode(vNodeRulesCalc, GrfObRecs);
  vNodeGprCalcs := vTreeItems.AddObject(nil, 'Группы расчетов',
    Pointer(10));
  GrfNode(vNodeGprCalcs, GrfGrpCalc);
  vNodeCJ := vTreeItems.AddObject(nil, 'Журналы расчетов',
    Pointer(11));
  GrfNode(vNodeCJ, GrfCJs);
  vNodeAccLists := vTreeItems.AddObject(nil, 'Планы счетов',
    Pointer(17));
  GrfNode(vNodeAccLists, GrfAccLists);
  vNodeRecAccLst := vTreeItems.AddChildObject(vNodeAccLists,
    'Реквизиты плана счетов', Pointer(19));
  GrfNode(vNodeRecAccLst, GrfObRecs);
  vNodeFrmAcclSt := vTreeItems.AddChildObject(vNodeAccLists,
    'Форма списка плана счетов', Pointer(20));
  GrfNode(vNodeFrmAcclSt, GrfDoc);
  vNodeSubcnts := vTreeItems.AddObject(nil, 'Субконто', Pointer(18));
  GrfNode(vNodeSubcnts, GrfSubcnts);
  vNodeOperation := vTreeItems.AddObject(nil, 'Операция', Pointer(-1));
  GrfNode(vNodeOperation, GrfOpers);
  vNodeRecOper := vTreeItems.AddChildObject(vNodeOperation,
    'Реквизиты операциии', Pointer(21));
  GrfNode(vNodeRecOper, GrfOpers);
  vNodeRecProv := vTreeItems.AddChildObject(vNodeOperation,
    'Реквизиты проводок', Pointer(24));
  GrfNode(vNodeRecProv, GrfObRecs);
  vNodeGrfJO := vTreeItems.AddChildObject(vNodeOperation,
    'Графы журнала операций', Pointer(23));
  GrfNode(vNodeGrfJO, GrfObRecs);
  vNodeFrmJO := vTreeItems.AddChildObject(vNodeOperation,
    'Форма журнала операций', Pointer(22));
  GrfNode(vNodeFrmJO, GrfDoc);
  vNodeFrmPorv := vTreeItems.AddChildObject(vNodeOperation,
    'Формы журнала проводок', Pointer(25));
  GrfNode(vNodeFrmPorv, GrfDoc);
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetObjByID(vID, vType: Integer): IMetaDataObj;
var
  i: Integer;
  vMet: IMetaDataObjArray;
begin
  try
    if vType = -1 then
    begin
      Result := nil;
      exit;
    end;
    vMet := FConfigurator.MetaData.TaskDef.Childs[vType];
    for i := 0 to vMet.Count - 1 do
    begin
      if vMet.item[i].id = vId then
      begin
        Result := vMet.item[i];
        Exit;
      end;
    end;
    Result := nil;
  except
    // ничего не делаем
  end;
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.RunSQL(Q: TADOQuery; T: string; CommandGo: Integer = 0;
  pParams: TStringList = nil): TADOQuery;
var
  vQ: TADOQuery;
  i: integer;
begin
  //  Debug(T);
    //echo(T);
  if Q = nil then
  begin
    vQ := TADOQuery.Create(nil);
    Q := vQ;
  end;
  with Q do
  begin
    Close;
    Connection := SubSystemConnection;
    Close;
    SQL.Clear;
    SQL.Add(T);

    if pParams <> nil then
    begin
      Parameters.Clear;
      for i := 0 to pParams.Count - 1 do
      begin
        Parameters[i].Value := pParams.ValueFromIndex[i];
      end;
    end;

    if CommandGo = 0 then
      Open;
    if CommandGo = 1 then
      ExecSQL;
  end;
  Result := Q;
end;
//------------------------------------------------------------------------------
// заполняет список подсистемами объекта
// используется во многих местах

procedure TfrmSubSystems.FullListSubSystems(vList: TListView; vCfgID: Integer =
  0; vSubcongID: Integer = 0);
var
  Q: TADOQuery;
  vSQLText: string;
begin
  if vCfgID = 0 then
    vCfgID := CurCfg;

  //ShowMessage(IntToStr(vCfgID));

  vList.Items.BeginUpdate();
  vList.Items.Clear();
  vSQLText := 'select SS.ID,SS.Name,SC.Name from SubSystems SS '
    + ' left join subconfigs SC on (SS.SubconfigID=SC.ID) '
    + ' where (SS.ConfigID = '
    + IntToStr(vCfgID) +
    ')';
  if vSubcongID <> 0 then
    vSQLText := vSQLText + ' and ((SS.SubconfigID = ' + IntToStr(vSubcongID) +
      ') or (SS.SubconfigID = 0))';
  Q := RunSQL(nil, vSQLText, 0);
  Q.First;
  while not Q.Eof do
  begin
    vSQLText := Trim(Q.Fields[1].AsString);
    if Trim(Q.Fields[2].AsString) <> '' then
      vSQLText := vSQLText + ' (' + Trim(Q.Fields[2].AsString) + ')';
    vList.AddItem(vSQLText, Pointer(Q.FieldByName('ID').asInteger));
    Q.Next;
  end; // while not Q.Eof do begin
  vList.Items.EndUpdate();
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ShowSubSystems(vList: TListView; vKind: Integer; vRef,
  vField, vValue: string);
var
  Q: TADOQuery;
  i: integer;
  vVal: string;
  vSQLText: string;
begin
  try
    if vValue <> '' then
      vVal := vValue
    else
      vVal := IntToStr(vKind);

    vList.Items.BeginUpdate();
    vList.Items.Clear();

    vSQLText := 'select SS.ID as [ID],SS.Name as [Name],SC.Name as [CfgName] from SubSystems SS '
      + ' left join subconfigs SC on (SS.SubconfigID=SC.ID) '
      + ' where (SS.ConfigID = ' + IntToStr(CurCfg) + ')';

    Q := RunSQL(nil, vSQLText, 0);
    Q.First;
    while not Q.Eof do
    begin

      vSQLText := Trim(Q.Fields[1].AsString);
      if Trim(Q.Fields[2].AsString) <> '' then
        vSQLText := vSQLText + ' (' + Trim(Q.Fields[2].AsString) + ')';
      vList.AddItem(vSQLText, TObject(Q.FieldByName('ID').asInteger));

      //      vList.AddItem(Q.FieldValues['Name'],
      //        TObject(Q.FieldByName('ID').asInteger));
      Q.Next;
    end;
    Q := RunSQL(nil,
      'select SubSystemID from ' + vRef + ' where (' + vField + ' = '
      + vVal
      + ') and SubSystemID IN (Select ID from SubSystems where ConfigID = '
      + IntToStr(CurCfg) + ')'
      , 0);
    Q.First;
    while not Q.Eof do
    begin
      for i := 0 to vList.Items.Count - 1 do
      begin
        if Integer(vList.Items.Item[i].Data) = Q.Fields[0].AsInteger then
        begin
          vList.Items.Item[i].Checked := True;
        end;
      end;
      Q.Next;
    end;
  except
    // ничего не делаем :)
  end;
  vList.Items.EndUpdate();
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.SaveSubSystems(vList: TListView; vTreeNode: TTreeNode);
var
  i: integer;
  CurItm: TListItem;
  Q: TADOQuery;
  CurSubSystemID: Integer;
  CurMetObj: TTreeNode;
begin
  // SubSystemID, ObjType, ObjKind
  Q := RunSQL(nil,
    'select * from SubSystemObjects where ObjKind = '
    + IntToStr(Integer(vTreeNode.data))
    + ' and (SubSystemID in (select ID from SubSystems where ConfigID = ' +
    IntTOStr(CurCfg) + '))'
    , 0);
  for i := 0 to vList.Items.Count - 1 do
  begin
    CurItm := vList.Items.Item[i];
    CurSubSystemID := Integer(CurItm.Data);
    CurMetObj := vTreeNode;
    if CurItm.Checked = False then
    begin
      RunSQL(nil,
        'DELETE from SubSystemObjects where SubSystemID = '
        + IntToStr(CurSubSystemID)
        + ' and ObjKind = '
        + IntToStr(Integer(CurMetObj.data)),
        1);
    end
    else
    begin
      if Q.Locate('SubSystemID', CurSubSystemID, [loCaseInsensitive]) = False
        then
      begin
        with Q do
        begin
          Insert();
          FieldByName('SubSystemID').AsInteger := CurSubSystemID;
          FieldByName('ObjType').AsInteger := Integer(CurMetObj.Parent.Data);
          FieldByName('ObjKind').AsInteger := Integer(CurMetObj.Data);
          Post();
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.tvMetadataDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDNodeDblClick();
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.tvMetadataClick(Sender: TObject);
//var
//  s: string;
begin
  if FEvents <> nil then
    FEvents.OnMDNodeClick;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.tvMetadataCompare(Sender: TObject; Node1,
  Node2: TTreeNode; Data: Integer; var Compare: Integer);
var
  vDop: Boolean;
begin
  try
    if Node2.Level <> 0 then
    begin
      vDop := PMyRec(Node2.Data).fext < PMyRec(Node1.Data).fext;
      Compare := Integer(vDop);
    end;
  except
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewConfigsEdited(Sender: TObject;
  Item: TListItem; var S: string);
var
  Q: TADOQuery;
begin
  Q := RunSQL(nil, 'select * from Configs where ID=' +
    IntToStr(Integer(Item.Data)), 0);
  with Q do
  begin
    Edit;
    FieldByName('Name').AsString := S;
    post;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.PropsValueListEditorClick(Sender: TObject);
begin
  if PropsValueListEditor.Strings.Count <> 0 then
    Memo1.Lines.Text :=
      PropsValueListEditor.Strings.ValueFromIndex[PropsValueListEditor.Row - 1];
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewSubSystemsListEdited(Sender: TObject;
  Item: TListItem; var S: string);
begin
  RunSQL(nil,
    'Update SubSystems Set Name = ' + DBInvCom + s
    + DBInvCom + ' where ID=' + IntToStr(Integer(Item.Data)), 1);
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ShellTreeView1DblClick(Sender: TObject);
begin
//  ShellTreeView1.SelectedFolder.ExecuteDefault;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetShowSubSystemsObjExecute(Sender: TObject);
begin
  try
    if TreeViewMetadata.Selected <> nil then
      ShowSubSystems(ListViewIncludeSubSystems,
        PMyRec(TreeViewMetadata.Selected.Data).ObjKind, 'SubSystemObjects',
        'ObjKind', '');
  except
    // to do nothing
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgMetShowSubSystemsExecute(Sender: TObject);
begin
  if TreeViewConfigMatadata.Selected <> nil then
    if TreeViewConfigMatadata.Selected.Parent <> nil then
      ShowSubSystems(ListViewConfigMetadata,
        Integer(TreeViewConfigMatadata.Selected.Data), 'SubSystemObjects',
        'ObjKind', '')
    else
      ListViewConfigMetadata.items.Clear;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.CfgMetSaveSubSystemsExecute(Sender: TObject);
var
  i: Integer;
begin
  if TreeViewConfigMatadata.Selected <> nil then
    for i := 0 to TreeViewConfigMatadata.SelectionCount - 1 do
    begin
      SaveSubSystems(ListViewConfigMetadata,
        TreeViewConfigMatadata.Selections[i]);
    end;
end;

//------------------------------------------------------------------------------

procedure TfrmSubSystems.ExtFrmSaveSubSystemsExecute(Sender: TObject);
var
  i: integer;
  CurItm: TListItem;
  Q: TADOQuery;
  CurSubSystemID: Integer;
  CurMetObj: TListItem;
  vList: TListView;
begin
  // SubSystemID, ExtRecID
  Q := RunSQL(nil,
    'select * from SubSystemsExtFilesObjects where ExtRecID = '
    + IntToStr(Integer(ListViewExtForms.Selected.data))
    + ' and (SubSystemID in (select ID from SubSystems where ConfigID = ' +
    IntTOStr(CurCfg) + '))'
    , 0);
  vList := ListViewConfigMetadata;
  for i := 0 to vList.Items.Count - 1 do
  begin
    CurItm := vList.Items.Item[i];
    CurSubSystemID := Integer(CurItm.Data);
    CurMetObj := ListViewExtForms.Selected;
    if CurItm.Checked = False then
    begin
      RunSQL(nil,
        'DELETE from SubSystemsExtFilesObjects where SubSystemID = '
        + IntToStr(CurSubSystemID)
        + ' and ExtRecID = '
        + IntToStr(Integer(CurMetObj.data)),
        1);
    end
    else
    begin
      if Q.Locate('SubSystemID', CurSubSystemID, [loCaseInsensitive]) = False
        then
      begin
        with Q do
        begin
          Insert();
          FieldByName('SubSystemID').AsInteger := CurSubSystemID;
          FieldByName('ExtRecID').AsInteger := Integer(CurMetObj.Data);
          Post();
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.TreeViewConfigMatadataClick(Sender: TObject);
begin
  CfgMetShowSubSystemsExecute(CfgMetShowSubSystems);
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewExtFormsClick(Sender: TObject);
begin
  ExtFrmShowSubSystemsExecute(ExtFrmShowSubSystems);
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.TreeViewConfigMatadataChange(Sender: TObject;
  Node: TTreeNode);
begin
  CfgMetShowSubSystemsExecute(CfgMetShowSubSystems);
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewToDoCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if (Item.ImageIndex = 5) then
  begin
    ListViewToDo.Canvas.Font.Color := clGray;
    ListViewToDo.Canvas.Font.Style :=
      ListViewToDo.Canvas.Font.Style + [fsStrikeOut];
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewToDoDblClick(Sender: TObject);
begin
  ToDoEditExecute(ToDoEdit);
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewConfigMetadataMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
  HitTest: THitTests;
begin
  Item := ListViewConfigMetadata.GetItemAt(x, y);
  HitTest := ListViewConfigMetadata.GetHitTestInfoAt(x, y);
  if (Item <> nil) and (HitTest = [htOnStateIcon]) then
  begin
    Item.Selected := True;
    if PageControlConfig.ActivePage = TabSheetMetObj then
      CfgMetSaveSubSystemsExecute(CfgMetSaveSubSystems);
    if PageControlConfig.ActivePage = TabSheetExtFrms then
      ExtFrmSaveSubSystemsExecute(ExtFrmSaveSubSystems);
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewToDoColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  SortColumn := Column.Index;
  ListViewToDo.AlphaSort;
end;

procedure TfrmSubSystems.ListViewToDoCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
    Compare := CompareText(Item1.SubItems[SortColumn - 1],
      Item2.SubItems[SortColumn - 1]);
end;

//------------------------------------------------------------------------------
//                функции/процедуры для скриптов
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetSubSystemsObjShow;
begin
  MetShowSubSystemsObjExecute(MetShowSubSystemsObj);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure TfrmSubSystems.GoToSheet(const vSheet: WideString);
var
  vName: string;
begin
  vName := LowerCase(vSheet);

  if Pos(vName, VisTabs) = 0 then
    VisTabs := VisTabs + ',' + vName;

  if vName = 'subsystems' then
  begin
    TabSheetMainSubSystems.Show;
    TabSheetMainSubSystems.TabVisible := true;
    //TabSheetMainSubSystems.SetFocus;
  end;
  if vName = 'tuning' then
  begin
    TabSheetTuning.Show;
    TabSheetTuning.TabVisible := true;
    //TabSheetTuning.SetFocus;
  end;
  if vName = 'confdata' then
  begin
    TabSheetConfData.Show;
    TabSheetConfData.TabVisible := true;
    //TabSheetConfData.SetFocus;
  end;
  if vName = 'metobj' then
  begin
    TabSheetMetObj.Show;
    TabSheetMetObj.TabVisible := true;
    //TabSheetMetObj.SetFocus;
  end;
  if vName = 'extfrms' then
  begin
    TabSheetExtFrms.Show;
    TabSheetExtFrms.TabVisible := true;
    //TabSheetExtFrms.SetFocus;
  end;
  if vName = 'relises' then
  begin
    TabSheetRelises.Show;
    TabSheetRelises.TabVisible := true;
  end;
  if vName = 'statuses' then
  begin
    TabSheetStatuses.Show;
    TabSheetStatuses.TabVisible := true;
  end;
  if vName = 'confs' then
  begin
    TabSheetConfs.Show;
    TabSheetConfs.TabVisible := true;
    //TabSheetConfs.SetFocus;
  end;
  if vName = 'todo' then
  begin
    TabSheetToDo.Show;
    TabSheetToDo.TabVisible := true;
    //TabSheetToDo.SetFocus;
  end;
  if vName = 'props' then
  begin
    TabSheetProps.Show;
    TabSheetProps.TabVisible := true;
    //TabSheetProps.SetFocus;
  end;
  if vName = 'ssobj' then
  begin
    TabSheetSSObj.Show;
    TabSheetSSObj.TabVisible := true;
    //TabSheetSSObj.SetFocus;
  end;
  if vName = 'expl' then
  begin
    TabSheetExpl.Show;
    TabSheetExpl.TabVisible := true;
    //TabSheetExpl.SetFocus;
  end;
  if vName = 'links' then
  begin
    TabSheetLinks.Show;
    TabSheetLinks.TabVisible := true;
    //TabSheetLinks.SetFocus;
  end;
  if vName = 'objshowing' then
  begin
    TabSheetShowMDObj.Show;
    TabSheetShowMDObj.TabVisible := true;
    //TabSheetShowMDObj.SetFocus;
  end;
  if vName = 'avlbss' then
  begin
    TabSheetAvailableSubSystems.Show;
    TabSheetAvailableSubSystems.TabVisible := true;
    //TabSheetAvailableSubSystems.SetFocus
  end;
  if vName = 'templates' then
  begin
    TabSheetTemplates.Show;
    TabSheetTemplates.TabVisible := true;
    //TabSheetTemplates.SetFocus;
  end;
  if vName = 'note' then
  begin
    TabSheetNote.Show;
    TabSheetNote.TabVisible := true;
    //TabSheetTemplates.SetFocus;
  end;
  if vName = 'notelist' then
  begin
    TabSheetNoteList.Show;
    TabSheetNoteList.TabVisible := true;
    //TabSheetTemplates.SetFocus;
  end;

  if vName = 'todoobj' then
  begin
    tsToDoObj.Show;
    tsToDoObj.TabVisible := true;
    //TabSheetTemplates.SetFocus;
  end;

  if vName = 'mdobjblocks' then
  begin
    tsMDObjBlocks.Show;
    tsMDObjBlocks.TabVisible := true;
    //TabSheetTemplates.SetFocus;
  end;

  if vName = 'logedits' then
  begin
    tsEditLog.Show;
    tsEditLog.TabVisible := true;
    //TabSheetTemplates.SetFocus;
  end;

end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetCurrentPage: WideString;
begin
  if PageControlSubSystems.ActivePage = TabSheetMainSubSystems then
  begin
    if PageControlSubSystemsProps.ActivePage = TabSheetProps then
      Result := 'subsystems\props'
    else if PageControlSubSystemsProps.ActivePage = TabSheetLinks then
      Result := 'subsystems\links'
    else if PageControlSubSystemsProps.ActivePage = TabSheetSSObj then
      Result := 'subsystems\ssobj'
    else if PageControlSubSystemsProps.ActivePage = TabSheetExpl then
      Result := 'subsystems\expl'
    else if PageControlSubSystemsProps.ActivePage = TabSheetAvailableSubSystems
      then
      Result := 'subsystems\avlbss'
    else if PageControlSubSystemsProps.ActivePage = TabSheetShowMDObj then
      Result := 'subsystems\objshowing'
    else if PageControlSubSystemsProps.ActivePage = TabSheetNote then
      Result := 'subsystems\note'
    else if PageControlSubSystemsProps.ActivePage = TabSheetNoteList then
      Result := 'subsystems\notelist'
    else if PageControlSubSystemsProps.ActivePage = tsToDoObj then
      Result := 'subsystems\todoobj'
    else if PageControlSubSystemsProps.ActivePage = tsMDObjBlocks then
      Result := 'subsystems\mdobjblocks'
    else if PageControlSubSystemsProps.ActivePage = tsEditLog then
      Result := 'subsystems\logedits'

  end;
  if PageControlSubSystems.ActivePage = TabSheetTuning then
  begin
    if PageControlConfig.ActivePage = TabSheetConfData then
      Result := 'confdata';
    if PageControlConfig.ActivePage = TabSheetMetObj then
      Result := 'metobj';
    if PageControlConfig.ActivePage = TabSheetExtFrms then
      Result := 'extfrms';
    if PageControlConfig.ActivePage = TabSheetRelises then
      Result := 'relises';
    if PageControlConfig.ActivePage = TabSheetStatuses then
      Result := 'statuses';
  end;
  if PageControlSubSystems.ActivePage = TabSheetConfs then
    Result := 'confs';
  if PageControlSubSystems.ActivePage = TabSheetToDo then
    Result := 'todo';
  if PageControlSubSystems.ActivePage = TabSheetTemplates then
    Result := 'templates';
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//                  возврат строки SQL соединения

function GetParam(str, ParamName: string): string;
var
  i: integer;
  temp: string;
begin
  //возвращаем значение параметра по его имени.
  Result := '';
  i := Pos(ParamName, str);
  if i = 0 then
    Exit;
  temp := copy(str, i + Length(ParamName) + 2, Length(str));
  i := Pos('"', temp);
  if i = 0 then
    Exit;
  Result := Copy(temp, 1, i - 1);
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetSQLConnectionString: WideString;
const
  key = '19465912879oiuxc ensdfaiuo3i73798kjl';
var
  CurByte: byte;
  f: TFileStream;
  mem: TMemoryStream;
  size: integer;
  hash: char;
  ResStr: string;
  //vStr: WideString;
  vFileDBA: string;
begin
  //очистим старую инфу
  ResStr := '';
  vFileDBA := IncludeTrailingBackslash(FConfigurator.IBDir) +
    LowerCase('1Cv7.DBA');
  //анализируем файл
  if not (FileExists(vFileDBA)) then
  begin
    Result := '';
    exit;
  end;
  try
    f := TFileStream.Create(vFileDBA, fmOpenRead or fmShareDenyWrite);
    mem := TMemoryStream.Create;
    mem.LoadFromStream(f);
    size := mem.Size;
    mem.Position := 0;
    while mem.Position < Size do
    begin
      CurByte := PByte(Integer(Mem.Memory) + mem.Position)^;
      //вычислим хэш-символ
      hash := key[(mem.position mod 36) + 1];
      ResStr := ResStr + char(CurByte xor ord(hash));
      mem.Position := mem.Position + 1;
    end;
    //теперь парсим расшифрованную строку
    Result := ''
      + '"Server=' + GetParam(ResStr, '{"Server"') + '";'
      + '"DB=' + GetParam(ResStr, '{"DB"') + '";'
      + '"UID=' + GetParam(ResStr, '{"UID"') + '";'
      + '"PWD=' + GetParam(ResStr, '{"PWD"') + '";'
      + '"Checksum=' + GetParam(ResStr, '{"Checksum"') + '"';
  finally
    if Assigned(f) then
      f.Free;
    if Assigned(mem) then
      mem.Free;
  end;
end;
//------------------------------------------------------------------------------
//          конец возврата строки SQL соединения
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ShowSubsystemByObj;
begin
  try
    if TreeViewMetadata.Selected <> nil then
      ShowSubSystems(ListViewIncludeSubSystems,
        PMyRec(TreeViewMetadata.Selected.Data).ObjKind, 'SubSystemObjects',
        'ObjKind', '');
  except
    // nothing
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ActiveFormActivate(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------

function TfrmSubSystems.VisibleTabsEx: Boolean;
var
  t: TStringList;
  I: Integer;
begin
  Result := false;
  t := TStringList.create; //создаём класс
  t.text :=
    stringReplace('props,links,ssobj,expl,avlbss,objshowing,mdobjblocks,logedits,todoobj,note', ',',
    #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    if Pos(T[i], VisTabs) <> 0 then
      Result := true;
  end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TfrmSubSystems.TreeViewTemplatesDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  Node, SelNode: TTreeNode;
begin
  Node := TreeViewTemplates.GetNodeAt(x, y);
  Accept := (Sender = Source) and (Node <> nil);
  if not Accept then
    Exit;
  SelNode := TreeViewTemplates.Selected;
  while (Node.Parent <> nil) and (Node <> SelNode) do
  begin
    Node := Node.Parent;
    if Node = SelNode then
      Accept := False;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.TreeViewTemplatesDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  Node, SelNode: TTreeNode;
  //  S: string;
  //  I: Integer;
  vID: Integer;
begin
  Node := TreeViewTemplates.GetNodeAt(X, Y);
  if Node = nil then
    Exit;
  SelNode := TreeViewTemplates.Selected;
  if Node = SelNode then
    exit;
  if Node.ImageIndex <> GrfFldr then
    Node := Node.Parent;
  SelNode.MoveTo(Node, naAddChild);
  if Node.ImageIndex = GrfFldr then
    vID := PTreeViewData(Node.Data).ID
  else
    vID := PTreeViewData(Node.Data).ParentID;
  RunSQL(nil, 'Update Templates Set ParentID=' + IntToStr(vID) + ' where ID=' +
    IntToStr(PTreeViewData(SelNode.Data).ID), 1);
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.TreeViewTemplatesDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTemplatesListEdit;
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetSpecialFolderPath(var SPFolder: WideString):
  WideString;
var
  Reg: TRegistry;
begin
  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    if
      Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', false) then
      Result := Reg.ReadString(SPFolder)
    else
      Result := '';
  finally
    Reg.Free;
  end;
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetCurrentDBUserNames: WideString;
var
  vList: TStringList;
  vFileName: string;
begin
  vFileName := IncludeTrailingBackslash(FConfigurator.IBDir) +
    'usrdef\users.usr';
  if FileExists(vFileName) then
  begin
    vList := ReadUsersList(vFileName);
    Result := vList.CommaText;
  end;
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetDBUserNames(var UsersListFile: WideString):
  WideString;
var
  vList: TStringList;
  vFileName: string;
begin
  vFileName := UsersListFile;
  if FileExists(vFileName) then
  begin
    vList := ReadUsersList(vFileName);
    Result := vList.CommaText;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.MetDelCurrentErrorExecute(Sender: TObject);
begin
  //MetDelCurrentErr;
  //ShowMessage('Предусмотреть вызов процедуры');
  vMDTree.DeleteCurrentError;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ShowOptionsWndExecute(Sender: TObject);
begin
  vOptions.Show;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ToDoMarks(vList: TListView; vVar: Integer);
var
  i: integer;
begin
  for i := 0 to vList.Items.Count - 1 do
  begin
    case vVar of
      0: vList.Items.Item[i].Checked := False;
      1: vList.Items.Item[i].Checked := True;
      2:
        begin
          if vList.Items.Item[i].Checked then
            vList.Items.Item[i].Checked := False
          else
            vList.Items.Item[i].Checked := True
        end;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.OnMDSubSystemsListRefreshEvent;
begin
  ShowMessage('Плагин');
end;
//------------------------------------------------------------------------------

function TfrmSubSystems.GetMDTree: IMDTree;
begin
  Result := vMDTree;
  Result._AddRef;
  // без этой строки не освобождается память
end;
//

function TfrmSubSystems.GetAvailableSubSystems: IAvailableSubSystems;
begin
  Result := vAvSS;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetCfgList: ICfgList;
begin
  Result := vCfgLst;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetExtFrmsList: IExtFrmsList;
begin
  Result := vExtFrmsLst;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetLinks: ILinks;
begin
  Result := vLinks;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetObjectClasses: IObjectClasses;
begin
  Result := vObjClasses;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetTemplates: ITemplates;
begin
  Result := vTemplates;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetToDoList: IToDoList;
begin
  Result := vToDoLst;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetTuningMDObj: ITuningMDObj;
begin
  Result := vTuningMDObj;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetTuningSubSystemsList: ITuningSubSystemsList;
begin
  Result := vTuningSSLst;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetOptions: IOptions;
begin
  Result := vOptions;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetBookmarks: IBookmarks;
begin
  Result := vBookmarks;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetObjectNote: IObjectNote;
begin
  Result := vNote;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetObjectNoteList: IObjectNoteList;
begin
  Result := vNoteList;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetRelisesList: IRelises;
begin
  Result := vRelisesList;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetStatusList: IStatusList;
begin
  Result := vStatusList;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetSubconfigsList: ISubconfigs;
begin
  Result := vSubcfg;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetUsersList: IListUsers;
begin
  Result := vUsersList;
  Result._AddRef;
  // без этой строки не освобождается память
end;

function TfrmSubSystems.GetListCategoryes: IListCategoryes;
begin
  Result := vListCategoryes;
  Result._AddRef;
end;

function TfrmSubSystems.GetListSeriousnes: IListSeriousness;
begin
  Result := vListSeriousnes;
  Result._AddRef;
end;

function TfrmSubSystems.GetListToDoCols: IToDoViewColumns;
begin
  Result := vListToDoCols;
  Result._AddRef;
end;

function TfrmSubSystems.GetListMDObjBlocks: IMDObjBlocks;
begin
  Result := vMDObjBlocks;
  Result._AddRef;
end;

function TfrmSubSystems.GetDBChangeLog: IDBChangesLog;
begin
  Result := vDBChangesLog;
  Result._AddRef;
end;

{
function TfrmSubSystems.GetHistory: IHistory;
begin
  Result := vHistory;
  Result._AddRef; // без этой строки не освобождается память
end;
 }

{
function TfrmSubSystems.GetTest: ITestMy;
var
  T : TTestMy;
begin
  T := TTestMy.Create;
  Result := T;
  Result._AddRef; // без этой строки не освобождается память
end;

 А кстати, если ты к скрипту добавишь именнованный объект,
типа Self.AddnameItem "MDTree", MDTree
тогда
заработает конструкция
Sub MDTree_OnRferesh()
End Sub

if FEvents <> nil then begin
  try
    // TODO : Если обработчиков события уже нет, возникает ошибка!
    v := bFlagSaveSettings;
    FEvents.OnBeforeSaveSettings(SettingsString, v);
    bFlagSaveSettings := v;
  except
    on E:Exception do begin
      s := 'История: вызов обработчиков события OnBeforeSaveSettings неудачен'#13#10+
        'Возникло исключение:'#13#10+E.Message;
      if FDebugFlag then ShowMessage(s);
    end;
  end;
end;

OnMDSubSystemsListRefresh

 }

procedure TfrmSubSystems.ExtFrmShowSubSystemsExecute(Sender: TObject);
begin
  vExtFrmsLst.ShowSubSystems;
end;

procedure TfrmSubSystems.ToolButton28Click(Sender: TObject);
var
  s: string;
begin
  if FEvents <> nil then
  begin
    try
      FEvents.OnMDSubSystemsListRefresh;
    except
      on E: Exception do
      begin
        s := 'Подсистемы: вызов обработчиков события OnMDNodeDblClick неудачен'#13#10
          +
          'Возникло исключение:'#13#10 + E.Message;
        Echo(s);
      end;
    end;
  end
  else
  begin
    ShowMessage('в скрипте нету!');
    //vAvSS.Refresh;
  end;
end;

procedure TfrmSubSystems.NewObjExecute(Sender: TObject);
begin
  FConfigurator.SendCommand(33710);
end;

procedure TfrmSubSystems.DeleteObjExecute(Sender: TObject);
begin
  FConfigurator.SendCommand(33709);
end;

procedure TfrmSubSystems.TreeViewLinksDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnLinksChoiceObj;
end;

procedure TfrmSubSystems.ShowBookmarksExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnShowBookmarks;
end;

procedure TfrmSubSystems.SetOptionsByNameExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSetSavedOptionsByName;
end;

procedure TfrmSubSystems.SaveOptionsByNameExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnSaveOptionsByName;
end;

procedure TfrmSubSystems.OnMDNodeClickEvent(InScript: Boolean = true);
begin
  //if FEvents <> nil then FEvents.OnSaveOptionsByName;
  if FEvents <> nil then
  begin // самое главное
    //v := bFlagSaveSettings;
    try
      //FEvents.OnBeforeSaveSettings(SettingsString, v);
      //bFlagSaveSettings := v;
      if InScript = false then
        ShowMessage('from me plugin');
    except
      on E: Exception do
        if FDebugFlag then
          ShowMessage('типа ошибочка вышла');
    end;
  end;

end;
{

OnBeforeRestoreSettingsEvent
begin
if FEvents <> nil then begin // самое главное
    v := bFlagSaveSettings;
    try
    // TODO : Если обработчиков события уже нет, возникает ошибка!
    FEvents.OnBeforeSaveSettings(SettingsString, v);
     bFlagSaveSettings := v;
    except
      on E:Exception do
       if FDebugFlag then ShowMessage(s);
    end;
  end;
end;
//-----
procedure THistory_ActiveFormX.RestoreSettings;
var
  bRestoreSettings: WordBool;
  HistoryListString: WideString;
  s: string;
begin
  try
    bRestoreSettings := true;
    OnBeforeRestoreSettingsEvent(HistoryListString, bRestoreSettings);
    if not bRestoreSettings then begin
      // скрипты сделали что нужно
    end
    else begin
      // работае плагин
    end;
  except
    on E: Exception do begin
      s := 'История: восстановление данных истории завер
        artbear(15: 09):
      шилось неудачей'#13#10+
        'Возникло исключение:'#13#10 + E.Message;
      if FDebugFlag then ShowMessage(s);
    end;
  end;
end;
}

procedure TfrmSubSystems.BookmarkNewExecute(Sender: TObject);
begin
  vBookmarks.Add;
end;

procedure TfrmSubSystems.BookmarkDeleteExecute(Sender: TObject);
begin
  vBookmarks.Delete;
end;

procedure TfrmSubSystems.BookmarkNextExecute(Sender: TObject);
begin
  vBookmarks.Next;
end;

procedure TfrmSubSystems.BookmarkPreviosExecute(Sender: TObject);
begin
  vBookmarks.Previos;
end;

procedure TfrmSubSystems.ActiveFormCreate(Sender: TObject);
begin
  CF_DDGData := RegisterClipboardFormat(DDGData);
end;

procedure TfrmSubSystems.ToolButton37Click(Sender: TObject);
var
  v: WideString;
begin
  v := '';
  vToDoLst.SaveToFile(v);
end;

procedure TfrmSubSystems.TabSheetNoteShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowObjectNote;
end;

procedure TfrmSubSystems.NoteOpenCardExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteOpenCard;
end;

procedure TfrmSubSystems.NoteDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteDelete;
end;

procedure TfrmSubSystems.NoteSaveFileExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteSaveToFile;
end;

procedure TfrmSubSystems.NoteLoadFromFileExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteLoadFromFile;
end;

procedure TfrmSubSystems.NoteRefreshCurrentExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteRefresh;
end;

procedure TfrmSubSystems.NoteListRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteListRefresh;
end;

procedure TfrmSubSystems.NoteListOpenExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteListOpen;
end;

procedure TfrmSubSystems.NoteListDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteListDelete
end;

procedure TfrmSubSystems.NoteListSaveToFileExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteListSaveToFile;
end;

procedure TfrmSubSystems.TabSheetNoteListShow(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPageShowObjectNoteList;
end;

procedure TfrmSubSystems.ListViewLNotesListDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteListDblClick
end;

procedure TfrmSubSystems.TreeViewConfigMatadataDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTuningMDObjDblClick;
end;

procedure TfrmSubSystems.PanelHeaderClick(Sender: TObject);
var
  h: Integer;
begin
  h := 17;
  if vToDoLst.GetMaxListConditionsSize = 0 then
    vToDoLst.SetMaxListConditionsSize(h);
  PageControl1.Constraints.MinHeight := 17;
  if PanelHeader.Tag = 0 then
  begin
    //PageControl1.Constraints.MinHeight := 80;
    PanelDetails.Constraints.MinHeight := 80;
    PanelDetails.Height := vToDoLst.GetMaxListConditionsSize;
    PanelHeader.Tag := 1;
  end
  else
  begin

    PanelDetails.Constraints.MinHeight := 17;
    PanelDetails.Height := 17;
    PanelHeader.Tag := 0;
  end;
end;
//------------------------------------------------------------------------------
// блок вызова процедур для управления списком релизов

procedure TfrmSubSystems.ReliseRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTuningRelisesRefresh;
end;

procedure TfrmSubSystems.ReliseAddExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTuningRelisesAdd;
end;

procedure TfrmSubSystems.ReliseEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTuningRelisesEdit;
end;

procedure TfrmSubSystems.ReliseDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTuningRelisesDelete;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.ListViewRelisesDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnTuningRelisesEdit;
end;

function TfrmSubSystems.GetToDoObjName: WideString;
begin
  Result := vToDoObjName;
end;

procedure TfrmSubSystems.PanelCaptionClick(Sender: TObject);
begin
  if PanelPlace = 1 then
  begin
    if PanelCaption.Tag = 0 then
    begin
      Panel2.Height := 250;
      PanelCaption.Tag := 1;
    end
    else
    begin
      Panel2.Height := 17;
      PanelCaption.Tag := 0;
    end;
  end;
end;

procedure TfrmSubSystems.ListViewToDoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    vToDoLst.Edit;
  end;

  if Key = VK_INSERT then
  begin
    vToDoLst.New;
  end;

  if Key = VK_DELETE then
  begin
    vToDoLst.Delete;
  end;

end;

procedure TfrmSubSystems.StatusesRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnStatusListRefresh;
end;

procedure TfrmSubSystems.StatusesAddExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnStatusListAdd;
end;

procedure TfrmSubSystems.StatusesEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnStatusListEdit;
end;

procedure TfrmSubSystems.StatusesDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnStatusListDelete;
end;

procedure TfrmSubSystems.ListViewStatusesDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnStatusListEdit;
end;

procedure TfrmSubSystems.SubConfAddExecute(Sender: TObject);
begin
  vSubcfg.Add;
end;

procedure TfrmSubSystems.SubConfEditExecute(Sender: TObject);
begin
  vSubcfg.Edit;
end;

procedure TfrmSubSystems.SubConfDeleteExecute(Sender: TObject);
begin
  vSubcfg.Delete;
end;

procedure TfrmSubSystems.SubConfRefreshExecute(Sender: TObject);
begin
  if ListViewConfigs.Selected <> nil then
    vSubcfg.Refresh(Integer(ListViewConfigs.Selected.Data));
end;

procedure TfrmSubSystems.ListViewSubconfigsDblClick(Sender: TObject);
begin
  SubConfEditExecute(Sender);
end;

procedure TfrmSubSystems.SubConfChoiceExecute(Sender: TObject);
begin
  vSubcfg.Choice;
end;

procedure TfrmSubSystems.ListViewConfigsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  {
    if Item <> nil then
      vSubcfg.Refresh(Integer(Item.Data));
      }
end;

procedure TfrmSubSystems.ListViewSubSystemsListDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCfgSubSystemsEdit;
end;

function TfrmSubSystems.GetItemID(vList: TComboBox): Integer;
var
  vStrID: string;
begin
  if vList = nil then
  begin
    Result := 0;
    exit;
  end;
  if vList.ItemIndex <> 0 then
  begin
    vStrID := copy(vList.Text, Pos('(', vList.Text) + 1, Pos(')',
      vList.Text) - 2);
    if vStrID = '' then
      vStrID := '0';
    Result := StrToInt(vStrID);
  end
  else
    Result := 0;
end;

function TfrmSubSystems.GetIDFromStr(const vStr: WideString): WideString;
//safecall;
//function TfrmSubSystems.GetIDFromStr(vStr: WideString): WideString;
var
  vStrID: string;
begin
  Result := '0';
  if vStr = '' then
    exit;
  vStrID := copy(vStr, Pos('(', vStr) + 1, Pos(')', vStr) - 2);
  if vStrID = '' then
    vStrID := '0';
  Result := vStrID;
end;

procedure TfrmSubSystems.ComboBoxSubconfigsOnASLChange(Sender: TObject);
begin
  if FEvents <> nil then
  begin
    FEvents.OnAviliableSubsystemsSubconfigChange;
  end;
end;

procedure TfrmSubSystems.ListViewConfigsDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnConfigsEdit;
end;
//------------------------------------------------------------------------------

procedure TfrmSubSystems.UsersRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnUsersListRefresh;
end;

procedure TfrmSubSystems.UsersNewExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnUsersListNew;
end;

procedure TfrmSubSystems.UsersEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnUsersListEdit;
end;

procedure TfrmSubSystems.UsersDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnUsersListDelete;
end;

procedure TfrmSubSystems.ListViewUsersDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnUsersListDblClick;
end;

procedure TfrmSubSystems.ComboBoxSubconfigsOnULChange(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnUsersListChangeSubConfig;
end;

function TfrmSubSystems.GetNameByID(vID: SYSINT; vStr: string): WideString;
begin
  Result := RunSQL(nil, 'Select Name from ' + vStr + ' where ID = ' +
    IntToStr(vID), 0).Fields[0].AsString;
end;

function TfrmSubSystems.GetLinksText(vTable, vField, vType, vID: string):
  string;
var
  Q: TADOQuery;
begin
  Result := '';
  Q := RunSQL(nil, 'select id from ' + vTable + ' where ' + vField + '=' +
    vID);
  if not Q.IsEmpty then
  begin
    q.First;
    while not q.Eof do
    begin
      if Result = '' then
        Result := Result + vType + '(' + Q.Fields[0].AsString + ')'
      else
        Result := Result + ',' + vType + '(' + Q.Fields[0].AsString + ')';
      q.Next;
    end;
  end;
end;

procedure TfrmSubSystems.ComboBoxParentToDoDropDown(Sender: TObject);
var
  Q: TADOQuery;
begin
  {
    ComboBoxParentToDo.Items.BeginUpdate;
    ComboBoxParentToDo.Items.Clear;
    ComboBoxParentToDo.Items.Add('Все задачи');
    }
  Q := RunSQL(nil, 'select Id,Name from ToDo');
  Q.First;
  while not q.Eof do
  begin
    //ComboBoxParentToDo.Items.Add('(' + Q.Fields[0].AsString + ') ' +
      //Q.Fields[1].AsString);
    q.Next;
  end;
  //ComboBoxParentToDo.Items.EndUpdate;
end;
//-

procedure TfrmSubSystems.CategoryNewExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListCategoryesNew;
end;

procedure TfrmSubSystems.CategoryEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListCategoryesEdit;
end;

procedure TfrmSubSystems.CategoryDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListCategoryesDelete;
end;

procedure TfrmSubSystems.CategoryRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListCategoryesRefresh;
end;

procedure TfrmSubSystems.SeriousnesRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListSeriousnessRefresh;
end;

procedure TfrmSubSystems.SeriousnesNewExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListSeriousnessNew;
end;

procedure TfrmSubSystems.SeriousnesEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListSeriousnessEdit;
end;

procedure TfrmSubSystems.SeriousnesDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListSeriousnessDelete;
end;

procedure TfrmSubSystems.ListViewSeriousnessDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListSeriousnessEdit;
end;

procedure TfrmSubSystems.ListViewCategoryesDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnListCategoryesEdit;
end;

function TfrmSubSystems.GetItemsForList(Q: TADOQuery): TStrings;
var
  vResList: TStrings;

begin
  vResList := TStringList.Create;
  vResList.Add('Все');
  Q.First;
  while not Q.Eof do
  begin
    vResList.Add('(' + Q.FieldByName('ID').AsString + ') ' +
      Q.FieldByName('Name').AsString);
    q.Next;
  end;
  Result := vResList;
end;

procedure AddCondition(var old: string; vStr: string; vType: string = 'and');
begin
  if old = '' then
    old := ' where ' + vStr
  else
    old := old + ' ' + vType + ' ' + vStr;
end;

procedure TfrmSubSystems.ListConditionsGetPickList(Sender: TObject;
  const KeyName: string; Values: TStrings);
var
  Q: TADOQuery;
  I, J: integer;
  Met: IMetaDataObjArray;
  //MetA: IMetaDataObjChilds;
  vTmpId: string;
  vSQLText: string;
  vSQLCond: string;
begin
  if KeyName = 'Вариант колонок' then
  begin
    Q := RunSQL(nil, 'select id,name from ToDoViewColumns');
    Values.AddStrings(GetItemsForList(Q));
    Values.Delete(0);
  end;
  if KeyName = 'Конфигурация' then
  begin
    Q := RunSQL(nil, 'select id,name from configs');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Подконфигурация' then
  begin
    vTmpId := GetIDFromStr(ListConditions.Values['Конфигурация']);
    if vTmpId <> '0' then
      Q := RunSQL(nil, 'select id,name from subconfigs where ConfigID=' + vTmpId)
    else
      Q := RunSQL(nil, 'select id,name from subconfigs');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Релиз' then
  begin
    vSQLText := 'select Id,Name from Relises';
    vSQLCond := '';
    vTmpId := GetIDFromStr(ListConditions.Values['Конфигурация']);
    if vTmpId <> '0' then
      AddCondition(vSQLCond, 'ConfigID=' + vTmpId);
    vTmpId := GetIDFromStr(ListConditions.Values['Подконфигурация']);
    if vTmpId <> '0' then
      AddCondition(vSQLCond, 'SubconfigID=' + vTmpId, 'and');
    AddCondition(vSQLCond, 'SubconfigID=0', 'or');
    vSQLText := vSQLText + vSQLCond + ' order by name desc';
    Q := RunSQL(nil, vSQLText);
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Подсистема' then
  begin
    Q := RunSQL(nil, 'select id,name from subsystems');
    Values.AddStrings(GetItemsForList(Q));
    Values.Add('Для выбранных подсистем');
  end;
  if KeyName = 'Категория' then
  begin
    Q := RunSQL(nil, 'select id,name from Categoryes');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Серьезность' then
  begin
    Q := RunSQL(nil, 'select id,name from Seriousness');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Состояние' then
  begin
    Values.Add('Не выполненые');
    Values.Add('Выполненые');
    Values.Add('Все');
  end;
  if KeyName = 'Статус' then
  begin
    Q := RunSQL(nil, 'select id,name from Statuses');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Исполнитель' then
  begin
    Q := RunSQL(nil, 'select id,name from users');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Инициатор' then
  begin
    Q := RunSQL(nil, 'select id,name from users');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Руководитель' then
  begin
    Q := RunSQL(nil, 'select id,name from users');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Автор' then
  begin
    Q := RunSQL(nil, 'select id,name from users');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Изменил' then
  begin
    Q := RunSQL(nil, 'select id,name from users');
    Values.AddStrings(GetItemsForList(Q));
  end;
  if KeyName = 'Основание' then
  begin
    Q := RunSQL(nil, 'select id,name from ToDo');
    Values.AddStrings(GetItemsForList(Q));
    Values.Insert(1, 'Для выбранных подсистем');
  end;
  if KeyName = 'ТипОбъекта' then
  begin

    Values.Add('Все');
    Values.Add('( 0) Константы');
    Values.Add('( 1) Справочники');
    Values.Add('( 2) Документы');
    Values.Add('( 3) Журналы документов');
    Values.Add('( 4) Перечисления');
    Values.Add('( 5) Отчеты');
    Values.Add('( 6) Обработки');
    Values.Add('(17) Планы счетов');
    Values.Add('(18) Виды субконто');
    Values.Add('(21) Операция');
    Values.Add('(24) Проводка');
    Values.Add('( 7) Регистры');
    Values.Add('(11) Журналы расчетов');
    Values.Add('( 9) Виды расчетов');
    Values.Add('(10) Группы расчетов');
    Values.Add('( 8) Календари');
  end;
  if KeyName = 'ДляОтчета' then
  begin
    Values.Add('Для отчета');
    Values.Add('Не для отчета');
    Values.Add('Все');
  end;

  if KeyName = 'ОбъектМД' then
  begin
    for j := 0 to 25 do
    begin
      Met := FConfigurator.MetaData.TaskDef.Childs[j];
      for i := 0 to Met.Count - 1 do
      begin
        //Node := vTree.Items.AddChildObject(Parent, GetMetView(Met.item[i]), Pointer(Met.item[i].ID));
        Values.Add('(' + IntToStr(Met.item[i].ID) + ') ' +
          Met.item[i].FullName);
      end;
    end;
    {
        Values.Add('Для отчета');
        Values.Add('Не для отчета');
        Values.Add('Все');
        }
  end;

  if KeyName = 'Степень подчиненности' then
  begin
    Values.Add('Все');
    Values.Add('Головные');
    Values.Add('Подчиненные');
    //    Values.Add('Подчиненно-головные');
  end;

end;

procedure TfrmSubSystems.ListViewToDoChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  Q: TADOQuery;
  vNode: TTreeNode;
begin
  if Item = nil then
    exit;
  TreeViewSubToDo.Items.Clear;
  if (Item.StateIndex = 0) or (Item.StateIndex = 1) then
  begin
    vNode := TreeViewSubToDo.Items.AddObject(nil, '(' +
      IntToStr(Integer(Item.Data)) + ') ' + Trim(Item.SubItems[0]),
      Pointer(Integer(Item.Data)));
    Q := RunSQL(nil, 'select distinct id,name from ToDoForFilter '
      + vToDoLst.GetConditionText(IntToStr(Integer(Item.data))));
    Q.First;
    while not q.Eof do
    begin
      vNode := TreeViewSubToDo.Items.AddChildObject(vNode, '(' +
        Q.Fields[0].AsString +
        ') ' + Trim(Q.Fields[1].AsString), Pointer(Q.Fields[0].AsInteger));
      TreeViewSubToDo.Items.AddChild(vNode, '(system)');
      q.Next
    end;
  end;
  //Q.Free;
end;

procedure TfrmSubSystems.TreeViewSubToDoExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  Q: TADOQuery;
  vNode: TTreeNode;
begin
  Node.DeleteChildren;

  //      Echo('----------------------------------');
  //    Echo('select distinct id,name from ToDoForFilter where ParentToDoId=' +
  //      IntToStr(Integer(Node.data)) + vToDoLst.GetConditionText());

  Q := RunSQL(nil, 'select distinct id,name from ToDoForFilter ' +
    vToDoLst.GetConditionText(IntToStr(Integer(Node.data))));

  if not Q.IsEmpty then
  begin

    Q.first;
    while not Q.Eof do
    begin

      vNode := TreeViewSubToDo.Items.AddChildObject(Node,
        '(' + Q.FieldByName('id').AsString + ') ' +
        Trim(Q.FieldByName('Name').AsString),
        Pointer(Q.FieldByName('id').AsInteger));

      TreeViewSubToDo.Items.AddChildObject(vNode, '(system)', Pointer(0));

      q.Next;
    end;
  end;
  //Q.Free;
end;

procedure TfrmSubSystems.TreeViewSubToDoDblClick(Sender: TObject);
begin
  if TreeViewSubToDo.Selected <> nil then
    vToDoLst.OpenCard(Integer(TreeViewSubToDo.Selected.Data));
end;

procedure TfrmSubSystems.AddColItem(vList: TListView; vField, vPresent, vVal:
  string);
var
  LItem: TListItem;
  vCheck, vPos: integer;
  vData: PLRec;
  vWidht: string;
begin
  vCheck := StrToInt(Copy(vVal, 1, 1));
  vPos := StrToInt(Copy(vVal, 3, 2));
  vWidht := Copy(vVal, 6, 3);

  New(vData);
  vData.Position := vPos;
  vData.FName := vField;

  LItem := vList.Items.Add;
  if vCheck = 1 then
    LItem.Checked := true;
  LItem.Data := vData;
  LItem.Caption := vPresent;
  LItem.SubItems.Insert(0, vWidht);

end;

procedure TfrmSubSystems.FillListToDoCols(vList: TListView; vID: Integer);
var
  Q: TADOQuery;
begin
  vList.Items.Clear;
  Q := RunSQL(nil, 'select * from ToDoViewColumns where ID=' + IntToStr(vID));
  //AddColItem(vList, 'FID', 'ID задачи', Q.FieldByName('FID').AsString);
  AddColItem(vList, 'FName', 'Наименование', Q.FieldByName('FName').AsString);
  AddColItem(vList, 'FPriority', 'Приоритет',
    Q.FieldByName('FPriority').AsString);
  AddColItem(vList, 'FSeriousnessName', 'Серьезность',
    Q.FieldByName('FSeriousnessName').AsString);
  AddColItem(vList, 'FStatusName', 'Статус',
    Q.FieldByName('FStatusName').AsString);
  AddColItem(vList, 'FDateStart', 'Дата начала',
    Q.FieldByName('FDateStart').AsString);
  AddColItem(vList, 'FDateEnd', 'Дата конца',
    Q.FieldByName('FDateEnd').AsString);
  AddColItem(vList, 'FDateStartPlan', 'Дата начала план',
    Q.FieldByName('FDateStartPlan').AsString);
  AddColItem(vList, 'FDateEndPlan', 'Дата конца план',
    Q.FieldByName('FDateEndPlan').AsString);
  AddColItem(vList, 'FRecipientName', 'Исполнитель',
    Q.FieldByName('FRecipientName').AsString);
  AddColItem(vList, 'FConfigName', 'Конфигурация',
    Q.FieldByName('FConfigName').AsString);
  AddColItem(vList, 'FSubconfigName', 'Подконфигурация',
    Q.FieldByName('FSubconfigName').AsString);
  AddColItem(vList, 'FSubsystems', 'Подсистемы',
    Q.FieldByName('FSubsystems').AsString);
  AddColItem(vList, 'FMDObjTypes', 'Типы метаданных',
    Q.FieldByName('FMDObjTypes').AsString);
  AddColItem(vList, 'FMDObj', 'Объекты метаданных',
    Q.FieldByName('FMDObj').AsString);
  AddColItem(vList, 'FManagerName', 'Руководитель',
    Q.FieldByName('FManagerName').AsString);
  AddColItem(vList, 'FReliseName', 'Релиз',
    Q.FieldByName('FReliseName').AsString);
  AddColItem(vList, 'FCRT', 'CRT',
    Q.FieldByName('FCRT').AsString);
  vList.SortType := stData;
end;

procedure TfrmSubSystems.ToDoListColRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoListColsRefresh;
end;

procedure TfrmSubSystems.ToDoListColNewExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoListColsNew;
end;

procedure TfrmSubSystems.ToDoListColEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoListColsEdit;
end;

procedure TfrmSubSystems.ToDoListColDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoListColsDelete;
end;

procedure TfrmSubSystems.ListViewToDoViewColumnsDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoListColsEdit;
end;

procedure TfrmSubSystems.ListConditionsStringsChange(Sender: TObject);
begin
  try
    if GetIDFromStr(ListConditions.Values['Вариант колонок']) <> '0' then
    begin
      FillListToDoCols(ListViewToDoCols,
        StrToInt(GetIDFromStr(ListConditions.Values['Вариант колонок'])));
      ListViewToDoCols.AlphaSort;
    end;
  except
    // а ничего, потом буду разбираться почему выдает ошибку.
  end;

end;

procedure TfrmSubSystems.ListViewToDoColsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  vDop: Boolean;
begin
  try
    vDop := PLRec(Item2.Data).Position < PLRec(Item1.Data).Position;
    Compare := Integer(vDop);
  except
  end;
end;

procedure TfrmSubSystems.btnUpClick(Sender: TObject);
var
  LItem: TListItem;
begin
  LItem := ListViewToDoCols.Selected;
  if LItem = nil then
    exit;
  PLRec(LItem.Data).Position := PLRec(LItem.Data).Position - 1;
  PLRec(ListViewToDoCols.Items.Item[LItem.Index - 1].Data).Position :=
    PLRec(ListViewToDoCols.Items.Item[LItem.Index - 1].Data).Position + 1;
  ListViewToDoCols.AlphaSort;
end;

procedure TfrmSubSystems.btnDownClick(Sender: TObject);
var
  LItem: TListItem;
begin
  LItem := ListViewToDoCols.Selected;
  if LItem = nil then
    exit;
  PLRec(LItem.Data).Position := PLRec(LItem.Data).Position + 1;
  PLRec(ListViewToDoCols.Items.Item[LItem.Index + 1].Data).Position :=
    PLRec(ListViewToDoCols.Items.Item[LItem.Index + 1].Data).Position - 1;
  ListViewToDoCols.AlphaSort;
end;

procedure TfrmSubSystems.tvMetadataKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_RETURN) then
  begin
    if FEvents <> nil then
      FEvents.OnMDNodeDblClick();
  end
  else if (Shift = [ssCtrl]) and (Key = VK_RETURN) then
  begin
    vMDTree.ExpandType;
  end;

end;

procedure TfrmSubSystems.pnlChildToDoCaptionClick(Sender: TObject);
var
  hL: Integer;
begin
  if vToDoLst.GetMaxListChildToDoSize = 0 then
    hL := 17;
  vToDoLst.SetMaxListChildToDoSize(hL);

  if pnlChildToDoCaption.Tag = 0 then
  begin
    pnlChildToDo.Constraints.MinHeight := 17;
    pnlChildToDo.Height := vToDoLst.GetMaxListChildToDoSize;
    pnlChildToDoCaption.Tag := 1;
  end
  else
  begin
    pnlChildToDo.Constraints.MinHeight := 17;
    pnlChildToDo.Height := 17;
    pnlChildToDoCaption.Tag := 0;
  end;
end;

procedure TfrmSubSystems.actToDoObjRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoObjRefresh();

end;

procedure TfrmSubSystems.actToDoObjEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoObjEdit();
end;

procedure TfrmSubSystems.actToDoObjDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoObjDelete();
end;

procedure TfrmSubSystems.tvToDoObjExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  Q: TADOQuery;
  vNode: TTreeNode;
begin
  Node.DeleteChildren;
  Q := RunSQL(nil, 'select ID,Name from ToDo where ParentToDoID=' +
    IntToStr(Integer(Node.Data)));

  if not Q.IsEmpty then
  begin

    Q.first;
    while not Q.Eof do
    begin

      vNode := tvToDoObj.Items.AddChildObject(Node,
        '(' + Q.FieldByName('id').AsString + ') ' +
        Trim(Q.FieldByName('Name').AsString),
        Pointer(Q.FieldByName('id').AsInteger));

      tvToDoObj.Items.AddChildObject(vNode, '(system)', Pointer(0));

      q.Next;
    end;
  end;
end;

procedure TfrmSubSystems.tvToDoObjDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnToDoObjEdit();
end;

procedure TfrmSubSystems.CloseDatabase;
begin
  SubSystemConnection.Close;
end;

procedure TfrmSubSystems.actMDBlocksRefreshExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDObjBlocksRefresh;
end;

procedure TfrmSubSystems.actMDBlocsEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDObjBlocksEdit;
end;

procedure TfrmSubSystems.actMDBlocksDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDObjBlocksDelete;
end;

procedure TfrmSubSystems.lvMDObjBlocksDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMDObjBlocksEdit;
end;

procedure TfrmSubSystems.tvMetadataAdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
var
  NodeRect: TRect;
  DC: HDC;
  i: Integer;
begin
  DefaultDraw := True;

  if vShowBlocks = 0 then
    Exit;

  NodeRect := Node.DisplayRect(true);
  try

    if Node.Level = 1 then
    begin
      if Node.Data <> nil then
      begin
        RunSQL(qryTmp, 'Select id,'
          + '(select count(MDC.id) from MDObjBlocksChange as MDC '
          + ' where MDC.MDObj=MDObj and DateChange '
          + ' between DateStartBlockPlan and DateEndBlockPlan) as ColEdits'
          + ' from MDObjBlocks where subconfigid=' + IntToStr(CurSubCfg)
          + ' and Blocked=' + DBTrue + ' and MDObj=' +
          IntToStr(PMyRec(Node.Data).ObjKind));

        if not qryTmp.IsEmpty then
        begin
          //ilBlocks.Draw(Sender.Canvas, NodeRect.Left-50, NodeRect.Top, GrfBlock);
          if qryTmp.Fields[1].AsInteger = 0 then
            i := 1
          else
            i := 0;

          DC := GetDC(Sender.Handle);
          ImageList_Draw(ilBlocks.Handle, i, DC, NodeRect.Left - 50,
            NodeRect.Top,
            ILD_NORMAL);
          ReleaseDC(Sender.Handle, DC);
        end
      end;
      //      else

    end;
  except
  end;

end;

function TfrmSubSystems.DBTrue(): string;
begin
  if Pos('SQLOLEDB', SubSystemConnection.ConnectionString) <> 0 then
    result := '1'
  else
    result := 'true';
end;

function TfrmSubSystems.DBFalse(): string;
begin
  if Pos('SQLOLEDB', SubSystemConnection.ConnectionString) <> 0 then
    result := '0'
  else
    result := 'false';
end;

function TfrmSubSystems.DBInvCom(): string;
begin
  if Pos('SQLOLEDB', SubSystemConnection.ConnectionString) <> 0 then
    result := ''''
  else
    result := '"';
end;

procedure TfrmSubSystems.actDBCnahgeGetByMDObjExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDBChangesGetListByID;
end;

procedure TfrmSubSystems.actDBChangeAddExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDBChangesAdd;
end;

procedure TfrmSubSystems.actDBChangeEditExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDBChangesEdit;
end;

procedure TfrmSubSystems.actDBChangeDeleteExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDBChangesDelete;
end;

procedure TfrmSubSystems.lvDBChangesDblClick(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDBChangesEdit;
end;

function TfrmSubSystems.GetDataConnectionString(): WideString;
begin
  Result := SubSystemConnection.ConnectionString;
end;

procedure TfrmSubSystems.ToDoCopyExecute(Sender: TObject);
{
var
  i : integer;
  }
begin
  if FEvents <> nil then
    FEvents.OnToDoCopy;
  {
i := vToDoLst.GetSelectedToDoID;
vToDoLst.CopyByID(i);
   }
end;

procedure TfrmSubSystems.ToDoCreateChildExecute(Sender: TObject);
{
var
  i : integer;
  }
begin
  if FEvents <> nil then
    FEvents.OnToDoCreateChild;

  {
  i := vToDoLst.GetSelectedToDoID;
  vToDoLst.CreateChild(i);
  }
end;

procedure TfrmSubSystems.actMetExpandTypeExecute(Sender: TObject);
begin
  vMDTree.ExpandType();
end;

procedure TfrmSubSystems.actNoteNewExecute(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnNoteNew;
end;

procedure TfrmSubSystems.tvMetadataExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  TreeViewMetadata.Items[node.AbsoluteIndex].Selected := true;
  vMDTree.FillData;
end;

function TfrmSubSystems.ifstr(pVal1,pVal2 : string): string;
begin
  if pVal1 = '' then Result := pVal2 else Result := pVal1;
end;


initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfrmSubSystems,
    CLASS_Artbear_ActiveFormX,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmSingle);
end.


