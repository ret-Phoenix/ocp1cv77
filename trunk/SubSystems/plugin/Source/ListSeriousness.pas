unit ListSeriousness;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, FormSubSystemsMain,
  OpenConf_TLB, Controls, ComCtrls, ADODB, SysUtils, Dialogs,
  FormEditCardSeriousness, StdVcl;

type
  TListSeriousness = class(TAutoObject, IListSeriousness)
  public
    frm: TfrmSubSystems;
    List: TListView;
    Config: IConfigurator;

    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy;

  protected
    procedure Delete; safecall;
    procedure Edit; safecall;
    procedure New; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
    procedure Refresh; safecall;

  end;

implementation

uses ComServ;

constructor TListSeriousness.CreateObj(frmSS: TfrmSubSystems; vConfig:
  IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewSeriousness;
  Config := vConfig;
end;

destructor TListSeriousness.Destroy;
begin
end;

procedure TListSeriousness.Delete;
var
  Q: TADOQuery;
  vStatusID: string;
begin
  if List.Selected = nil then
    exit;
  vStatusID := IntToStr(Integer(List.Selected.data));
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  Q := FRM.RunSQL(nil, 'select ID from ToDo where SeriousnessID=' + vStatusID,
    0);
  if not Q.IsEmpty then
  begin
    ShowMessage('На данную запись есть ссылки, сначала удалите их!');

    Q.First;
    while not Q.Eof do
    begin
      frm.Echo('Задача № ' + Q.FieldByName('ID').AsString);
      Q.Next;
    end;

  end
  else
  begin
    frm.RunSQL(nil, 'delete from Seriousness where ID=' + vStatusID, 1);
  end;
end;

procedure TListSeriousness.Edit;
var
  i: integer;
begin
  if List.Selected = nil then
    exit;
  i := Integer(List.Selected.Data);
  OpenCard(i);
end;

procedure TListSeriousness.New;
var
  i: integer;
begin
  i := 0;
  OpenCard(i);
end;

procedure TListSeriousness.OpenCard(var vID: SYSINT);
begin
  with TfrmEditCardSeriousness.Create(nil) do
  begin

    with QDocument do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from Seriousness where ID=' + IntToStr(vID));
      Connection := frm.SubSystemConnection;
      Open;
      if vID = 0 then
        Insert
      else
        Edit;
    end;
    ShowModal;
    Free;
  end;
end;

procedure TListSeriousness.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
begin
  // обновим основной список
  List.Items.BeginUpdate;
  List.Items.Clear;
  Q := frm.RunSQL(nil, 'select id,name from Seriousness', 0);
  Q.First;
  while not Q.Eof do
  begin
    LItem := List.Items.Add;
    with LItem do
    begin
      Caption := Q.FieldByName('ID').AsString;
      Data := Pointer(Q.FieldByName('ID').AsInteger);
    end;
    with LItem.SubItems do
    begin
      Insert(0, Q.FieldByName('Name').AsString);
    end;
    Q.Next;
  end;
  List.Items.EndUpdate;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TListSeriousness, Class_ListSeriousness,
    ciMultiInstance, tmApartment);
end.
