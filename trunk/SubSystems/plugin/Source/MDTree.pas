unit MDTree;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB,
  FormSubSystemsMain, treelist,
  ComCtrls, OpenConf_TLB, SysUtils, ShelLAPI, ADODB, ExtTreeFiles,
  Messages, Dialogs, Controls, AvailableSubSystems, ObjectClasses,
  Forms, ObjectNote, StdVcl;

type
  TMDTree = class(TAutoObject, IConnectionPointContainer, IMDTree)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;

    frm: TfrmSubSystems;
    Config: IConfigurator;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }

    function GetMetView(vObj: IMetaDataObj): string;
  public
    FEvents: IMDTreeEvents;
    List: TTreeView;
    //List: TTreeList;
    vListSort: TListView;
    mListExtPrnFrms: TListView;

    procedure Initialize; override;
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy; override;

    procedure Open; safecall;
    procedure Fill; safecall;
    procedure TreeInFile; safecall;
    procedure DeleteAllErros; safecall;
    procedure DeleteCurrentError; safecall;
    function GetTypeViewIndex: SYSINT; safecall;
    procedure SetTypeViewIndex(Ind: SYSINT); safecall;
    function GetNodeClass: SYSINT; safecall;
    function GetCurrentMDObjFullName: WideString; safecall;
    function GetCurrentMDObj: OleVariant; safecall;
    procedure GetMDNodeObjInfo; safecall;
    function ExpandType: SYSINT; safecall;

    function ObjByCursor: IMetaDataObj;

    function InsertExtFrms(vSubSystems: string): TTreeNode;

    procedure InsertMDObjInTree(vKindStr, vTypeStr: string);
    procedure InsertJournal(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
      iKind: Integer; pFull: Integer = 0);

    procedure InsertReference(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
      iKind: Integer; pFull: Integer = 0);

    procedure InsertDocument(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
      iKind: Integer; pFull: integer = 0);

    procedure InsertEnum(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
      iKind: Integer; pFull: integer = 0);

    procedure InsertObRec(vNodePr: TTreeNode; vObj: IMetaDataObj; iType, iKind:
      Integer);

    procedure AddFilesInTree(
      vTree: TTreeView;
      vParentNodeGrp: TTreeNode;
      StartFolder, Mask, MaskFalse: string;
      ScanSubFolders: Boolean = True
      );

    procedure GetTurboMDLinks();
    //    function GetFileSize(FileName: string): Integer;
    function CheckUpload(vName: string): Boolean;
    function GetExtPrnlist(): Boolean;
    function InsertExtPrnFrms(pNode: TTreeNode; vName: string): Boolean;
    function InsertFileInTree(pParent: TTreeNode; pFolderName, pFileName, pFExt:
      string): Boolean;

    procedure CheckUnloadDialogModule(pViewName: string; pCurNode: TTreeNode;
      pGrfDefault: Integer);

    function GoToObject(const pName: WideString): SYSINT; safecall;
    // не прописан в ТЛБ, т.к. не знаю как прописать экпорт типа данных другого интерфейса
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function ReternFileInfo(const ParamFile: WideString): WideString; safecall;
    procedure GetObjectNote; safecall;
    function GoToPathInExplorer(const vPath: WideString): SYSINT; safecall;
    procedure FillData; safecall;

  end;

const
  ImgFolder = 4;
  ImgErt = 8;
  ImgMxl = 9;
  ImgTxt = 16;
  ImgOther = 69;
  ImgArc = 20;
  ImgWord = 21;
  ImgExl = 22;
  ImgAcs = 23;
  ImgMD = 58;
  ImgExe = 70;

var
  vDir: string;
  AcNode: TTreeNode;
  AcNode1: TTreeNode;

  {
  OnMDBtnChoiceClick
  OnMDNodeChange
  OnMDNodeClick
  OnMDNodeDblClick
  OnMDSubSystemsListRefresh
  OnMDTreeDeleteErrors
  OnMDTreeFilling
  OnMDTreeSaveToFile
  OnMDViewChange
  }

implementation

uses ComServ, StrUtils, DB;
//------------------------------------------------------------------------------

function TMDTree.CheckUpload(vName: string): Boolean;
var
  i: Integer;
begin
  if vListSort = nil then
  begin
    Result := false;
    Exit;
  end;
  for i := 0 to vListSort.Items.Count - 1 do
  begin
    if vListSort.Items.Item[i].Caption = vName then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;
//------------------------------------------------------------------------------

function GetFileSize(FileName: string): Integer;
var
  FS: TFileStream;
begin
  try
    FS := TFileStream.Create(Filename, fmOpenRead);
  except
    Result := -1;
  end;
  if Result <> -1 then
    Result := FS.Size;
  FS.Free;
end;
//------------------------------------------------------------------------------

procedure TMDTree.GetTurboMDLinks();
var
  FName: string;
  F: TextFile;
  S: string;
  LItem: TListItem;
begin
  FName := Config.IBDir + 'turbomd.prm';
  if FileExists(FName) then
  begin

    vListSort := TListView.Create(nil);
    vListSort.Parent := frm;
    vListSort.Items.BeginUpdate;
    vListSort.Visible := False;
    vListSort.SortType := stNone;
    AssignFile(F, FName); { File selected in dialog }
    Reset(F);
    while not Eof(F) do
    begin
      Readln(F, S);
      LItem := vListSort.Items.Add;
      LItem.Caption := Trim(Copy(S, 0, Pos('=', S) - 1));
      LItem.SubItems.Insert(0, Trim(Copy(S, Pos('=', S) + 1, Length(S))));
    end;
    CloseFile(F);
  end;
end;
//------------------------------------------------------------------------------

procedure GrfNode(vNode: TTreeNode; vImg: Integer);
begin
  vNode.ImageIndex := vImg;
  vNode.SelectedIndex := vImg;
  // vNode.StateIndex := vImg;
end;
{
function CreateData(vMDObj: IMetaDataObj; vObjType, vObjKind, vDocType: Integer; vOpenStr: string): PMyRec;
var
  vData: PMyRec;
begin
  New(vData);
  vData.MDObj := vMDObj;
  vData.ObjType := vObjType;
  vData.ObjKind := vObjKind;
  vData.DocType := vDocType;
  vData.OpenStr := vOpenStr;
  Result := vData;
end;
}
//------------------------------------------------------------------------------

function TMDTree.GetMetView(vObj: IMetaDataObj): string;
var
  lStr: string;
begin
  {
  Идентификатор
  Идентификатор + синоним
  Идентификатор + ID
  Идентификатор + синоним + ID
  }

  if frm.MDTreeViewMode = 0 then
    lStr := ';'
  else
    lStr := ' - ';

  case frm.ComboBoxView.ItemIndex of
    0: Result := vObj.Name;
    {
    1: Result := vObj.Name + ' [' + vObj.Present + ']';
    2: Result := vObj.Name + ' [' + IntToStr(vObj.ID) + ']';
    3: Result := vObj.Name + ' [' + vObj.Present + '] - ' + IntToStr(vObj.ID);
    }

    1: Result := vObj.Name + lStr + vObj.Present;
    2: Result := vObj.Name + lStr + IntToStr(vObj.ID);
    3: Result := vObj.Name + lStr + vObj.Present + lStr + IntToStr(vObj.ID);

  end;
end;

//------------------------------------------------------------------------------

procedure TMDTree.Open;
var
  vNode: TTreeNode;
  strDocFoms: string;
  Node: TTreeNode;
  vDoc: CfgDoc;
  s: string;
  ext: string;
  Ext1C: string;
begin
  // strDocFoms := '{1}{2}{3}{5}{6}{9}{11}{17}{20}{22}{25}';
  vNode := List.Selected;
  try
    if vNode = nil then
      exit;
    if vNode.ImageIndex <> GrfFldr then
    begin
      if PMyRec(vNode.Data).OpenStr = '-' then
        exit;
      try
        if PMyRec(vNode.Data).OpenStr <> '' then
        begin
          strDocFoms := PMyRec(vNode.Data).OpenStr;
          Config.Documents[strDocFoms].Open();
          //Config.Documents[strDocFoms].
        end
        else
        begin
          try
            Node := List.Selected;
            s := PMyRec(Node.Data).FolderName + PMyRec(Node.Data).FileName;
            ext := LowerCase(ExtractFileExt(s));
            Ext1C := '.ert,.mxl,.efd,.txt,.prm,.spl';
            if Pos(ext, Ext1C) > 0 then
            begin
              vDoc := Config.Documents.Open(s);
              vDoc.Open();
            end
            else
            begin
              ShellExecute(frm.handle, 'open', pchar(s), '',
                PChar(PMyRec(Node.Data).FolderName), SW_SHOWNORMAL);
            end;
          except
          end;
        end;
      finally
        // nothing
      end;
    end;
  except
  end;
