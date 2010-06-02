unit FormEditCardObjectNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBCtrls, ADODB;

type
  TfrmEditCardObjectNote = class(TForm)
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    Panel1: TPanel;
    btnOk: TButton;
    btnClose: TButton;
    QObjNote: TADOQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditCardObjectNote: TfrmEditCardObjectNote;

implementation
uses FormSubSystemsMain;
{$R *.dfm}

procedure TfrmEditCardObjectNote.btnOkClick(Sender: TObject);
begin
  if QObjNote.State in [dsInsert,dsEdit] then
    QObjNote.Post;
  Close;
end;

procedure TfrmEditCardObjectNote.btnCloseClick(Sender: TObject);
begin
  QObjNote.Cancel;
  Close;
end;

end.
