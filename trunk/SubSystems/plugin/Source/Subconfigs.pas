unit Subconfigs;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, CfgList, FormSubSystemsMain,
  OpenConf_TLB, ComCtrls, Dialogs, Controls, SysUtils, ADODB,
  FormEditCardSubconfig, StdVcl;

type
  TSubconfigs = class(TAutoObject, ISubconfigs)
  private
    frm: TfrmSubSystems;
    List: TListView;
    Config: IConfigurator;
  public
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator;
      vConfigList: ICfgList);
    destructor Destroy;
    procedure Refresh(vCfgID: SYSINT); safecall;
    procedure Add; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure Choice; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
    procedure SetCurrent; safecall;
//    function GetCurrent() : SYSINT; safecall;
    function GetLinksByID(vID: SYSINT): WideString; safecall;
  protected

  end;

implementation

uses ComServ;

constructor TSubconfigs.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator;
  vConfigList: ICfgList);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewSubconfigs;
  Config := vConfig;
end;
//------------------------------------------------------------------------------

destructor TSubconfigs.Destroy;
begin
end;
//------------------------------------------------------------------------------

procedure TSubconfigs.Add;
var
  vID: Integer;
  Q: TADOQuery;
begin
  {ToDo: перевести на параметры или заменить на простое добавление}
  Q := frm.RunSQL(nil,'select id from todo where id=0');
  with Q do begin
    close;
    sql.Clear;
    sql.Add('select Id,Name,ConfigID from Subconfigs where rtrim(Path)=:pCDir');
    Parameters.ParamByName('pCDir').Value := Config.IBDir;
    Open;
  end;
  if not Q.IsEmpty then
  begin
    if MessageDlg('Данный путь уже зарегистрирован!'#13#10
      + frm.GetNameByID(Q.FieldByName('ConfigID').AsInteger, 'configs')
      + ' - (' + Q.FieldByName('ID').AsString + ') '
      + Trim(Q.FieldByName('Name').AsString)
      + #13#10'Добавить данную подконфигурацию?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;
  end;
  vID := 0;
  OpenCard(vID);
end;
//------------------------------------------------------------------------------

procedure TSubconfigs.Choice;
var
  CurItem: TListItem;
  i: Integer;
begin
  //ShowMessage('выбираем подконфигу');
  CurItem := List.Selected;
  if CurItem = nil then
    Exit;
  //ShowMessage('точно выделена');
  CurItem.ImageIndex := GrfSubCfgChoice;
  frm.CurSubCfg := Integer(List.Selected.Data);
  //ShowMessage('устанавливаем переменные');
  for i := 0 to List.Items.Count - 1 do
  begin
    if CurItem <> List.Items.Item[i] then
    begin
      List.Items.Item[i].ImageIndex := GrfSubCfgUnChoice;
      //ShowMessage('установили картинку');
    end;
  end;
  frm.ListConditions.Values['Подконфигурация'] := '(' + IntToStr(frm.CurSubCfg)
    +
    ') ' + List.Selected.Caption;
  //ShowMessage('установили значения в мн.фильтре');
  frm.vRelisesList.Refresh;
end;
//------------------------------------------------------------------------------

procedure TSubconfigs.Delete;
var
  vStr: string;
begin
  if List.Selected <> nil then
  begin
    if MessageDlg('Удалить подконфигурацию?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      vStr := GetLinksByID(Integer(List.Selected.data));
      if vStr = '' then
        frm.RunSQL(nil, 'Delete from subconfigs where ID = ' +
          IntToStr(Integer(List.Selected.data)), 1)
      else
      begin
        ShowMessage('Нельзя удалить данную запись, на нее есть ссылки!');
        frm.Echo(vStr);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TSubconfigs.Edit;
var
  vID: Integer;
begin
  if List.Selected <> nil then
  begin
    vID := Integer(List.Selected.data);
    OpenCard(vID);
  end;
end;
//------------------------------------------------------------------------------

procedure TSubconfigs.OpenCard(var vID: SYSINT);
begin
  with TfrmEditCardSubconfig.Create(nil) do
  begin
    frm.RunSQL(QListConfigs, 'select * from configs');
    frm.RunSQL(QDocument, 'select * from subconfigs where Id =' +
      IntToStr(vID));

    if vID = 0 then
    begin
      QDocument.Insert;
      QDocumentConfigID.AsInteger := frm.CurCfg;
      QDocumentName.AsString := Config.MetaData.TaskDef.Props[1];
      QDocumentPath.AsString := Config.IBDir;
    end
    else
      QDocument.edit;

    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TSubconfigs.Refresh(vCfgID: SYSINT);
var
  Q: TADOQuery;
  LItem: TListItem;
  s: string;
  i: Integer;
begin
  try

    if vCfgID = 0 then
      vCfgID := frm.CurCfg;

    if frm.CurCfg = vCfgID then
    begin

      frm.ComboBoxSubconfigsOnASL.Items.BeginUpdate;
      frm.ComboBoxSubconfigsOnASL.Items.Clear;
      frm.ComboBoxSubconfigsOnASL.Items.Add('Все подконфигурации');

    end;

    List.Items.Clear;
    Q := frm.RunSQL(nil, 'Select * from Subconfigs where ConfigID = ' +
      IntToStr(vCfgID) + ' Order by Name', 0);
    Q.First;
    while not Q.Eof do
    begin
      LItem := List.Items.Add;
      LItem.Caption := Q.Fields[2].AsString;
      LItem.SubItems.Insert(0, Q.Fields[3].AsString);
      LItem.Data := Pointer(Q.Fields[0].AsInteger);
      LItem.ImageIndex := GrfSubCfgUnChoice;
      if frm.CurCfg = vCfgID then
      begin

        frm.ComboBoxSubconfigsOnASL.Items.Add('(' + Q.FieldByName('ID').AsString
          + ') '
          + Q.FieldByName('Name').AsString);

      end;
      if UpperCase(Config.IBDir) =
        trim(UpperCase(Q.FieldByName('Path').AsString)) then
      begin
        i := Q.RecNo;
        frm.CurSubCfg := Q.FieldByName('ID').AsInteger;
        LItem.ImageIndex := GrfSubCfgChoice;
      end;
      Q.Next;
    end;

    if frm.CurCfg = vCfgID then
    begin

      frm.ComboBoxSubconfigsOnSSL.Items := frm.ComboBoxSubconfigsOnASL.Items;
      frm.ComboBoxSubconfigsOnRL.Items := frm.ComboBoxSubconfigsOnASL.Items;
      frm.ComboBoxSubconfigsOnUL.Items := frm.ComboBoxSubconfigsOnASL.Items;

      frm.ComboBoxSubconfigsOnSSL.ItemIndex := i;
      frm.ComboBoxSubconfigsOnRL.ItemIndex := i;
      frm.ComboBoxSubconfigsOnASL.ItemIndex := i;
      frm.ComboBoxSubconfigsOnUL.ItemIndex := i;

      frm.ComboBoxSubconfigsOnASL.Items.EndUpdate;

      frm.ListConditions.Values['Подконфигурация'] :=
        frm.ComboBoxSubconfigsOnSSL.Text;

    end;

  except
    on E: Exception do
    begin
      s := 'Подсистемы: Обновление списка подконфигураций'#13#10 +
        'Возникло исключение:'#13#10 + E.Message;
      frm.Echo(s);
      ShowMessage(s);
    end;

  end;
end;
//
//function TSubconfigs.GetCurrent() : SYSINT;
//begin
//  Result := frm.CurSubCfg;
//end;

procedure TSubconfigs.SetCurrent;
var
  i: integer;
  s: string;
begin
  try
    //    ShowMessage('до обновления списока подконфигураций');
    Refresh(frm.CurCfg);
    //    ShowMessage('после обновления списока подконфигураций');
    for i := 0 to List.Items.Count - 1 do
    begin
      //ShowMessage('вошли в цикл ' + IntToStr(i));
        //ShowMessage('subitm: ' + List.Items.Item[i].SubItems[0]);
          //ShowMessage('ib dir: ' + Config.IBDir);
      if List.Items.Item[i].SubItems[0] = Config.IBDir then
      begin
        //ShowMessage('нашли текущую');
        List.Items.Item[i].Selected := True;
        Choice;
      end;
    end;
  except
    on E: Exception do
    begin
      s := 'Подсистемы: Установка текущей подконфигурации'#13#10 +
        'Возникло исключение:'#13#10 + E.Message;
      frm.Echo(s);
      ShowMessage(s);
    end;
  end;
end;

function TSubconfigs.GetLinksByID(vID: SYSINT): WideString;
begin
  Result :=
    frm.GetLinksText('ObjectNote', 'SubconfigID', 'ObjectNote', IntToStr(vID))
    + frm.GetLinksText('Relises', 'SubconfigID', 'Relise', IntToStr(vID))
    + frm.GetLinksText('Subsystems', 'SubconfigID', 'Subsystem', IntToStr(vID))
    + frm.GetLinksText('ToDo', 'SubconfigID', 'ToDo', IntToStr(vID))
    + frm.GetLinksText('Users', 'SubconfigID', 'User', IntToStr(vID));

end;

initialization
  TAutoObjectFactory.Create(ComServer, TSubconfigs, Class_Subconfigs,
    ciMultiInstance, tmApartment);
end.