end;
//------------------------------------------------------------------------------

procedure TMDTree.InsertObRec(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
  iKind: Integer);
var
  vNodeObj: TTreeNode;
begin
  vNodeObj := List.Items.AddChildObject(
    vNodePr,
    GetMetView(vObj),
    frm.CreateData(vObj, iType, iKind, iObj, '-')
    );
  GrfNode(vNodeObj, GrfElement);
end;
//------------------------------------------------------------------------------

procedure TMDTree.CheckUnloadDialogModule(pViewName: string; pCurNode:
  TTreeNode; pGrfDefault: Integer);
var
  lMdl, lFrm: Boolean;
begin
  lMdl := CheckUpload(pViewName + '.Модуль');
  lFrm := CheckUpload(pViewName + '.Диалог');
  if (lMdl) and (lFrm) then
    frm.GrfNode(pCurNode, GrfTMDObj)
  else if lMdl then
    frm.GrfNode(pCurNode, GrfTMDModule)
  else if lFrm then
    frm.GrfNode(pCurNode, GrfTMDForm)
  else
    frm.GrfNode(pCurNode, pGrfDefault);
end;

procedure TMDTree.InsertReference(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
  iKind: Integer; pFull: integer = 0);
var
  vNodeObj, vNode, vCurNode: TTreeNode;
  f, vImg, i: Integer;
  Met: IMetaDataObjArray;
  PStr: string;
  vViewName: string;
begin

  // 4 - кол-во уровней
  // 13 - способ редактирования
  // 14 - единая форма для элемента и группы

  if pFull = 0 then
  begin
    vNodeObj := List.Items.AddChildObject(
      vNodePr,
      GetMetView(vObj),
      frm.CreateData(vObj, iType, iKind, iObj, '-')
      );
    frm.GrfNode(vNodeObj, GrfRef);
    List.Items.AddChildObject(
      vNodeObj,
      '(system)',
      nil
      );
    Exit;
  end
  else
  begin
    if vNodePr.getFirstChild.Text = '(system)' then
    begin
      vNodePr.DeleteChildren;
    end
    else
    begin
      exit;
    end;
    vNodeObj := vNodePr;
  end;

  if vObj.Props[13] <> 'ВСписке' then
  begin
    vViewName := 'Справочник.' + vObj.Name + '.Форма';
    vCurNode := List.Items.AddChildObject(vNodeObj, 'Форма элемента',
      frm.CreateData(vObj, iType, iKind, iDocForm, vViewName));
    CheckUnloadDialogModule(vViewName, vCurNode, GrfFrmEdit);
  end;

  if vObj.Props[4] > '1' then
  begin
    if vObj.Props[14] <> '0' then
    begin
      vViewName := 'Справочник.' + vObj.Name + '.Форма группы';
      vCurNode := List.Items.AddChildObject(vNodeObj, 'Форма группы',
        frm.CreateData(vObj, iType, iKind, iDocForm, vViewName));
      CheckUnloadDialogModule(vViewName, vCurNode, GrfFrmEdit);
    end;
  end;
  vCurNode := List.Items.AddChildObject(vNodeObj, 'Описание',
    frm.CreateData(vObj, iType, iKind, iDocForm, 'Описание.' +
    IntTOStr(vObj.id)));
  frm.GrfNode(vCurNode, GrfFrmNote);
  // добавляем реквизиты
  // 9 - периодичность
  // 10 -  сортировка
  // 11 - отбор
  if vObj.childs[0].count <> 0 then
  begin
    vNode := List.Items.AddChildObject(vNodeObj, 'Реквизиты', nil);
    frm.GrfNode(vNode, GrfFldr);
    for f := 0 to vObj.childs[0].count - 1 do
    begin
      vCurNode := List.Items.AddChildObject(
        vNode,
        GetMetView(vObj.childs[0].item[f]),
        frm.CreateData(vObj.childs[0].item[f], iType, iKind, iRecForm,
        '-')
        );
      vImg := GrfElement;
      if vObj.childs[0].item[f].Props[9] = '1' then
        vImg := GrfRecPeriod;
      if vObj.childs[0].item[f].Props[10] = '1' then
        vImg := GrfRecSort;
      if vObj.childs[0].item[f].Props[11] = '1' then
        vImg := GrfRecFilter;
      frm.GrfNode(vCurNode, vImg);
    end;
  end;
  // добавляем формы списка
  if vObj.childs[1].count <> 0 then
  begin
    vNode := List.Items.AddChildObject(vNodeObj, 'Формы списка', nil);
    frm.GrfNode(vNode, GrfFldr);
    for f := 0 to vObj.childs[1].count - 1 do
    begin
      vViewName := 'Справочник.' + vObj.Name + '.ФормаСписка.' +
        vObj.childs[1].item[f].Name;
      vCurNode := List.Items.AddChildObject(
        vNode,
        vObj.childs[1].item[f].Name,
        frm.CreateData(vObj.childs[1].item[f], iType, iKind, iDocForm,
        vViewName));
      CheckUnloadDialogModule(vViewName, vCurNode, GrfFrmEdit);
    end;
  end;
  InsertExtPrnFrms(vNodeObj, vObj.FullName);
  // добавляем подчиненные справочники
  Met := Config.MetaData.TaskDef.Childs[1];
  if Met.Count <> 0 then
  begin
    vNode := nil;
    for i := 0 to Met.Count - 1 do
    begin
      PStr := UpperCase(Met.item[i].Props[3]);
      if Trim(PStr) = UpperCase('[' + trim(vObj.FullName) + ']') then
      begin
        if vNode = nil then
        begin
          vNode := List.Items.AddChildObject(vNodeObj, 'Подчиненные', nil);
          frm.GrfNode(vNode, GrfRefFldChild);
        end;
        vCurNode := List.Items.AddChildObject(vNode,
          GetMetView(Met.item[i]),
          frm.CreateData(Met.item[i], iType, iKind, iObj, 'Справочник.'
          + Met.item[i].Name));
        frm.GrfNode(vCurNode, GrfRef);
      end;
    end;
  end;

end;
//------------------------------------------------------------------------------

procedure TMDTree.InsertDocument(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
  iKind: Integer; pFull: integer = 0);
var
  vNodeObj, vCurNode, vNode: TTreeNode;
  Met: IMetaDataObjArray;
  i, f, k: integer;
  vVS: string;
  t: TStringList;
  vViewName: string;
