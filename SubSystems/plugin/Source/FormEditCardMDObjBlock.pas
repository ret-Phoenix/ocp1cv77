unit FormEditCardMDObjBlock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, JvExControls, JvComponent,
  JvDBLookup, JvExMask, JvToolEdit, JvDBControls, Buttons, FormSubSystemsMain,
  ComCtrls, FormChoiceParentToDo;

type
  TfrmEditCardMDObjBlock = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentMDObj: TIntegerField;
    QDocumentBlocked: TBooleanField;
    QDocumentName: TWideStringField;
    QDocumentUserBlockID: TIntegerField;
    QDocumentUserUnBlockID: TIntegerField;
    QDocumentToDoID: TIntegerField;
    QDocumentDateStartBlockPlan: TDateTimeField;
    QDocumentDateStartBlockReal: TDateTimeField;
    QDocumentDateEndBlockPlan: TDateTimeField;
    QDocumentDateEndBlockReal: TDateTimeField;
    QDocumentNote: TMemoField;
    DataSource1: TDataSource;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    lblMDObjName: TLabel;
    JvDBLookupCombo1: TJvDBLookupCombo;
    JvDBLookupCombo2: TJvDBLookupCombo;
    JvDBLookupCombo3: TJvDBLookupCombo;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    JvDBDateEdit2: TJvDBDateEdit;
    JvDBDateEdit3: TJvDBDateEdit;
    JvDBDateEdit4: TJvDBDateEdit;
    btnOk: TButton;
    btnPost: TButton;
    btnCancel: TButton;
    btnManageParentToDoShow: TSpeedButton;
    btnManageParentToDoChoice: TSpeedButton;
    QListUsers: TADOQuery;
    QListToDo: TADOQuery;
    DS_QListToDo: TDataSource;
    DS_QListUsers: TDataSource;
    QDocumentSubconfig: TIntegerField;
    ADOQuery1: TADOQuery;
    procedure btnManageParentToDoShowClick(Sender: TObject);
    procedure btnManageParentToDoChoiceClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    frmSSN: TfrmSubSystems;
  end;

var
  frmEditCardMDObjBlock: TfrmEditCardMDObjBlock;

implementation

{$R *.dfm}

procedure TfrmEditCardMDObjBlock.btnManageParentToDoShowClick(
  Sender: TObject);
begin
  if QDocumentToDoID.AsInteger <> 0 then
    frmSSN.vToDoLst.OpenCard(QDocumentToDoID.AsInteger);
end;

procedure TfrmEditCardMDObjBlock.btnManageParentToDoChoiceClick(
  Sender: TObject);
var
  Node: TTreeNode;
begin
  with TfrmChoiceParentToDo.Create(nil) do
  begin
    frmSSM := frmSSN;
    QList := frmSSN.RunSQL(nil, 'select Id,Name from configs order by Name');
    QList.First;
    while not QList.Eof do
    begin
      Node := tvToDo.Items.AddObject(nil, QList.FieldByName('Name').AsString,
        Pointer(QList.FieldByName('ID').AsInteger));
      frmSSN.GrfNode(Node, 5);
      tvToDo.Items.AddChild(Node, 'system');
      vReturnID := 0;
      QList.Next;
    end;
    tvToDo.Images := frmSSN.ImageListToDoList;
    ShowModal;
    if not (QDocument.State in [dsInsert, dsEdit]) then
      QDocument.Edit;
    QDocumentToDoID.AsInteger := vReturnID;
    Free;
  end;
end;

procedure TfrmEditCardMDObjBlock.btnOkClick(Sender: TObject);
begin
  btnPostClick(Sender);
  Close;
end;

procedure TfrmEditCardMDObjBlock.btnPostClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
  begin
    with QDocument do
    begin
      Post;
      Refresh;
      Edit;
    end;
  end;
  DBEdit3.SetFocus;
end;

procedure TfrmEditCardMDObjBlock.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  //OpenResult := 0;
  close;
end;

procedure TfrmEditCardMDObjBlock.DBCheckBox1Click(Sender: TObject);
begin
  if not QDocumentBlocked.AsBoolean then begin
    QDocument.Edit;
    QDocumentUserUnBlockID.AsInteger := frmSSN.CurUser;
  end;
end;

end.

