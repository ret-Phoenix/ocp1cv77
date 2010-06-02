unit TuningMDObj;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB,
  Windows, Messages, Graphics, Controls, Forms, Dialogs, SysUtils,
  OpenConf_TLB, ExtCtrls, ComCtrls, FormSubSystemsMain,
  ADODB, StdVcl;

type
  TTuningMDObj = class(TAutoObject, IConnectionPointContainer, ITuningMDObj)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ITuningMDObjEvents;

    frm: TfrmSubSystems;
    Config: IConfigurator;
    Tree: TTreeView;

    function GetMetView(vObj: IMetaDataObj): string;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator;
      TreeObj: TTreeView);
    destructor Destroy; override;

    procedure Refresh; safecall;
    procedure Show; safecall;
    procedure Save; safecall;

    procedure RefreshForToDo(Q: TADOQuery);
    procedure AddMetItems(vTree: TTreeView; Num: Integer; Parent: TTreeNode;
      Img: Integer);

    function GetMDObj(mdo: IMetaDataObj; lLever: integer; lQ: TADOQuery):
      integer;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function GetCurrentMDObj: OleVariant; safecall;
  end;

implementation

uses ComServ, DB;

function TTuningMDObj.GetMetView(vObj: IMetaDataObj): string;
begin
  {
  Идентификатор
  Идентификатор + синоним
  Идентификатор + ID
  Идентификатор + синоним + ID
  }
  case frm.ComboBoxView.ItemIndex of
    0: Result := vObj.Name;
    1: Result := vObj.Name + ' [' + vObj.Present + ']';
    2: Result := vObj.Name + ' [' + IntToStr(vObj.ID) + ']';
    3: Result := vObj.Name + ' [' + vObj.Present + '] - ' + IntToStr(vObj.ID);
  end;
end;

procedure TTuningMDObj.AddMetItems(vTree: TTreeView; Num: Integer; Parent:
  TTreeNode; Img: Integer);
var
  Met: IMetaDataObjArray;
  i: Integer;
  Node: TTreeNode;
begin

  /////////////////////////////
  case Integer(Parent.Data) of
    0: i := GrfConsts;
    1: i := GrfRefs;
    2: i := GrfDocs;
    3: i := GrfJrns;
    4: i := GrfEnums;
    5: i := GrfReps;
    6: i := GrfCalcVars;
    7: i := GrfRegs;
    8: i := GrfCalndars;
    9: i := GrfKindCalcs;
    10: i := GrfGrpCalc;
    11: i := GrfCJs;
    12: i := GrfFldr;
    13: i := GrfFldr;
    14: i := GrfFldr;
    15: i := GrfObRecs;
    16: i := GrfObRecs;
    17: i := GrfAccLists;
    18: i := GrfObRecs;
    19: i := GrfObRecs;
    20: i := GrfDoc;
    21: i := GrfOpers;
    22: i := GrfDoc;
    23: i := GrfObRecs;
    24: i := GrfObRecs;
    25: i := GrfDoc;
  end;
  Parent.ImageIndex := i;
  Parent.SelectedIndex := i;

  /////////////////////////////

  if Num = -1 then
    exit;
  Met := Config.MetaData.TaskDef.Childs[Num];
  for i := 0 to Met.Count - 1 do
  begin
    Node := vTree.Items.AddChildObject(Parent, GetMetView(Met.item[i]),
      Pointer(Met.item[i].ID));
    Node.ImageIndex := Img;
    Node.SelectedIndex := Img;
  end;
end;
//------------------------------------------------------------------------------

procedure TTuningMDObj.RefreshForToDo(Q: TADOQuery);
var
  //  Met: IMetaDataObjArray;
  MetA: IMetaDataObjChilds;
  //  i: Integer;
  Node: TTreeNode;
  s: string;
begin
  try
    MetA := Config.MetaData.TaskDef.Childs;
    Tree.Items.Clear();
    Q.First;
    while not Q.Eof do
    begin
      Node := Tree.Items.AddObject(nil,
        MetA.Name[Q.FieldByName('ObjID').AsInteger, true],
        Pointer(Q.FieldByName('ObjID').AsInteger));
      AddMetItems(Tree, Q.FieldByName('ObjID').AsInteger, Node, -1);
      Q.Next
    end;

  except
    on E: Exception do
    begin
      s := 'Подсистемы: '#13#10 +
        'Возникло исключение:'#13#10 + E.Message;
      frm.Echo(s);
    end;
  end;

end;
//------------------------------------------------------------------------------

procedure TTuningMDObj.Refresh;
var
  //  Met: IMetaDataObjArray;
  //  i: Integer;
  Node: TTreeNode;
