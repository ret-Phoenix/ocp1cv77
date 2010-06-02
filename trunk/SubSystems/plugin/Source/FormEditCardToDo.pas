unit FormEditCardToDo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DBCtrls, StdCtrls, DB, Mask, ADODB, ExtCtrls, Menus,
  OpenConf_TLB, ComCtrls, Buttons, FormSubSystemsMain, ShellAPI,
  Grids, DBGrids, JvDBControls,
  JvDBLookup,
  FormChoiceParentToDo, ToolWin, JvExMask, JvToolEdit, JvExControls,
  JvExDBGrids, JvDBGrid, JvComponent, JvExExtCtrls, treelist, JvRollOut,
  JvSpin, JvDBSpinEdit, JvExtComponent;

type
  TfrmEditCardToDo = class(TForm)
    PopupMenu1: TPopupMenu;
    xcx1: TMenuItem;
    QDocument: TADOQuery;
    DS_QDocument: TDataSource;
    PopupMenuSS: TPopupMenu;
    SubSystems1: TMenuItem;
    QListRelises: TADOQuery;
    DSQListRelises: TDataSource;
    DS_QListStatuses: TDataSource;
    QListStatuses: TADOQuery;
    DS_QListConfigs: TDataSource;
    QListConfigs: TADOQuery;
    QListSubconfigs: TADOQuery;
    DSQListSubconfigs: TDataSource;
    QDocumentID: TAutoIncField;
    QDocumentConfigID: TIntegerField;
    QDocumentName: TWideStringField;
    QDocumentPriority: TIntegerField;
    QDocumentNote: TMemoField;
    QDocumentDone: TBooleanField;
    QDocumentDateStart: TDateTimeField;
    QDocumentDateEnd: TDateTimeField;
    QDocumentComplete: TIntegerField;
    QDocumentReliseID: TIntegerField;
    QDocumentStatusID: TIntegerField;
    QDocumentForReport: TBooleanField;
    QDocumentReportText: TMemoField;
    QDocumentSubconfigID: TIntegerField;
    QDocumentAuthorID: TIntegerField;
    QDocumentRecipientID: TIntegerField;
    QDocumentDateTimeCreate: TDateTimeField;
    QListUsers: TADOQuery;
    DS_QListUsers: TDataSource;
    QDocumentParentToDoID: TIntegerField;
    QDocumentLastEditorID: TIntegerField;
    QDocumentLastEditDateTime: TDateTimeField;
    QListToDo: TADOQuery;
    DS_QListToDo: TDataSource;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBMemo1: TDBMemo;
    TabSheet2: TTabSheet;
    DBMemo2: TDBMemo;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBCheckBoxRep: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    btnSSChoice: TButton;
    MemoSubSystems: TMemo;
    MemoObjTypes: TMemo;
    ListViewObj: TListView;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Label4: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    DBEditName: TDBEdit;
    DBCheckBoxDone: TDBCheckBox;
    DBEditprcnt: TDBEdit;
    DBLookupComboBoxCfg: TDBLookupComboBox;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    btnPost: TButton;
    DBEdit4: TDBEdit;
    QDocumentDateStartPlan: TDateTimeField;
    QDocumentDateEndPlan: TDateTimeField;
    QDocumentSeriousness: TIntegerField;
    QDocumentCRT: TIntegerField;
    QDocumentUnsolvedProblem: TMemoField;
    QDocumentKeyWords: TMemoField;
    Label16: TLabel;
    Label17: TLabel;
    GroupBox2: TGroupBox;
    DBMemo4: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    Button2: TButton;
    QListSeriousness: TADOQuery;
    DS_QListSeriousness: TDataSource;
    Label19: TLabel;
    DBGrid1: TDBGrid;
    QSubListIniciators: TADOQuery;
    DS_QSubListIniciators: TDataSource;
    QSubListIniciatorsID: TAutoIncField;
    QSubListIniciatorsToDoID: TIntegerField;
    QSubListIniciatorsTypeDataID: TIntegerField;
    QSubListIniciatorsObjId: TIntegerField;
    QSubListIniciatorsIniciator: TStringField;
    ToolBar1: TToolBar;
    btnIniciatorsRefresh: TToolButton;
    ToolButton2: TToolButton;
    btnIniciatorsNew: TToolButton;
    btnIniciatorsSave: TToolButton;
    btnIniciatorsDelete: TToolButton;
    ToolBar2: TToolBar;
    btnCategoryesRefresh: TToolButton;
    ToolButton3: TToolButton;
    btnCategoryesNew: TToolButton;
    btnCategoryesSave: TToolButton;
    btnCategoryesDelete: TToolButton;
    DBGrid2: TDBGrid;
    QSubListCategoryes: TADOQuery;
    DS_QSubListCategoryes: TDataSource;
    QSubListCategoryesID: TAutoIncField;
    QSubListCategoryesToDoID: TIntegerField;
    QSubListCategoryesTypeDataID: TIntegerField;
    QSubListCategoryesObjId: TIntegerField;
    QListCategoryes: TADOQuery;
    DS_QListCategoryes: TDataSource;
    QSubListCategoryesCategory: TStringField;
    Label20: TLabel;
    QDocumentManagerID: TIntegerField;
    DBLookupComboBox2: TDBLookupComboBox;
    Button3: TButton;
    JvDBDateEdit1: TJvDBDateEdit;
    JvDBDateEdit2: TJvDBDateEdit;
    JvDBDateEdit3: TJvDBDateEdit;
    JvDBDateEdit4: TJvDBDateEdit;
    tsFiles: TTabSheet;
    ToolBar3: TToolBar;
    btnFilesRefresh: TToolButton;
    btn2: TToolButton;
    btnFilesNew: TToolButton;
    btnFilesSave: TToolButton;
    btnFilesDelete: TToolButton;
    dbgrd1: TDBGrid;
    QSubListFiles: TADOQuery;
    DS_QListFiles: TDataSource;
    QSubListFilesID: TIntegerField;
    QSubListFilesToDoID: TIntegerField;
    QSubListFilesName: TStringField;
    QSubListFilesPath: TStringField;
    ToolButton1: TToolButton;
    btnFilesChoiceFile: TToolButton;
    btnFilesOpenFile: TToolButton;
    btnInitiatorsCancel: TToolButton;
    btnCategoryesCancel: TToolButton;
    btnFilesCancel: TToolButton;
    QListToDoID: TIntegerField;
    QListToDoName: TStringField;
    JvDBLookupCombo1: TJvDBLookupCombo;
    btnManageSubConfigShow: TSpeedButton;
    btnManageSubConfigAdd: TSpeedButton;
    btnManageSubConfigClear: TSpeedButton;
    JvDBLookupCombo2: TJvDBLookupCombo;
    JvDBLookupCombo3: TJvDBLookupCombo;
    JvDBLookupCombo4: TJvDBLookupCombo;
    JvDBLookupCombo5: TJvDBLookupCombo;
    btnManageReliseShow: TSpeedButton;
    btnManageReliseAdd: TSpeedButton;
    btnManageReliseClear: TSpeedButton;
    btnManageRecipientShow: TSpeedButton;
    btnManageRecipientAdd: TSpeedButton;
    btnManageRecipientClear: TSpeedButton;
    btnManageParentToDoShow: TSpeedButton;
    btnManageParentToDoChoice: TSpeedButton;
    btnManageParentToDoClear: TSpeedButton;
    btnManageStatusShow: TSpeedButton;
    btnManageStatusAdd: TSpeedButton;
    btnManageStatusClear: TSpeedButton;
    tsBlocks: TTabSheet;
    tsLogEdits: TTabSheet;
    ToolBar4: TToolBar;
    btnBlocksRefresh: TToolButton;
    ToolButton5: TToolButton;
    btnBlocksEdit: TToolButton;
    QSubListBlocks: TADOQuery;
    dsQSubListBlocks: TDataSource;
    JvDBGrid1: TJvDBGrid;
    ToolBar5: TToolBar;
    btnLogRefresh: TToolButton;
    ToolButton6: TToolButton;
    btnLogEdit: TToolButton;
    JvDBGrid2: TJvDBGrid;
    QSubListLog: TADOQuery;
    dsQSubListLog: TDataSource;
    ts1: TTabSheet;
    dbgrd2: TDBGrid;
    ds_qryQSubListStatusHistory: TDataSource;
    qryQSubListStatusHistory: TADOQuery;
    dQSubListStatusHistoryDateChange: TDateTimeField;
    sQSubListStatusHistoryUser: TStringField;
    sQSubListStatusHistoryStatus: TStringField;
    iQSubListStatusHistoryID: TIntegerField;
    iQSubListStatusHistoryToDoID: TIntegerField;
    iQSubListStatusHistoryUserID: TIntegerField;
    iQSubListStatusHistoryStatusID: TIntegerField;
    tlb1: TToolBar;
    btn1: TToolButton;
    btnSHRefresh: TToolButton;
    btnSHDelete: TToolButton;
    pnl1: TPanel;
    JvDBLookupCombo6: TJvDBLookupCombo;
    SpeedButton3: TSpeedButton;
    Label18: TLabel;
    QListCR: TADOQuery;
    dsListCR: TDataSource;
    QListCRid: TIntegerField;
    QListCRname: TStringField;
    QListCRstateSystem: TIntegerField;
    QListCRstateReal: TIntegerField;
    QListCRStateSystemText: TStringField;
    rgTypeChilds: TRadioGroup;
    Splitter1: TSplitter;
    TabSheet6: TTabSheet;
    PageControl2: TPageControl;
    Label5: TLabel;
    JvRollOut1: TJvRollOut;
    dbmmo1: TDBMemo;
    JvRollOut2: TJvRollOut;
    Splitter2: TSplitter;
    DBMemo3: TDBMemo;
    JvDBSpinEdit1: TJvDBSpinEdit;
    mQDocumentComments: TMemoField;
    TreeList1: TTreeList;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure ListViewObjDblClick(Sender: TObject);
    procedure btnClearReliseClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnKindClearClick(Sender: TObject);
    procedure xcx1Click(Sender: TObject);
    procedure ListView1Exit(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSSClearClick(Sender: TObject);
    procedure btnTypeChoiceClick(Sender: TObject);
    procedure btnTypeClearClick(Sender: TObject);
    procedure btnKindChoiceClick(Sender: TObject);
    procedure btnSSChoiceClick(Sender: TObject);
    procedure TreeViewObjKindsDblClick(Sender: TObject);
    procedure TreeViewObjKindsExit(Sender: TObject);
    procedure SubSystems1Click(Sender: TObject);
    procedure ADOQuery1ConfigIDChange(Sender: TField);
    procedure DBLookupComboBoxSubCfgEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ADOQuery1SubconfigIDChange(Sender: TField);
    procedure DBLookupComboBoxRlsEnter(Sender: TObject);
    procedure btnClearUserIDClick(Sender: TObject);
    procedure btnClearParentToDoClick(Sender: TObject);
    procedure QSubListIniciatorsNewRecord(DataSet: TDataSet);
    procedure btnIniciatorsRefreshClick(Sender: TObject);
    procedure btnIniciatorsNewClick(Sender: TObject);
    procedure btnIniciatorsSaveClick(Sender: TObject);
    procedure btnIniciatorsDeleteClick(Sender: TObject);
    procedure btnCategoryesRefreshClick(Sender: TObject);
    procedure btnCategoryesNewClick(Sender: TObject);
    procedure btnCategoryesSaveClick(Sender: TObject);
    procedure btnCategoryesDeleteClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
    procedure QDocumentConfigIDChange(Sender: TField);
    procedure QSubListFilesNewRecord(DataSet: TDataSet);
    procedure btnFilesRefreshClick(Sender: TObject);
    procedure btnFilesNewClick(Sender: TObject);
    procedure btnFilesSaveClick(Sender: TObject);
    procedure btnFilesDeleteClick(Sender: TObject);
    procedure btnFilesChoiceFileClick(Sender: TObject);
    procedure btnFilesOpenFileClick(Sender: TObject);
    procedure btnInitiatorsCancelClick(Sender: TObject);
    procedure btnCategoryesCancelClick(Sender: TObject);
    procedure btnFilesCancelClick(Sender: TObject);
    procedure btnManageSubConfigShowClick(Sender: TObject);
    procedure btnManageSubConfigAddClick(Sender: TObject);
    procedure btnManageSubConfigClearClick(Sender: TObject);
    procedure btnManageReliseShowClick(Sender: TObject);
    procedure btnManageReliseAddClick(Sender: TObject);
    procedure btnManageReliseClearClick(Sender: TObject);
    procedure btnManageRecipientShowClick(Sender: TObject);
    procedure btnManageRecipientAddClick(Sender: TObject);
    procedure btnManageRecipientClearClick(Sender: TObject);
    procedure btnManageParentToDoShowClick(Sender: TObject);
    procedure btnManageParentToDoChoiceClick(Sender: TObject);
    procedure btnManageParentToDoClearClick(Sender: TObject);
    procedure btnManageStatusShowClick(Sender: TObject);
    procedure btnManageStatusAddClick(Sender: TObject);
    procedure btnManageStatusClearClick(Sender: TObject);
    procedure btnBlocksRefreshClick(Sender: TObject);
    procedure btnBlocksEditClick(Sender: TObject);
    procedure btnLogRefreshClick(Sender: TObject);
    procedure btnLogEditClick(Sender: TObject);
    procedure JvDBLookupCombo5Change(Sender: TObject);
    procedure btnSHRefreshClick(Sender: TObject);
    procedure btnSHDeleteClick(Sender: TObject);
    procedure rgTypeChildsClick(Sender: TObject);
    procedure TreeList1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeList1DblClick(Sender: TObject);
    procedure QListCategoryesBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    procedure AddMetItems(vTree: TTreeView; Num: Integer; Parent: TTreeNode;
      Img: Integer);
  public
    { Public declarations }
    pConf: IConfigurator;
    frmSS: TfrmSubSystems;
    OpenResult: Integer;

  end;

var
  frmEditCardToDo: TfrmEditCardToDo;

implementation
uses FormToDoAccessoryTuning, SubSystems_TLB;
{$R *.dfm}

procedure TfrmEditCardToDo.AddMetItems(vTree: TTreeView; Num: Integer; Parent:
  TTreeNode; Img: Integer);
var
  Met: IMetaDataObjArray;
  i: Integer;
  Node: TTreeNode;
begin
  if Num = -1 then
    exit;
  Met := pConf.MetaData.TaskDef.Childs[Num];
  for i := 0 to Met.Count - 1 do
  begin
    Node := vTree.Items.AddChildObject(Parent, Met.item[i].Name + ' (' +
      Met.item[i].Present + ')', Pointer(Met.item[i].ID));
    Node.ImageIndex := Img;
    Node.StateIndex := Img;
  end;
end;

procedure TfrmEditCardToDo.btnKindClearClick(Sender: TObject);
begin
  //ADOQuery1ObjID.AsInteger := -1;
  //LabelKindObj.Caption := '';
end;

procedure TfrmEditCardToDo.xcx1Click(Sender: TObject);
begin
  //ShowMessage((Sender as(TMenuItem)).Caption + ' - ' + IntTostr((Sender as(TMenuItem)).tag));
  //ADOQuery1ObjType.AsInteger := (Sender as (TMenuItem)).tag;
  //ADOQuery1ObjID.AsInteger := 0;
  //LabelKindObj.Caption := '';
  //LabelTypeObj.Caption := (Sender as (TMenuItem)).Caption;
end;

procedure TfrmEditCardToDo.ListView1Exit(Sender: TObject);
begin
  //  ShowMessage('exit');
  //TreeViewObjKinds.Visible := false;
end;

procedure TfrmEditCardToDo.FormClick(Sender: TObject);
begin
  //TreeViewObjKinds.Visible := false;
end;

procedure TfrmEditCardToDo.btnOkClick(Sender: TObject);
begin
  btnPostClick(sender);
  OpenResult := QDocumentid.AsInteger;
  close;
end;

procedure TfrmEditCardToDo.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  OpenResult := 0;
  close;
end;

procedure TfrmEditCardToDo.btnSSClearClick(Sender: TObject);
begin
  //ADOQuery1SubSystemID.AsInteger := 0;
  //LabelSubSystem.Caption := '';
end;

procedure TfrmEditCardToDo.btnTypeChoiceClick(Sender: TObject);
begin
  PopupMenu1.Popup(Self.Left + ((sender as TButton).left) + 5, self.Top + (sender
    as TButton).top + 55);
end;

procedure TfrmEditCardToDo.btnTypeClearClick(Sender: TObject);
begin
  //ADOQuery1ObjType.AsInteger := -1;
  //LabelTypeObj.Caption := '';
  //btnKindClearClick(btnKindClear);
end;

procedure TfrmEditCardToDo.btnKindChoiceClick(Sender: TObject);
//var
//  i: integer;
//  Met: IMetaDataObjArray;
//  vMenu: TMenuItem;
//  LItem: TListItem;
begin
  //TreeViewObjKinds.BringToFront;
  //TreeViewObjKinds.Visible := true;
  //TreeViewObjKinds.Items.Clear;
  //AddMetItems(TreeViewObjKinds, ADOQuery1ObjType.AsInteger, nil, 35);
  //SetFocusedControl(TreeViewObjKinds);
end;

procedure TfrmEditCardToDo.btnSSChoiceClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert] then
  begin
    ShowMessage('Сначала необходимо сохранить задачу');
    exit;
  end;

  //PopupMenuSS.Popup(Self.Left + ((sender as TButton).left) + 5, self.Top + (sender as TButton).top + 55);
  with TfrmToDoAccessoryTuning.Create(nil) do
  begin
    frm := frmSS;
    frmToDo := Self;
    ToDoID := QDocumentid.AsInteger;
    ShowModal;
    {
    if ModalResult = mrOk then begin
      ShowMessage('Ok');
    end
    else begin
      ShowMessage('cancel');
    end;
    }
    Free;
  end;
