unit ListCategoryes;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, FormSubSystemsMain,
  OpenConf_TLB, Controls, ComCtrls, ADODB, SysUtils, Dialogs, StdVcl;

type
  TListCategoryes = class(TAutoObject, IListCategoryes)
  public
    frm: TfrmSubSystems;
    List: TListView;
    //vSSList: TTuningSubSystemsList;
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

uses ComServ, FormEditCardCategory, Forms;

constructor TListCategoryes.CreateObj(frmSS: TfrmSubSystems; vConfig:
  IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewCategoryes;
  Config := vConfig;
end;

destructor TListCategoryes.Destroy;
begin
end;

procedure TListCategoryes.Delete;
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
  Q := FRM.RunSQL(nil,
    'select ToDoID from ToDoAccessory where TypeDataID = 5 and ObjId=' +
    vStatusID, 0);
  if not Q.IsEmpty then
  begin
    ShowMessage('На данную категорию есть ссылки, сначала удалите их!');

    Q.First;
    while not Q.Eof do
    begin
      frm.Echo('Задача № ' + Q.FieldByName('ID').AsString);
      Q.Next;
    end;

  end
  else
  begin
    frm.RunSQL(nil, 'delete from Categoryes where ID=' + vStatusID, 1);
  end;
end;

procedure TListCategoryes.Edit;
var
  i: integer;
begin
  if List.Selected = nil then
    exit;
  i := Integer(List.Selected.Data);
  OpenCard(i);
end;

procedure TListCategoryes.New;
var
  i: integer;
begin
  i := 0;
  OpenCard(i);
end;

procedure TListCategoryes.OpenCard(var vID: SYSINT);
begin
  with TfrmEditCardCategory.Create(nil) do
  begin

    with QDocument do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from Categoryes where ID=' + IntToStr(vID));
      Connection := frm.SubSystemConnection;
      Open;
      if vID = 0 then
        Insert
      else
        Edit;
    end;
    ShowModal;
    Free;
    //ParentWindow := Application.MainForm.Handle;
    //Show;
  end;
end;

procedure TListCategoryes.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
begin
  // обновим список на закладке задач на основной форме
    {
  frm.ComboBoxCategory.Items.BeginUpdate;
  frm.ComboBoxCategory.Items.Clear;
  frm.ComboBoxCategory.Items.Add('Все категории');
  }
  // обновим основной список
  List.Items.BeginUpdate;
  List.Items.Clear;
  Q := frm.RunSQL(nil, 'select id,name from Categoryes where IsFolder = 0', 0);
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
    //   frm.ComboBoxCategory.Items.Add('(' + Q.FieldByName('ID').AsString + ') ' + Q.FieldByName('Name').AsString);
    Q.Next;
  end;
  List.Items.EndUpdate;
  //  frm.ComboBoxCategory.Items.EndUpdate;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TListCategoryes, Class_ListCategoryes,
    ciMultiInstance, tmApartment);
end.
