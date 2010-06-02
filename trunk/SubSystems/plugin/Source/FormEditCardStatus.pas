unit FormEditCardStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormSubSystemsMain, StdCtrls, DBCtrls, Mask, DB, ADODB;

type
  TfrmEditCardStatus = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentName: TWideStringField;
    QDocumentNote: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    btnOk: TButton;
    btnPost: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditCardStatus: TfrmEditCardStatus;

implementation

{$R *.dfm}

procedure TfrmEditCardStatus.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  close;
end;

procedure TfrmEditCardStatus.btnPostClick(Sender: TObject);
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
end;

procedure TfrmEditCardStatus.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  close;
end;

procedure TfrmEditCardStatus.FormShow(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

end.