begin
  Tree.Items.Clear();
  Node := Tree.Items.AddObject(nil, 'Константы', Pointer(0));
  AddMetItems(Tree, 0, Node, GrfConst);
  Node := Tree.Items.AddObject(nil, 'Справочники', Pointer(1));
  AddMetItems(Tree, 1, Node, GrfRef);
  Node := Tree.Items.AddObject(nil, 'Документы', Pointer(2));
  AddMetItems(Tree, 2, Node, GrfDoc);
  Node := Tree.Items.AddObject(nil, 'Журналы документов', Pointer(3));
  AddMetItems(Tree, 3, Node, GrfJrn);
  Node := Tree.Items.AddObject(nil, 'Перечисления', Pointer(4));
  AddMetItems(Tree, 4, Node, GrfEnum);
  Node := Tree.Items.AddObject(nil, 'Отчеты', Pointer(5));
  AddMetItems(Tree, 5, Node, GrfRep);
  Node := Tree.Items.AddObject(nil, 'Обработки', Pointer(6));
  AddMetItems(Tree, 6, Node, GrfCalcVar);
  Node := Tree.Items.AddObject(nil, 'Регистры', Pointer(7));
  AddMetItems(Tree, 7, Node, GrfReg);
  Node := Tree.Items.AddObject(nil, 'Календари', Pointer(8));
  AddMetItems(Tree, 8, Node, GrfCalndar);
  Node := Tree.Items.AddObject(nil, 'Виды расчетов', Pointer(9));
  AddMetItems(Tree, 9, Node, GrfKindCalc);
  Node := Tree.Items.AddObject(nil, 'Группы расчетов', Pointer(10));
  AddMetItems(Tree, 10, Node, GrfGrpCalc);
  Node := Tree.Items.AddObject(nil, 'Журналы расчетов', Pointer(11));
  AddMetItems(Tree, 11, Node, GrfCJ);
  Node := Tree.Items.AddObject(nil, 'Нумераторы', Pointer(12));
  AddMetItems(Tree, 12, Node, GrfDoc);
  Node := Tree.Items.AddObject(nil, 'Последовательности', Pointer(13));
  AddMetItems(Tree, 13, Node, GrfDoc);
  Node := Tree.Items.AddObject(nil, 'Графы отбора', Pointer(14));
  AddMetItems(Tree, 14, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Общие реквизиты', Pointer(15));
  AddMetItems(Tree, 15, Node, GrfObRec);
  Node := Tree.Items.AddObject(nil, 'Правила пересчета', Pointer(16));
  AddMetItems(Tree, 16, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Планы счетов', Pointer(17));
  AddMetItems(Tree, 17, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Субконто', Pointer(18));
  AddMetItems(Tree, 18, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Реквизиты плана счетов', Pointer(19));
  AddMetItems(Tree, 19, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Формы списка плана счетов', Pointer(20));
  AddMetItems(Tree, 20, Node, GrfFrmList);
  Node := Tree.Items.AddObject(nil, 'Реквизиты операциии', Pointer(21));
  AddMetItems(Tree, 21, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Формы журнала операций', Pointer(22));
  AddMetItems(Tree, 22, Node, GrfFrmList);
  Node := Tree.Items.AddObject(nil, 'Графы журнала операций', Pointer(23));
  AddMetItems(Tree, 23, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Реквизиты проводок', Pointer(24));
  AddMetItems(Tree, 24, Node, GrfElement);
  Node := Tree.Items.AddObject(nil, 'Формы журнала проводок', Pointer(25));
  AddMetItems(Tree, 25, Node, GrfFrmList);
  //Node := Tree.Items.Add(nil,'Представление проводки',Pointer(26));
  //AddMetItems(26, Node);
end;
//------------------------------------------------------------------------------

procedure TTuningMDObj.Show;
begin
  //CfgMetShowSubSystemsExecute(CfgMetShowSubSystems);
  ShowMessage('сделать');
end;
//------------------------------------------------------------------------------

function GetObjname(pName: string): string;
var
  lPos: integer;
begin
  lPos := Pos('[', pName);
  if lPos > 0 then
  begin
    Result := Trim(copy(pName, 0, lPos - 2));
  end
  else
    Result := pName;
end;

//------------------------------------------------------------------------------

function TTuningMDObj.GetMDObj(mdo: IMetaDataObj; lLever: integer; lQ:
  TADOQuery): integer;
var
  childs: IMetaDataObjChilds;
  mda: IMetaDataObjArray;
  vObj: IMetaDataObj;
  i, c, j, k: integer;
begin
  try
    childs := mdo.Childs;
    for i := 0 to childs.Count - 1 do
    begin
      mda := childs[i];
      c := mda.Count - 1;
      for j := 0 to c - 1 do
      begin
        try
          //frm.Echo('  ' + childs[i].item[j].FullName);
          with lQ do
          begin
            Insert;
            FieldByName('ConfigID').AsInteger := frm.CurCfg;
            FieldByName('SubconfigID').AsInteger := frm.CurSubCfg;
            FieldByName('MDObjType').AsInteger := i;
            FieldByName('MDObjID').AsInteger := childs[i].item[j].ID;
            FieldByName('MDObjName').AsString := childs[i].item[j].FullName;
            Post;
          end;

        finally
          GetMDObj(mda[j], lLever + 1, lQ);
        end;
      end;
    end;
  except
    GetMDObj(mda[j], lLever + 1, lQ);
  end;
end;

procedure TTuningMDObj.Save;
var
  lSQL: string;
  i: integer;
  Node: TTreeNode;
  lQ: TADOQuery;
begin
  lQ := frm.RunSQL(nil, 'select * from MDStruct where ID=0');

  GetMDObj(Config.MetaData.TaskDef, 0, lQ);

  ShowMessage('Обработка завершена');
end;

procedure TTuningMDObj.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITuningMDObjEvents;
end;

procedure TTuningMDObj.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

constructor TTuningMDObj.CreateObj(frmSS: TfrmSubSystems; vConfig:
  IConfigurator; TreeObj: TTreeView);
begin
  inherited Create;
  frm := frmSS;
  Config := vConfig;
  Tree := TreeObj;
end;

destructor TTuningMDObj.Destroy;
begin
end;

function TTuningMDObj.GetCurrentMDObj: OleVariant;
begin
  if Tree.Selected.HasChildren then
  begin
    Result := varEmpty;
  end
  else
  begin
    try
      Result := Config.MetaData.FindObject(Integer(Tree.Selected.Data));
    except
      on E: Exception do
      begin
        frm.Echo('Подсистемы: Получение объекта дерева настрйоки подсистем'#13#10
          +
          'Возникло исключение:'#13#10 + E.Message
          );
        Result := varEmpty;
      end;
    end;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTuningMDObj, Class_TuningMDObj,
    ciMultiInstance, tmApartment);
end.

