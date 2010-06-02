unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, Grids, DBGrids, JvExMask, JvToolEdit;

type
  TForm1 = class(TForm)
    DataFileName: TJvFilenameEdit;
    Label1: TLabel;
    btnRunUpdate: TButton;
    Memo1: TMemo;
    QDB: TADOQuery;
    SubSystemConnection: TADOConnection;
    chkSQL: TCheckBox;
    btnCreateSQLViews: TButton;
    Memo2: TMemo;
    function RunSQL(Q: TADOQuery; T: string; CommandGo: Integer = 0): TADOQuery;
    procedure DataFileNameChange(Sender: TObject);
    procedure btnRunUpdateClick(Sender: TObject);
    function CheckFieldAdd(vTable, vField, vFType: string): Boolean;
    function CheckTablePresent(vTable: string): Boolean;
    procedure AddComment(S: string);
    procedure btnCreateSQLViewsClick(Sender: TObject);
    procedure DeleteViewSP(pArray: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.RunSQL(Q: TADOQuery; T: string; CommandGo: Integer = 0):
  TADOQuery;
var
  vQ: TADOQuery;
begin
  if Q = nil then
  begin
    vQ := TADOQuery.Create(nil);
    Q := vQ;
  end;
  with Q do
  begin
    Close;
    Connection := SubSystemConnection;
    Close;
    SQL.Clear;
    SQL.Add(T);
    if CommandGo = 0 then
      Open;
    if CommandGo = 1 then
      ExecSQL;
  end;
  Result := Q;
end;
//------------------------------------------------------------------------------

procedure TForm1.DataFileNameChange(Sender: TObject);
var
  s: string;
begin
  SubSystemConnection.Close;
  s := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
    + DataFileName.FileName + ';Persist Security Info=False';
  SubSystemConnection.ConnectionString := trim(s);
  SubSystemConnection.Open;

end;
//------------------------------------------------------------------------------

function TForm1.CheckTablePresent(vTable: string): Boolean;
var
  SL: TStrings;
  i: Integer;
begin
  SL := TStringList.Create;
  Result := false;
  SubSystemConnection.GetTableNames(SL, False);
  for i := 0 to (SL.Count - 1) do
  begin
    if SL[i] = vTable then
    begin
      Result := true;
      Break;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TForm1.CheckFieldAdd(vTable, vField, vFType: string): Boolean;
var
  vModuleDone: Boolean;
  FL: TStrings;
  j: Integer;
begin
  FL := TStringList.Create;
  Result := False;
  vModuleDone := False;
  SubSystemConnection.GetFieldNames(vTable, FL);
  for j := 0 to (FL.Count - 1) do
  begin
    if FL[j] = vField then
    begin
      vModuleDone := true;
      Break;
    end;
  end;
  if vModuleDone = false then
  begin
    RunSQL(QDB, 'ALTER TABLE ' + vTable + ' ADD [' + vField + '] ' + vFType, 1);
    Result := True;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.AddComment(S: string);
begin
  Memo1.Lines.Add(S);
end;

procedure RestructSQLDB();
begin

end;

procedure TForm1.btnRunUpdateClick(Sender: TObject);
var
  s: string;
  vModuleDone, vToDoDone: Boolean;
  SL, FL: TStrings;
  j, i: integer;
  Q: TADOQuery;
begin

  if chkSQL.Checked then
  begin
    if CheckTablePresent('Params') = false then
    begin
      ShowMessage('Переход на MS SQL возможен только после релиза 1.3.5.0');
      exit;
    end
    else
    begin
      Q := RunSQL(nil, 'select Version from Params');
      q.First;
      if q.Fields[0].AsString = '1.3.4.9' then
      begin
        ShowMessage('Переход на MS SQL возможен только после релиза 1.3.5.0');
        exit;
      end;
    end;

    RestructSQLDB();

  end;

  if CheckTablePresent('SubSystemsExtFiles') = False then
  begin
    S :=
      'CREATE TABLE SubSystemsExtFiles('
      + '  [ID] AutoIncrement primary key,'
      + '  [IsFolder] Logical,'
      + '  [Name] Text(50),'
      + '  [Path] Text(250),'
      + '  [Mask] Text(200),'
      + '  [Relatively] Integer'
      + ')';
    RunSQL(nil, S, 1);
    S :=
      'CREATE TABLE SubSystemsExtFilesObjects('
      + '  [ID] AutoIncrement primary key,'
      + '  [subsystemID] Integer,'
      + '  [ExtRecID] Integer'
      + ')';
    RunSQL(nil, S, 1);
    AddComment('Добавлены таблицы для работы с внешними формами.');
  end;

  if CheckTablePresent('ToDo') = false then
  begin
    S :=
      'CREATE TABLE ToDo('
      + '  [ID] AutoIncrement primary key,'
      + '  [ConfigID] Integer,'
      + '  [Name] Text(50),'
      + '  [Priority] Integer,'
      + '  [Note] Memo,'
      + '  [Done] Logical,'
      + '  [User] Text(24),'
      + '  [DateStart] Date,'
      + '  [DateEnd] Date,'
      + '  [Status] Text(50),'
      + '  [Complete] Integer'
      + ')';
    RunSQL(nil, S, 1);
    AddComment('Добавлена таблица задач (первый вариант)');
  end;

  if CheckTablePresent('Relises') = false then
  begin
    CheckFieldAdd('ToDo', 'SubSystemID', 'integer');
    CheckFieldAdd('ToDo', 'ObjType', 'integer');
    CheckFieldAdd('ToDo', 'ObjID', 'integer');
    AddComment('Добавлены временыне поля в таблицу задач');
  end;

  if CheckTablePresent('Templates') = false then
  begin
    S :=
      'CREATE TABLE Templates('
      + '  [ID] AutoIncrement primary key,'
      + '  [IsFolder] Logical,'
      + '  [ParentID] Integer,'
      + '  [Name] Text(50),'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);
    AddComment('Добавлена таблица шаблонов');
  end;
  CheckFieldAdd('Templates', 'IsModule', 'Logical');

  if CheckTablePresent('ObjectNote') = false then
  begin
    S :=
      'CREATE TABLE ObjectNote('
      + '  [ID] AutoIncrement primary key,'
      + '  [ObjID] Integer,'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);
    AddComment('Доработана таблица шаблонов');
  end;

  if CheckTablePresent('ToDoAccessory') = false then
  begin
    S :=
      'CREATE TABLE ToDoAccessory('
      + '  [ID] AutoIncrement primary key,'
      + '  [ToDoID] Integer,'
      + '  [TypeDataID] Integer,'
      + '  [ObjId] Integer'
      + ')';
    RunSQL(nil, S, 1);
    // переносим данные
    Q := RunSQL(nil, 'select Id,SubSystemID,ObjType,ObjID from ToDo', 0);
    Q.First;
    while not Q.Eof do
    begin
      if Q.Fields[1].AsString <> '' then
        RunSQL(nil,
          'Insert into ToDoAccessory (ToDoID,TypeDataID,ObjID) Values (' +
          Q.Fields[0].AsString + ',1,' + Q.Fields[1].AsString + ')'
          , 1);

      if Q.Fields[2].AsInteger <> -1 then
        RunSQL(nil,
          'Insert into ToDoAccessory (ToDoID,TypeDataID,ObjID) Values (' +
          Q.Fields[0].AsString + ',2,' + Q.Fields[2].AsString + ')'
          , 1);

      if (Q.Fields[3].AsString <> '')
        and (Q.Fields[3].AsInteger <> -1) then
        RunSQL(nil,
          'Insert into ToDoAccessory (ToDoID,TypeDataID,ObjID) Values (' +
          Q.Fields[0].AsString + ',3,' + Q.Fields[3].AsString + ')'
          , 1);

      Q.Next;
    end;
    RunSQL(nil, 'alter table ToDo drop [SubSystemID]', 1);
    RunSQL(nil, 'alter table ToDo drop [ObjType]', 1);
    RunSQL(nil, 'alter table ToDo drop [ObjID]', 1);
    AddComment('Добавлена множественная привязка задач');
  end;

  if CheckTablePresent('Relises') = false then
  begin
    S :=
      'CREATE TABLE Relises('
      + '  [ID] AutoIncrement primary key,'
      + '  [ConfigID] Integer,'
      + '  [Name] Text(50),'
      + '  [DateLoadPlan] Date,'
      + '  [DateLoadReal] Date,'
      + '  [UserNamePlan] Text(50),'
      + '  [UserNameReal] Text(50),'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);

    S := 'ALTER TABLE ToDo' + '  ADD [ReliseID] Integer';
    RunSQL(nil, S, 1);
    AddComment('Добавлена работа с релизами');
  end;

  if CheckTablePresent('Statuses') = false then
  begin
    S :=
      'CREATE TABLE Statuses('
      + '  [ID] AutoIncrement primary key,'
      + '  [Name] Text(50),'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);

    S :=
      'ALTER TABLE ToDo'
      + '  ADD [StatusID] Integer,'
      + '   [ForReport] Logical,'
      + '   [ReportText] Memo';
    RunSQL(nil, S, 1);

    RunSQL(nil, 'Insert into Statuses (Name) Values("Не начато")', 1);
    RunSQL(nil, 'Insert into Statuses (Name) Values("В процессе выполнения")',
      1);
    RunSQL(nil, 'Insert into Statuses (Name) Values("Завершено")', 1);
    RunSQL(nil, 'Insert into Statuses (Name) Values("В ожидании")', 1);
    RunSQL(nil, 'Insert into Statuses (Name) Values("Отменено")', 1);

    RunSQL(nil, 'Update ToDo Set StatusID = 1 where Status = "Не начато"', 1);
    RunSQL(nil,
      'Update ToDo Set StatusID = 2 where Status = "В процессе выполнения"',
      1);
    RunSQL(nil, 'Update ToDo Set StatusID = 3 where Status = "Завершено"', 1);
    RunSQL(nil, 'Update ToDo Set StatusID = 4 where Status = "В ожидании"', 1);
    RunSQL(nil, 'Update ToDo Set StatusID = 5 where Status = "Отменено"', 1);

    RunSQL(nil, 'ALTER TABLE ToDo DROP [Status]', 1);
    AddComment('Добавлен настраиваемый список статусов.');
  end;

  // проверяем наличие "Подконфигураций"
  if CheckTablePresent('Subconfigs') = false then
  begin
    S :=
      'CREATE TABLE Subconfigs('
      + '  [ID] AutoIncrement primary key,'
      + '  [ConfigID] Integer,'
      + '  [Name] Text(50),'
      + '  [Path] Text(255),'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);

    RunSQL(nil, 'ALTER TABLE ToDo ADD [SubconfigID] Integer', 1);
    RunSQL(nil, 'ALTER TABLE SubSystems ADD [SubconfigID] Integer, [Note] Memo',
      1);
    RunSQL(nil, 'ALTER TABLE Relises ADD [SubconfigID] Integer', 1);
    RunSQL(nil, 'ALTER TABLE Configs ADD [Note] Memo', 1);

    RunSQL(nil, 'Update ToDo Set SubconfigID=0', 1);
    RunSQL(nil, 'Update SubSystems Set SubconfigID=0', 1);
    RunSQL(nil, 'Update Relises Set SubconfigID=0', 1);
    AddComment('Добавлена возможность работы с подконфигурациями.');
  end;

  // Изменяем внешние формы для работы с исключающей маской
  CheckFieldAdd('SubSystemsExtFiles', 'MaskFalse', 'Text(200)');

  // Добавляем поле подконфигурация для описаний
  if CheckFieldAdd('ObjectNote', 'SubconfigID', 'Integer') then
  begin
    RunSQL(nil, 'Update ObjectNote Set SubconfigID=0', 1);
  end;

  // Добавляем список пользователей
  if CheckTablePresent('Users') = false then
  begin
    S :=
      'CREATE TABLE Users('
      + '  [ID] AutoIncrement primary key,'
      + '  [SubconfigID] Integer,'
      + '  [Name] Text(50),'
      + '  [Login] Text(50),'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);

    RunSQL(nil, 'ALTER TABLE ToDo ADD [AuthorID] Integer', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [RecipientID] Integer', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [DateTimeCreate] Date', 1);

    S := 'select Distinct User from ToDo';
    Q := RunSQL(nil, S, 0);
    Q.First;
    while not Q.Eof do
    begin
      if Q.Fields[0].AsString <> '' then
        RunSQL(nil, 'Insert Into Users (SubconfigID,Name,Login) VALUES(0,"' +
          Trim(Q.Fields[0].AsString) + '","' + Trim(Q.Fields[0].AsString) +
          '")', 1);
      Q.Next;
    end;

    Q := RunSQL(nil, 'Select Id,Name from Users');
    Q.First;
    while not Q.Eof do
    begin
      RunSQL(nil, 'Update ToDo Set RecipientID = ' + Q.Fields[0].AsString
        + ' where Trim(User)= "' + Trim(Q.Fields[1].AsString) + '"', 1);
      RunSQL(nil, 'Update ToDo Set AuthorID = ' + Q.Fields[0].AsString
        + ' where Trim(User)= "' + Trim(Q.Fields[1].AsString) + '"', 1);
      Q.Next;
    end;
    RunSQL(nil, 'Update ToDo Set DateTimeCreate = DateStart', 1);
    RunSQL(nil, 'ALTER TABLE ToDo DROP [User]', 1);

    RunSQL(nil, 'ALTER TABLE Relises ADD [UserPlanID] Integer', 1);
    RunSQL(nil, 'ALTER TABLE Relises ADD [UserRealID] Integer', 1);

    Q := RunSQL(nil, 'select distinct UserNamePlan ' +
      ' from Relises where UserNamePlan not in (select Login from Users)');
    Q.First;
    while not Q.Eof do
    begin
      if Q.Fields[0].AsString <> '' then
        RunSQL(nil, 'Insert Into Users (SubconfigID,Name,Login) VALUES(0,"' +
          Trim(Q.Fields[0].AsString) + '","' + Trim(Q.Fields[0].AsString) +
          '")', 1);
      Q.Next;
    end;

    Q := RunSQL(nil, 'select distinct UserNameReal ' +
      ' from Relises where UserNameReal not in (select Login from Users)');
    Q.First;
    while not Q.Eof do
    begin
      if Q.Fields[0].AsString <> '' then
        RunSQL(nil, 'Insert Into Users (SubconfigID,Name,Login) VALUES(0,"' +
          Trim(Q.Fields[0].AsString) + '","' + Trim(Q.Fields[0].AsString) +
          '")', 1);
      Q.Next;
    end;

    Q := RunSQL(nil, 'Select Id,Name from Users');
    Q.First;
    while not Q.Eof do
    begin
      RunSQL(nil, 'Update Relises Set UserPlanID = ' + Q.Fields[0].AsString
        + ' where Trim(UserNamePlan)= "' + Trim(Q.Fields[1].AsString) + '"', 1);
      RunSQL(nil, 'Update Relises Set UserRealID = ' + Q.Fields[0].AsString
        + ' where Trim(UserNameReal)= "' + Trim(Q.Fields[1].AsString) + '"', 1);
      Q.Next;
    end;

    RunSQL(nil, 'ALTER TABLE Relises DROP [UserNamePlan]', 1);
    RunSQL(nil, 'ALTER TABLE Relises DROP [UserNameReal]', 1);
    AddComment('Добавлен настраиваемый список пользователей.');

  end;

  // Изменяем задачи, добавляем головную задачу

  if CheckFieldAdd('ToDo', 'ParentToDoID', 'Integer') then
  begin
    RunSQL(nil, 'ALTER TABLE ToDo ADD [LastEditorID] Integer', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [LastEditDateTime] Date', 1);

    RunSQL(nil, 'Update ToDo Set LastEditDateTime = DateTimeCreate', 1);
    RunSQL(nil, 'Update ToDo Set LastEditorID = AuthorID', 1);
    RunSQL(nil, 'Update ToDo Set ParentToDoID = 0', 1);
    AddComment('Добавлена возможность подчиненности задач');
  end;
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // релиз: 1.3.4.5
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  // добавляем работу с планированием начала и конца работ
  if CheckFieldAdd('Users', 'Email', 'Text(100)') then
  begin
    RunSQL(nil, 'ALTER TABLE ToDo ADD [DateStartPlan] Date', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [DateEndPlan] Date', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [SeriousnessID] Integer', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [CRT] Integer', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [UnsolvedProblem] Memo', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [KeyWords] Memo', 1);
    RunSQL(nil, 'ALTER TABLE ToDo ADD [ManagerID] Integer', 1);

    RunSQL(nil, 'Update ToDo Set DateStartPlan = DateStart', 1);
    RunSQL(nil, 'Update ToDo Set DateEndPlan = DateEnd', 1);
    RunSQL(nil, 'Update ToDo Set ManagerID = AuthorID', 1);

    // добавляем Seriousness
    S :=
      'CREATE TABLE Seriousness('
      + '  [ID] AutoIncrement primary key,'
      + '  [Name] Text(50),'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);
    // добавляем категории
    S :=
      'CREATE TABLE Categoryes('
      + '  [ID] AutoIncrement primary key,'
      + '  [ParentID] Integer,'
      + '  [IsFolder] Logical,'
      + '  [Name] Text(50),'
      + '  [Note] Memo'
      + ')';
    RunSQL(nil, S, 1);

    RunSQL(nil, 'create proc ListCategoryes as'
      + ' SELECT ToDoAccessory.ID, ToDoAccessory.ToDoID,'
      + ' ToDoAccessory.TypeDataID, ToDoAccessory.ObjId, Categoryes.Name'
      + ' FROM ToDoAccessory LEFT JOIN Categoryes ON'
      + ' ToDoAccessory.ObjId = Categoryes.ID'
      + ' WHERE (((ToDoAccessory.TypeDataID)=5));'
      , 1);

    RunSQL(nil, 'create proc ListIniciators as'
      + ' SELECT ToDoAccessory.ID, ToDoAccessory.ToDoID,'
      + ' ToDoAccessory.TypeDataID, ToDoAccessory.ObjId, Users.Name'
      + ' FROM ToDoAccessory LEFT JOIN Users ON ToDoAccessory.ObjId = Users.ID'
      + ' WHERE (((ToDoAccessory.TypeDataID)=4));'
      , 1);

    RunSQL(nil, 'create proc ListMDObjects as'
      + ' SELECT ToDoAccessory.ID, ToDoAccessory.ToDoID,'
      + ' ToDoAccessory.TypeDataID, ToDoAccessory.ObjId'
      + ' FROM ToDoAccessory'
      + ' WHERE (((ToDoAccessory.TypeDataID)=3));'
      , 1);

    RunSQL(nil, 'create proc ListSubSystems as'
      + ' SELECT ToDoAccessory.ID, ToDoAccessory.ToDoID,'
      + ' ToDoAccessory.TypeDataID, ToDoAccessory.ObjId, SubSystems.Name'
      + ' FROM ToDoAccessory LEFT JOIN SubSystems ON'
      + ' ToDoAccessory.ObjId = SubSystems.ID'
      + ' WHERE (((ToDoAccessory.TypeDataID)=1));'
      , 1);

    RunSQL(nil, 'create proc ListTypeOjects as'
      + ' SELECT ToDoAccessory.ID, ToDoAccessory.ToDoID,'
      + ' ToDoAccessory.TypeDataID, ToDoAccessory.ObjId'
      + ' FROM ToDoAccessory'
      + ' WHERE (((ToDoAccessory.TypeDataID)=2));'
      , 1);

    RunSQL(nil, 'create proc ToDoForFilter as'
      + ' SELECT ToDo.*, Configs.Name AS ConfigName,'
      + ' Subconfigs.Name AS SubconfigName, Relises.Name AS ReliseName,'
      + ' Statuses.Name AS StatusName, Author.Name AS AuthorName,'
      + ' Seriousness.Name AS SeriousnessName,'
      + ' ListCategoryes.ObjId AS ListCategoryesObjId,'
      + ' ListCategoryes.Name AS ListCategoryeName,'
      + ' ListSubSystems.ObjId AS ListSubSystemsObjId,'
      + ' ListSubSystems.Name AS ListSubSystemsName,'
      + ' ListIniciators.ObjId AS ListIniciatorsObjId,'
      + ' ListIniciators.Name AS ListIniciatorsName,'
      + ' Recipient.Name AS RecipientName,'
      + ' LastEditor.Name AS LastEditorName,'
      + ' Manager.Name AS ManagerName, ParentToDo.Name AS ParentToDoName,'
      + ' ListMDObjects.ObjId AS MDObjId, ListTypeOjects.ObjId AS MDTypeObjID'
      + ' FROM ((((((((((((((ToDo LEFT JOIN Configs ON ToDo.ConfigID = Configs.ID)'
      + ' LEFT JOIN Subconfigs ON ToDo.SubconfigID = Subconfigs.ID)'
      + ' LEFT JOIN Relises ON ToDo.ReliseID = Relises.ID)'
      + ' LEFT JOIN Statuses ON ToDo.StatusID = Statuses.ID)'
      + ' LEFT JOIN Seriousness ON ToDo.SeriousnessID = Seriousness.ID)'
      + ' LEFT JOIN Users AS Author ON ToDo.AuthorID = Author.ID)'
      + ' LEFT JOIN ListCategoryes ON ToDo.ID = ListCategoryes.ToDoID)'
      + ' LEFT JOIN ListIniciators ON ToDo.ID = ListIniciators.ToDoID)'
      + ' LEFT JOIN Users AS Recipient ON ToDo.RecipientID = Recipient.ID)'
      + ' LEFT JOIN Users AS LastEditor ON ToDo.LastEditorID = LastEditor.ID)'
      + ' LEFT JOIN Users AS Manager ON ToDo.ManagerID = Manager.ID)'
      + ' LEFT JOIN ToDo AS ParentToDo ON ToDo.ParentToDoID = ParentToDo.ID)'
      + ' LEFT JOIN ListSubSystems ON ToDo.ID = ListSubSystems.ToDoID)'
      + ' LEFT JOIN ListTypeOjects ON ToDo.ID = ListTypeOjects.ToDoID)'
      + ' LEFT JOIN ListMDObjects ON ToDo.ID = ListMDObjects.ToDoID;'
      , 1);
    AddComment('Добавлен работы с категориями, серьезностью задач ...');
  end;

  //if CheckFieldAdd('ToDo', 'ToDoViewColumnsID', 'Integer') then
  if CheckTablePresent('ToDoViewColumns') = false then
  begin

    s := 'Drop proc ToDoForFilter';
    RunSQL(QDB, s, 1);

    s := 'CREATE PROC ToDoForFilter as '
      + '  SELECT Configs.Name AS ConfigName, Subconfigs.Name AS SubconfigName,'
      + '  Relises.Name AS ReliseName, Statuses.Name AS StatusName,'
      + '  Author.Name AS AuthorName,Seriousness.Name AS SeriousnessName,'
      + '  ListCategoryes.ObjId AS ListCategoryesObjId, ListCategoryes.Name AS ListCategoryeName,'
      + '  ListSubSystems.ObjId AS ListSubSystemsObjId, ListSubSystems.Name AS ListSubSystemsName,'
      + '  ListIniciators.ObjId AS ListIniciatorsObjId,ListIniciators.Name AS ListIniciatorsName,'
      + '  Recipient.Name AS RecipientName, LastEditor.Name AS LastEditorName, Manager.Name AS ManagerName,'
      + '  ParentToDo.Name AS ParentToDoName, ListMDObjects.ObjId AS MDObj,'
      + '  ListTypeOjects.ObjId AS MDObjTypes, ToDo.ID, ToDo.ConfigID, ToDo.Name,'
      + '  ToDo.Priority, ToDo.Done, ToDo.DateStart, ToDo.DateEnd, ToDo.Complete,'
      + '  (select count(TL.id) from ToDo TL where TL.ParentToDoId=ToDo.id) AS HasChild,'
      + '  ToDo.SubconfigID, ToDo.RecipientID, ToDo.ReliseID, ToDo.SeriousnessID,'
      + '  ToDo.StatusID, ToDo.ManagerID, ToDo.CRT, ToDo.AuthorID, ToDo.LastEditorID,'
      + '  ToDo.ForReport, ToDo.DateStartPlan, ToDo.DateEndPlan, ToDo.ParentToDoID'
      + '  FROM ((((((((((((((ToDo LEFT JOIN Configs ON ToDo.ConfigID = Configs.ID)'
      + '  LEFT JOIN Subconfigs ON ToDo.SubconfigID = Subconfigs.ID)'
      + '  LEFT JOIN Relises ON ToDo.ReliseID = Relises.ID) LEFT JOIN Statuses ON ToDo.StatusID = Statuses.ID)'
      + '  LEFT JOIN Seriousness ON ToDo.SeriousnessID = Seriousness.ID) LEFT JOIN Users AS Author ON ToDo.AuthorID = Author.ID)'
      + '  LEFT JOIN ListCategoryes ON ToDo.ID = ListCategoryes.ToDoID) LEFT JOIN ListIniciators ON ToDo.ID = ListIniciators.ToDoID)'
      + '  LEFT JOIN Users AS Recipient ON ToDo.RecipientID = Recipient.ID) LEFT JOIN Users AS LastEditor ON ToDo.LastEditorID = LastEditor.ID)'
      + '  LEFT JOIN Users AS Manager ON ToDo.ManagerID = Manager.ID) LEFT JOIN ToDo AS ParentToDo ON ToDo.ParentToDoID = ParentToDo.ID)'
      + '  LEFT JOIN ListSubSystems ON ToDo.ID = ListSubSystems.ToDoID) LEFT JOIN ListTypeOjects ON ToDo.ID = ListTypeOjects.ToDoID)'
      + '  LEFT JOIN ListMDObjects ON ToDo.ID = ListMDObjects.ToDoID';
    RunSQL(QDB, s, 1);

    s := 'CREATE TABLE ToDoViewColumns ('
      + '  [ID] AutoIncrement primary key,'
      + '  [Name] Text(50),'
      + '  [FID] Text(8),'
      + '  [FName] Text(8),'
      + '  [FPriority] Text(8),'
      + '  [FSeriousnessName] Text(8),'
      + '  [FStatusName] Text(8),'
      + '  [FDateStart] Text(8),'
      + '  [FDateEnd] Text(8),'
      + '  [FDateStartPlan] Text(8),'
      + '  [FDateEndPlan] Text(8),'
      + '  [FRecipientName] Text(8),'
      + '  [FConfigName] Text(8),'
      + '  [FSubconfigName] Text(8),'
      + '  [FSubsystems] Text(8),'
      + '  [FMDObjTypes] Text(8),'
      + '  [FMDObj] Text(8),'
      + '  [FManagerName] Text(8),'
      + '  [FReliseName] Text(8)'
      + ')';

    RunSQL(QDB, s, 1);
    AddComment('Добавлена возможность настройки колонок списка задач');
  end;
  //-----------------------------------------------
  CheckFieldAdd('ObjectNote', 'MDObjName', 'Text(100)');

  //============================================================================
  // Блок управления файлами для зачад
  //============================================================================

  if CheckTablePresent('ToDoFiles') = false then
  begin
    s := 'CREATE TABLE ToDoFiles ('
      + '  [ID] AutoIncrement primary key,'
      + '  [ToDoID] integer,'
      + '  [Name] Text(50),'
      + '  [Path] Text(255)'
      + ')';
    RunSQL(QDB, s, 1);
    AddComment('Добавлена возможность привязки файлов к задачам');
  end;
  //
  // блок управления блокировками объектов МД
  //
  if CheckTablePresent('MDObjBlocks') = false then
  begin
    s := 'CREATE TABLE MDObjBlocks ('
      + '  [ID] AutoIncrement primary key,'
      + '  [SubconfigID] integer,'
      + '  [MDObj] integer,'
      + '  [Blocked] logical,'
      + '  [Name] text(100),'
      + '  [UserBlockID] int,'
      + '  [UserUnBlockID] int,'
      + '  [ToDoID] int,'
      + '  [DateStartBlockPlan] date,'
      + '  [DateStartBlockReal] date,'
      + '  [DateEndBlockPlan] date,'
      + '  [DateEndBlockReal] date,'
      + '  [Note] Memo'
      + ')';
    RunSQL(QDB, s, 1);

    s := 'CREATE TABLE MDObjBlocksChange ('
      + '  [ID] AutoIncrement primary key,'
      + '  [DateChange] Date,'
      + '  [SubconfigID] integer,'
      + '  [MDObj] integer,'
      + '  [Name] text(100),'
      + '  [UserID] int,'
      + '  [ToDoID] int,'
      + '  [Note] Memo'
      + ')';
    RunSQL(QDB, s, 1);
    AddComment('Добавлен блок работы с блокировкой объектов МД');

  end;
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Relise 1.3.4.8
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if CheckTablePresent('ToDoStatusHistory') = false then
  begin
    s := 'CREATE TABLE ToDoStatusHistory ('
      + '  [ID] AutoIncrement primary key,'
      + '  [ToDoID] int,'
      + '  [DateChange] date,'
      + '  [UserID] integer,'
      + '  [StatusID] integer'
      + ')';
    RunSQL(QDB, s, 1);
    AddComment('Добавлен блок логирования статуса задачи');
  end;

  // Relise 1.3.4.9

  if CheckFieldAdd('ToDoViewColumns', 'FCRT', 'text(8)') then
  begin
    RunSQL(nil, 'ALTER TABLE ToDoViewColumns DROP [FID]', 1);
    AddComment('Добавлен блок отображения CR в списке задач');
  end;

  s := 'Drop proc ToDoForFilter';
  RunSQL(QDB, s, 1);

  s := 'CREATE PROC ToDoForFilter as '
    + '  SELECT Configs.Name AS ConfigName, Subconfigs.Name AS SubconfigName,'
    + '  Relises.Name AS ReliseName, Statuses.Name AS StatusName,'
    + '  Author.Name AS AuthorName,Seriousness.Name AS SeriousnessName,'
    + '  ListCategoryes.ObjId AS ListCategoryesObjId, ListCategoryes.Name AS ListCategoryeName,'
    + '  ListSubSystems.ObjId AS ListSubSystemsObjId, ListSubSystems.Name AS ListSubSystemsName,'
    + '  ListIniciators.ObjId AS ListIniciatorsObjId,ListIniciators.Name AS ListIniciatorsName,'
    + '  Recipient.Name AS RecipientName, LastEditor.Name AS LastEditorName, Manager.Name AS ManagerName,'
    + '  ParentToDo.Name AS ParentToDoName, ListMDObjects.ObjId AS MDObj,'
    + '  ListTypeOjects.ObjId AS MDObjTypes, ToDo.ID, ToDo.ConfigID, ToDo.Name,'
    + '  ToDo.Priority, ToDo.Done, ToDo.DateStart, ToDo.DateEnd, ToDo.Complete,'
    + '  (select count(TL.id) from ToDo TL where TL.ParentToDoId=ToDo.id) AS HasChild,'
    + '  ToDo.SubconfigID, ToDo.RecipientID, ToDo.ReliseID, ToDo.SeriousnessID,'
    + '  ToDo.StatusID, ToDo.ManagerID, ToDo.CRT, ToDo.AuthorID, ToDo.LastEditorID,'
    + '  ToDo.ForReport, ToDo.DateStartPlan, ToDo.DateEndPlan, ToDo.ParentToDoID'
    + '  ,ToDo.Note, ToDo.UnsolvedProblem'
    + '  FROM ((((((((((((((ToDo LEFT JOIN Configs ON ToDo.ConfigID = Configs.ID)'
    + '  LEFT JOIN Subconfigs ON ToDo.SubconfigID = Subconfigs.ID)'
    + '  LEFT JOIN Relises ON ToDo.ReliseID = Relises.ID) LEFT JOIN Statuses ON ToDo.StatusID = Statuses.ID)'
    + '  LEFT JOIN Seriousness ON ToDo.SeriousnessID = Seriousness.ID) LEFT JOIN Users AS Author ON ToDo.AuthorID = Author.ID)'
    + '  LEFT JOIN ListCategoryes ON ToDo.ID = ListCategoryes.ToDoID) LEFT JOIN ListIniciators ON ToDo.ID = ListIniciators.ToDoID)'
    + '  LEFT JOIN Users AS Recipient ON ToDo.RecipientID = Recipient.ID) LEFT JOIN Users AS LastEditor ON ToDo.LastEditorID = LastEditor.ID)'
    + '  LEFT JOIN Users AS Manager ON ToDo.ManagerID = Manager.ID) LEFT JOIN ToDo AS ParentToDo ON ToDo.ParentToDoID = ParentToDo.ID)'
    + '  LEFT JOIN ListSubSystems ON ToDo.ID = ListSubSystems.ToDoID) LEFT JOIN ListTypeOjects ON ToDo.ID = ListTypeOjects.ToDoID)'
    + '  LEFT JOIN ListMDObjects ON ToDo.ID = ListMDObjects.ToDoID';
  RunSQL(QDB, s, 1);

  if CheckTablePresent('Params') = false then
  begin
    s := 'CREATE TABLE Params ('
      + '  [ID] AutoIncrement primary key,'
      + '  [Version] text(20)'
      + ')';
    RunSQL(QDB, s, 1);
    RunSQL(nil, 'Insert into Params (Version) Values("1.3.4.9")', 1);
    AddComment('Добавлен блок хранения версии');

  end
  else
  begin
    try
      RunSQL(nil, 'Update Params set Version = "1.3.4.9"', 1);
    except
      // nothing
    end;

  end;

  Q := RunSQL(nil, 'select Version from Params');
  q.First;
  if q.Fields[0].AsString = '1.3.4.9' then
  begin
    s := 'CREATE TABLE MDStruct ('
      + '  [ID] AutoIncrement primary key,'
      + '  [ConfigID] integer,'
      + '  [SubconfigID] integer,'
      + '  [MDObjType] integer,'
      + '  [MDObjID] integer,'
      + '  [MDObjName] text(100)'
      + ')';
    RunSQL(QDB, s, 1);
    AddComment('Добавлен блок хранения структуры метаданных подконфигурации');
    RunSQL(nil, 'Update Params set Version = "1.3.5.0"', 1);
  end;

  ShowMessage('Обновление структуры закончено');

end;



procedure TForm1.btnCreateSQLViewsClick(Sender: TObject);
var
  lParams: TStringList;
begin
  lParams := TStringList.Create;
  if chkSQL.Checked then
  begin
    lParams.Add('spGetToDoCardMainData');
    lParams.Add('P');
    DeleteViewSP(lParams);
    RunSQL(nil, 'CREATE PROCEDURE spGetToDoCardMainData (@ID int) AS'
      + ' SELECT'
      + ' 	T.ID,'
      + ' 	T.Name,'
      + ' 	T.Priority,'
      + ' 	T.Note,'
      + ' 	T.Done,'
      + ' 	T.DateStart,'
      + ' 	T.DateEnd,'
      + ' 	T.ForReport,'
      + ' 	T.ReportText,'
      + ' 	T.DateStartPlan,'
      + ' 	T.DateEndPlan,'
      + ' 	T.UnsolvedProblem,'
      + '   dbo.RefCR.ID AS CR_ID,'
      + ' 	dbo.RefCR.Name AS CR_Name,'
      + ' 	dbo.Seriousness.Name AS Seriousness,'
      + ' 	dbo.Statuses.Name AS Status,'
      + '   dbo.Users.Name AS RecipientName'
      + ' FROM'
      + ' 	dbo.ToDo T'
      + ' 	left JOIN dbo.Seriousness ON dbo.Seriousness.ID = T.SeriousnessID'
      + ' 	left JOIN dbo.RefCR ON T.CRT = dbo.RefCR.ID'
      + ' 	left JOIN dbo.Statuses ON T.StatusID = dbo.Statuses.ID'
      + ' 	left JOIN dbo.Users ON T.RecipientID = dbo.Users.ID'
      + ' WHERE'
      + ' 	T.ID = @ID'
      + ' GO'
      , 1);

    RunSQL(nil, 'DROP VIEW ListCR'
      + ' CREATE VIEW dbo.ListCR'
      + ' AS'
      + ' SELECT     dbo.RefCR.ID, dbo.RefCR.Name, dbo.RefCR.Note, dbo.RefCR.DateStartPlan, dbo.RefCR.DateEndPlan, dbo.Statuses.Name AS Статус,'
      + '                      Statuses_1.Name AS СтатусРеальный, dbo.Users.Name AS Инициатор, Users_1.Name AS Куратор'
      + ' FROM         dbo.RefCR LEFT OUTER JOIN'
      + '                      dbo.Users AS Users_1 ON dbo.RefCR.Curator = Users_1.ID LEFT OUTER JOIN'
      + '                      dbo.Users ON dbo.RefCR.Initiator = dbo.Users.ID LEFT OUTER JOIN'
      + '                      dbo.Statuses AS Statuses_1 ON dbo.RefCR.StateReal = Statuses_1.ID LEFT OUTER JOIN'
      + '                      dbo.Statuses ON dbo.RefCR.StateSystem = dbo.Statuses.ID'
      , 1);

    RunSQL(nil, 'DROP VIEW ListCR'
      + ' CREATE VIEW dbo.ToDoCardsMainInfo'
      + ' AS'
      + ' SELECT     T.ID, T.Name, T.Priority, T.Note, T.Done, T.DateStart, T.DateEnd, T.ForReport, T.ReportText, T.DateStartPlan, T.DateEndPlan, T.UnsolvedProblem,'
      + '                       dbo.RefCR.ID AS CR_ID, dbo.RefCR.Name AS CR_Name, dbo.Seriousness.Name AS Seriousness, dbo.Statuses.Name AS Status,'
      + '                       dbo.Users.Name AS RecipientName'
      + ' FROM         dbo.Statuses RIGHT OUTER JOIN'
      + '                       dbo.ToDo T ON dbo.Statuses.ID = T.StatusID LEFT OUTER JOIN'
      + '                       dbo.Users ON T.RecipientID = dbo.Users.ID LEFT OUTER JOIN'
      + '                       dbo.RefCR ON T.CRT = dbo.RefCR.ID LEFT OUTER JOIN'
      + '                       dbo.Seriousness ON T.SeriousnessID = dbo.Seriousness.ID'

      , 1);
  end;




end;

end.

{
try
  if FileExists(IncludeTrailingBackslash(FConfigurator.IBDir) +
    'SubSystems.ini') then
    DeleteFile(IncludeTrailingBackslash(FConfigurator.IBDir) +
      'SubSystems.ini');
except
  Echo('Ошибка при попытке удалить файл настроек старой версии');
end;
}