end;

procedure TfrmEditCardToDo.TreeViewObjKindsDblClick(Sender: TObject);
begin
  //ADOQuery1ObjID.AsInteger := Integer(TreeViewObjKinds.Selected.data);
  //LabelKindObj.Caption := TreeViewObjKinds.Selected.Text;
  //TreeViewObjKinds.Visible := false;
end;

procedure TfrmEditCardToDo.TreeViewObjKindsExit(Sender: TObject);
begin
  //TreeViewObjKinds.Visible := false;
end;

procedure TfrmEditCardToDo.SubSystems1Click(Sender: TObject);
begin
  //ADOQuery1SubSystemID.AsInteger := (Sender as (TMenuItem)).tag;
  //LabelSubSystem.Caption := (Sender as (TMenuItem)).Caption;
end;

procedure TfrmEditCardToDo.btnPostClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
  begin
    //    QDocument.
    QDocument.UpdateRecord;
    QDocument.Post;
  end;
  {
 QDocument.Close;
 QDocument.Open;
 }

//  QDocument.close;
//  QListRelises.Close;
//  QListStatuses.close;
//  QListConfigs.close;
//  QListSubconfigs.close;
//  QListUsers.close;
//  QListToDo.close;
//  QListSeriousness.close;
//  QListCategoryes.close;
//  QSubListIniciators.close;
//  QSubListCategoryes.close;
//  QSubListFiles.close;
//
//  QDocument.Open;
//  QListRelises.Open;
//  QListStatuses.Open;
//  QListConfigs.Open;
//  QListSubconfigs.Open;
//  QListUsers.Open;
//  QListToDo.Open;
//  QListSeriousness.Open;
//  QListCategoryes.Open;
//  QSubListIniciators.Open;
//  QSubListCategoryes.Open;
//  QSubListFiles.Open;

  with QDocument do
  begin
    Edit;
    FieldByName('LastEditorID').AsInteger := frmSS.CurUser;
    FieldByName('LastEditDateTime').AsDateTime := Now();
    Post;

    Edit;
  end;

  //btnSSChoice.SetFocus;
  DBEditName.SetFocus;
