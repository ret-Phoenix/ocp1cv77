unit FormEditCardSubconfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormSubSystemsMain, DB, ADODB, DBCtrls, StdCtrls, Mask, Buttons,
  FileCtrl;

type
  TfrmEditCardSubconfig = class(TForm)
    QDocument: TADOQuery;
    QListConfigs: TADOQuery;
    DS_QDocument: TDataSource;
    DS_QListConfigs: TDataSource;
    QDocumentID: TAutoIncField;
    QDocumentConfigID: TIntegerField;
    QDocumentName: TWideStringField;
    QDocumentNote: TMemoField;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    btnCancel: TButton;
    btnPost: TButton;
    btnOk: TButton;
    QDocumentPath: TStringField;
    btnChoiceDir: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnChoiceDirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditCardSubconfig: TfrmEditCardSubconfig;

implementation

{$R *.dfm}

procedure TfrmEditCardSubconfig.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  close;
end;

procedure TfrmEditCardSubconfig.btnPostClick(Sender: TObject);
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
  DBEdit1.SetFocus;
end;

procedure TfrmEditCardSubconfig.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  close;
end;

procedure TfrmEditCardSubconfig.btnChoiceDirClick(Sender: TObject);
var
  lDir :string;
begin
  lDir := DBEdit2.Text;
  if SelectDirectory('Выбор каталога', '', lDir) then
  begin
    DBEdit2.Text := lDir;
  end;
end;

end.

