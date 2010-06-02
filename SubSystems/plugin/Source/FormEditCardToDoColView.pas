unit FormEditCardToDoColView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormSubSystemsMain, DB, StdCtrls, Mask, DBCtrls, ADODB, ComCtrls;

type
  TfrmEditCardToDoColView = class(TForm)
    QDocument: TADOQuery;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    btnOk: TButton;
    btnPost: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    btnUp: TButton;
    btnDown: TButton;
    ListViewCol: TListView;
    QDocumentID: TAutoIncField;
    QDocumentName: TWideStringField;
    QDocumentFName: TWideStringField;
    QDocumentFPriority: TWideStringField;
    QDocumentFSeriousnessName: TWideStringField;
    QDocumentFStatusName: TWideStringField;
    QDocumentFDateStart: TWideStringField;
    QDocumentFDateEnd: TWideStringField;
    QDocumentFDateStartPlan: TWideStringField;
    QDocumentFDateEndPlan: TWideStringField;
    QDocumentFRecipientName: TWideStringField;
    QDocumentFConfigName: TWideStringField;
    QDocumentFSubconfigName: TWideStringField;
    QDocumentFSubsystems: TWideStringField;
    QDocumentFMDObjTypes: TWideStringField;
    QDocumentFMDObj: TWideStringField;
    QDocumentFManagerName: TWideStringField;
    QDocumentFReliseName: TWideStringField;
    sQDocumentFCR: TStringField;
    procedure ListViewColCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure btnOkClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure ListViewColDblClick(Sender: TObject);
    procedure ListViewColMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    OpenResult: integer;
  end;

var
  frmEditCardToDoColView: TfrmEditCardToDoColView;

implementation

{$R *.dfm}

procedure TfrmEditCardToDoColView.ListViewColCompare(Sender: TObject;
  Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  vDop: Boolean;
begin
  try
    vDop := PLRec(Item2.Data).Position < PLRec(Item1.Data).Position;
    Compare := Integer(vDop);
  except
  end;
end;

procedure TfrmEditCardToDoColView.btnOkClick(Sender: TObject);
begin
  btnPostClick(sender);
  OpenResult := QDocumentid.AsInteger;
  close;
end;

procedure TfrmEditCardToDoColView.btnPostClick(Sender: TObject);
var
  i: integer;
  FldName, vPosition: string;
  LItem: TListItem;
begin
  //if QDocument.State in [dsEdit,sdInsert]
  QDocument.Edit;
  for i := 0 to ListViewCol.Items.Count - 1 do
  begin
    LItem := ListViewCol.Items.Item[i];
    FldName := PLRec(LItem.Data).FName;

    if PLRec(LItem.Data).Position < 10 then
      vPosition := '0' + IntToStr(PLRec(LItem.Data).Position)
    else
      vPosition := IntToStr(PLRec(LItem.Data).Position);

    if LItem.Checked then
      QDocument.FieldByName(FldName).AsString := '1_' + vPosition + '_' +
        LItem.SubItems[0]
    else
      QDocument.FieldByName(FldName).AsString := '0_' + vPosition + '_' +
        LItem.SubItems[0];
  end;

  with QDocument do
  begin
    Post;
    Edit;
  end;
  DBEdit2.SetFocus;
end;

procedure TfrmEditCardToDoColView.btnCancelClick(Sender: TObject);
begin
  QDocument.cancel;
  OpenResult := 0;
  close;
end;

procedure TfrmEditCardToDoColView.btnUpClick(Sender: TObject);
var
  LItem: TListItem;
begin
  LItem := ListViewCol.Selected;
  if (LItem <> nil) then
  begin
    ListViewCol.Items.Item[LItem.Index - 1].Selected := True;
    PLRec(LItem.Data).Position := PLRec(LItem.Data).Position - 1;
    PLRec(ListViewCol.Items.Item[LItem.Index - 1].Data).Position :=
      PLRec(ListViewCol.Items.Item[LItem.Index - 1].Data).Position + 1;
    ListViewCol.AlphaSort;
  end;
end;

procedure TfrmEditCardToDoColView.btnDownClick(Sender: TObject);
var
  LItem: TListItem;
begin
  LItem := ListViewCol.Selected;
  if LItem = nil then
    exit;
  PLRec(LItem.Data).Position := PLRec(LItem.Data).Position + 1;
  PLRec(ListViewCol.Items.Item[LItem.Index + 1].Data).Position :=
    PLRec(ListViewCol.Items.Item[LItem.Index + 1].Data).Position - 1;
  ListViewCol.AlphaSort;
end;

procedure TfrmEditCardToDoColView.ListViewColDblClick(Sender: TObject);
var
  vOld: string;
begin
  vOld := ListViewCol.Selected.SubItems[0];
  if InputQuery('Ширина', 'Ширина колонки', vOld) then
    ListViewCol.Selected.SubItems[0] := vOld;
end;

procedure TfrmEditCardToDoColView.ListViewColMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
  HitTest: THitTests;
begin
  Item := ListViewCol.GetItemAt(x, y);
  HitTest := ListViewCol.GetHitTestInfoAt(x, y);
  if (Item <> nil) then
  begin
    Item.Selected := True;
  end;
end;

end.

