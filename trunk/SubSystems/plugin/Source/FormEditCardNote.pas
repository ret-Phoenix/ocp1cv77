unit FormEditCardNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, ExtCtrls, Mask, FormSubSystemsMain,
  JvExControls, JvComponent, JvDBLookup;

type
  TfrmEditCardNote = class(TForm)
    QDocument: TADOQuery;
    QDocumentID: TAutoIncField;
    QDocumentObjID: TIntegerField;
    QDocumentNote: TMemoField;
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    DS_QDocument: TDataSource;
    btnOk: TButton;
    btnClose: TButton;
    QDocumentSubconfigID: TIntegerField;
    QListSubconfigs: TADOQuery;
    DS_QListSubconfigs: TDataSource;
    Panel2: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    QDocumentMDObjName: TWideStringField;
    Label2: TLabel;
    qryQListMDStruct: TADOQuery;
    dsListMDStruct: TDataSource;
    dblkcbbMDObj: TJvDBLookupCombo;
    procedure btnCloseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure DS_QListSubconfigsDataChange(Sender: TObject; Field: TField);
    procedure dsListMDStructDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    mMainFrm: TfrmSubSystems;
  end;

var
  frmEditCardNote: TfrmEditCardNote;

implementation

{$R *.dfm}

procedure TfrmEditCardNote.btnOkClick(Sender: TObject);
begin
  if QDocument.State in [dsEdit, dsInsert] then
  begin
    QDocument.Post;
  end;
  Close;
end;

procedure TfrmEditCardNote.btnCloseClick(Sender: TObject);
begin
  QDocument.Cancel;
  Close;
end;

procedure TfrmEditCardNote.DS_QListSubconfigsDataChange(Sender: TObject;
  Field: TField);
begin
  mMainFrm.RunSQL(qryQListMDStruct, 'select * from MDStruct where SubConfigID='
    + IntToStr(mMainFrm.CurSubCfg), 0);
end;

procedure TfrmEditCardNote.dsListMDStructDataChange(Sender: TObject;
  Field: TField);
begin
  if not (QDocument.State in [dsInsert,dsEdit]) then exit;
  with QDocument do
  begin
    FieldByName('ObjID').AsInteger :=
      qryQListMDStruct.FieldByname('MDObjID').AsInteger;
    FieldByName('MDObjName').AsString :=
      qryQListMDStruct.FieldByname('MDObjName').AsString;
  end;

end;

end.

