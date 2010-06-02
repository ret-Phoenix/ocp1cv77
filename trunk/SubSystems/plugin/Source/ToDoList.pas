unit ToDoList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB,
  Controls, Dialogs, SysUtils, AvailableSubSystems,
  OpenConf_TLB, ComCtrls, FormSubSystemsMain, DB,
  ADODB, Menus, TuningSubSystemsList, FormEditCardToDo,
  XMLDoc, XMLIntf, StdVcl;

type
  TToDoList = class(TAutoObject, IConnectionPointContainer, IToDoList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IToDoListEvents;

    frm: TfrmSubSystems;
    List: TListView;
    vSSList: TTuningSubSystemsList;
    Config: IConfigurator;

    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    ListViewType: integer;
    vMailSender: string;

    vMaxListChildToDoSize: Integer;
    vMaxListConditionsSize: Integer;

    procedure Initialize; override;
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy;

    procedure Refresh; safecall;
    function New: SYSINT; safecall;
    function Edit: SYSINT; safecall;
    procedure Delete; safecall;
    function OpenCard(vID: SYSINT): SYSINT; safecall;
    function GetMDObjByID(vID: SYSINT): WideString; safecall;
    function GetSubSystemsByID(vID: SYSINT): WideString; safecall;
    function GetTypeObjByID(vID: SYSINT): WideString; safecall;
    procedure SaveToFile(var vFileName: WideString); safecall;
    function GetConditionsViewType: SYSINT; safecall;
    procedure SetConditionsViewType(vVal: SYSINT); safecall;
    function GetListViewType: SYSINT; safecall;
    procedure SetListViewType(vVal: SYSINT); safecall;
    function GetStatusByID(vID: SYSINT): WideString; safecall;
    function GetConfigByID(vID: SYSINT): WideString; safecall;
    function SelectToDoByID(var vID: SYSINT): SYSINT; safecall;
    function GetSelectedToDoID: SYSINT; safecall;
    function GetNameByID(vID: SYSINT; vStr: string): WideString;
    //  public
    function SetConditions(ForTree: string): string;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function GetMaxListChildToDoSize: SYSINT; safecall;
    function GetMaxListConditionsSize: SYSINT; safecall;
    procedure SetMaxListChildToDoSize(var vVal: SYSINT); safecall;
    procedure SetMaxListConditionsSize(var vVal: SYSINT); safecall;
    procedure ListForObjectRefresh(var vID: SYSINT); safecall;
    procedure ToDoObjDelete; safecall;
    procedure ToDoObjEdit; safecall;
    function CopyByID(vID: SYSINT): SYSINT; safecall;
    function CreateChild(vParentID: SYSINT): SYSINT; safecall;
    function GetConditionText(const ForTree: WideString): WideString; safecall;
  end;

implementation

uses ComServ, Forms, StrUtils;

constructor TToDoList.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewToDo;
  Config := vConfig;
  vSSList := TTuningSubSystemsList.CreateObj(frm);
end;

destructor TToDoList.Destroy;
begin
end;

procedure TToDoList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IToDoListEvents;
end;

procedure TToDoList.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

procedure ToDoNewColumn(vList: TListView; vName: string; vWidth: Integer);
begin
  with vList.Columns.Add do
  begin
    Caption := vName;
    Width := vWidth;
  end;
end;

procedure AddCondition(var old: string; vStr: string; vType: string = 'and');
begin
  if old = '' then
    old := 'where ' + vStr
  else
    old := old + ' ' + vType + ' ' + vStr;
end;

function TToDoList.SetConditions(ForTree: string): string;
var
  vCond, vTmpID: string;
  t: TStringList;
  i: Integer;

begin
  vCond := '';
  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Конфигурация']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'ConfigID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Подконфигурация']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'SubConfigID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Релиз']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'ReliseID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Серьезность']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'SeriousnessID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Статус']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'StatusID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Исполнитель']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'RecipientID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Руководитель']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'ManagerID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Автор']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'AuthorID=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Изменил']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'LastEditorID=' + vTmpID);

  if ForTree = '' then
    vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Основание'])
  else
    vTmpID := ForTree;

  if vTmpID <> '0' then
    AddCondition(vCond, 'ParentToDoID=' + vTmpID);

  vTmpID := frm.ListConditions.Values['ДляОтчета'];
  if vTmpID = 'Для отчета' then
    AddCondition(vCond, 'ForReport=' + frm.DBTrue)
  else if vTmpID = 'Не для отчета' then
    AddCondition(vCond, 'ForReport=' + frm.DBFalse);

  vTmpID := frm.ListConditions.Values['Состояние'];
  if vTmpID = 'Выполненые' then
    AddCondition(vCond, 'Done=' + frm.DBTrue)
  else if vTmpID = 'Не выполненые' then
    AddCondition(vCond, 'Done=' + frm.DBFalse);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Подсистема']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'ListSubSystemsObjId=' + vTmpID)
  else if frm.ListConditions.Values['Подсистема'] = 'Для выбранных подсистем'
    then
  begin
    AddCondition(vCond, 'ListSubSystemsObjId in (' +
      frm.vAvSS.GetSelectedSubSystemsID + ')');
  end;

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Категория']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'ListCategoryesObjId=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['Инициатор']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'ListIniciatorsObjId=' + vTmpID);

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['ТипОбъекта']);
  if vTmpID = '0' then
  begin
    if frm.ListConditions.Values['ТипОбъекта'] = 'Константы' then
      AddCondition(vCond, 'TypeObjId=' + vTmpID);
  end
  else
  begin
    AddCondition(vCond, 'MDTypeObjID=' + vTmpID);
  end;

  vTmpID := frm.GetIDFromStr(frm.ListConditions.Values['ОбъектМД']);
  if vTmpID <> '0' then
    AddCondition(vCond, 'MDObjId=' + vTmpID);

  vTmpID := frm.ListConditions.Values['Ключевые слова'];
  if vTmpID <> '0' then
  begin
    t := TStringList.create; //создаём класс
    t.text := stringReplace(vTmpID, ',', #13#10, [rfReplaceAll]);
    for i := 0 to T.Count - 1 do
    begin
      if i = 0 then
        AddCondition(vCond, 'KeyWords like "%' + T[i] + '%"')
      else
        AddCondition(vCond, 'KeyWords like "%' + T[i] + '%"', 'or')
    end;

  end;

  vTmpID := frm.ListConditions.Values['CR'];
  if vTmpID <> '0' then
  begin
    t := TStringList.create; //создаём класс
    t.text := stringReplace(vTmpID, ',', #13#10, [rfReplaceAll]);
    for i := 0 to T.Count - 1 do
    begin
      if i = 0 then
        AddCondition(vCond, 'CRT = ' + T[i])
      else
        AddCondition(vCond, 'CRT = ' + T[i], 'or')
    end;

  end;

  vTmpID := frm.ListConditions.Values['Степень подчиненности'];
  if vTmpID = 'Головные' then
    AddCondition(vCond, 'ParentToDoID=0')
  else if vTmpID = 'Подчиненные' then
    AddCondition(vCond, 'ParentToDoID<>0');
  //  else if vTmpID = 'Подчиненно-головные' then
  //    AddCondition(vCond, 'ParentToDoID<>0 and HasChild <>0');
  Result := vCond;
end;

//------------------------------------------------------------------------------

procedure TToDoList.Refresh;
var
  Q: TADOQuery;
  LItem, CItem: TListItem;
  vCond: string;
  i, j: integer;
  vFldName: string;
  vFldVal: string;
begin

  if frm.ListConditions.Values['Вариант колонок'] = '' then
  begin
    //    frm.Echo('Не выбран вариант отображения колонок!');
    //    exit;
    frm.ListViewToDoCols.Items.Clear;
    frm.AddColItem(frm.ListViewToDoCols, 'FName', 'Наименование', '1_01_300');
  end;

  List.Items.BeginUpdate;
  List.Items.Clear;

  List.Columns.Clear;
  ToDoNewColumn(List, 'ID', 50);


  for i := 0 to frm.ListViewToDoCols.Items.Count - 1 do
  begin
    if frm.ListViewToDoCols.Items[i].Checked then
      ToDoNewColumn(List, frm.ListViewToDoCols.Items[i].Caption,
        StrToInt(frm.ListViewToDoCols.Items[i].SubItems[0]));
  end;

  //vFromExt := '';
  vCond := SetConditions('');

  Q := frm.RunSQL(nil,
    'select distinct id, name, Priority, SeriousnessName,'
    + 'StatusName, DateStart, DateEnd, Done, ParentToDoID,'
    + 'DateStartPlan,DateEndPlan,RecipientName,ConfigName,'
    + 'SubconfigName,ManagerName,ReliseName,' // Subsystems,MDObjTypes,MDObj,
    + 'HasChild, CRT  from ToDoForFilter ' + vCond);

  q.First;
  while not q.Eof do
  begin

    //********************************

    LItem := List.Items.Add;
    with LItem do
    begin
      Caption := RightStr('          ' + Q.FieldByName('ID').AsString, 5);
      Data := Pointer(Q.FieldByName('ID').AsInteger);
    end;

    with LItem.SubItems do
    begin
      Clear;
      j := 0;
      for i := 0 to frm.ListViewToDoCols.Items.Count - 1 do
      begin
        CItem := frm.ListViewToDoCols.Items[i];
        vFldName := trim(Copy(PLRec(CItem.Data).FName, 2, 50));
        if CItem.Checked then
        begin
          if vFldName = 'Subsystems' then
            vFldVal := GetSubSystemsByID(Q.FieldByName('ID').AsInteger)
          else if vFldName = 'MDObjTypes' then
            vFldVal := GetMDObjByID(Q.FieldByName('ID').AsInteger)
          else if vFldName = 'MDObj' then
            vFldVal := GetTypeObjByID(Q.FieldByName('ID').AsInteger)
          else
            vFldVal := Q.FieldByName(vFldName).AsString;
          Insert(j, vFldVal);
          inc(j);
        end;
      end;

    end;

    if Q.FieldByName('Done').AsBoolean = true then
      LItem.ImageIndex := 5
    else
      LItem.ImageIndex := 3;

    if (Q.FieldByName('HasChild').AsInteger <> 0) and
      (Q.FieldByName('ParentToDoID').AsInteger = 0) then
      i := 0
    else if (Q.FieldByName('HasChild').AsInteger <> 0) and
      (Q.FieldByName('ParentToDoID').AsInteger <> 0) then
      i := 1
    else if (Q.FieldByName('ParentToDoID').AsInteger <> 0) then
      i := 2
    else
      i := -1;
    LItem.StateIndex := i;

    Q.Next;
  end;
  //

  List.Items.EndUpdate;
  List.AlphaSort;
end;

//------------------------------------------------------------------------------

function TToDoList.New: SYSINT;
var
  i: integer;
begin
  i := 0;
  Result := OpenCard(i);
end;
//------------------------------------------------------------------------------

function TToDoList.Edit: SYSINT;
var
  i: integer;
begin
  if List.Selected = nil then
    exit;
  i := Integer(List.Selected.Data);
  Result := OpenCard(i);
end;
//------------------------------------------------------------------------------

procedure TToDoList.Delete;
begin
  if List.Selected = nil then
    exit;
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  frm.RunSQL(nil, 'delete from ToDo where ID=' +
    IntToStr(Integer(List.Selected.data)), 1);
end;
//------------------------------------------------------------------------------

function TToDoList.OpenCard(vID: SYSINT): SYSINT;
var
  vQ: TADOQuery;
  LItem: TListItem;
  vNode: TTreeNode;
begin
  with TfrmEditCardToDo.Create(nil) do
  begin
    pConf := Config;
    frmSS := frm;

    frm.RunSQL(QListRelises, 'select Id,Name from Relises where ConfigID=' +
      IntToStr(frmSS.CurCfg) + ' order by Name');
    frm.RunSQL(QListStatuses, 'select Id,Name from Statuses order by Name');
    frm.RunSQL(QListConfigs, 'select Id,Name from Configs order by Name');
    frm.RunSQL(QListSubconfigs, 'select Id,Name from Subconfigs order by Name');
    frm.RunSQL(QListUsers, 'select Id,Name from Users order by Name');
    frm.RunSQL(QListToDo, 'select Id,Name from ToDo order by Name');
    frm.RunSQL(QListSeriousness,
      'select ID,Name from Seriousness order by Name');
    frm.RunSQL(QListCategoryes,
      'select ID,Name from Categoryes where IsFolder=0 order by Name');

    frm.RunSQL(QListCR, 'select id,name,stateSystem, stateReal from RefCR');

    frm.RunSQL(QDocument, 'select * from ToDo where ID=' + IntToStr(vID));

    frm.RunSQL(QSubListIniciators,
      'select * from ToDoAccessory where (TypedataID = 4) and (ToDoID=' +
      IntToStr(vID) + ')');
    frm.RunSQL(QSubListCategoryes,
      'select * from ToDoAccessory where (TypedataID = 5) and (ToDoID=' +
      IntToStr(vID) + ')');

    frm.RunSQL(QSubListFiles,
      'select * from ToDoFiles where (ToDoID=' + IntToStr(vID) + ')');

    frm.RunSQL(qryQSubListStatusHistory,
      'select * from ToDoStatusHistory where (ToDoID=' + IntToStr(vID) + ')');

    ToolBar1.Images := frmSS.ImageListSubSustems;
    ToolBar2.Images := frmSS.ImageListSubSustems;
    ToolBar3.Images := frmSS.ImageListSubSustems;
    ToolBar4.Images := frmSS.ImageListSubSustems;
    ToolBar5.Images := frmSS.ImageListSubSustems;
    tlb1.Images := frmSS.ImageListSubSustems;

    if vID = 0 then
    begin
      QDocument.Insert();
      QDocumentConfigID.AsInteger := frm.CurCfg;
      QDocumentSubconfigID.AsInteger := frm.CurSubCfg;
      QDocumentDateStart.AsDateTime := Date;
      QDocumentForReport.AsBoolean := false;
      QDocumentDone.AsBoolean := False;

      QDocumentRecipientID.AsInteger := frm.CurUser;
      QDocumentParentToDoID.AsInteger := 0;

      // system
      QDocumentDateTimeCreate.AsDateTime := Now;
      QDocumentAuthorID.AsInteger := frm.CurUser;
    end
    else
    begin
      QDocument.Edit();
      //      vNode := TreeViewToDo.Items.AddObjectFirst(nil, QDocumentName.AsString,
      //        Pointer(QDocumentID.AsInteger));
      //      TreeViewToDo.Items.AddChildObject(vNode, '(system)', pointer(0));
    end;

    // заполняем текстовыми представлениями значения идентификаторов ссылок.
    // выбираем подсистемы
    MemoSubSystems.Lines.Clear;
    vQ := frm.RunSQL(nil,
      'select ObjID from ToDoAccessory where (TypedataID = 1) and (ToDoID=' +
      IntToStr(vID) + ')', 0);
    vQ.First;
    while not vQ.Eof do
    begin
      MemoSubSystems.Lines.Add(vSSList.GetSubSystemNameByID(vQ.Fields[0].AsInteger));
      vQ.Next;
    end;

    MemoObjTypes.Lines.Clear;
    vQ := frm.RunSQL(nil,
      'select ObjID from ToDoAccessory where (TypedataID = 2) and (ToDoID=' +
      IntToStr(vID) + ')', 0);
    vQ.First;
    while not vQ.Eof do
    begin
      try
        MemoObjTypes.Lines.Add(
          Config.MetaData.TaskDef.Childs.Name[vQ.Fields[0].AsInteger, true]
          );
      except
        MemoObjTypes.Lines.Add('Объект не найден!');
      end;
      vQ.Next;
    end;
    ListViewObj.Items.Clear;
    vQ := frm.RunSQL(nil,
      'select ObjID from ToDoAccessory where (TypedataID = 3) and (ToDoID=' +
      IntToStr(vID) + ')', 0);
    vQ.First;
    while not vQ.Eof do
    begin
      try
        LItem := ListViewObj.Items.Add;
        LItem.Caption :=
          Config.MetaData.FindObject(vQ.Fields[0].AsInteger).FullName;
      except
        LItem := ListViewObj.Items.Add;
        LItem.Caption := 'Объект не найден!';
      end;

      vQ.Next;
    end;
    ShowModal;
    Result := OpenResult;
    Free;
  end;
end;
//------------------------------------------------------------------------------

function TToDoList.GetMDObjByID(vID: SYSINT): WideString;
var
  T: TStringList;
  vQ: TADOQuery;
begin
  T := TStringList.Create;
  vQ := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 2) and (ToDoID=' +
    IntToStr(vID) + ')', 0);
  vQ.First;
  while not vQ.Eof do
  begin
    try
      T.Add(
        Config.MetaData.TaskDef.Childs.Name[vQ.Fields[0].AsInteger, true]
        );
    except
      T.Add('Объект не найден!');
    end;

    vQ.Next;
  end;
  Result := T.CommaText;
end;
//------------------------------------------------------------------------------

function TToDoList.GetTypeObjByID(vID: SYSINT): WideString;
var
  T: TStringList;
  vQ: TADOQuery;
  vMDObj: IMetaDataObj;
begin
  T := TStringList.Create;
  vQ := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 3) and (ToDoID=' +
    IntToStr(vID) + ')', 0);
  vQ.First;
  while not vQ.Eof do
  begin
    try
      vMDObj := Config.MetaData.FindObject(vQ.Fields[0].AsInteger);
      if vMDObj <> nil then
        T.Add(vMDObj.FullName);
    except
      T.Add('Объект не найден!');
    end;
    vQ.Next;
  end;
  Result := T.CommaText;