end;

procedure TfrmEditCardToDo.btnClearReliseClick(Sender: TObject);
begin
  QDocumentReliseID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.ListViewObjDblClick(Sender: TObject);
begin
  if ListViewObj.Selected <> nil then
  begin
    frmSS.vToDoObjName := ListViewObj.Selected.Caption;
    if frmSS.FEvents <> nil then
      frmSS.FEvents.OnToDoCardGetObjectName;
  end;
end;

procedure TfrmEditCardToDo.FormShow(Sender: TObject);
begin
  DBEditName.SetFocus;
  OpenResult := QDocumentid.AsInteger;
end;

procedure TfrmEditCardToDo.ADOQuery1ConfigIDChange(Sender: TField);
begin
  QDocumentSubconfigID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.DBLookupComboBoxSubCfgEnter(Sender: TObject);
begin
  with QListSubconfigs do
  begin
    Close;
    Connection := QDocument.Connection;
    sql.Clear;
    sql.Add('select Id,Name from Subconfigs where ConfigID=' +
      QDocumentConfigID.AsString);
    Open;
  end;
end;

procedure TfrmEditCardToDo.Button1Click(Sender: TObject);
begin
  QDocumentSubconfigID.AsInteger := 0;
  QDocumentReliseID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.ADOQuery1SubconfigIDChange(Sender: TField);
