unit FormEditCardRelise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, Mask, ADODB, ComCtrls, DBEditDateTimePicker,
  OpenConf_TLB, FormSubSystemsMain;

type
  TfrmEditCardRelise = class(TForm)
    QDocument: TADOQuery;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DSQDocument: TDataSource;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    DBEditDateTimePicker1: TDBEditDateTimePicker;
    DBEditDateTimePicker2: TDBEditDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    btnClose: TButton;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    btnClear: TButton;
    QListSubconfigs: TADOQuery;
    QListConfigs: TADOQuery;
    DSQListConfigs: TDataSource;
    DSQListSubconfigs: TDataSource;
    QListUsers: TADOQuery;
    DS_QListUsers: TDataSource;
    QDocumentID: TAutoIncField;
    QDocumentConfigID: TIntegerField;
    QDocumentName: TWideStringField;
    QDocumentNote: TMemoField;
    QDocumentDateLoadPlan: TDateTimeField;
    QDocumentDateLoadreal: TDateTimeField;
    QDocumentSubconfigID: TIntegerField;
    QDocumentUserPlanID: TIntegerField;
    QDocumentUserRealID: TIntegerField;
    DBLookupComboBox3: TDBLookupComboBox;
    Button2: TButton;
    DBLookupComboBox4: TDBLookupComboBox;
    Button3: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure QDocumentConfigIDChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    pConf: IConfigurator;
    frmSS: TfrmSubSystems;
  end;

var
  frmEditCardRelise: TfrmEditCardRelise;

implementation
//uses FormSubSystemsMain;
{$R *.dfm}

procedure TfrmEditCardRelise.Button1Click(Sender: TObject);
begin
  if QDocument.State in [dsInsert, dsEdit] then
    QDocument.Post;
  close;
end;

procedure TfrmEditCardRelise.btnCloseClick(Sender: TObject);
begin
  QDocument.cancel;
  close;
end;

procedure TfrmEditCardRelise.btnClearClick(Sender: TObject);
begin
  QDocumentSubconfigID.AsInteger := 0;
end;

procedure TfrmEditCardRelise.DBLookupComboBox2Enter(Sender: TObject);
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

procedure TfrmEditCardRelise.QDocumentConfigIDChange(Sender: TField);
begin
  QDocumentSubconfigID.AsInteger := 0;
end;

end.