end;
//------------------------------------------------------------------------------

function TToDoList.GetSubSystemsByID(vID: SYSINT): WideString;
var
  T: TStringList;
  vQ: TADOQuery;
begin
  T := TStringList.Create;
  vQ := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 1) and (ToDoID=' +
    IntToStr(vID) + ')', 0);
  vQ.First;
  while not vQ.Eof do
  begin
    T.Add(
      vSSList.GetSubSystemNameByID(vQ.Fields[0].AsInteger)
      );
    vQ.Next;
  end;
  Result := T.CommaText;
end;
//------------------------------------------------------------------------------

procedure TToDoList.SaveToFile(var vFileName: WideString);
var
  Q: TADOQuery;
  XMLDocument: IXMLDocument;
  RootNode, NewXMLNode: IXMLNode;
begin
  if vFileName = '' then
  begin
    if frm.SaveDialog1.Execute then
    begin
      vFileName := frm.SaveDialog1.FileName;
    end
    else
      exit;
  end;

  XMLDocument := NewXMLDocument('1.0');
  XMLDocument.Encoding := 'UTF-8';
  RootNode := XMLDocument.AddChild('Подсистемы');
  RootNode.SetAttributeNS('DateOut', '', DateToStr(Now));
  RootNode.SetAttributeNS('TimeOut', '', TimeToStr(Now));
  Q := frm.RunSQL(nil,
    'select T.*, S.Name as [Status] from ToDo T left join Statuses S on (T.StatusID=S.ID)',
    0);
  Q.First;
  while not Q.Eof do
  begin
    NewXMLNode := RootNode.AddChild('Task');
    with NewXMLNode do
    begin
      SetAttributeNS('ID', '', Q.FieldByName('ID').AsString);
      SetAttributeNS('ДатаВремяСоздания', '',
        Q.FieldByName('DateTimeCreate').AsString);
      SetAttributeNS('Конфигурация', '',
        GetNameByID(Q.FieldByName('ConfigID').AsInteger, 'Configs'));
      SetAttributeNS('Подконфигурация', '',
        GetNameByID(Q.FieldByName('SubConfigID').AsInteger, 'SubConfigs'));
      SetAttributeNS('Подсистемы', '',
        GetSubSystemsByID(Q.FieldByName('ID').AsInteger));
      SetAttributeNS('ТипыМетаданных', '',
        GetTypeObjByID(Q.FieldByName('ID').AsInteger));
      SetAttributeNS('ОбъектыМетаданных', '',
        GetMDObjByID(Q.FieldByName('ID').AsInteger));
      {DONE: UserName into XML todolist}
      SetAttributeNS('Пользователь', '',
        GetNameByID(Q.FieldByName('RecipientID').AsInteger, 'Users'));
      SetAttributeNS('Автор', '',
        GetNameByID(Q.FieldByName('AuthorID').AsInteger, 'Users'));
      SetAttributeNS('Приоритет', '', Q.FieldByName('Priority').AsInteger);
      SetAttributeNS('Статус', '', Q.FieldByName('Status').AsString);
      SetAttributeNS('ДатаНачала', '', Q.FieldByName('DateStart').AsString);
      SetAttributeNS('ДатаКонца', '', Q.FieldByName('DateEnd').AsString);
      SetAttributeNS('ПроцентВыполнения', '',
        Q.FieldByName('Complete').AsInteger);
      SetAttributeNS('Выполнено', '', Q.FieldByName('Done').AsBoolean);
      SetAttributeNS('Описание', '', Q.FieldByName('Note').AsString);
      SetAttributeNS('ДляОтчета', '', Q.FieldByName('ForReport').AsBoolean);
      SetAttributeNS('ТекстДляОтчета', '',
        Q.FieldByName('ReportText').AsString);
    end;
    q.Next;
  end;
  try
    XMLDocument.SaveToFile(vFileName);
  except
    on E: Exception do
    begin
      frm.Echo('Подсистемы: Сохранение задач'#13#10 +
        'Возникло исключение:'#13#10 + E.Message
        );
    end;
  end;
