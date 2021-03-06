unit FormEditCardSeriousness;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormSubSystemsMain, DB, ADODB, StdCtrls, DBCtrls, Mask;

type
  TfrmEditCardSeriousness = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentName: TWideStringField;
    QDocumentNote: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    btnCancel: TButton;
    btnPost: TButton;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OpenResult: Integer
  end;

var
  frmEditCardSeriousness: TfrmEditCardSeriousness;

implementation
{$R *.dfm}

procedure TfrmEditCardSeriousness.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  OpenResult := QDocumentid.AsInteger;
  close;

end;

procedure TfrmEditCardSeriousness.btnPostClick(Sender: TObject);
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

procedure TfrmEditCardSeriousness.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  OpenResult := 0;
  close;

end;

end.
