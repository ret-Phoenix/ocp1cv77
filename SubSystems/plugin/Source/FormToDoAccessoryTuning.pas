unit FormToDoAccessoryTuning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, FormSubSystemsMain, OpenConf_TLB, ADODB, StdCtrls,
    ExtCtrls,
  AvailableSubSystems, ObjectClasses, TuningMDObj, ToolWin, FormEditCardToDo;

type
  TfrmToDoAccessoryTuning = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ListViewSubSystems: TListView;
    ListViewTypeMetadataObj: TListView;
    TreeViewMetadataObj: TTreeView;
    Panel1: TPanel;
    btnOk: TButton;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ListViewObj: TListView;
    ToolButton1: TToolButton;
    btnClose: TButton;
    procedure ListViewObjCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure TreeViewMetadataObjDblClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vAvlSS: TAvailableSubSystems;
    vObjCls: TObjectClasses;
    vTunObj: TTuningMDObj;
  public
    { Public declarations }
    frm: TfrmSubSystems;
    frmToDo: TfrmEditCardToDo;
    ToDoID: Integer;
  end;

var
  frmToDoAccessoryTuning: TfrmToDoAccessoryTuning;

implementation

uses DB, TuningSubSystemsList;

{$R *.dfm}

procedure TfrmToDoAccessoryTuning.FormShow(Sender: TObject);
var
  MetA: IMetaDataObjChilds;
  i: integer;
  Q: TADOQuery;
  vStr: string;
  LItem: TListItem;
begin

  //ListViewObj.SmallImages := frm.ImageListSubSustems;
  //frm.FullListSubSystems(ListViewSubSystems,frmToDo.ADOQuery1ConfigID.AsInteger);
  vAvlSS := TAvailableSubSystems.CreateObj(frm, ListViewSubSystems);
  vObjCls := TObjectClasses.CreateObj(frm, ListViewTypeMetadataObj);
  vTunObj := TTuningMDObj.CreateObj(frm, frm.FConfigurator,
    TreeViewMetadataObj);

  vAvlSS.Refresh;
  frm.FullListSubSystems(ListViewSubSystems,
    frmToDo.QDocumentConfigID.AsInteger);

  ListViewTypeMetadataObj.Items.Clear;
  MetA := frm.FConfigurator.MetaData.TaskDef.Childs;
  for i := 0 to MetA.Count - 1 do
  begin
    frm.CreateObjLItem(ListViewTypeMetadataObj, MetA.Name[i, true], i);
  end;
  // заполняем сохраненными данными
  vStr := '';
  Q := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 1) and (ToDoID=' +
    IntToStr(ToDoID) + ')', 0);
  Q.First;
  while not Q.Eof do
  begin
    vStr := vStr + ',' + Q.Fields[0].AsString;
    Q.Next
  end;
  if vStr <> ',' then
    vAvlSS.SetSubSystems(vStr);
  //~~~~~~~~~~~~~~~~~~~~~
  vStr := '';
  Q := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 2) and (ToDoID=' +
    IntToStr(ToDoID) + ')', 0);
  Q.First;
  while not Q.Eof do
  begin
    vStr := vStr + ',' + Q.Fields[0].AsString;
    Q.Next
  end;
  if vStr <> ',' then
    vObjCls.SetObjClasses(vStr);
  //~~~~~~~~~~~~~~~~~~~~~
  vTunObj.RefreshForToDo(Q);
  Q := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 3) and (ToDoID=' +
    IntToStr(ToDoID) + ')', 0);
  Q.First;
  while not Q.Eof do
  begin
    LItem := ListViewObj.Items.Add;
    try
      LItem.Caption :=
        frm.FConfigurator.MetaData.FindObject(Q.Fields[0].AsInteger).FullName;
    except
      LItem.Caption := 'Объект не найден!';
    end;
    LItem.Data := Pointer(Q.Fields[0].AsInteger);
    Q.Next
  end;
  TabSheet3Show(Sender);
  PageControl1.TabIndex := 0;
end;

procedure TfrmToDoAccessoryTuning.btnOkClick(Sender: TObject);
var
  vStr: WideString;
  t: TStringList;
  I: Integer;
//  vID: string;
  Q: TADOQuery;
//  vFind: Boolean;
  vSSList: TTuningSubSystemsList;
  LItem: TListItem;
