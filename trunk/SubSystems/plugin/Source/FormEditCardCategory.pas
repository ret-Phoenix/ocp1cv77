unit FormEditCardCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormSubSystemsMain, DB, ADODB, StdCtrls, DBCtrls, Mask;

type
  TfrmEditCardCategory = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentParentID: TIntegerField;
    QDocumentIsFolder: TBooleanField;
    QDocumentName: TWideStringField;
    QDocumentNote: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    btnOk: TButton;
    btnPost: TButton;
    btnCancel: TButton;
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
  frmEditCardCategory: TfrmEditCardCategory;

implementation

{$R *.dfm}

procedure TfrmEditCardCategory.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  OpenResult := QDocumentid.AsInteger;
  close;
end;

procedure TfrmEditCardCategory.btnPostClick(Sender: TObject);
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

procedure TfrmEditCardCategory.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  OpenResult := 0;
  close;
end;

end.
