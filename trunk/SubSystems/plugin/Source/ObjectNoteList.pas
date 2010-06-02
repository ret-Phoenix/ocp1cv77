unit ObjectNoteList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB,
  ObjectNote, FormSubSystemsMain, ComCtrls, ADODB, Dialogs,
  XMLDoc, XMLIntf, SysUtils, Controls;

type
  TObjectNoteList = class(TAutoObject, IConnectionPointContainer,
      IObjectNoteList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IObjectNoteListEvents;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    frm: TfrmSubSystems;
    List: TListView;

    procedure Initialize; override;

    constructor CreateObj(frmSS: TfrmSubSystems);
    destructor Destroy;

  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function GetSelectedRowID: SYSINT; safecall;
    procedure Refresh; safecall;
    procedure SaveToFile(var vFileName: WideString); safecall;
    function SetSelectedRowID(vID: SYSINT): SYSINT; safecall;
    procedure DeleteByRowID(vID: SYSINT); safecall;
  end;

implementation

uses ComServ, OpenConf_TLB, DB;
//------------------------------------------------------------------------------

procedure TObjectNoteList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IObjectNoteListEvents;
end;
//------------------------------------------------------------------------------

procedure TObjectNoteList.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;
//------------------------------------------------------------------------------

constructor TObjectNoteList.CreateObj(frmSS: TfrmSubSystems);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewLNotesList;
end;
//------------------------------------------------------------------------------

destructor TObjectNoteList.Destroy;
begin
end;
//------------------------------------------------------------------------------

function TObjectNoteList.GetSelectedRowID: SYSINT;
begin
  Result := -1;
  if List.Selected <> nil then
  begin
    Result := Integer(List.Selected.data);
  end;
end;
//------------------------------------------------------------------------------

procedure TObjectNoteList.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
  vName: string;
  vMDObj: IMetaDataObj;
  lParams: TStringList;
  lSCnf: string;
begin
  lParams := TStringList.Create;
//  lParams.Add(frm.vSubcfg.);
//  lParams.Add('0');

  lParams.Add(IntToStr(frm.CurSubCfg));
  lParams.Add(IntToStr(frm.CurSubCfg));

  List.Items.Clear;

  Q := frm.RunSQL(nil, 'select ' +
    '	n.Objid' +
    '	,m.mdobjname' +
    '	,n.MDObjName' +
    '	,n.Note' +
    ' from' +
    '	ObjectNote as n' +
    '	left join MDStruct as m on' +
    '		n.ObjID = m.mdobjid' +
    '		and (m.Subconfig=:pSC)' +
    ' where' +
    '	(n.Subconfig=:pSC) or (n.Subconfig=0)'
    , 0,lParams);

  Q.First;
  while not Q.Eof do
  begin
    try
      try
        vMDObj := frm.FConfigurator.MetaData.FindObject(Q.Fields[1].AsInteger);
      finally
        if vMDObj <> nil then
        begin
          lParams := TStringList.Create;
          lParams.Add(vName);
          lParams.Add(q.FieldByName('ObjID').AsString);

          vName := vMDObj.FullName;
          frm.RunSQL(nil, 'Update ObjectNote Set MDObjName = :vName'
            + ' where (SubconfigID=' + IntToStr(frm.CurSubCfg)
            + ') and (ObjID= :pIDObj)', 1, lParams);
        end
        else
          vName := 'Объект не найден!';
      end;
    except
      vName := 'Объект не найден!';
    end;

    LItem := List.Items.Add;
    with LItem do
    begin
      Caption := vName;
      SubItems.Insert(0, frm.ifstr(Q.Fields[1].AsString,Q.Fields[2].AsString)); // Name
      Data := Pointer(Q.Fields[0].AsInteger); // ObjID
    end;
    Q.Next;
  end;

end;
//------------------------------------------------------------------------------

procedure TObjectNoteList.SaveToFile(var vFileName: WideString);
var
  Q: TADOQuery;
  vName: string;
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
  RootNode := XMLDocument.AddChild('Описания');
  RootNode.SetAttributeNS('DateOut', '', DateToStr(Now));
  RootNode.SetAttributeNS('TimeOut', '', TimeToStr(Now));
  Q := frm.RunSQL(nil, 'select ObN.ID,ObN.ObjID,ObN.MDObjName,ObN.Note, SC.Name'
    + ' from ObjectNote ObN '
    + ' inner join Subconfigs SC on  (SC.ID=ObN.SubconfigID) '
    + ' where (SC.ID=' + IntToStr(frm.CurSubCfg) + ')', 0);
  Q.First;
  while not Q.Eof do
  begin
    try
      vName :=
        frm.FConfigurator.MetaData.FindObject(Q.Fields[1].AsInteger).FullName;
    except
      vName := 'Объект не найден!';
    end;
    NewXMLNode := RootNode.AddChild('ObjectNote');
    with NewXMLNode do
    begin
      SetAttributeNS('ID', '', Q.FieldByName('ID').AsString);
      SetAttributeNS('Subconfig', '', Q.FieldByName('Name').AsString);
      SetAttributeNS('MDObjName', '', Q.FieldByName('MDObjName').AsString);
      SetAttributeNS('ОбъектМетаданных', '', vName);
      SetAttributeNS('Описание', '', Q.FieldByName('Note').AsString);
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
//------------------------------------------------------------------------------

function TObjectNoteList.SetSelectedRowID(vID: SYSINT): SYSINT;
var
  i: integer;
begin
  for i := 0 to list.Items.Count - 1 do
  begin
    if integer(list.Items.Item[i].Data) = vID then
    begin
      list.Items.Item[i].Selected := true;
    end;
  end;
end;

procedure TObjectNoteList.DeleteByRowID(vID: SYSINT); safecall;
begin
  if List.Selected = nil then
    exit;
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  frm.RunSQL(nil, 'delete from ObjectNote where ID=' +
    IntToStr(Integer(List.Selected.data)), 1);

end;

//------------------------------------------------------------------------------
initialization
  TAutoObjectFactory.Create(ComServer, TObjectNoteList, Class_ObjectNoteList,
    ciMultiInstance, tmApartment);
end.