begin
  QDocumentReliseID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.DBLookupComboBoxRlsEnter(Sender: TObject);
begin
  with QListRelises do
  begin
    Close;
    Connection := QDocument.Connection;
    sql.Clear;
    sql.Add('select Id,Name from Relises where (ConfigID=' +
      QDocumentConfigID.AsString + ') and ((SubconfigID=' +
      QDocumentSubconfigID.AsString +
      ') or (SubconfigID=0)) order by name desc');
    Open;
  end;
end;

procedure TfrmEditCardToDo.btnClearUserIDClick(Sender: TObject);
begin
  QDocumentRecipientID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.btnClearParentToDoClick(Sender: TObject);
begin
  QDocumentParentToDoID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.QSubListIniciatorsNewRecord(DataSet: TDataSet);
begin
  QSubListIniciatorsToDoID.AsInteger := QDocumentID.AsInteger;
  QSubListIniciatorsTypeDataID.AsInteger := 4;
end;

procedure TfrmEditCardToDo.btnIniciatorsRefreshClick(Sender: TObject);
begin
  frmSS.RunSQL(QSubListIniciators,
    'select * from ToDoAccessory where TypeDataID=4 and ToDoID=' +
    QDocumentID.AsString);
end;

procedure TfrmEditCardToDo.btnIniciatorsNewClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert] then
  begin
    ShowMessage('Сначала необходимо записать задачу!');
    Exit;
  end;
  QSubListIniciators.Insert;
  QSubListIniciatorsToDoID.AsInteger := QDocumentID.AsInteger;
