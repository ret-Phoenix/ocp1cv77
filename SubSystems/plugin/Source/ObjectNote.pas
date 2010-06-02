unit ObjectNote;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, FormSubSystemsMain, SysUtils,
  AdoDB, Messages, Dialogs, Classes;

type
  TObjectNote = class(TAutoObject, IObjectNote)
  public
    frm: TfrmSubSystems;

    constructor CreateObj(frmSS: TfrmSubSystems);
    destructor Destroy;
    //    /function GetByID(vID: SYSINT): WideString; safecall;
    function HasNote(vID: SYSINT): SYSINT; safecall;
    procedure DeleteByID(vID: SYSINT); safecall;
    procedure OpenByID(vID: SYSINT); safecall;
    procedure SetByID(vID: SYSINT; const vVal: WideString); safecall;
    procedure LoadFromFile(vID: SYSINT; var vFileName: WideString); safecall;
    procedure SaveToFile(vID: SYSINT; var vFileName: WideString); safecall;
    function GetNoteTextByID(vID: SYSINT): WideString; safecall;
    procedure SetNoteTextByID(vID: SYSINT; const vVal: WideString); safecall;
    procedure OpenByRowID(var vID: SYSINT); safecall;
    procedure New(); safecall;
  end;

implementation

uses ComServ, DB, FormEditCardNote, Forms;

constructor TObjectNote.CreateObj(frmSS: TfrmSubSystems);
begin
  inherited Create;
  frm := frmSS;
end;

destructor TObjectNote.Destroy;
begin
end;

//function TObjectNote.GetByID(vID: SYSINT): WideString;
//begin
//  Result := frm.RunSQL(nil, 'Select Note from ObjectNote where ObjID=' + IntToStr(vID), 0).Fields[0].AsString;
//end;

function TObjectNote.HasNote(vID: SYSINT): SYSINT;
begin
  if frm.RunSQL(nil, 'Select ID from ObjectNote where ObjID=' + IntToStr(vID) +
    ' and SubconfigID= ' + IntToStr(frm.CurSubCfg)).IsEmpty then
    Result := 0
  else
    Result := 1;
end;

procedure TObjectNote.DeleteByID(vID: SYSINT);
begin
  frm.RunSQL(nil, 'Delete from ObjectNote where ObjID=' + IntToStr(vID) +
    ' and SubconfigID= ' + IntToStr(frm.CurSubCfg), 1);
end;
//------------------------------------------------------------------------------

procedure TObjectNote.OpenByID(vID: SYSINT);
var
  vSQLText: string;
  //vSubcongID: integer;
begin

  with TfrmEditCardNote.Create(nil) do
  begin
    mMainFrm := frm;
    Caption := frm.FConfigurator.MetaData.FindObject(vID).FullName;
    QDocument.Connection := frm.SubSystemConnection;
    QListSubconfigs.Connection := frm.SubSystemConnection;
    frm.RunSQL(QListSubconfigs, 'Select Id,Name from subconfigs where ConfigID='
      + IntToStr(frm.CurCfg), 0);
    vSQLText := 'Select * from ObjectNote where ObjID=' + IntToStr(vID)
      + ' and (SubconfigID=' + IntToStr(frm.CurSubCfg) + ')';

    frm.RunSQL(QDocument, vSQLText, 0);
    if QDocument.IsEmpty then
    begin
      QDocument.Insert;
      QDocumentObjID.AsInteger := vID;
      QDocumentSubconfigID.AsInteger := frm.CurSubCfg;
      QDocumentMDObjName.AsString :=
        frm.FConfigurator.MetaData.FindObject(vID).FullName;
    end;
    ShowModal;
    Free;
  end;

end;

procedure TObjectNote.SetByID(vID: SYSINT; const vVal: WideString);
var
  lParams: TStringList;
begin
  lParams := TStringList.Create;
  lParams.Add(vVal);
  frm.RunSQL(nil, 'Update ObjectNote Set Note = :vVal where ObjID=' +
    IntToStr(vID) + ' and SubconfigID=' + IntToStr(frm.CurSubCfg), 1, lParams);
end;