end;

function TToDoList.GetConditionsViewType: SYSINT;
begin
  //
end;

procedure TToDoList.SetConditionsViewType(vVal: SYSINT);
begin
  //
end;

function TToDoList.GetListViewType: SYSINT;
begin
  Result := ListViewType;
end;

procedure TToDoList.SetListViewType(vVal: SYSINT);
begin
  ListViewType := vVal;
end;
//------------------------------------------------------------------------------

function TToDoList.GetStatusByID(vID: SYSINT): WideString;
begin
  Result := frm.RunSQL(nil, 'Select Name from Statuses where ID = ' +
    IntToStr(vID), 0).Fields[0].AsString;
end;
//------------------------------------------------------------------------------

function TToDoList.GetConfigByID(vID: SYSINT): WideString;
begin
  Result := frm.RunSQL(nil, 'Select Name from Configs where ID = ' +
    IntToStr(vID), 0).Fields[0].AsString;
end;

//------------------------------------------------------------------------------

function TToDoList.GetNameByID(vID: SYSINT; vStr: string): WideString;
begin
  Result := frm.RunSQL(nil, 'Select Name from ' + vStr + ' where ID = ' +
    IntToStr(vID), 0).Fields[0].AsString;
end;

//------------------------------------------------------------------------------

function TToDoList.SelectToDoByID(var vID: SYSINT): SYSINT;
var
  i: Integer;
  vIDStr: string;