begin
  frm.RunSQL(nil, 'Delete from ToDoAccessory where (ToDoID=' + IntToStr(ToDoID)
    + ')', 1);

  vSSList := TTuningSubSystemsList.CreateObj(frm);

  vStr := vAvlSS.GetSelectedSubSystemsID;

  t := TStringList.create; //создаём класс
  t.text := stringReplace(vStr, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    frm.RunSQL(nil,
      'Insert into ToDoAccessory (ToDoID,TypeDataID,ObjID) Values (' +
      IntToStr(ToDoID) + ',1,' + T[i] + ')', 1);
  end;
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  vStr := vObjCls.GetObjClasses;
  t := TStringList.create; //создаём класс
  t.text := stringReplace(vStr, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    frm.RunSQL(nil,
      'Insert into ToDoAccessory (ToDoID,TypeDataID,ObjID) Values (' +
      IntToStr(ToDoID) + ',2,' + T[i] + ')', 1);
  end;
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  for i := 0 to ListViewObj.Items.Count - 1 do
  begin
    if ListViewObj.Items.Item[i].ImageIndex = GrfElement then
      frm.RunSQL(nil,
        'Insert into ToDoAccessory (ToDoID,TypeDataID,ObjID) Values (' +
        IntToStr(ToDoID) + ',3,' +
        IntToStr(Integer(ListViewObj.Items.Item[i].Data)) + ')', 1);
  end;

  // заполняем текстовыми представлениями значения идентификаторов ссылок.
  // выбираем подсистемы
  frmToDo.MemoSubSystems.Lines.Clear;
  Q := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 1) and (ToDoID=' +
    IntToStr(ToDoID) + ')', 0);
  Q.First;
  while not Q.Eof do
  begin
    frmToDo.MemoSubSystems.Lines.Add(vSSList.GetSubSystemNameByID(Q.Fields[0].AsInteger));
    Q.Next;
  end;

  frmToDo.MemoObjTypes.Lines.Clear;
  Q := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 2) and (ToDoID=' +
    IntToStr(ToDoID) + ')', 0);
  Q.First;
  while not Q.Eof do
  begin
    frmToDo.MemoObjTypes.Lines.Add(
      frm.FConfigurator.MetaData.TaskDef.Childs.Name[Q.Fields[0].AsInteger, true]
      );
    Q.Next;
  end;

  //frmToDo.MemoObj.Lines.Clear;
  frmToDo.ListViewObj.Items.Clear;
  Q := frm.RunSQL(nil,
    'select ObjID from ToDoAccessory where (TypedataID = 3) and (ToDoID=' +
    IntToStr(ToDoID) + ')', 0);
  Q.First;
  while not Q.Eof do
  begin
    try
      LItem := frmToDo.ListViewObj.Items.Add;
      LItem.Caption :=
        frm.FConfigurator.MetaData.FindObject(Q.Fields[0].AsInteger).FullName;
    except
      LItem := frmToDo.ListViewObj.Items.Add;
      LItem.Caption := 'Объект не найден!';
    end;
    Q.Next;
  end;
  Close;
end;

procedure TfrmToDoAccessoryTuning.TabSheet3Show(Sender: TObject);
var
//  Met: IMetaDataObjArray;
  MetA: IMetaDataObjChilds;
  i, j: Integer;
  Node: TTreeNode;
  vCaptMD, vCaptObj: string;
  s: string;
begin
  try

    if frmToDo.QDocumentConfigID.AsInteger <> frm.CurCfg then
    begin
      exit;
    end;

    MetA := frm.FConfigurator.MetaData.TaskDef.Childs;
    TreeViewMetadataObj.Items.Clear();
    for i := 0 to ListViewTypeMetadataObj.Items.Count - 1 do
    begin
      if ListViewTypeMetadataObj.Items.Item[i].Checked then
      begin
        Node := TreeViewMetadataObj.Items.AddObject(nil,
          ListViewTypeMetadataObj.Items.Item[i].Caption,
          Pointer(Integer(ListViewTypeMetadataObj.Items.Item[i].Data)));
        vTunObj.AddMetItems(TreeViewMetadataObj,
          Integer(ListViewTypeMetadataObj.Items.Item[i].Data), Node, -1);
      end;
    end;

    for j := 0 to ListViewObj.Items.Count - 1 do
    begin
      ListViewObj.Items.Item[j].ImageIndex := GrfElement;
    end;

    for i := 0 to ListViewTypeMetadataObj.Items.Count - 1 do
    begin
      vCaptMD := ListViewTypeMetadataObj.Items.Item[i].Caption + '.';
      if not ListViewTypeMetadataObj.Items.Item[i].Checked then
      begin
        for j := 0 to ListViewObj.Items.Count - 1 do
        begin
          vCaptObj := ListViewObj.Items.Item[j].Caption;
          if Pos(vCaptMD, vCaptObj) <> 0 then
          begin
            ListViewObj.Items.Item[j].ImageIndex := GrfRecFilter;
            //          end else
            //            if ListViewObj.Items.Item[j].ImageIndex <> GrfRecFilter then
            //              ListViewObj.Items.Item[j].ImageIndex := GrfElement;
            //          if Pos(vCaptMD, vCaptObj) <> 0 then begin
            //            frm.Echo('удаленный');
          end;
        end;
      end;
    end;
    //ListViewObj.Repaint;
  except
    on E: Exception do
    begin
      s := 'Подсистемы: Заполнение списка доступных объектов'#13#10 +
        'Возникло исключение:'#13#10 + E.Message;
      frm.Echo(s);
    end;
  end;
end;

procedure TfrmToDoAccessoryTuning.TreeViewMetadataObjDblClick(Sender: TObject);
var
  LItem: TListItem;
begin
  if not TreeViewMetadataObj.Selected.HasChildren then
  begin
    LItem := ListViewObj.Items.Add;
    LItem.Caption := TreeViewMetadataObj.Selected.Parent.Text + '.' +
      TreeViewMetadataObj.Selected.Text;
    LItem.Data := Pointer(Integer(TreeViewMetadataObj.Selected.Data));
    Litem.ImageIndex := GrfElement;
    frm.RunSQL(nil,
      'Insert into ToDoAccessory (ToDoID,TypeDataID,ObjID) Values (' +
      IntToStr(ToDoID) + ',3,' +
      IntToStr(Integer(TreeViewMetadataObj.Selected.Data)) + ')', 1);
  end;
end;

procedure TfrmToDoAccessoryTuning.ToolButton1Click(Sender: TObject);
begin
  if MessageDlg('Удалить принадлежность к данному объекту?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if ListViewObj.Selected <> nil then
      ListViewObj.Selected.Delete;
  end;
end;

procedure TfrmToDoAccessoryTuning.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmToDoAccessoryTuning.ListViewObjCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.ImageIndex = GrfRecFilter then
  begin
    //frm.Echo(IntToStr(Item.ImageIndex));
    ListViewObj.Canvas.Font.Color := clGray;
    ListViewObj.Canvas.Font.Style :=
      ListViewObj.Canvas.Font.Style + [fsStrikeOut];
  end;
end;

end.
