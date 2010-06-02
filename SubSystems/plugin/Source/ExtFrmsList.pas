unit ExtFrmsList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB,
  Windows, Messages, Controls, Forms, Dialogs, SysUtils,
  ComCtrls, FormSubSystemsMain,
  DB, ADODB, FormEditExtPath, StdVcl;

type
  TExtFrmsList = class(TAutoObject, IConnectionPointContainer, IExtFrmsList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IExtFrmsListEvents;

    frm: TfrmSubSystems;
    List: TListView;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    constructor CreateObj(frmSS: TfrmSubSystems);
    destructor Destroy;

    procedure Refresh; safecall;
    procedure NewFolder; safecall;
    procedure NewFile; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure ShowSubSystems; safecall;
    procedure SaveSubSystems; safecall;

  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ;

//------------------------------------------------------------------------------

procedure TExtFrmsList.Refresh;
var
  Q: TADOQuery;
  LItem: TListItem;
  vSQLText: string;
  //i: integer;
begin
  List.Items.BeginUpdate;
  List.Items.Clear;
  vSQLText := 'select * from SubSystemsExtFiles order by Isfolder';
  Q := frm.RunSQL(nil, vSQLText, 0);
  Q.First;
  while not Q.Eof do
  begin
    LItem := List.Items.Add;
    LItem.Caption := Q.FieldByName('Name').AsString;
    LItem.SubItems.Insert(0, Q.FieldByName('Path').AsString);
    LItem.SubItems.Insert(1, Q.FieldByName('Mask').AsString);
    LItem.SubItems.Insert(2, Q.FieldByName('MaskFalse').AsString);
    LItem.Data := Pointer(Q.FieldByName('ID').AsInteger);
    if Q.FieldByName('IsFolder').AsBoolean = True then
      LItem.ImageIndex := 4
    else
      LItem.ImageIndex := 69;
    Q.Next;
  end;
  List.Items.EndUpdate;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.NewFolder;
var
  Q: TADOQuery;
  //  vName, vDir: string;
  //  itm: TListItem;
begin
  with TfrmEditExtPath.Create(nil) do
  begin
    //btnChoiceDir.Enabled := false;
    vIBDir := frm.FConfigurator.IBDir;
    IsFolder := True;
    vList := List;
    vOperation := 'insert';
    eMask.Text := '*.*';
    eMaskFalse.Text := '';
    Caption := 'Подсистемы: Внешние формы - группа (Новая)';
    ShowModal;
    if ModalResult = mrOk then
    begin
      Q := frm.RunSQL(nil, 'select id from Subconfigs where id=0');
      with Q do
      begin
        close;
        sql.Clear;
        sql.Add('Insert INTO SubSystemsExtFiles (IsFolder, name, Path, Mask,MaskFalse) '
          + 'Values (' + frm.DBTrue + ', :pName, :pPath, :pMask, :pMaskFalse');
        Parameters.ParamByName('pName').Value := Trim(eName.Text);
        Parameters.ParamByName('pPath').Value := Trim(eName.Text);
        Parameters.ParamByName('pMask').Value := Trim(eMask.Text);
        Parameters.ParamByName('pMaskFalse').Value := Trim(eMaskFalse.Text);
        ExecSQL;
      end;
    end
    else
      Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.NewFile;
var
  lParams: TStringList;
  //vName, vDir: string;
  //itm: TListItem;
  //vOD: TOpenDialog;
begin

  with TfrmEditExtPath.Create(nil) do
  begin
    vIBDir := IncludeTrailingBackslash(frm.FConfigurator.IBDir);
    IsFolder := False;
    eMask.Enabled := false;
    eMaskFalse.Enabled := false;
    vList := List;
    vOperation := 'insert';
    Caption := 'Подсистемы: Внешние формы - элемент (Новый)';
    ShowModal;
    if ModalResult = mrOk then
    begin
      lParams := TStringList.Create;
      // Теперь добавляем несколько названия в наш список
      lParams.Add(Trim(eName.Text));
      lParams.Add(Trim(ePath.Text));

      frm.RunSQL(nil,
        'Insert INTO SubSystemsExtFiles (IsFolder, name, Path) Values (' +
          frm.DBFalse + ', :pName, :pPath', 1,lParams);
    end
    else
      Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Edit;
var
  vIsFolder: string;
  lParams : TStringList;
begin
  if List.Selected = nil then
    exit;
  with TfrmEditExtPath.Create(nil) do
  begin
    if List.Selected.ImageIndex = 4 then
    begin
      vIsFolder := frm.DBTrue;
      IsFolder := true;
      vIBDir := frm.FConfigurator.IBDir;
      //btnChoiceDir.Enabled := false;
    end
    else
    begin
      vIsFolder := frm.DBFalse;
      IsFolder := False;
      eMask.Enabled := false;
      eMaskFalse.Enabled := false;
    end;
    vList := List;
    vIBDir := IncludeTrailingBackslash(frm.FConfigurator.IBDir);
    vOperation := 'edit';
    eName.Text := List.Selected.Caption;
    ePath.Text := List.Selected.SubItems[0];
    eMask.Text := List.Selected.SubItems[1];
    eMaskFalse.Text := List.Selected.SubItems[2];
    Caption := 'Подсистемы: Внешние формы - ' + List.Selected.Caption;
    ShowModal;
    if ModalResult = mrOk then begin
      lParams := TStringList.Create;
      lParams.Add(Trim(eName.Text));
      lParams.Add(Trim(ePath.Text));
      lParams.Add(Trim(eMask.Text));
      lParams.Add(Trim(eMaskFalse.Text));

      frm.RunSQL(
        nil,
        'Update SubSystemsExtFiles Set IsFolder = ' + vIsFolder
        + ',Name = :eName,'
        + ' Path = :ePath,'
        + ' Mask = :eMask,'
        + ' MaskFalse = eMaskFalse'
        + ' where ID = ' + IntToStr(Integer(List.Selected.data))
        , 1, lParams);
      end
    else
      Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Delete;
begin
  if List.Selected = nil then
    exit;
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    frm.RunSQL(nil, 'delete * from SubSystemsExtFilesObjects where ExtRecId=' +
      IntToStr(Integer(List.Selected.Data)), 1);
    frm.RunSQL(nil, 'delete * from SubSystemsExtFiles where ID = ' +
      IntToStr(Integer(List.Selected.Data)), 1);
    List.Selected.Delete;
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.ShowSubSystems;
begin
  try
    frm.ShowSubSystems(frm.ListViewConfigMetadata, 0,
      'SubSystemsExtFilesObjects', 'ExtRecID',
      IntToStr(Integer(List.Selected.Data)));
  except
    // to do nothing
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.SaveSubSystems;
var
  i: integer;
  CurItm: TListItem;
  Q: TADOQuery;
  CurSubSystemID: Integer;
  CurMetObj: TListItem;
  vList: TListView;
begin
  // SubSystemID, ExtRecID
  Q := frm.RunSQL(nil,
    'select * from SubSystemsExtFilesObjects where ExtRecID = '
    + IntToStr(Integer(List.Selected.data))
    + ' and (SubSystemID in (select ID from SubSystems where ConfigID = ' +
    IntTOStr(frm.CurCfg) + '))'
    , 0);
  vList := frm.ListViewConfigMetadata;
  for i := 0 to vList.Items.Count - 1 do
  begin
    CurItm := vList.Items.Item[i];
    CurSubSystemID := Integer(CurItm.Data);
    CurMetObj := List.Selected;
    if CurItm.Checked = False then
    begin
      frm.RunSQL(nil,
        'DELETE from SubSystemsExtFilesObjects where SubSystemID = '
        + IntToStr(CurSubSystemID)
        + ' and ExtRecID = '
        + IntToStr(Integer(CurMetObj.data)),
        1);
    end
    else
    begin
      if Q.Locate('SubSystemID', CurSubSystemID, [loCaseInsensitive]) = False
        then
      begin
        with Q do
        begin
          Insert();
          FieldByName('SubSystemID').AsInteger := CurSubSystemID;
          FieldByName('ExtRecID').AsInteger := Integer(CurMetObj.Data);
          Post();
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IExtFrmsListEvents;
end;
//------------------------------------------------------------------------------

procedure TExtFrmsList.Initialize;
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

constructor TExtFrmsList.CreateObj(frmSS: TfrmSubSystems);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewExtForms;
end;
//------------------------------------------------------------------------------

destructor TExtFrmsList.Destroy;
begin
end;
//------------------------------------------------------------------------------
initialization
  TAutoObjectFactory.Create(ComServer, TExtFrmsList, Class_ExtFrmsList,
    ciMultiInstance, tmApartment);
end.