end;

procedure TfrmEditCardToDo.btnIniciatorsSaveClick(Sender: TObject);
begin
  QSubListIniciators.Post;
end;

procedure TfrmEditCardToDo.btnIniciatorsDeleteClick(Sender: TObject);
begin
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  QSubListIniciators.Delete;
end;
//

procedure TfrmEditCardToDo.btnCategoryesRefreshClick(Sender: TObject);
begin
  frmSS.RunSQL(QSubListCategoryes,
    'select * from ToDoAccessory where TypeDataID=5 and ToDoID=' +
    QDocumentID.AsString);
end;

procedure TfrmEditCardToDo.btnCategoryesNewClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert] then
  begin
    ShowMessage('Сначала необходимо записать задачу!');
    Exit;
  end;
  QSubListCategoryes.Insert;
  QSubListCategoryesToDoID.AsInteger := QDocumentID.AsInteger;
  QSubListCategoryesTypeDataID.AsInteger := 5;
end;

procedure TfrmEditCardToDo.btnCategoryesSaveClick(Sender: TObject);
begin
  QSubListCategoryes.Post;
end;

procedure TfrmEditCardToDo.btnCategoryesDeleteClick(Sender: TObject);
begin
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  QSubListCategoryes.Delete;
end;

procedure TfrmEditCardToDo.Button3Click(Sender: TObject);
begin
  QDocumentManagerID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.btnSendEmailClick(Sender: TObject);
