unit FormEditCardDBChangeRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormSubSystemsMain, StdCtrls, DBCtrls, JvExControls,
  JvComponent, JvDBLookup, JvExMask, JvToolEdit, JvDBControls, DB, Mask,
  ADODB, Buttons, ComCtrls, FormChoiceParentToDo;

type
  TfrmEditCardDBChangeRecord = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentDateChange: TDateTimeField;
    QDocumentSubconfigID: TIntegerField;
    QDocumentMDObj: TIntegerField;
    QDocumentName: TWideStringField;
    QDocumentUserID: TIntegerField;
    QDocumentToDoID: TIntegerField;
    QDocumentNote: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsQDocument: TDataSource;
    Label2: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    JvDBLookupCombo1: TJvDBLookupCombo;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    JvDBLookupCombo2: TJvDBLookupCombo;
    JvDBLookupCombo3: TJvDBLookupCombo;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    lblMDObjName: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnManageParentToDoShow: TSpeedButton;
    btnManageParentToDoChoice: TSpeedButton;
    btnOk: TButton;
    btnPost: TButton;
    btnCancel: TButton;
    QListSubconfigs: TADOQuery;
    QListUsers: TADOQuery;
    QListToDo: TADOQuery;
    dsQListSubconfigs: TDataSource;
    dsQListUsers: TDataSource;
    dsQListToDo: TDataSource;
    procedure btnManageParentToDoShowClick(Sender: TObject);
    procedure btnManageParentToDoChoiceClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    frmSSF: TfrmSubSystems;
  end;

var
  frmEditCardDBChangeRecord: TfrmEditCardDBChangeRecord;

implementation

{$R *.dfm}

procedure TfrmEditCardDBChangeRecord.btnManageParentToDoShowClick(
  Sender: TObject);
begin
  if QDocumentToDoID.AsInteger <> 0 then
    frmSSF.vToDoLst.OpenCard(QDocumentToDoID.AsInteger);
end;

procedure TfrmEditCardDBChangeRecord.btnManageParentToDoChoiceClick(
  Sender: TObject);
var
  Node: TTreeNode;
begin
  with TfrmChoiceParentToDo.Create(nil) do
  begin
    frmSSM := frmSSF;
    QList := frmSSF.RunSQL(nil, 'select Id,Name from configs order by Name');
    QList.First;
    while not QList.Eof do
    begin
      Node := tvToDo.Items.AddObject(nil, QList.FieldByName('Name').AsString,
        Pointer(QList.FieldByName('ID').AsInteger));
      frmSSF.GrfNode(Node, 5);
      tvToDo.Items.AddChild(Node, 'system');
      vReturnID := 0;
      QList.Next;
    end;
    tvToDo.Images := frmSSM.ImageListToDoList;
    ShowModal;
    if not (QDocument.State in [dsInsert, dsEdit]) then
      QDocument.Edit;
    QDocumentToDoID.AsInteger := vReturnID;
    Free;
  end;
end;

procedure TfrmEditCardDBChangeRecord.btnOkClick(Sender: TObject);
begin
  btnPostClick(Sender);
  Close;
end;

procedure TfrmEditCardDBChangeRecord.btnPostClick(Sender: TObject);
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
  DBEdit2.SetFocus;
end;

procedure TfrmEditCardDBChangeRecord.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  //OpenResult := 0;
  close;
end;

end.

 