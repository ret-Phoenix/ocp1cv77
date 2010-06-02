unit DBChangesLog;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, FormSubSystemsMain, SysUtils, ADODB,
  Controls, ComCtrls, FormEditCardDBChangeRecord, Dialogs, StdVcl;

type
  TDBChangesLog = class(TAutoObject, IDBChangesLog)
  public
    frmSS: TfrmSubSystems;
    List: TListView;

    constructor CreateObj(frmSSP: TfrmSubSystems);
    destructor Destroy;
  protected
    procedure Add; safecall;
    procedure Delete; safecall;
    procedure Edit; safecall;
    procedure OpenCard(vID: SYSINT); safecall;
    procedure GetListByMDObj(vID: SYSINT); safecall;

  end;

implementation

uses ComServ, Forms, DB;

constructor TDBChangesLog.CreateObj(frmSSP: TfrmSubSystems);
begin
  inherited Create;
  frmSS := frmSSP;
  List := frmSS.lvDBChanges;
end;

destructor TDBChangesLog.Destroy;
begin
end;

procedure TDBChangesLog.Add;
begin
  OpenCard(-frmSS.vMDTree.GetCurrentMDObj.ID);
end;

procedure TDBChangesLog.Delete;
var
  vID: string;
begin
  if List.Selected = nil then
    exit;
  vID := IntToStr(Integer(List.Selected.data));
  if MessageDlg('Удалить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;
  frmSS.RunSQL(nil, 'delete from MDObjBlocksChange where ID=' + vID, 1);
end;

procedure TDBChangesLog.Edit;
begin
  if List.Selected = nil then
    exit;
  OpenCard(Integer(List.Selected.Data));
end;

procedure TDBChangesLog.OpenCard(vID: SYSINT);
begin
  with TfrmEditCardDBChangeRecord.Create(nil) do
  begin
    frmSSF := frmSS;
    frmSSF.RunSQL(QListSubconfigs,
      'select id,name from subconfigs where configid=' + IntToStr(frmSSF.CurCfg)
      + ' order by name');
    frmSSF.RunSQL(QListUsers, 'select id,name from users where (subconfigid=' +
      IntToStr(frmSSF.CurSubCfg) + ') or (subconfigid=0) order by name');
    frmSSF.RunSQL(QListToDo, 'select id,name from ToDo order by name');
    frmSSF.RunSQL(QDocument, 'select * from MDObjBlocksChange where id=' +
      IntToStr(vID));

    if vID < 0 then
    begin
      QDocument.Insert;
      QDocumentSubconfigID.AsInteger := frmSSF.CurSubCfg;
      QDocumentUserID.AsInteger := frmSSF.CurUser;
      QDocumentDateChange.AsDateTime := Now;
      QDocumentMDObj.AsInteger := -vID;
    end;
    lblMDObjName.Caption :=
      frmSSF.FConfigurator.MetaData.FindObject(QDocumentMDObj.AsInteger).FullName;

    ShowModal;
    Free;
  end;
end;

procedure TDBChangesLog.GetListByMDObj(vID: SYSINT);
var
  Q: TADOQuery;
  LItem: TListItem;
begin
  try
    List.Items.BeginUpdate;
    List.Items.Clear;
    Q := frmSS.RunSQL(nil,
      'select id,name,DateChange from MDObjBlocksChange where subconfigid=' +
      IntToStr(frmSS.CurSubCfg) + ' and MDObj=' + IntToStr(vID) +
        ' order by DateChange desc');
    Q.First;
    while not Q.Eof do
    begin
      LItem := List.Items.Add;
      LItem.Caption := Q.Fields[1].AsString;
      LItem.Data := Pointer(Q.Fields[0].AsInteger);
      LItem.SubItems.Insert(0, Q.Fields[2].AsString);
      Q.Next;
    end;
  finally
    List.Items.EndUpdate;
  end;

end;

initialization
  TAutoObjectFactory.Create(ComServer, TDBChangesLog, Class_DBChangesLog,
    ciMultiInstance, tmApartment);
end.

