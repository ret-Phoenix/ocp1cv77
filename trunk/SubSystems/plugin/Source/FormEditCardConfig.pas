unit FormEditCardConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, 
  ActnList, FormSubSystemsMain;

type
  TfrmEditCardConfig = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentName: TWideStringField;
    DS_QDocument: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    btnOk: TButton;
    btnPost: TButton;
    btnCancel: TButton;
    QDocumentNote: TMemoField;
    DBMemo1: TDBMemo;
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmEditCardConfig: TfrmEditCardConfig;

implementation

{$R *.dfm}

procedure TfrmEditCardConfig.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  close;
end;

procedure TfrmEditCardConfig.btnPostClick(Sender: TObject);
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

procedure TfrmEditCardConfig.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  close;
end;

end.