var
  vRecipietnts: string;
  vUser: Integer;
  vText: string;
  //  vName: string;
  vEmailFile: TextFile;
  //  vIDU: Integer;
  //  vStr: WideString;
begin
  vUser := QDocumentRecipientID.AsInteger;
  vRecipietnts := frmSS.vUsersList.GetEmailByID(vUser);
  QSubListIniciators.First;
  while not QSubListIniciators.Eof do
  begin
    vUser := QSubListIniciatorsObjId.AsInteger;
    vRecipietnts := vRecipietnts + ',' + frmSS.vUsersList.GetEmailByID(vUser);
    QSubListIniciators.Next;
  end;

  if QDocumentForReport.AsBoolean then
    if QDocumentReportText.AsString <> '' then
      vText := QDocumentReportText.AsString
    else
      vText := QDocumentNote.AsString
  else
    vText := QDocumentNote.AsString;

  AssignFile(vEmailFile, 'c:\email.txt'); // связываем входной файл
  Rewrite(vEmailFile);
  WriteLn(vEmailFile, 'email'); // кто
  WriteLn(vEmailFile, ''); // кому
  WriteLn(vEmailFile, vRecipietnts); // кому мыло
  WriteLn(vEmailFile, QDocumentName.AsString); // сабжект
  WriteLn(vEmailFile, ''); // файл
  WriteLn(vEmailFile, '1'); // показать
  WriteLn(vEmailFile, vText); // текст
  CloseFile(vEmailFile);

  //vStr := '"' + frmSS.vToDoLst.MailSenderExe + '" c:\email.txt';
  {
    frmSS.Echo(vStr);
    WinExec(PChar(vStr),0);
    }
  //WinExec(pchar(frmSS.vToDoLst.MailSenderExe + ' c:\email.txt'));

  //frmSS.Echo('"' + frmSS.vToDoLst.MailSenderExe + '"');
  //frmSS.Echo('"' + ExtractFileDir(frmSS.vToDoLst.MailSenderExe) + '"');
    {
  ShellExecute(0, 'open',
    PChar('"' + frmSS.vToDoLst.MailSenderExe + '"'),
    PChar('c:\email.txt'),
    //PChar('"'+ExtractFileDir(frmSS.vToDoLst.MailSenderExe)+'\"'),
    'd:\',
    SW_SHOWNORMAL);
     }
end;

procedure TfrmEditCardToDo.QDocumentConfigIDChange(Sender: TField);
begin
  QDocumentSubconfigID.AsInteger := 0;
end;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// блок работы с файлами задачи
//

procedure TfrmEditCardToDo.QSubListFilesNewRecord(DataSet: TDataSet);
begin
  if QDocument.State in [dsInsert] then
  begin
    ShowMessage('Сначала необходимо записать задачу!');
    Exit;
  end;
  QSubListFilesToDoID.AsInteger := QDocumentID.AsInteger;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnFilesRefreshClick(Sender: TObject);
begin
  frmSS.RunSQL(QSubListFiles, 'select * from ToDoFiles where ToDoID=' +
    QDocumentID.AsString);
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnFilesNewClick(Sender: TObject);
begin
  QSubListFiles.Insert;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnFilesSaveClick(Sender: TObject);
begin
  if QSubListFiles.State in [dsInsert, dsEdit] then
    QSubListFiles.Post;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnFilesDeleteClick(Sender: TObject);
begin
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  QSubListFiles.Delete;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnFilesChoiceFileClick(Sender: TObject);
begin
  if QSubListFiles.State in [dsInsert, dsEdit] then
  begin
    if frmSS.OpenDialog1.Execute then
    begin
      QSubListFilesPath.AsString := frmSS.OpenDialog1.FileName;
    end;
  end
  else if QSubListFiles.State in [dsBrowse] then
  begin
    if frmSS.OpenDialog1.Execute then
    begin
      QSubListFiles.Edit;
      QSubListFilesPath.AsString := frmSS.OpenDialog1.FileName;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnFilesOpenFileClick(Sender: TObject);
begin

  if FileExists(QSubListFilesPath.AsString) then
  begin
    ShellExecute(frmSS.handle, 'open', pchar(QSubListFilesPath.AsString), '',
      PChar(ExtractFileDir(QSubListFilesPath.AsString)), SW_SHOWNORMAL);
  end
  else
    ShowMessage('Файл не найден!');
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnInitiatorsCancelClick(Sender: TObject);
begin
  QSubListIniciators.Cancel;
end;

procedure TfrmEditCardToDo.btnCategoryesCancelClick(Sender: TObject);
begin
  QSubListCategoryes.Cancel;
end;

procedure TfrmEditCardToDo.btnFilesCancelClick(Sender: TObject);
begin
  QSubListFiles.Cancel;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnManageSubConfigShowClick(Sender: TObject);
var
  I: Integer;
begin
  i := QDocumentSubconfigID.AsInteger;
  if i <> 0 then
    frmSS.vSubcfg.OpenCard(i);
end;