begin
  Result := 0;
  if vID <> 0 then
  begin
    vIDStr := IntToStr(vID);
    for i := 0 to List.Items.Count - 1 do
    begin
      if List.Items.Item[i].Caption = vIDStr then
      begin
        List.Items.Item[i].Selected := true;
        break;
        Result := 1;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------

function TToDoList.GetSelectedToDoID: SYSINT;
begin
  if List.Selected = nil then
    Result := 0
  else
    Result := StrToInt(List.Selected.Caption);
end;
//------------------------------------------------------------------------------

function TToDoList.GetMaxListChildToDoSize: SYSINT;
begin
  Result := vMaxListChildToDoSize;
end;

function TToDoList.GetMaxListConditionsSize: SYSINT;
begin
  Result := vMaxListConditionsSize;
end;

procedure TToDoList.SetMaxListChildToDoSize(var vVal: SYSINT);
begin
  vMaxListChildToDoSize := vVal;
end;

procedure TToDoList.SetMaxListConditionsSize(var vVal: SYSINT);
begin
  vMaxListConditionsSize := vVal;
end;

procedure TToDoList.ListForObjectRefresh(var vID: SYSINT);
var
  Q: TADOQuery;
  vNode: TTreeNode;
begin
  {
  frm.Echo(
    'select distinct ToDoID,ToDo.name from ToDoAccessory, '
    + 'ToDo where (TypedataID = 3) and (ObjID=' + IntToStr(vID) +
    ') and (ToDo.ID=ObjID) and (ToDo.SubconfigID=' + intToStr(frm.CurSubCfg) +
      ')'
    );
          }
  frm.tvToDoObj.Items.Clear;
  Q := frm.RunSQL(nil,
    'select distinct ToDo.ID,ToDo.name from ToDoAccessory, '
    + 'ToDo where (TypedataID = 3) and (ObjID=' + IntToStr(vID) +
    ') and (ToDo.ID=ToDoID) and (ToDo.SubconfigID=' + intToStr(frm.CurSubCfg) +
    ')');
  //ShowMessage(IntToStr(q.RecordCount));
  Q.First;
  while not Q.Eof do
  begin

    vNode := frm.tvToDoObj.Items.AddObject(nil, '(' +
      Q.FieldByName('ID').AsString + ') ' + Q.FieldByName('Name').AsString,
      Pointer(Q.FieldByName('ID').AsInteger));

    frm.tvToDoObj.Items.AddChild(vNode, 'system');

    Q.Next;
  end;

