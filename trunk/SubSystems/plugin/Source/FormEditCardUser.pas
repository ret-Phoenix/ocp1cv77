unit FormEditCardUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBCtrls, StdCtrls, Mask;

type
  TfrmEditCardUser = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentSubconfigID: TIntegerField;
    QDocumentName: TWideStringField;
    QDocumentLogin: TWideStringField;
    QDocumentNote: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DS_QDocument: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    btnCancel: TButton;
    btnPost: TButton;
    btnOk: TButton;
    Label4: TLabel;
    DS_QListSubconfigs: TDataSource;
    QListSubconfigs: TADOQuery;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    QDocumentEmail: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OpenResult: Integer;
  end;

var
  frmEditCardUser: TfrmEditCardUser;

implementation
uses FormSubSystemsMain;
{$R *.dfm}

procedure TfrmEditCardUser.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  OpenResult := QDocumentid.AsInteger;
  close;
end;

procedure TfrmEditCardUser.btnPostClick(Sender: TObject);
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

procedure TfrmEditCardUser.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  OpenResult := 0;
  close;
end;

end.