procedure TfrmEditCardToDo.btnManageSubConfigAddClick(Sender: TObject);
begin
  frmSS.vSubcfg.Add;
  QListSubconfigs.Requery;
end;

procedure TfrmEditCardToDo.btnManageSubConfigClearClick(Sender: TObject);
begin
  QDocumentSubconfigID.AsInteger := 0;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnManageReliseShowClick(Sender: TObject);
var
  I: Integer;
begin
  i := QDocumentReliseID.AsInteger;
  if i <> 0 then
    frmSS.vRelisesList.OpenCard(i);
end;

procedure TfrmEditCardToDo.btnManageReliseAddClick(Sender: TObject);
begin
  frmSS.vRelisesList.Add;
  QListRelises.Requery;
end;

procedure TfrmEditCardToDo.btnManageReliseClearClick(Sender: TObject);
begin
  QDocumentReliseID.AsInteger := 0;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnManageRecipientShowClick(Sender: TObject);
var
  I: Integer;
begin
  i := QDocumentRecipientID.AsInteger;
  if i <> 0 then
    frmSS.vUsersList.OpenCard(i);
end;

procedure TfrmEditCardToDo.btnManageRecipientAddClick(Sender: TObject);
begin
  frmSS.vUsersList.Add;
  QListUsers.Requery;
end;

procedure TfrmEditCardToDo.btnManageRecipientClearClick(Sender: TObject);
begin
  QDocumentRecipientID.AsInteger := 0;
end;
//------------------------------------------------------------------------------

procedure TfrmEditCardToDo.btnManageParentToDoShowClick(Sender: TObject);
var
  I: Integer;
begin
  i := QDocumentParentToDoID.AsInteger;
  if i <> 0 then
    frmSS.vToDoLst.OpenCard(i);
end;

procedure TfrmEditCardToDo.btnManageParentToDoChoiceClick(Sender: TObject);

var
  Node: TTreeNode;
begin
  with TfrmChoiceParentToDo.Create(nil) do
  begin
    frmSSM := frmSS;
    QList := frmSS.RunSQL(nil, 'select Id,Name from configs order by Name');
    QList.First;
    while not QList.Eof do
    begin
      Node := tvToDo.Items.AddObject(nil, QList.FieldByName('Name').AsString,
        Pointer(QList.FieldByName('ID').AsInteger));
      frmSS.GrfNode(Node, 5);
      tvToDo.Items.AddChild(Node, 'system');
      vReturnID := 0;
      QList.Next;
    end;
    tvToDo.Images := frmSS.ImageListToDoList;
    ShowModal;
    QDocumentParentToDoID.AsInteger := vReturnID;
    Free;
  end;

end;

procedure TfrmEditCardToDo.btnManageParentToDoClearClick(Sender: TObject);
begin
  QDocumentParentToDoID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.btnManageStatusShowClick(Sender: TObject);
var
  i: Integer;
begin
  i := QDocumentStatusID.AsInteger;
  if i <> 0 then
    frmSS.vStatusList.OpenCard(i);
end;

procedure TfrmEditCardToDo.btnManageStatusAddClick(Sender: TObject);
begin
  frmSS.vStatusList.Add;
  QListStatuses.Requery;
end;

procedure TfrmEditCardToDo.btnManageStatusClearClick(Sender: TObject);
begin
  QDocumentStatusID.AsInteger := 0;
end;

procedure TfrmEditCardToDo.btnBlocksRefreshClick(Sender: TObject);
begin
  frmSS.RunSQL(QSubListBlocks,
    'select Id,Name,Blocked from MDObjBlocks where ToDoID=' +
    QDocumentID.AsString);
end;

procedure TfrmEditCardToDo.btnBlocksEditClick(Sender: TObject);
begin
  frmSS.vMDObjBlocks.OpenCard(QSubListBlocks.FieldByName('ID').AsInteger, 0);
end;

procedure TfrmEditCardToDo.btnLogRefreshClick(Sender: TObject);
begin
  frmSS.RunSQL(QSubListLog,
    'select Id,Name,DateChange from MDObjBlocksChange where ToDoID=' +
    QDocumentID.AsString);
end;

procedure TfrmEditCardToDo.btnLogEditClick(Sender: TObject);
begin
  frmSS.vDBChangesLog.OpenCard(QSubListLog.FieldByName('ID').AsInteger);
end;

procedure TfrmEditCardToDo.JvDBLookupCombo5Change(Sender: TObject);
var
  Q: TADOQuery;
begin
  if QDocument.State in [dsInsert] then
  begin
    ShowMessage('Задача еще на записана! Нельзя менять ее статус!');
    Exit;
  end;
  Q := frmSS.RunSQL(nil, 'select * from ToDoStatusHistory where ID=0');
  Q.Insert;
  Q.FieldByName('ToDoID').AsInteger := QDocumentID.AsInteger;
  Q.FieldByName('DateChange').AsDateTime := Now;
  Q.FieldByName('UserID').AsInteger := frmSS.CurUser;
  Q.FieldByName('StatusID').AsInteger := QDocumentStatusID.AsInteger;
  Q.Post;
  //  frmSS.RunSQL(nil, 'insert into ToDoStatusHistory'
  //    + ' (ToDoID,DateChange,UserID,StatusID) values ('
  //    + QDocumentID.AsString + ','
  //    + '"' + DateTimeToStr(Now) + '",'
  //    + IntToStr(frmSS.CurUser) + ','
  //    + QDocumentStatusID.AsString + ')', 1);
  btnSHRefreshClick(Sender);
