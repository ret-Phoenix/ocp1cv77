unit ListUsers;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, Dialogs, FormSubSystemsMain,
  ComCtrls, OpenConf_TLB, SysUtils, ADODB, FormEditCardUser, Controls, StdVcl;

type
  TListUsers = class(TAutoObject, IListUsers)
  private
    frm: TfrmSubSystems;
    List: TListView;
    Config: IConfigurator;
  public
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy;
    function Add: SYSINT; safecall;
    function Delete: SYSINT; safecall;
    function Edit: SYSINT; safecall;
    function GetCurrentUser(var vType: SYSINT): WideString; safecall;
    procedure Refresh; safecall;
    procedure SetCurrentUser(var vType: SYSINT; var vVal: WideString);
      safecall;
    function OpenCard(var vID: SYSINT): SYSINT; safecall;
    function GetLinksByID(vID: SYSINT): WideString; safecall;
    function GetEmailByID(var vID: SYSINT): WideString; safecall;
    function GetUserNameByID(vID, vTypeID: SYSINT): WideString; safecall;
  protected
    //
  end;

implementation

uses ComServ, DB;

constructor TListUsers.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewUsers;
  Config := vConfig;
end;

destructor TListUsers.Destroy;
begin
end;

function TListUsers.Add: SYSINT;
var
  vID: Integer;
begin
  Result := 0;
  vID := 0;
  Result := OpenCard(vID);
end;

function TListUsers.Delete: SYSINT;
var
  i: integer;
//  Q: TADOQuery;
  vStr: string;
begin
  Result := -1;
  if List.Selected = nil then
    exit;
  Result := 0;

  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;

  i := Integer(List.Selected.Data);
  //  , RecipientID, UserPlanID, UserRealID,
  vStr := GetLinksByID(i);
  if vStr = '' then
  begin
    frm.RunSQL(nil, 'delete from users where Id=' + IntToStr(i), 1);
    Result := 1;
  end
  else
  begin
    ShowMessage('Нельзя удалить данную запись, на нее имеются ссылки!');
    frm.Echo(vStr);
    Result := 0;
  end;
end;

function TListUsers.Edit: SYSINT;
var
  i: integer;
begin
  Result := -1;
  if List.Selected = nil then
    exit;
  Result := 0;
  i := Integer(List.Selected.Data);
  Result := OpenCard(i);
end;

function TListUsers.GetCurrentUser(var vType: SYSINT): WideString;
begin
  if vType = 0 then
    Result := frm.RunSQL(nil, 'select Name from Users where UserID=' +
      IntToStr(frm.CurUser), 0).Fields[0].AsString;
  if vType = 1 then
    Result := frm.RunSQL(nil, 'select ID from Users where Name=' +
      Config.AppProps[appUserName], 0).Fields[0].AsString;
end;

procedure TListUsers.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
  vSQLText: string;
  i: integer;
begin
  List.Items.BeginUpdate;
  List.Items.Clear;
  {
  frm.ComboBoxUsers.Items.BeginUpdate;
  frm.ComboBoxUsers.Items.Clear;
  frm.ComboBoxUsers.Items.Add('Все пользователи');
  }

  vSQLText := 'select UL.ID,UL.Name,UL.Login,SC.Name as [SubconfigName]'
    + 'from Users UL left join Subconfigs SC on UL.SubconfigID= SC.ID';
  i := frm.GetItemID(frm.ComboBoxSubconfigsOnUL);
  if i <> 0 then
    vSQLText := vSQLText + ' where ((SubconfigID=' + IntToStr(i) +
      ') or (SubconfigID=0))';

  Q := frm.RunSQL(nil, vSQLText, 0);
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
      Insert(1, Q.FieldByName('Login').AsString);
      Insert(2, Q.FieldByName('SubconfigName').AsString);

      if UpperCase(Trim(Q.FieldByName('Login').AsString)) =
        UpperCase(Config.AppProps[appUserName]) then
      begin
        frm.CurUser := Q.FieldByName('ID').AsInteger;
      end;

    end;

    //    frm.ComboBoxUsers.Items.Add('(' + Q.FieldByName('ID').AsString + ') ' +
      //    Q.FieldByName('Name').AsString);

    Q.Next;
  end;
  //  frm.ComboBoxUsers.Items.EndUpdate;
  List.Items.EndUpdate;
  //  frm.ComboBoxAuthor.Items := frm.ComboBoxUsers.Items;
end;

procedure TListUsers.SetCurrentUser(var vType: SYSINT;
  var vVal: WideString);
begin
  if vType = 0 then
    frm.CurUser := StrToInt(vVal);
  if vType = 1 then
    frm.CurUser := frm.RunSQL(nil, 'select ID from Users where Name=' + vVal,
      0).Fields[0].AsInteger;
end;

function TListUsers.OpenCard(var vID: SYSINT): SYSINT;
//var
//  vFileName: string;
begin

  with TfrmEditCardUser.Create(nil) do
  begin
    frm.RunSQL(QListSubconfigs, 'select Id,Name from subconfigs');
    frm.RunSQL(QDocument, 'select * from Users where ID = ' + IntToStr(vID));

    if vID = 0 then
    begin
      QDocument.Insert;
      QDocumentSubconfigID.AsInteger := frm.CurSubCfg;
    end;

    ShowModal;
    Result := OpenResult;
    Free;
  end;

end;

function TListUsers.GetLinksByID(vID: SYSINT): WideString;
begin
  Result := frm.GetLinksText('ToDo', 'AuthorID', 'ToDo', IntToStr(vID))
    + frm.GetLinksText('ToDo', 'RecipientID', 'ToDo', IntToStr(vID))
    + frm.GetLinksText('Relises', 'UserPlanID', 'Relise', IntToStr(vID))
    + frm.GetLinksText('Relises', 'UserRealID', 'Relise', IntToStr(vID));
end;

function TListUsers.GetEmailByID(var vID: SYSINT): WideString;
begin
  Result := Trim(frm.RunSQL(nil, 'select Email from Users where ID = ' +
    IntToStr(vID)).Fields[0].AsString);
end;

function TListUsers.GetUserNameByID(vID, vTypeID: SYSINT): WideString;
var
  vField: string;
begin
  if vTypeID = 0 then
    vField := 'Login'
  else
    vField := 'Name';
  Result := Trim(frm.RunSQL(nil, 'select ' + vField
    + ' from Users where ID = ' + IntToStr(vID)).Fields[0].AsString);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TListUsers, Class_ListUsers,
    ciMultiInstance, tmApartment);
end.

