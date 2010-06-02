unit TuningSubSystemsList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, 
  Windows, Messages, Graphics, Controls, Forms, Dialogs, SysUtils,
  ExtCtrls, ComCtrls, FormSubSystemsMain,
  DB, ADODB, Variants,
  ShellCtrls, ActnList, Menus, CompDoc, 
  FormEditCardSubsystem, StdVcl;

type
  TTuningSubSystemsList = class(TAutoObject, IConnectionPointContainer,
      ITuningSubSystemsList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ITuningSubSystemsListEvents;

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
    procedure New; safecall;
    procedure Edit; safecall;
    procedure Delete; safecall;
    procedure OpenCard(var vID: SYSINT); safecall;
    function GetSubSystemNameByID(vID: SYSINT): WideString; safecall;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;

  end;

implementation

uses ComServ;
//------------------------------------------------------------------------------

procedure TTuningSubSystemsList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITuningSubSystemsListEvents;
end;
//------------------------------------------------------------------------------

procedure TTuningSubSystemsList.Initialize;
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

constructor TTuningSubSystemsList.CreateObj(frmSS: TfrmSubSystems);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewSubSystemsList;
end;
//------------------------------------------------------------------------------

destructor TTuningSubSystemsList.Destroy;
begin
end;
//------------------------------------------------------------------------------

procedure TTuningSubSystemsList.Refresh;
begin
  //frm.Echo('подконфига: ' + IntToStr(frm.GetItemID(frm.ComboBoxSubconfigsOnSSL)));
  frm.FullListSubSystems(List, 0, frm.GetItemID(frm.ComboBoxSubconfigsOnSSL));
end;
//------------------------------------------------------------------------------

procedure TTuningSubSystemsList.New;
var
  vID: Integer;
begin
  vID := 0;
  OpenCard(vID);
end;
//------------------------------------------------------------------------------

procedure TTuningSubSystemsList.Edit;
var
  vID: Integer;
begin
  if List.Selected = nil then
    exit;
  vID := Integer(List.Selected.data);
  OpenCard(vID);
end;
//------------------------------------------------------------------------------

procedure TTuningSubSystemsList.Delete;
begin
  if List.Selected <> nil then
  begin
    if MessageDlg('Удалить подсистему?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      frm.RunSQL(nil, 'Delete from SubSystems where ID = ' +
        IntToStr(Integer(List.Selected.data)), 1);
      frm.RunSQL(nil, 'Delete from SubSystemObjects where SubSystemID = ' +
        IntToStr(Integer(List.Selected.data)), 1);
    end;
  end;
  frm.FullListSubSystems(List);
end;
//------------------------------------------------------------------------------

function TTuningSubSystemsList.GetSubSystemNameByID(
  vID: SYSINT): WideString;
var
  Q: TADOQuery;
begin
  Q := frm.RunSQL(nil, 'Select Name from SubSystems where ID = ' +
    IntToStr(vID), 0);
  Q.First;
  Result := Q.Fields[0].AsString;
end;
//------------------------------------------------------------------------------

procedure TTuningSubSystemsList.OpenCard(var vID: SYSINT);
begin

  with TfrmEditCardSubsystem.Create(nil) do
  begin

    frm.RunSQL(QDocument, 'select * from subsystems where ID = ' +
      IntToStr(vID));
    frm.RunSQL(QListConfigs, 'select * from configs');
    frm.RunSQL(QListSubconfigs, 'select * from subconfigs');

    if vID = 0 then
    begin
      with QDocument do
      begin
        Insert();
        FieldByName('ConfigID').AsInteger := frm.CurCfg;
        FieldByName('SubconfigID').AsInteger := frm.CurSubCfg;
        FieldByName('Name').AsString := 'Подсистема ' +
          FieldByName('ID').AsString;
      end;
    end;

    if vID <> 0 then
    begin
      QDocument.edit();
    end;
    ShowModal;
    Free;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTuningSubSystemsList,
    Class_TuningSubSystemsList,
    ciMultiInstance, tmApartment);
end.
