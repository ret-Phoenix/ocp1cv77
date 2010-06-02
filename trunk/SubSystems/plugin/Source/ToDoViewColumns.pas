unit ToDoViewColumns;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, FormEditCardToDoColView,
  FormSubSystemsMain, ComCtrls, OpenConf_TLB, ADODB, SysUtils, Dialogs,
  Controls, StdVcl;

type
  TToDoViewColumns = class(TAutoObject, IToDoViewColumns)
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

constructor TToDoViewColumns.CreateObj(frmSS: TfrmSubSystems; vConfig:
  IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewToDoViewColumns;
  Config := vConfig;
end;

destructor TToDoViewColumns.Destroy;
begin
end;

procedure TToDoViewColumns.Delete;
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
  Q := FRM.RunSQL(nil, 'select Name from Users where ToDoViewColumnsID=' +
    vStatusID, 0);
  if not Q.IsEmpty then
  begin
    ShowMessage('На данную запись есть ссылки, сначала удалите их!');

    Q.First;
    while not Q.Eof do
    begin
      frm.Echo('Пользователь: ' + Q.FieldByName('Name').AsString);
      Q.Next;
    end;

  end
  else
  begin
    frm.RunSQL(nil, 'delete from ToDoViewColumns where ID=' + vStatusID, 1);
  end;
end;

procedure TToDoViewColumns.Edit;
var
  i: integer;
begin
  if List.Selected = nil then
    exit;
  i := Integer(List.Selected.Data);
  OpenCard(i);
end;

procedure TToDoViewColumns.New;
var
  i: integer;
begin
  i := 0;
  OpenCard(i);
end;

procedure TToDoViewColumns.OpenCard(var vID: SYSINT);
begin
  with TfrmEditCardToDoColView.Create(nil) do
  begin
    frm.RunSQL(QDocument, 'select * from ToDoViewColumns where ID = ' +
      IntToStr(vID));

    if vID = 0 then
    begin
      QDocument.Insert;
      //QDocumentFID.AsString := '1_01_50';
      QDocumentFName.AsString := '1_01_350';
      QDocumentFPriority.AsString := '1_02_30';
      QDocumentFSeriousnessName.AsString := '1_03_150';
      QDocumentFStatusName.AsString := '1_04_150';
      QDocumentFDateStart.AsString := '1_05_50';
      QDocumentFDateEnd.AsString := '1_06_50';
      QDocumentFDateStartPlan.AsString := '1_07_50';
      QDocumentFDateEndPlan.AsString := '1_08_50';
      QDocumentFRecipientName.AsString := '1_09_150';
      QDocumentFConfigName.AsString := '1_10_150';
      QDocumentFSubconfigName.AsString := '1_11_150';
      QDocumentFSubsystems.AsString := '1_12_150';
      QDocumentFMDObjTypes.AsString := '1_13_150';
      QDocumentFMDObj.AsString := '1_14_150';
      QDocumentFManagerName.AsString := '1_15_150';
      QDocumentFReliseName.AsString := '1_16_150';
      sQDocumentFCR.AsString := '1_17_50';

      frm.AddColItem(ListViewCol, 'FName', 'Наименование',
        QDocumentFName.AsString);
      frm.AddColItem(ListViewCol, 'FPriority', 'Приоритет',
        QDocumentFPriority.AsString);
      frm.AddColItem(ListViewCol, 'FSeriousnessName', 'Серьезность',
        QDocumentFSeriousnessName.AsString);
      frm.AddColItem(ListViewCol, 'FStatusName', 'Статус',
        QDocumentFStatusName.AsString);
      frm.AddColItem(ListViewCol, 'FDateStart', 'Дата начала',
        QDocumentFDateStart.AsString);
      frm.AddColItem(ListViewCol, 'FDateEnd', 'Дата конца',
        QDocumentFDateEnd.AsString);
      frm.AddColItem(ListViewCol, 'FDateStartPlan', 'Дата начала план',
        QDocumentFDateStartPlan.AsString);
      frm.AddColItem(ListViewCol, 'FDateEndPlan', 'Дата конца план',
        QDocumentFDateEndPlan.AsString);
      frm.AddColItem(ListViewCol, 'FRecipientName', 'Исполнитель',
        QDocumentFRecipientName.AsString);
      frm.AddColItem(ListViewCol, 'FConfigName', 'Конфигурация',
        QDocumentFConfigName.AsString);
      frm.AddColItem(ListViewCol, 'FSubconfigName', 'Подконфигурация',
        QDocumentFSubsystems.AsString);
      frm.AddColItem(ListViewCol, 'FSubsystems', 'Подсистемы',
        QDocumentFSubsystems.AsString);
      frm.AddColItem(ListViewCol, 'FMDObjTypes', 'Типы метаданных',
        QDocumentFMDObjTypes.AsString);
      frm.AddColItem(ListViewCol, 'FMDObj', 'Объекты метаданных',
        QDocumentFMDObj.AsString);
      frm.AddColItem(ListViewCol, 'FManagerName', 'Руководитель',
        QDocumentFManagerName.AsString);
      frm.AddColItem(ListViewCol, 'FReliseName', 'Релиз',
        QDocumentFReliseName.AsString);
      frm.AddColItem(ListViewCol, 'FCRT', 'CRT',
        sQDocumentFCR.AsString);
      ListViewCol.SortType := stData;

    end
    else
      frm.FillListToDoCols(ListViewCol, QDocumentID.AsInteger);
    ShowModal;
    Free;
  end;
end;

procedure TToDoViewColumns.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
begin
  // обновим основной список
  List.Items.BeginUpdate;
  List.Items.Clear;
  Q := frm.RunSQL(nil, 'select id,name from ToDoViewColumns', 0);

  if Q.IsEmpty then
  begin
    Q := frm.RunSQL(nil, 'select * from ToDoViewColumns', 0);
    Q.Insert;
    Q.FieldByName('Name').AsString := 'Полный список колонок';
    //Q.FieldByName('FID').AsString := '1_01_50';
    Q.FieldByName('FName').AsString := '1_01_350';
    Q.FieldByName('FPriority').AsString := '1_02_30';
    Q.FieldByName('FSeriousnessName').AsString := '1_03_150';
    Q.FieldByName('FStatusName').AsString := '1_04_150';
    Q.FieldByName('FDateStart').AsString := '1_05_50';
    Q.FieldByName('FDateEnd').AsString := '1_06_50';
    Q.FieldByName('FDateStartPlan').AsString := '1_07_50';
    Q.FieldByName('FDateEndPlan').AsString := '1_08_50';
    Q.FieldByName('FRecipientName').AsString := '1_09_150';
    Q.FieldByName('FConfigName').AsString := '1_10_150';
    Q.FieldByName('FSubconfigName').AsString := '1_11_150';
    Q.FieldByName('FSubsystems').AsString := '1_12_150';
    Q.FieldByName('FMDObjTypes').AsString := '1_13_150';
    Q.FieldByName('FMDObj').AsString := '1_14_150';
    Q.FieldByName('FManagerName').AsString := '1_15_150';
    Q.FieldByName('FReliseName').AsString := '1_16_150';
    Q.FieldByName('FCRT').AsString := '1_17_50';
    Q.Post;
    frm.RunSQL(Q, 'select id,name from ToDoViewColumns', 0);
  end;

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
  TAutoObjectFactory.Create(ComServer, TToDoViewColumns, Class_ToDoViewColumns,
    ciMultiInstance, tmApartment);
end.
