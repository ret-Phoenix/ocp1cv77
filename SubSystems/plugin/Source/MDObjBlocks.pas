unit MDObjBlocks;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, FormSubSystemsMain, SysUtils,
  ComCtrls, ADODB, FormEditCardMDObjBlock, Dialogs, Controls, StdVcl;

type
  TMDObjBlocks = class(TAutoObject, IMDObjBlocks)
  public
    frmSS: TfrmSubSystems;
    List: TListView;

    constructor CreateObj(frmSSP: TfrmSubSystems);
    destructor Destroy;

  protected
    function Delete: SYSINT; safecall;
    function Get(vMDObjID, vTypeData: SYSINT): SYSINT; safecall;
    procedure OpenCard(vID, vIdType: SYSINT); safecall;
    procedure Refresh; safecall;
    function SetBlock(vMDObjID: SYSINT): SYSINT; safecall;
    procedure UnSetBlock(vMDObjID: SYSINT); safecall;
    function Edit: SYSINT; safecall;
    procedure ShowBlocks(vVal: SYSINT); safecall;

  end;

implementation

uses ComServ;

constructor TMDObjBlocks.CreateObj(frmSSP: TfrmSubSystems);
begin
  inherited Create;
  frmSS := frmSSP;
  List := frmSS.lvMDObjBlocks;
end;

destructor TMDObjBlocks.Destroy;
begin
end;

function TMDObjBlocks.Delete: SYSINT;
begin
  Result := 0;
  if List.Selected = nil then
    exit;

  if MessageDlg('Удалить запись блокировки объекта МД?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    frmSS.RunSQL(nil, 'delete from MDObjBlocks where id= ' +
      IntToStr(Integer(List.Selected.data)),1);
  end;
  Result := 1;
end;

function TMDObjBlocks.Get(vMDObjID, vTypeData: SYSINT): SYSINT;
var
  Q: TADOQuery;
  vField: string;
begin
  case vTypeData of
    0: vField := 'id';
    1: vField := 'UserBlockID';
  end;
  Q := frmSS.RunSQL(nil, 'select ' + vField + ' from MDObjBlocks where MDObj=' +
    IntToStr(vMDObjID) + ' and Blocked='+frmSS.DBTrue);
  if Q.IsEmpty then
    Result := 0
  else
    Result := Q.Fields[0].AsInteger;
end;

procedure TMDObjBlocks.OpenCard(vID, vIdType: SYSINT);
var
  Q: TADOQuery;
  vMDID: string;
begin
  with TfrmEditCardMDObjBlock.Create(nil) do
  begin
    frmSSN := frmSS;

    frmSS.RunSQL(QListUsers, 'select id,name from Users order by name');
    frmSS.RunSQL(QListToDo, 'select id,name from ToDo order by name');
    case vIdType of
      0: // open by id
        begin
          Q := frmSS.RunSQL(QDocument, 'select * from MDObjBlocks where id=' +
            IntToStr(vID));
          if Q.IsEmpty then
          begin
            ShowMessage('Нет данных по данному ID');
            Free;
            Exit;
          end;
        end;
      1: // open for read by md id
        begin
          if vID < 0 then
          begin
            ShowMessage('Неправильный ИД объекта!');
            Free;
            exit;
          end;

          frmSS.RunSQL(QDocument, 'select * from MDObjBlocks where ID=' +
            IntToStr(vID));
          if QDocument.Recordset.RecordCount = 0 then
          begin
            ShowMessage('Нет данных по блокировке объекта.');
            Free;
            Exit;
          end;
        end;
      2: // open for (un)set blocking
        begin
          if vID < 0 then
            vMDID := IntToStr(-vID)
          else
            vMDID := IntToStr(vID);

          frmSS.RunSQL(QDocument, 'select * from MDObjBlocks where (MDObj='
            + vMDID + ') and (SubconfigId=' + IntToStr(frmSS.CurSubCfg) +
            ')');
          if QDocument.Recordset.RecordCount = 0 then
          begin
            if vID > 0 then
            begin
              QDocument.Insert();
              QDocumentSubconfig.AsInteger := frmSS.CurSubCfg;
              QDocumentToDoID.AsInteger := 0;
              QDocumentUserBlockID.AsInteger := frmSS.CurUser;
              QDocumentBlocked.AsBoolean := True;
              QDocumentMDObj.AsInteger := vID;
            end
            else if vID < 0 then
            begin
              ShowMessage('Нельзя разблокировать не заблокированный объект!');
              Free;
              exit;
            end
          end
          else if (QDocument.Recordset.RecordCount <> 0) then
          begin
            if (vID < 0) then
            begin
              QDocument.Edit;
              QDocumentBlocked.AsBoolean := False;
            end;

            if (vID > 0) then
            begin
              ShowMessage('Нелья заблокировать неразблокированный объект!');
              Free;
              Exit;
            end;

          end;

        end;
    end;

    try
      lblMDObjName.Caption :=
        frmSS.FConfigurator.MetaData.FindObject(QDocumentMDObj.AsInteger).FullName;
    except
      lblMDObjName.Caption := 'Объект не найден!';
    end;

    ShowModal;
    Free;
  end;
end;

procedure TMDObjBlocks.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
begin
  try
    List.Items.BeginUpdate;
    List.Items.Clear;
    Q := frmSS.RunSQL(nil, 'Select id,name,blocked,DateStartBlockPlan,MDObj,'
      + '(select count(MDC.id) from MDObjBlocksChange as MDC '
      + ' where MDC.MDObj=MDObj and DateChange between DateStartBlockPlan and DateEndBlockPlan) as ColEdits,'
      + 'DateEndBlockPlan from MDObjBlocks where subconfigid=' +
      IntToStr(frmSS.CurSubCfg));
    Q.First;
    while not Q.Eof do
    begin
      LItem := List.Items.Add;
      try
        LItem.Caption :=
          frmSS.FConfigurator.MetaData.FindObject(Q.FieldByName('MDObj').AsInteger).FullName;
      except
        LItem.Caption := 'Объект не найден!';
      end;
      LItem.Data := Pointer(Q.FieldByName('ID').AsInteger);
      with LItem.SubItems do
      begin
        Insert(0, Q.FieldByName('Name').AsString);
        Insert(1, Q.FieldByName('DateStartBlockPlan').AsString);
        Insert(2, Q.FieldByName('DateEndBlockPlan').AsString);
      end;
      if Q.FieldByName('blocked').AsBoolean then
        if Q.FieldByName('ColEdits').AsInteger = 0 then
          LItem.StateIndex := GrfBlock
        else
          LItem.StateIndex := GrfBlockEdit;

      Q.Next

    end;
  finally
    List.Items.EndUpdate;
  end;
end;

function TMDObjBlocks.SetBlock(vMDObjID: SYSINT): SYSINT;
begin
  OpenCard(vMDObjID, 2);
end;

procedure TMDObjBlocks.UnSetBlock(vMDObjID: SYSINT);
begin
  OpenCard(-vMDObjID, 2);
end;

function TMDObjBlocks.Edit: SYSINT;
begin
  Result := 0;
  if List.Selected = nil then
    exit;
  OpenCard(Integer(List.Selected.data), 1);
  Result := 1;
end;

procedure TMDObjBlocks.ShowBlocks(vVal: SYSINT);
begin
  frmSS.vShowBlocks := vVal;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TMDObjBlocks, Class_MDObjBlocks,
    ciMultiInstance, tmApartment);
end.