end;

procedure TToDoList.ToDoObjDelete;
begin
  if frm.tvToDoObj.Selected = nil then
    exit;
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  frm.RunSQL(nil, 'delete from ToDo where ID=' +
    IntToStr(Integer(frm.tvToDoObj.Selected.data)), 1);
end;

procedure TToDoList.ToDoObjEdit;
var
  i: integer;
begin
  if frm.tvToDoObj.Selected = nil then
    exit;
  i := Integer(frm.tvToDoObj.Selected.Data);
  OpenCard(i);
end;

function TToDoList.CopyByID(vID: SYSINT): SYSINT;
var
  Q1: TADOQuery;
  i: Integer;
begin
  with TfrmEditCardToDo.Create(nil) do
  begin
    pConf := Config;
    frmSS := frm;

    frm.RunSQL(QListRelises, 'select Id,Name from Relises where ConfigID=' +
      IntToStr(frmSS.CurCfg) + ' order by Name');
    frm.RunSQL(QListStatuses, 'select Id,Name from Statuses order by Name');
    frm.RunSQL(QListConfigs, 'select Id,Name from Configs order by Name');
    frm.RunSQL(QListSubconfigs, 'select Id,Name from Subconfigs order by Name');
    frm.RunSQL(QListUsers, 'select Id,Name from Users order by Name');
    frm.RunSQL(QListToDo, 'select Id,Name from ToDo order by Name');
    frm.RunSQL(QListSeriousness,
      'select ID,Name from Seriousness order by Name');
    frm.RunSQL(QListCategoryes,
      'select ID,Name from Categoryes where IsFolder=0 order by Name');

    Q1 := frm.RunSQL(nil, 'select * from ToDo where ID=' + IntToStr(vID));
    frm.RunSQL(QDocument, 'select * from ToDo where ID = 0');
    QDocument.Insert;
    for i := 1 to QDocument.FieldCount - 1 do
    begin
      QDocument.Fields[i].Value := Q1.Fields[i].Value;
    end;

    /// При копировании дата создания должна быть текущей
    QDocumentDateTimeCreate.AsDateTime := Now;
    QDocumentAuthorID.AsInteger := frm.CurUser;

    ToolBar1.Images := frmSS.ImageListSubSustems;
    ToolBar2.Images := frmSS.ImageListSubSustems;
    ToolBar3.Images := frmSS.ImageListSubSustems;
    ToolBar4.Images := frmSS.ImageListSubSustems;
    ToolBar5.Images := frmSS.ImageListSubSustems;

    ShowModal;
    Result := OpenResult;
    Free;
  end;
