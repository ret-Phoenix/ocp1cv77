unit FormEditCardSubsystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBCtrls, StdCtrls, Mask;

type
  TfrmEditCardSubsystem = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentConfigID: TIntegerField;
    QDocumentName: TWideStringField;
    QDocumentSubconfigID: TIntegerField;
    QDocumentNote: TMemoField;
    QListConfigs: TADOQuery;
    QListSubconfigs: TADOQuery;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DS_QDocument: TDataSource;
    DS_QListConfigs: TDataSource;
    DS_QListSubconfigs: TDataSource;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    btnOk: TButton;
    btnPost: TButton;
    btnCancel: TButton;
    btnClear: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure QDocumentConfigIDChange(Sender: TField);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditCardSubsystem: TfrmEditCardSubsystem;

implementation
uses FormSubSystemsMain;
{$R *.dfm}

procedure TfrmEditCardSubsystem.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  close;
end;

procedure TfrmEditCardSubsystem.btnPostClick(Sender: TObject);
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

procedure TfrmEditCardSubsystem.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  close;
end;

procedure TfrmEditCardSubsystem.btnClearClick(Sender: TObject);
begin
  QDocumentSubconfigID.AsInteger := 0;
end;

procedure TfrmEditCardSubsystem.QDocumentConfigIDChange(Sender: TField);
begin
  QDocumentSubconfigID.AsInteger := 0;
end;

procedure TfrmEditCardSubsystem.DBLookupComboBox2Enter(Sender: TObject);
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

end.