procedure TObjectNote.LoadFromFile(vID: SYSINT; var vFileName: WideString);
//var
//  Q: TADOQuery;
begin
  if vFileName = '' then
  begin
    if frm.OpenDialog1.Execute then
    begin
      vFileName := frm.OpenDialog1.FileName;
    end
    else
      exit;
  end;
  with TfrmEditCardNote.Create(nil) do
  begin
    mMainFrm := frm;
    QDocument.Connection := frm.SubSystemConnection;
    frm.RunSQL(QDocument, 'Select * from ObjectNote where ObjID=' +
      IntToStr(vID) + ' and SubconfigID=' + IntToStr(frm.CurSubCfg), 0);
    if QDocument.IsEmpty then
    begin
      with QDocument do
      begin
        Insert;
        QDocumentObjID.AsInteger := vID;
        QDocumentSubconfigID.AsInteger := frm.CurSubCfg;
        QDocumentNote.LoadFromFile(vFileName);
        QDocumentMDObjName.AsString :=
          frm.FConfigurator.MetaData.TaskDef.Childs.Name[vID, true];
        Post;
      end;
    end
    else
    begin
      QDocument.Edit;
      QDocumentNote.LoadFromFile(vFileName);
      QDocument.Post;
    end;
    Free;
  end;
end;

procedure TObjectNote.SaveToFile(vID: SYSINT; var vFileName: WideString);
//var
//  Q: TADOQuery;
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
  with TfrmEditCardNote.Create(nil) do
  begin
    mMainFrm := frm;
    QDocument.Connection := frm.SubSystemConnection;
    frm.RunSQL(QDocument, 'Select * from ObjectNote where ObjID=' +
      IntToStr(vID) + ' and SubconfigID=' + IntToStr(frm.CurSubCfg), 0);
    if not QDocument.IsEmpty then
    begin
      QDocumentNote.SaveToFile(vFileName);
    end
    else
      ShowMessage('Описание для данного объекта не существует!');
    Free;
  end;
end;

function TObjectNote.GetNoteTextByID(vID: SYSINT): WideString;
var
  Q: TADOQuery;
begin
  Q := frm.RunSQL(nil, 'Select Note from ObjectNote where ObjID=' +
    IntToStr(vID) + ' and SubconfigID=' + IntToStr(frm.CurSubCfg), 0);
  if Q.IsEmpty then
    result := ''
  else
    Result := Q.Fields[0].AsString;
end;

procedure TObjectNote.SetNoteTextByID(vID: SYSINT; const vVal: WideString);
//var
//  Q: TADOQuery;
begin
  with TfrmEditCardNote.Create(nil) do
  begin
    mMainFrm := frm;
    QDocument.Connection := frm.SubSystemConnection;
    frm.RunSQL(QDocument, 'Select * from ObjectNote where ObjID=' +
      IntToStr(vID) + ' and SubconfigID=' + IntToStr(frm.CurSubCfg), 0);
    if QDocument.IsEmpty then
    begin
      with QDocument do
      begin
        Insert;
        QDocumentObjID.AsInteger := vID;
        QDocumentNote.Text := vVal;
        Post;
      end;
    end
    else
    begin
      QDocumentNote.Text := vVal;
      QDocument.Post;
    end;
    Free;
  end;
end;

procedure TObjectNote.OpenByRowID(var vID: SYSINT); safecall;
var
  vSQLText: string;
  //  vSubcongID: integer;
begin

  with TfrmEditCardNote.Create(nil) do
  begin
    mMainFrm := frm;
    QDocument.Connection := frm.SubSystemConnection;
    QListSubconfigs.Connection := frm.SubSystemConnection;
    frm.RunSQL(QListSubconfigs, 'Select Id,Name from subconfigs where ConfigID='
      + IntToStr(frm.CurCfg), 0);
    vSQLText := 'Select * from ObjectNote where ID=' + IntToStr(vID);

    frm.RunSQL(QDocument, vSQLText, 0);
    if QDocument.IsEmpty then
    begin
      ShowMessage('Нет записи с данным ИД!');
    end
    else
      ShowModal;
    Caption := QDocumentMDObjName.AsString;
    Free;
  end;
end;

procedure TObjectNote.New; safecall;
begin
  with TfrmEditCardNote.Create(nil) do
  begin
    mMainFrm := frm;
    QDocument.Connection := frm.SubSystemConnection;
    //QListSubconfigs.Connection := frm.SubSystemConnection;

    frm.RunSQL(QListSubconfigs, 'Select * from Subconfigs where ConfigID='
      + IntToStr(frm.CurCfg), 0);

    frm.RunSQL(QDocument, 'Select * from ObjectNote where ID=-1', 0);
    with QDocument do
    begin
      Insert;
      FieldByName('SubConfigID').AsInteger := frm.CurSubCfg;
    end;
    ShowModal;
    Free;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TObjectNote, Class_ObjectNote,
    ciMultiInstance, tmApartment);
end.