end;

function TToDoList.CreateChild(vParentID: SYSINT): SYSINT;
var
  Q1: TADOQuery;
  i: Integer;
begin
  with TfrmEditCardToDo.Create(nil) do
  begin
    pConf := Config;
    frmSS := frm;

    frm.RunSQL(QListRelises, 'select Id,Name from Relises where ConfigID=' +
      IntToStr(frmSS.CurCfg) + ' order by Name');
    frm.RunSQL(QListStatuses, 'select Id,Name from Statuses order by Name');
    frm.RunSQL(QListConfigs, 'select Id,Name from Configs order by Name');
    frm.RunSQL(QListSubconfigs, 'select Id,Name from Subconfigs order by Name');
    frm.RunSQL(QListUsers, 'select Id,Name from Users order by Name');
    frm.RunSQL(QListToDo, 'select Id,Name from ToDo order by Name');
    frm.RunSQL(QListSeriousness,
      'select ID,Name from Seriousness order by Name');
    frm.RunSQL(QListCategoryes,
      'select ID,Name from Categoryes where IsFolder=0 order by Name');

    Q1 := frm.RunSQL(nil, 'select * from ToDo where ID=' + IntToStr(vParentID));
    frm.RunSQL(QDocument, 'select * from ToDo where ID = 0');
    QDocument.Insert;
    try
      for i := 1 to QDocument.FieldCount - 1 do
      begin
        QDocument.Fields[i].Value := Q1.Fields[i].Value;
      end;
    except
      // ничего не выводим.
    end;

    QDocument.FieldByName('ParentToDoID').AsInteger := vParentID;

    ToolBar1.Images := frmSS.ImageListSubSustems;
    ToolBar2.Images := frmSS.ImageListSubSustems;
    ToolBar3.Images := frmSS.ImageListSubSustems;
    ToolBar4.Images := frmSS.ImageListSubSustems;
    ToolBar5.Images := frmSS.ImageListSubSustems;

    ShowModal;
    Result := OpenResult;
    Free;
  end;
end;

function TToDoList.GetConditionText(const ForTree: WideString): WideString;
begin
  Result := SetConditions(ForTree);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TToDoList, Class_ToDoList,
    ciMultiInstance, tmApartment);
end.