begin

  if pFull = 0 then
  begin
    vNodeObj := List.Items.AddChildObject(
      vNodePr,
      GetMetView(vObj),
      frm.CreateData(vObj, iType, iKind, iObj, '-')
      );
    frm.GrfNode(vNodeObj, GrfDoc);
    List.Items.AddChildObject(vNodeObj, '(system)', nil);
    Exit;
  end
  else
  begin
    if vNodePr.getFirstChild.Text = '(system)' then
    begin
      vNodePr.DeleteChildren;
    end
    else
    begin
      exit;
    end;
    vNodeObj := vNodePr;
  end;
  // добавим форму документа
  vViewName := 'Документ.' + vObj.Name + '.Форма';
  vCurNode := List.Items.AddChildObject(vNodeObj, 'Форма документа',
    frm.CreateData(vObj, iType, iKind, iDocForm, vViewName));
  CheckUnloadDialogModule(vViewName, vCurNode, GrfFrmEdit);
  vViewName := 'Документ.' + vObj.Name + '.Модуль Документа';
  vCurNode := List.Items.AddChildObject(vNodeObj, 'Модуль документа',
    frm.CreateData(vObj, iType, iKind, iDocForm, vViewName));
  if CheckUpload(vViewName) then
    frm.GrfNode(vCurNode, GrfTMDModule)
  else
    frm.GrfNode(vCurNode, GrfFrmModule);

  vCurNode := List.Items.AddChildObject(vNodeObj, 'Описание',
    frm.CreateData(vObj, iType, iKind, iDocForm, 'Описание.' +
    IntToStr(vObj.ID)));
  frm.GrfNode(vCurNode, GrfFrmNote);
  // добавляем общие реквизиты
  Met := Config.MetaData.TaskDef.Childs[15];
  if Met.Count <> 0 then
  begin
    vNode := List.Items.AddChildObject(vNodeObj, 'Общие реквизиты', nil);
    frm.GrfNode(vNode, GrfObRecs);
    for i := 0 to Met.Count - 1 do
    begin
      InsertObRec(vNode, Met.item[i], 15, Met.item[i].ID);
    end;
  end;
  // добавляем реквизиты шапки
  if vObj.childs['РеквизитШапки'].count <> 0 then
  begin
    vNode := List.Items.AddChildObject(vNodeObj, 'Шапка', nil);
    frm.GrfNode(vNode, GrfDocFldHdr);
    for f := 0 to vObj.childs['РеквизитШапки'].count - 1 do
    begin
      vCurNode := List.Items.AddChildObject(
        vNode,
        GetMetView(vObj.childs['РеквизитШапки'].item[f]),
        frm.CreateData(vObj.childs['РеквизитШапки'].item[f], iType,
        iKind, iRecForm, '-')
        );
      frm.GrfNode(vCurNode, GrfElement);
    end;
  end;
  // добавляем рек. таб. части
  if vObj.childs['РеквизитТабличнойЧасти'].count <> 0 then
  begin
    vNode := List.Items.AddChildObject(vNodeObj, 'Таблица', nil);
    frm.GrfNode(vNode, GrfDocFldDtl);
    for f := 0 to vObj.childs['РеквизитТабличнойЧасти'].count - 1 do
    begin
      vCurNode := List.Items.AddChildObject(
        vNode,
        GetMetView(vObj.childs['РеквизитТабличнойЧасти'].item[f]),
        frm.CreateData(vObj.childs['РеквизитТабличнойЧасти'].item[f],
        iType, iKind, iRecForm, '-')
        );
      GrfNode(vCurNode, GrfElement);
    end;
  end;

  vVS := vObj.Props[18];
  t := TStringList.create; //создаём класс
  vVS := stringReplace(vVS, 'Документ.', '', [rfReplaceAll]);
  t.text := stringReplace(vVS, ',', #13#10, [rfReplaceAll]);
  if T.Count > 0 then
  begin
    // добавляем Документы вводимые на основании
    vNode := List.Items.AddChildObject(vNodeObj,
      'Вводимые на основании', nil);
    GrfNode(vNode, GrfDocFldChild);
    for k := 0 to T.Count - 1 do
    begin
      vCurNode := List.Items.AddChildObject(
        vNode, T[k],
        frm.CreateData(Config.MetaData.TaskDef.Childs[2].item[T[k]],
        iType, Config.MetaData.TaskDef.Childs[2].item[T[k]].ID, iObj,
        '-')
        );
      GrfNode(vCurNode, GrfElement);
    end;
  end;
  InsertExtPrnFrms(vNodeObj, vObj.FullName);
  if vObj.Props[3] <> '' then
  begin
    vVS := StringReplace(vObj.Props[3], '[Журнал.', '', [rfReplaceAll]);
    vVS := Trim(StringReplace(vVS, ']', '', [rfReplaceAll]));
    vObj := Config.MetaData.TaskDef.Childs[3].item[vVS];
    InsertJournal(vNodeObj, vObj, 3, vObj.ID, 0);
  end;
end;
//------------------------------------------------------------------------------

procedure TMDTree.InsertEnum(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
  iKind: Integer; pFull: integer = 0);
var
  vNodeObj, vCurNode: TTreeNode;
  f: Integer;
begin
  if pFull = 0 then
  begin
    vNodeObj := List.Items.AddChildObject(
      vNodePr,
      GetMetView(vObj),
      frm.CreateData(vObj, iType, iKind, iObj, '-')
      );
    GrfNode(vNodeObj, GrfEnum);
    List.Items.AddChildObject(vNodeObj, '(system)', nil);
    Exit;
  end
  else
  begin
    if vNodePr.getFirstChild.Text = '(system)' then
    begin
      vNodePr.DeleteChildren;
    end
    else
    begin
      exit;
    end;
    vNodeObj := vNodePr;
  end;

  for f := 0 to vObj.childs[0].count - 1 do
  begin
    vCurNode := List.Items.AddChildObject(
      vNodeObj,
      GetMetView(vObj.childs[0].item[f]),
      frm.CreateData(vObj.childs[0].item[f], iType, iKind, iRecForm,
      '-')
      );
    GrfNode(vCurNode, GrfElement);
  end;
end;

//------------------------------------------------------------------------------

procedure TMDTree.InsertJournal(vNodePr: TTreeNode; vObj: IMetaDataObj; iType,
  iKind: Integer; pFull: Integer = 0);
var
  vNodeObj, vNode, vCurNode: TTreeNode;
  f: Integer;
  vViewName: string;
begin
  if pFull = 0 then
  begin
    vNodeObj := List.Items.AddChildObject(
      vNodePr,
      GetMetView(vObj),
      frm.CreateData(vObj, iType, iKind, iObj, '-')
      );
    GrfNode(vNodeObj, GrfJrn);
    List.Items.AddChildObject(vNodeObj, '(system)', nil);
    Exit;
  end
  else
  begin
    if vNodePr.getFirstChild.Text = '(system)' then
    begin
      vNodePr.DeleteChildren;
    end
    else
    begin
      exit;
    end;
    vNodeObj := vNodePr;
  end;

  if vObj.childs[0].count <> 0 then
  begin
    vNode := List.Items.AddChildObject(vNodeObj, 'Реквизиты', nil);
    GrfNode(vNode, GrfFldr);
    for f := 0 to vObj.childs[0].count - 1 do
    begin
      vCurNode := List.Items.AddChildObject(
        vNode,
        GetMetView(vObj.childs[0].item[f]),
        frm.CreateData(vObj.childs[0].item[f], iType, iKind, iRecForm,
        '-')
        );
      GrfNode(vCurNode, GrfElement);
    end;
  end;
  if vObj.childs[1].count <> 0 then
  begin
    vNode := List.Items.AddChildObject(vNodeObj, 'Формы списка', nil);
    GrfNode(vNode, GrfFldr);
    for f := 0 to vObj.childs[1].count - 1 do
    begin
      vViewName := 'Журнал.' + vObj.Name + '.Форма.' +
        vObj.childs[1].item[f].Name;
      vCurNode := List.Items.AddChildObject(
        vNode,
        vObj.childs[1].item[f].Name,
        frm.CreateData(vObj.childs[1].item[f], iType, iKind, iDocForm,
        vViewName));
      CheckUnloadDialogModule(vViewName, vCurNode, GrfFrmEdit);
    end;
  end;
  vCurNode := List.Items.AddChildObject(
    vNodeObj,
    'Описание',
    frm.CreateData(vObj, iType, iKind, iDocForm, 'Описание.' + IntTOStr(vObj.id))
    );
  frm.GrfNode(vCurNode, GrfFrmNote);
end;
//------------------------------------------------------------------------------

procedure TMDTree.InsertMDObjInTree(vKindStr, vTypeStr: string);
var
  f: Integer;
  vNode, vNodeObj, vCurNode: TTreeNode;
  vObj: IMetaDataObj;
  iKind, iType: Integer;
  vViewName: string;
  lQ: TADOQuery;
  lErMDName: string;
begin
  iKind := StrToInt(vKindStr);
  iType := StrToInt(vTypeStr);
  vObj := frm.GetObjByID(iKind, iType);

  if vObj = nil then
  begin
    lQ := frm.RunSQL(nil, 'select MDObjName from MDStruct where ConfigID=' +
      IntToStr(frm.CurCfg) + ' and SubconfigID=' + IntToStr(frm.CurSubCfg) +
      ' and MDObjID=' + IntToStr(iKind));
    if not lQ.IsEmpty then
    begin
      lQ.First;
      lErMDName := lQ.Fields[0].AsString;
    end
    else
    begin
      lErMDName := 'Не найден идентификатор в БД';
    end;
    vCurNode := List.Items.AddChildObject(
      vErNode,
      Config.MetaData.TaskDef.Childs.Name[iType, true] + ' - ' + lErMDName +
      ' - ' +
      IntToStr(iKind),
      Pointer(iKind)
      );
    frm.GrfNode(vCurNode, 69);
    iType := 999;
  end;

  case iType of
    0:
      begin // константы
        vCurNode := List.Items.AddChildObject(
          vNodeConsts,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        if vObj.Props[9] = '0' then
          frm.GrfNode(vCurNode, GrfConst);
        if vObj.Props[9] = '1' then
          frm.GrfNode(vCurNode, GrfConstPeriod);

      end;
    1:
      begin // справочники
        InsertReference(vNodeRefs, vObj, iType, iKind);
      end;
    2:
      begin // документы
        InsertDocument(vNodeDocs, vObj, iType, iKind);
      end;
    3:
      begin // журналы
        InsertJournal(vNodeJournals, vObj, iType, iKind);
      end;
    4:
      begin // перечисления
        InsertEnum(vNodeEnums, vObj, iType, iKind);
      end;
    5:
      begin // отчеты
        vViewName := 'Отчет.' + vObj.Name + '.Форма';
        vNodeObj := List.Items.AddChildObject(
          vNodeReps,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, vViewName));
        CheckUnloadDialogModule(vViewName, vNodeObj, GrfRep);
      end;
    6:
      begin //vNodeCalcVars - Обработка
        vViewName := 'Обработка.' + vObj.Name + '.Форма';
        vNodeObj := List.Items.AddChildObject(
          vNodeCalcVars,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, vViewName));
        CheckUnloadDialogModule(vViewName, vNodeObj, GrfCalcVar);
      end;
    7:
      begin //vNodeRegs - Регистр
        vNodeObj := List.Items.AddChildObject(
          vNodeRegs,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfReg);
        vNode := List.Items.AddChildObject(vNodeObj, 'Измерения', nil);
        GrfNode(vNode, GrfRegIzm);
        for f := 0 to vObj.childs[0].count - 1 do
        begin
          vCurNode := List.Items.AddChildObject(
            vNode,
            GetMetView(vObj.childs[0].item[f]),
            frm.CreateData(vObj.childs[0].item[f], iType, iKind, iRecForm,
            '-')
            );
          GrfNode(vCurNode, GrfElement);
        end;
        vNode := List.Items.AddChildObject(vNodeObj, 'Ресурсы', nil);
        GrfNode(vNode, GrfRegRess);
        for f := 0 to vObj.childs[1].count - 1 do
        begin
          vCurNode := List.Items.AddChildObject(
            vNode,
            GetMetView(vObj.childs[1].item[f]),
            frm.CreateData(vObj.childs[1].item[f], iType, iKind, iRecForm,
            '-')
            );
          GrfNode(vCurNode, GrfElement);
        end;
        vNode := List.Items.AddChildObject(vNodeObj, 'Реквизиты', nil);
        GrfNode(vNode, GrfRegRecs);
        for f := 0 to vObj.childs[2].count - 1 do
        begin
          vCurNode := List.Items.AddChildObject(
            vNode,
            GetMetView(vObj.childs[2].item[f]),
            frm.CreateData(vObj.childs[2].item[f], iType, iKind, iRecForm, '-')
            );
          GrfNode(vCurNode, GrfElement);
        end;
      end;
    8:
      begin //vNodeCalndars; - календари
        vNodeObj := List.Items.AddChildObject(
          vNodeCalndars,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfCalndar);
      end;
    9:
      begin //vNodeKindCalcs;
        vNodeObj := List.Items.AddChildObject(
          vNodeKindCalcs,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfKindCalc);
        vViewName := 'ВидРасчета.' + vObj.Name + '.Форма';
        vCurNode := List.Items.AddChildObject(vNodeObj, 'Модуль',
          frm.CreateData(vObj, iType, iKind, iDocForm, vViewName));
        CheckUnloadDialogModule(vViewName, vCurNode, GrfKindCalc);
        vCurNode := List.Items.AddChildObject(vNodeObj, 'Описание',
          frm.CreateData(vObj, iType, iKind, iDocForm, 'Описание.' +
          IntToStr(vObj.ID)));
        GrfNode(vCurNode, GrfFrmNote);
      end;
    10:
      begin //vNodeGprCalcs; - группы расчетов
        vNodeObj := List.Items.AddChildObject(
          vNodeGprCalcs,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfGrpCalc);
      end;
    11:
      begin //vNodeCJ;
        vNodeObj := List.Items.AddChildObject(
          vNodeCJ,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfCJ);
        if vObj.childs[1].count <> 0 then
        begin
          vNode := List.Items.AddChildObject(vNodeObj, 'Формы списка', nil);
          GrfNode(vNode, GrfFldr);

          for f := 0 to vObj.childs[1].count - 1 do
          begin
            vViewName := 'ЖурналРасчетов.' + vObj.Name + '.Форма.' +
              vObj.childs[1].item[f].Name;
            vCurNode := List.Items.AddChildObject(
              vNode,
              vObj.childs[1].item[f].Name,
              frm.CreateData(vObj.childs[1].item[f], iType, iKind, iDocForm,
              vViewName));
            CheckUnloadDialogModule(vViewName, vCurNode, GrfFrmEdit);
          end;
        end;
      end;
    12:
      begin //vNodeNums;
        vNodeObj := List.Items.AddChildObject(
          vNodeNums,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    13:
      begin //vNodePosled;
        vNodeObj := List.Items.AddChildObject(
          vNodePosled,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    14:
      begin //vNodeGrfOtb;
        vNodeObj := List.Items.AddChildObject(
          vNodeGrfOtb,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    15:
      begin //vNodeObrec;
        vNodeObj := List.Items.AddChildObject(
          vNodeObrec,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    16:
      begin //vNodeRulesCalc;
        vNodeObj := List.Items.AddChildObject(
          vNodeRulesCalc,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    17:
      begin //vNodeAccLists;
        vNodeObj := List.Items.AddChildObject(
          vNodeAccLists,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, 'ПланСчетов.ФормаСписка.'
          + vObj.Name + '.Форма')
          );
        CheckUnloadDialogModule(vViewName, vNodeObj, GrfFrmEdit);
      end;
    18:
      begin //vNodeSubcnts;
        vNodeObj := List.Items.AddChildObject(
          vNodeSubcnts,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfSubcnt);
      end;
    19:
      begin //vNodeRecAccLst;
        vNodeObj := List.Items.AddChildObject(
          vNodeRecAccLst,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iObj, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    20:
      begin //vNodeFrmAcclSt;
        vNodeObj := List.Items.AddChildObject(
          vNodeFrmAcclSt,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iRecForm, '-')
          );
        GrfNode(vNodeObj, GrfFrmList);
      end;
    21:
      begin //vNodeRecOper;
        vNodeObj := List.Items.AddChildObject(
          vNodeRecOper,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iRecForm, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    22:
      begin //vNodeFrmJO;
        vNodeObj := List.Items.AddChildObject(
          vNodeFrmJO,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iRecForm, '-')
          );
        CheckUnloadDialogModule(vViewName, vNodeObj, GrfFrmList);
      end;
    23:
      begin //vNodeGrfJO;
        vNodeObj := List.Items.AddChildObject(
          vNodeGrfJO,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iRecForm, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    24:
      begin //vNodeRecProv;
        vNodeObj := List.Items.AddChildObject(
          vNodeRecProv,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iRecForm, '-')
          );
        GrfNode(vNodeObj, GrfElement);
      end;
    25:
      begin //vNodeFrmPorv;
        vNodeObj := List.Items.AddChildObject(
          vNodeFrmPorv,
          GetMetView(vObj),
          frm.CreateData(vObj, iType, iKind, iRecForm, '-')
          );
        GrfNode(vNodeObj, GrfFrmList);
      end;
  end;

end;
//------------------------------------------------------------------------------

function TMDTree.InsertExtFrms(vSubSystems: string): TTreeNode;
var
  vSQLText: string;
  Q: TADOQuery;
  vTreeTmp: TTreeView;
  vCurNode, vNode: TTreeNode;
  MyExtPtr: PMyRec;
  lDir, vMask, vMaskfalse, lFilePath: string;
begin
  vSQLText := 'select DISTINCT ef.Path, ef.name, ef.mask, ef.maskFalse, ef.isfolder'
    + ' from SubSystemsExtFiles ef';
  if vSubSystems <> '' then
    vSQLText := vSQLText +
      ' LEFT JOIN SubSystemsExtFilesObjects efo ON ef.ID = efo.ExtRecID'
      + ' WHERE (efo.subsystemID In (' + vSubSystems + '))';
  //      + ' OR (ef.ID Not In (select ExtRecId from SubSystemsExtFilesObjects))';
  vSQLText := vSQLText + ' Order By Path';

  Q := frm.RunSQL(nil, vSQLText, 0);
  //List.Items.BeginUpdate();
  vTreeTmp := List;
  vTreeTmp.Items.Clear;
  vTreeTmp.SortType := stNone;
  vCurNode := vTreeTmp.Items.AddObject(nil, 'Внешние формы', nil);
  GrfNode(vCurNode, 53);
  while not Q.Eof do
  begin
    try
      New(MyExtPtr);
      if Q.FieldByName('IsFolder').AsBoolean then
      begin
        vDir := IncludeTrailingBackslash(Q.FieldByName('Path').asString);
        // заменять только первый символ
        // т.к. в названии папки данный символ допустим
        if Copy(vDir, 0, 1) = '@' then
          vDir := Config.IBDir + Copy(vDir, 2, Length(vDir));
        // если такого пути нет переходим к след.записи.
        if DirectoryExists(vDir) then
        begin

          MyExtPtr.FolderName := IncludeTrailingBackslash(vDir);
          MyExtPtr.FileName := Q.FieldByName('Name').asString;
          MyExtPtr.ISFolder := 1;
          MyExtPtr.fext := '';
          MyExtPtr.MDObj := nil;
          vMask := Q.FieldByName('Mask').AsString;
          vMaskFalse := Q.FieldByName('MaskFalse').AsString;
          vNode := vTreeTmp.Items.AddChildObject(vCurNode,
            Q.FieldByName('Name').asString, MyExtPtr);
          GrfNode(vNode, GrfFldr);
          // вызываем лишь если запись ссылается на папку
          AddFilesInTree(
            vTreeTmp,
            vNode,
            vDir,
            vMask,
            vMaskFalse
            );
        end;
      end
      else
      begin
        lFilePath := Q.FieldByName('Path').asString;
        if Copy(lFilePath, 0, 1) = '@' then
          lFilePath := Config.IBDir + Copy(lFilePath, 2, Length(lFilePath));
        // если файла нет идем к след.записи
        if FileExists(lFilePath) then
        begin
          lDir := IncludeTrailingBackslash(ExtractFileDir(lFilePath));
          InsertFileInTree(vCurNode, lDir, ExtractFileName(lFilePath),
            ExtractFileExt(ExtractFileName(lFilePath)));
        end;
      end;
    except
      // ничего не выводим
    end;
    Q.Next;
  end;
  vTreeTmp.SortType := stData;
  vTreeTmp.SortType := stNone;
  Result := vCurNode;
end;
//------------------------------------------------------------------------------

function TMDTree.InsertExtPrnFrms(pNode: TTreeNode; vName: string): Boolean;
var
  i: Integer;
  lFldr: TTreeNode;
  lItem: TListItem;
begin
  if mListExtPrnFrms = nil then
  begin
    Result := False;
    Exit;
  end;
  lFldr := nil;
  for i := 0 to mListExtPrnFrms.Items.Count - 1 do
  begin
    lItem := mListExtPrnFrms.Items.Item[i];
    if lItem.Caption = vName then
    begin
      if lFldr = nil then
      begin
        lFldr := List.Items.AddChild(pNode, 'Печатные формы');
        frm.GrfNode(lFldr, GrfDocExtFrmFld);
      end;
      InsertFileInTree(lFldr, lItem.SubItems[0], lItem.SubItems[1], '.ert');
      //Exit;
    end;
  end;
  Result := True;
end;
//------------------------------------------------------------------------------

function TMDTree.GetExtPrnlist(): Boolean;
var
  FName: string;
  lFlName: string;
  F: TextFile;
  S: string;
  LItem: TListItem;
  FileAttrs: Integer;
  sr: TSearchRec;
  lExt: string;
  t: TStringList;
  I: Integer;
begin
  mListExtPrnFrms := TListView.Create(nil);
  mListExtPrnFrms.Parent := frm;
  mListExtPrnFrms.Items.BeginUpdate;
  mListExtPrnFrms.Visible := False;
  mListExtPrnFrms.SortType := stNone;
  FileAttrs := faAnyFile;
  if FindFirst(Config.IBDir + 'ExtForms\PrnForms\*.efd', FileAttrs, sr) = 0 then
  begin
    repeat
      if (sr.Attr and FileAttrs) = sr.Attr then
      begin
        lExt := LowerCase(ExtractFileExt(sr.Name));
        lFlName := StringReplace(sr.Name, lExt, '', [rfIgnoreCase]);
        FName := (Config.IBDir + 'ExtForms\PrnForms\' + lFlName + '.ert');
        if FileExists(FName) then
        begin
          AssignFile(F, Config.IBDir + 'ExtForms\PrnForms\' + sr.Name);
          Reset(F);
          Readln(F, S);
          S := stringReplace(S, ' ', '', [rfReplaceAll]);
          S := stringReplace(S, 'Объект="', '', [rfReplaceAll]);
          S := stringReplace(S, '"', '', [rfReplaceAll]);

          t := TStringList.create; //создаём класс
          t.text := stringReplace(S, ',', #13#10, [rfReplaceAll]);
          for i := 0 to T.Count - 1 do
          begin
            LItem := mListExtPrnFrms.Items.Add;
            LItem.Caption := Trim(T[i]);
            LItem.SubItems.Insert(0, ExtractFileDir(FName) + '\');
            LItem.SubItems.Insert(1, ExtractFileName(FName));
          end;
          CloseFile(F);
        end;
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  Result := True;
end;

//------------------------------------------------------------------------------

procedure TMDTree.Fill;
var
  j, i: Integer;
  vNode, vNodeObj, vCurNode: TTreeNode;
  Q: TADOQuery;
  vObj, vObj2: IMetaDataObj;
  vSubSystems, vObjTypes: string;
  iKind, iType: Integer;

  Tbs: Variant;
  Met: IMetaDataObjArray;
  //  PStr: string;
  //  MyExtPtr: PMyRec;
  //  vTreeTmpSave: TTreeView;
  //  vVS: string;
  //  t: TStringList;
  //  k: Integer;
  //  vMask: Variant;
  //  vMaskFalse: Variant;
  vListSort: TListView;
  LItem: TListItem;
  vIdx: integer;
  //  vImg: integer;
  vAvSS: TAvailableSubSystems;
  vObCls: TObjectClasses;
  //  vViewName: string;
  //  vSCID: Integer;
  //  vDir: string;
  //  vDirUnCh: string;
  lEFNode: TTreeNode;
  lCol: TColumnItem;
  lList: TTreeList;
begin
  try

    lList := frm.TreeViewMetadata;
    lList.Columns.Clear;

    lCol := lList.Columns.Add;
    lCol.Header := 'Идентификатор';
    lCol.Image := True;
    lCol.Width := 1000;
    if frm.MDTreeViewMode = 0 then
    begin
      //lCol.Width := 150;

      case frm.ComboBoxView.ItemIndex of
        0: lCol.Width := 500;
        1:
          begin
            lCol.Width := 250;
            lCol := lList.Columns.Add;
            lCol.Header := 'Синоним';
            lCol.Width := 150;
          end;

        2:
          begin
            lCol.Width := 250;
            lCol := lList.Columns.Add;
            lCol.Header := 'ИД';
            lCol.Width := 50;
          end;

        3:
          begin
            lCol.Width := 250;
            lCol := lList.Columns.Add;
            lCol.Header := 'Синоним';
            lCol.Width := 150;

            lCol := lList.Columns.Add;
            lCol.Header := 'ИД';
            lCol.Width := 50;
          end;
      end;
    end;
    GetTurboMDLinks();
    GetExtPrnlist();
    frm.vBookmarks.Clear;
    //****************************************************************************
    // получаем список используемых подсистем
    vAvSS := TAvailableSubSystems.CreateObj(frm, frm.ListViewSubSystems);
    vSubSystems := vAvSS.GetSelectedSubSystemsID;
    //****************************************************************************
    // получаем список используемых объектов конфигурации
    vObCls := TObjectClasses.CreateObj(frm, frm.ListViewObj);
    vObjTypes := vObCls.GetObjClasses;
    //****************************************************************************
    if vObjTypes = '' then
    begin
      //frm.Echo('Выберите хотя бы 1 объект для отображения');
      exit;
    end;
    List.Items.BeginUpdate();
    List.Items.Clear;

    lEFNode := InsertExtFrms(vSubSystems);

    // создаем обшие ветки
    vNodeObj := List.Items.AddObject(nil, 'Конфигурация', nil);
    frm.GrfNode(vNodeObj, 58);
    vCurNode := List.Items.AddChildObject(
      vNodeObj,
      'Глобальный модуль',
      frm.CreateData(nil, iType, iKind, iDocForm, 'ГлобальныйМодуль')
      );
    frm.GrfNode(vCurNode, GrfFrmModule);

    vNode := List.Items.AddChildObject(vNodeObj, 'Общие таблицы', nil);
    frm.GrfNode(vNode, GrfFldr);
    Tbs := Config.Documents['Общие Таблицы'];
    for i := 0 to Tbs.CountPages - 1 do
    begin
      vCurNode := List.Items.AddChildObject(
        vNode,
        Tbs.NamePage[i],
        frm.CreateData(nil, iType, iKind, iDocForm, 'Общие таблицы.' +
        Tbs.NamePage[i])
        );
      frm.GrfNode(vCurNode, 9);
    end;

    //***********
    // создаем ветку для хранения ошибок
    vErNode := List.Items.AddChildObject(
      nil,
      'Не найденные ИД в МД',
      nil
      );
    frm.GrfNode(vErNode, 3);

    frm.CreateNodes();

    if vSubSystems <> '' then
    begin
      //****************************************************************************
      // заполнение дерева конфигурации
      Q := frm.RunSQL(
        nil,
        'select DISTINCT ObjKind, ObjType from SubSystemObjects'
        + ' where (SubSystemID in (' + vSubSystems + '))'
        + ' and (ObjType in (' + vObjTypes + '))'
        + ' Order By ObjType'
        , 0);

      Q.First;
      vListSort := TListView.Create(nil);
      vListSort.Parent := frm;
      vListSort.Items.BeginUpdate;
      vListSort.Visible := False;
      vListSort.SortType := stNone;
      while not Q.Eof do
      begin

        iKind := Q.FieldByName('ObjKind').AsInteger;
        iType := Q.FieldByName('ObjType').AsInteger;
        vObj := frm.GetObjByID(iKind, iType);

        LItem := vListSort.Items.Add;
        if vObj <> nil then
        begin
          LItem.Caption := vObj.FullName;
        end;
        LItem.SubItems.Insert(0, IntToStr(iType));
        LItem.SubItems.Insert(1, IntToStr(iKind));

        Q.Next;
      end;
      vListSort.SortType := stText;
      vListSort.Items.EndUpdate;

      for vIdx := 0 to vListSort.Items.Count - 1 do
      begin

        InsertMDObjInTree(vListSort.Items.Item[vIdx].SubItems[1],
          vListSort.Items.Item[vIdx].SubItems[0]);
      end;
    end
    else
    begin
      // перебираем типы метаданных.
      for j := 0 to frm.FConfigurator.MetaData.TaskDef.Childs.Count - 2 do
      begin

        Met := frm.FConfigurator.MetaData.TaskDef.Childs[j];
        if Met.Count <> 0 then
          for i := 0 to Met.Count - 1 do
          begin
            vObj2 := Met.item[i];
            if vObj2 <> nil then
              InsertMDObjInTree(IntToStr(vObj2.ID), IntToStr(j));
          end;

      end;

    end;
  finally
    // del not using nodes
    if vNodeConsts.Count = 0 then
      vNodeConsts.Delete;
    if vNodeRefs.Count = 0 then
      vNodeRefs.Delete;

    if vNodeNums.Count = 0 then
      vNodeNums.Delete;
    if vNodePosled.Count = 0 then
      vNodePosled.Delete;
    if vNodeObRec.Count = 0 then
      vNodeObRec.Delete;
    if vNodeDocs.Count = 0 then
      vNodeDocs.Delete;

    if vNodeGrfOtb.Count = 0 then
      vNodeGrfOtb.Delete;
    if vNodeJournals.Count = 0 then
      vNodeJournals.Delete;

    if vNodeEnums.Count = 0 then
      vNodeEnums.Delete;
    if vNodeReps.Count = 0 then
      vNodeReps.Delete;
    if vNodeCalndars.Count = 0 then
      vNodeCalndars.Delete;

    if vNodeRulesCalc.Count = 0 then
      vNodeRulesCalc.Delete;
    if vNodeKindCalcs.Count = 0 then
      vNodeKindCalcs.Delete;

    if vNodeGprCalcs.Count = 0 then
      vNodeGprCalcs.Delete;
    if vNodeCJ.Count = 0 then
      vNodeCJ.Delete;

    if vNodeRecAccLst.Count = 0 then
      vNodeRecAccLst.Delete;
    if vNodeFrmAcclSt.Count = 0 then
      vNodeFrmAcclSt.Delete;
    if vNodeAccLists.Count = 0 then
      vNodeAccLists.Delete;

    if vNodeSubcnts.Count = 0 then
      vNodeSubcnts.Delete;
    if vNodeRegs.Count = 0 then
      vNodeRegs.Delete;
    if vNodeCalcVars.Count = 0 then
      vNodeCalcVars.Delete;

    if vNodeRecOper.Count = 0 then
      vNodeRecOper.Delete;
    if vNodeRecProv.Count = 0 then
      vNodeRecProv.Delete;
    if vNodeGrfJO.Count = 0 then
      vNodeGrfJO.Delete;
    if vNodeFrmJO.Count = 0 then
      vNodeFrmJO.Delete;
    if vNodeFrmPorv.Count = 0 then
      vNodeFrmPorv.Delete;
    if vNodeOperation.Count = 0 then
      vNodeOperation.Delete;
    if vErNode.Count = 0 then
      vErNode.Delete;

    if vErNode.Deleting = True then
    begin
      frm.btnDelErrors.Enabled := False;
      frm.btnDelCurrentError.Enabled := False;
    end
    else
    begin
      frm.btnDelErrors.Enabled := True;
      frm.btnDelCurrentError.Enabled := true;
    end;

    List.Items.EndUpdate();
    //vTreeTmp.Items.Item[0]
    lEFNode.MoveTo(nil, naAdd);
    //List.Items.EndUpdate();
  end;
end;
//------------------------------------------------------------------------------

procedure TMDTree.TreeInFile;
var
  vSDlg: TSaveDialog;
begin
  vSDlg := TSaveDialog.Create(nil);
  if vSDlg.Execute then
  begin
    List.SaveToFile(vSDlg.FileName);
  end;
end;

procedure TMDTree.DeleteAllErros;
var
  //  Met: IMetaDataObjArray;
  //  i: Integer;
  CurItem: TTreeNode;
begin
  if List.Items.Count = 0 then
    Exit;
  if MessageDlg('Удалить не найденные объекты?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CurItem := vErNode.getFirstChild;
    while CurItem <> nil do
    begin
      frm.RunSQL(nil, 'Delete from SubSystemObjects where ObjKind = ' +
        IntToStr(Integer(CurItem.data)), 1);
      CurItem := CurItem.GetNextChild(CurItem);
    end;
    vErNode.Delete;
    frm.btnDelErrors.Enabled := False;
  end;
end;

procedure TMDTree.DeleteCurrentError;
var
  //  Met: IMetaDataObjArray;
  //  i: Integer;
  CurItem: TTreeNode;
begin
  if List.Items.Count = 0 then
    Exit;
  CurItem := List.Selected;
  if CurItem = nil then
    exit;
  if MessageDlg('Удалить не найденный объект?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CurItem := List.Selected;
    if CurItem.Parent = vErNode then
    begin
      frm.RunSQL(nil, 'Delete from SubSystemObjects where ObjKind = ' +
        IntToStr(Integer(CurItem.data)), 1);
      CurItem.Delete;
      frm.btnDelErrors.Enabled := vErNode.HasChildren;
      frm.btnDelCurrentError.Enabled := vErNode.HasChildren;
      if vErNode.HasChildren = false then
      begin
        vErNode.Delete;
      end;
    end;
  end;
end;

function TMDTree.GetTypeViewIndex: SYSINT;
begin
  Result := frm.ComboBoxView.ItemIndex;
end;

procedure TMDTree.SetTypeViewIndex(Ind: SYSINT);
begin
  frm.ComboBoxView.ItemIndex := Ind;
end;

function TMDTree.GetNodeClass: SYSINT;
begin
  Result := -1;
  if List.Selected = nil then
    exit;
  try
    Result := PMyRec(List.Selected.Data).DocType;
  except
    Result := -1;
  end;
end;

function TMDTree.GetCurrentMDObjFullName: WideString;
var
  vMDObj: IMetaDataObj;
begin
  Result := '';
  try
    if List.Selected <> nil then
    begin
      vMDObj := PMyRec(List.Selected.Data).MDObj;
      if vMDObj <> nil then
        Result := vMDObj.FullName;
    end;
  except
    Result := '';
  end;
end;

//------------------------------------------------------------------------------
// если ничего нет вернет 0

function TMDTree.GetCurrentMDObj: OleVariant;
var
  vNode: TTreeNode;
begin
  Result := varEmpty;
  try
    vNode := List.Selected;
    if PMyRec(vNode.Data).MDObj <> nil then
    begin
      Result := PMyRec(vNode.Data).MDObj;
    end
    else
      Result := varEmpty;
  except
    Result := varEmpty;
    //Echo('Ошибка при получении объекта');
  end;
end;

function TMDTree.ObjByCursor: IMetaDataObj;
var
  vNode: TTreeNode;
begin
  Result := nil;
  try
    vNode := List.Selected;
    if PMyRec(vNode.Data).MDObj <> nil then
    begin
      Result := PMyRec(vNode.Data).MDObj;
    end;
  except
    Result := nil;
    //Echo('Ошибка при получении объекта');
  end;
end;
//------------------------------------------------------------------------------

//function GetFileSize(FileName: string): Integer;
//var
//  FS: TFileStream;
//begin
//  try
//    FS := TFileStream.Create(Filename, fmOpenRead);
//  except
//    Result := -1;
//  end;
//  if Result <> -1 then
//    Result := FS.Size;
//
//  FS.Free;
//end;
//------------------------------------------------------------------------------

procedure TMDTree.GetMDNodeObjInfo;
var
  i: Integer;
  vObj: IMetaDataObj;
  vFileName: string;
begin
  try
    frm.ListViewIncludeSubSystems.Items.Clear;
    frm.PropsValueListEditor.Strings.Clear;
    frm.Memo1.Lines.Clear;

    frm.MetShowSubSystemsObjExecute(frm.MetShowSubSystemsObj);

    if List.Selected.Text = 'Конфигурация' then
      vObj := Config.MetaData.TaskDef
    else if PMyRec(List.Selected.data).FileName <> '' then
    begin
      vFileName := PMyRec(List.Selected.Data).FolderName +
        PMyRec(List.Selected.Data).FileName;
      frm.PropsValueListEditor.InsertRow('Каталог',
        PMyRec(List.Selected.Data).FolderName, true);
      frm.PropsValueListEditor.InsertRow('Имя',
        PMyRec(List.Selected.Data).FileName, true);
      frm.PropsValueListEditor.InsertRow('Расширение',
        PMyRec(List.Selected.Data).fext, true);
      frm.PropsValueListEditor.InsertRow('Дата изменения',
        DateTimeToStr(FileDateToDateTime(FileAge(vFileName))), true);
      frm.PropsValueListEditor.InsertRow('Размер',
        IntToStr(GetFileSize(vFileName)), true);
    end
    else
    begin
      vObj := PMyRec(List.Selected.data).MDObj;
      for i := 0 to vObj.Props.Count - 1 do
      begin
        frm.PropsValueListEditor.InsertRow(vObj.Props.Name[i, True],
          vObj.Props[i], true);
      end;
    end;
  except
    // ничего не выводим
  end;
end;

constructor TMDTree.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.TreeViewMetadata;
  Config := vConfig;
end;

destructor TMDTree.Destroy;
begin
end;

procedure TMDTree.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMDTreeEvents;
end;

procedure TMDTree.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

function TMDTree.ReternFileInfo(const ParamFile: WideString): WideString;
begin
  if PMyRec(list.Selected.Data).MDObj <> nil then
  begin
    Result := GetCurrentMDObjFullName;
  end
  else
  begin
    if AnsiLowerCase(ParamFile) = 'dir' then
      Result := PMyRec(list.Selected.Data).FolderName;
    if AnsiLowerCase(ParamFile) = 'name' then
      Result := PMyRec(list.Selected.Data).FileName;
    if AnsiLowerCase(ParamFile) = 'ext' then
      Result := PMyRec(list.Selected.Data).fext;
    if AnsiLowerCase(ParamFile) = 'isfolder' then
      Result := IntToStr(PMyRec(list.Selected.Data).IsFolder);
    //if AnsiLowerCase(ParamFile) = 'frommd' then
    //  Result := IntToStr(PMyRec(list.Selected.Data).FromMD);
    if AnsiLowerCase(ParamFile) = 'lastedit' then
      Result :=
        DateTimeToStr(FileDateToDateTime(FileAge(PMyRec(List.Selected.Data).FolderName + PMyRec(List.Selected.Data).FileName)));
    if AnsiLowerCase(ParamFile) = 'size' then
      Result := IntToStr(GetFileSize(PMyRec(List.Selected.Data).FolderName +
        PMyRec(List.Selected.Data).FileName))
  end;
end;

procedure TMDTree.GetObjectNote;
var
  vObjNote: TObjectNote;
  vMDObj: IMetaDataObj;
begin
  try
    if List.Selected <> nil then
    begin
      vMDObj := PMyRec(List.Selected.Data).MDObj;
      if vMDObj <> nil then
      begin
        vObjNote := TObjectNote.CreateObj(frm);
        frm.MemoNote.Text := vObjNote.GetNoteTextByID(ObjByCursor.ID);
      end;
    end;
  except
    //      on E: Exception do begin
    //        frm.Echo( 'Подсистемы: Получение описания объекта'#13#10 +
    //          'Возникло исключение:'#13#10 + E.Message
    //        );
    //      end;
  end;
end;

function TMDTree.ExpandType: SYSINT;
var
  vObj: IMetaDataObj;
  vKindStr: string;
  i: Integer;
  vMet: IMetaDataObjArray;
begin
  Result := 0;

  vObj := PMyRec(List.Selected.data).MDObj;

  if vObj.Props.Count < 4 then
    Exit;

  if Trim(vObj.Props[3]) = 'Справочник' then
  begin
    vKindStr := vObj.Props[4];
    vMet := Config.MetaData.TaskDef.Childs[1];
    for i := 0 to vMet.Count - 1 do
    begin
      if vMet.item[i].Name = vKindStr then
      begin
        //
        InsertReference(List.Selected, vMet.item[i], 1, vMet.item[i].ID);
        Result := 1;
        Exit;
      end;
    end;
  end;
  if Trim(vObj.Props[3]) = 'Документ' then
  begin
    vKindStr := vObj.Props[4];
    vMet := Config.MetaData.TaskDef.Childs[2];
    for i := 0 to vMet.Count - 1 do
    begin
      if vMet.item[i].Name = vKindStr then
      begin
        //InsertReference(List.Selected, vMet.item[i], 1, vMet.item[i].ID);
        InsertDocument(List.Selected, vMet.item[i], 1, vMet.item[i].ID);
        Result := 1;
        Exit;
      end;
    end;
  end;
  if Trim(vObj.Props[3]) = 'Перечисление' then
  begin
    vKindStr := vObj.Props[4];
    vMet := Config.MetaData.TaskDef.Childs[4];
    for i := 0 to vMet.Count - 1 do
    begin
      if vMet.item[i].Name = vKindStr then
      begin
        //InsertReference(List.Selected, vMet.item[i], 1, vMet.item[i].ID);
        InsertEnum(List.Selected, vMet.item[i], 1, vMet.item[i].ID);
        Result := 1;
        Exit;
      end;
    end;
  end;

end;

//------------------------------------------------------------------------------

function Like(AString, Pattern: string): boolean;
var
  i, n, n1, n2: integer;
  p1, p2: pchar;
label
  match, nomatch;
begin
  AString := UpperCase(AString);
  Pattern := UpperCase(Pattern);
  n1 := Length(AString);
  n2 := Length(Pattern);
  if n1 < n2 then
    n := n1
  else
    n := n2;
  p1 := pchar(AString);
  p2 := pchar(Pattern);
  for i := 1 to n do
  begin
    if p2^ = '*' then
      goto match;
    if (p2^ <> '?') and (p2^ <> p1^) then
      goto nomatch;
    inc(p1);
    inc(p2);
  end;
  if n1 > n2 then
  begin
    nomatch:
    Result := False;
    exit;
  end
  else if n1 < n2 then
  begin
    for i := n1 + 1 to n2 do
    begin
      if not (p2^ in ['*', '?']) then
        goto nomatch;
      inc(p2);
    end;
  end;
  match:
  Result := True;
end;
//------------------------------------------------------------------------------

function MatchesSpec(const FileName, Specification: string): boolean;
var
  SName, SExt, FName, FExt: string;
begin
  FName := ExtractFileName(FileName);
  SName := ExtractFileName(Specification);
  FExt := ExtractFileExt(FName);
  SExt := ExtractFileExt(SName);
  SetLength(FName, Length(FName) - Length(FExt));
  SetLength(SName, Length(SName) - Length(SExt));
  if SName = '' then
    SName := '*';
  if SExt = '' then
    SExt := '.*';
  if FExt = '' then
    FExt := '.';
  Result := Like(FName, SName) and Like(FExt, SExt);
end;
//------------------------------------------------------------------------------

function MatchesMask(Name: string; Mask: string): Boolean;
var
  t: TStringList;
  I: Integer;
begin
  t := TStringList.create; //создаём класс
  t.text := stringReplace(Mask, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    if MatchesSpec(Name, T[i]) then
    begin
      Result := True;
      exit;
    end;
  end;
  Result := False;
end;
//------------------------------------------------------------------------------

function _GetParentNode(StartFolder: string; MyNode: TTreeNode): TTreeNode;
//var
//  i: Integer;
begin
  try
    if MyNode.Parent <> nil then
    begin
      if PMyRec(MyNode.Data).FolderName = StartFolder then
        Result := MyNode;
      if PMyRec(MyNode.Data).FolderName <> StartFolder then
        Result := _GetParentNode(StartFolder, MyNode.Parent);
    end
    else
      Result := MyNode;
  except
    // nothing
    Result := MyNode;
  end;
end;
//------------------------------------------------------------------------------

procedure SetImgOnfile(vNode: TTreeNode; vExt: string);
var
  vExtArc: string;
  vImgID: Integer;
begin
  vExtArc := '.zip,.rar,.arj,1.part*';
  vImgID := ImgOther;
  if Pos(vExt, vExtArc) > 0 then
    vImgID := ImgArc;
  if vExt = '.doc' then
    vImgID := ImgWord;
  if vExt = '.xls' then
    vImgID := ImgExl;
  if vExt = '.mdb' then
    vImgID := ImgAcs;
  if vExt = '.efd' then
    vImgID := ImgTxt;
  if vExt = '.txt' then
    vImgID := ImgTxt;
  if vExt = '.ert' then
    vImgID := ImgErt;
  if vExt = '.mxl' then
    vImgID := ImgMxl;
  if vExt = '.prm' then
    vImgID := ImgTxt;
  if vExt = '.md' then
    vImgID := ImgMD;
  if vExt = '.exe' then
    vImgID := ImgExe;
  vNode.ImageIndex := vImgID;
  vNode.SelectedIndex := vImgID;
end;
//------------------------------------------------------------------------------

function TMDTree.InsertFileInTree(pParent: TTreeNode; pFolderName, pFileName,
  pFExt: string): Boolean;
var
  TD: PMyRec;
begin
  New(TD);
  TD.FolderName := pFolderName;
  TD.FileName := pFileName;
  TD.ISFolder := 0;
  TD.fext := pFExt;
  SetImgOnfile(List.Items.AddChildObject(pParent, pFileName, TD), pFExt);
end;

//------------------------------------------------------------------------------

procedure TMDTree.AddFilesInTree(
  vTree: TTreeView;
  vParentNodeGrp: TTreeNode;
  StartFolder, Mask, MaskFalse: string;
  ScanSubFolders: Boolean = True
  );
var
  SearchRec: TSearchRec;
  FindResult: Integer;
  TD: PMyRec;
  vParent: TTreeNode;
  //  vImgID: Integer;
  //  My: TTreeNode;
  vExt: string;
begin
  try
    StartFolder := IncludeTrailingBackslash(StartFolder);
    FindResult := FindFirst(StartFolder + '*.*', faAnyFile, SearchRec);
    try
      while FindResult = 0 do
        with SearchRec do
        begin

          if (Attr and faDirectory) <> 0 then
          begin
            if ScanSubFolders and (Name <> '.') and (Name <> '..') then
            begin
              if StartFolder = vDir then
              begin
                New(TD);
                TD.FolderName := StartFolder + Name + '\';
                TD.FileName := Name;
                TD.ISFolder := 1;
                TD.fext := '';

                AcNode1 := List.Items.AddChildObject(vParentNodeGrp, Name,
                  TD);
                AcNode := AcNode1;
                AcNode.ImageIndex := ImgFolder;
                AcNode.SelectedIndex := ImgFolder;
              end;
              if StartFolder <> vDir then
              begin
                New(TD);
                TD.FolderName := StartFolder + Name + '\';
                TD.FileName := Name;
                TD.ISFolder := 1;
                TD.fext := '';

                vParent := _GetParentNode(StartFolder, AcNode);
                AcNode1 := List.Items.AddChildObject(vParent, Name, TD);
                AcNode := AcNode1;
                AcNode.ImageIndex := ImgFolder;
                AcNode.SelectedIndex := ImgFolder;
              end;
              AddFilesInTree(vTree, vParentNodeGrp, StartFolder + Name, Mask,
                MaskFalse, ScanSubFolders);
            end
          end
          else
          begin // file
            if MatchesMask(Name, Mask) = True then
            begin
              if MatchesMask(Name, MaskFalse) = False then
              begin
                vExt := LowerCase(ExtractFileExt(Name));
                if StartFolder <> vDir then
                begin
                  //                  New(TD);
                  //                  TD.FolderName := StartFolder;
                  //                  TD.FileName := Name;
                  //                  TD.ISFolder := 0;
                  //                  TD.fext := vExt;
                  //
                  vParent := _GetParentNode(StartFolder, AcNode);
                  //                  My := List.Items.AddChildObject(vParent, Name, TD);
                  //                  SetImgOnfile(My, vExt);
                  InsertFileInTree(vParent, StartFolder, Name, vExt);
                end;

                if StartFolder = vDir then
                begin
                  //                  New(TD);
                  //                  TD.FolderName := StartFolder;
                  //                  TD.FileName := Name;
                  //                  TD.ISFolder := 0;
                  //                  TD.fext := vExt;
                  //
                  //                  My := List.Items.AddChildObject(vParentNodeGrp, Name, TD);
                  //                  SetImgOnfile(My, vExt);
                  InsertFileInTree(vParentNodeGrp, StartFolder, Name, vExt);
                end;
              end;
            end;
          end;
          FindResult := FindNext(SearchRec);
        end;
    finally
      FindClose(SearchRec);
    end;
  finally
    //List.EndUpdate;
  end;
end;

function TMDTree.GoToPathInExplorer(const vPath: WideString): SYSINT;
begin
  try
    Result := 1;
    if FileExists(vPath) = False then
    begin
      if DirectoryExists(vPath) then
//        frm.ShellTreeView1.Path := vPath
      else
        Result := 0;
    end
    else if FileExists(vPath) then
//      frm.ShellTreeView1.Path := vPath
    else
      Result := 0;
  except
    Result := 0;
  end;
end;
//
// переход к объекту МД по идентификатору, если переход осуществлен 1, иначе 0
///

function TMDTree.GoToObject(const pName: WideString): SYSINT;
var
  vMDObj: IMetaDataObj;
  i: integer;
begin
  if pName = '' then
  begin
    frm.Echo('Не задано имя объекта!');
    Result := 0;
    Exit;
  end;
  if List.Items.Count = 0 then
  begin
    frm.Echo('Дерево метаданных пусто!');
    Result := 0;
    Exit;
  end;

  for i := 0 to List.Items.Count - 1 do
  begin
    try
      if List.Items[i].ImageIndex <> GrfElement then
      begin
        vMDObj := PMyRec(List.Items[i].Data).MDObj;
        if vMDObj <> nil then
        begin
          if (pName = vMDObj.FullName) or (pName =
            PMyRec(List.Items[i].Data).OpenStr) then
          begin
            List.Items.Item[i].Selected := true;
            Result := 1;
            exit;
          end;
        end;
      end;
    except
      // может бтыь ошибка из-то разных типов объектов, хранимых в дереве.
    end;
  end;
  Result := 0;
end;

procedure TMDTree.FillData;
var
  Node: TTreeNode;
begin
  Node := List.Selected;

  if Node = nil then
    exit;

  if Assigned(Node.Data) then
  begin

    try

      if PMyRec(Node.Data).MDObj <> nil then
        //if Node.Level = 1 then
      begin
        try
          case PMyRec(Node.Data).ObjType of
            1: InsertReference(Node, PMyRec(Node.Data).MDObj,
                PMyRec(Node.Data).ObjType, PMyRec(Node.Data).ObjKind, 1);
            2: InsertDocument(Node, PMyRec(Node.Data).MDObj,
                PMyRec(Node.Data).ObjType, PMyRec(Node.Data).ObjKind, 1);
            3: InsertJournal(Node, PMyRec(Node.Data).MDObj,
                PMyRec(Node.Data).ObjType, PMyRec(Node.Data).ObjKind, 1);
            4: InsertEnum(Node, PMyRec(Node.Data).MDObj,
                PMyRec(Node.Data).ObjType, PMyRec(Node.Data).ObjKind, 1);
          end;
        except
        end;
      end;
    except

    end;

  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TMDTree, Class_MDTree,
    ciMultiInstance, tmApartment);
end.