end;

procedure TfrmEditCardToDo.btnSHRefreshClick(Sender: TObject);
begin
  frmSS.RunSQL(qryQSubListStatusHistory,
    'select * from ToDoStatusHistory where (ToDoID=' + QDocumentID.AsString +
    ')');
end;

procedure TfrmEditCardToDo.btnSHDeleteClick(Sender: TObject);
begin
  if qryQSubListStatusHistory.IsEmpty then
    Exit;
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  frmSS.RunSQL(nil,
    'Delete from ToDoStatusHistory where ID=' +
    iQSubListStatusHistoryID.AsString, 1);
  btnSHRefreshClick(Sender);
end;

procedure TfrmEditCardToDo.rgTypeChildsClick(Sender: TObject);
var
  vNode: TTreeNode;
  lQ: TADOQuery;
  lList: TTreeList;
begin
  lList := TreeList1;
  lList.Items.Clear;
  if rgTypeChilds.ItemIndex = 0 then
  begin
    vNode := lList.Items.AddObjectFirst(nil, QDocumentName.AsString,
      Pointer(QDocumentID.AsInteger));
    lList.Items.AddChildObject(vNode, '(system)', pointer(0));
    lList.SetNodeColumn(vNode, 1, JvDBLookupCombo5.Text);
    lList.SetNodeColumn(vNode, 2, JvDBLookupCombo3.Text);

  end
  else
  begin
    if QDocumentCRT.AsInteger = 0 then
    begin
      ShowMessage('Не указан CR! Получение дерева невозможно.');
      exit;
    end;
    lQ := frmSS.RunSQL(nil,
      'SELECT T.ID, T.Name, S.Name as Status, U.Name as Usr' + #13#10 +
      'FROM (ToDo as t LEFT JOIN Statuses as s ON T.StatusID = S.ID)' + #13#10 +
      'LEFT JOIN Users as u ON T.RecipientID = U.ID' +
      ' WHERE t.ParentToDoID=0  and t.CRT=' + QDocumentCRT.AsString);
    lQ.First;
    while not lQ.Eof do
    begin
      vNode := lList.Items.AddObjectFirst(nil, lQ.Fields[1].AsString,
        Pointer(lQ.Fields[0].AsInteger));
      lList.SetNodeColumn(vNode, 1, LQ.FieldByName('Status').AsString);
      lList.SetNodeColumn(vNode, 2, LQ.FieldByName('Usr').AsString);

      lList.Items.AddChildObject(vNode, '(system)', pointer(0));
      lQ.Next;
    end;
  end;
end;

procedure TfrmEditCardToDo.TreeList1Expanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  Q: TADOQuery;
  vNode: TTreeNode;
  lList: TTreeList;
begin
  lList := TreeList1;

  Node.DeleteChildren;
  Q := frmSS.RunSQL(nil,
    'SELECT T.ID, T.Name, S.Name as Status, U.Name as Usr' + #13#10 +
    'FROM (ToDo as t LEFT JOIN Statuses as s ON T.StatusID = S.ID)' + #13#10 +
    'LEFT JOIN Users as u ON T.RecipientID = U.ID' +
    ' WHERE t.ParentToDoID=' + IntToStr(Integer(Node.Data)));

  if not Q.IsEmpty then
  begin

    Q.first;
    while not Q.Eof do
    begin

      vNode := lList.Items.AddChildObject(Node,
        Q.FieldByName('Name').AsString,
        Pointer(Q.FieldByName('id').AsInteger));
      vNode.ImageIndex := 5;
      lList.SetNodeColumn(vNode, 1, Q.FieldByName('Status').AsString);
      lList.SetNodeColumn(vNode, 2, Q.FieldByName('Usr').AsString);

      lList.Items.AddChildObject(vNode, '(system)', Pointer(0));

      q.Next;
    end;
  end;

end;

procedure TfrmEditCardToDo.TreeList1DblClick(Sender: TObject);
begin
  if TreeList1.Selected <> nil then
  begin
    if Integer(TreeList1.Selected.Data) <> QDocumentID.AsInteger then
      frmSS.vToDoLst.OpenCard(Integer(TreeList1.Selected.Data));
  end;
end;

procedure TfrmEditCardToDo.QListCategoryesBeforeInsert(DataSet: TDataSet);
begin
  QSubListCategoryesToDoID.AsInteger := QDocumentID.AsInteger;
  QSubListCategoryesTypeDataID.AsInteger := 5;
end;

end.

