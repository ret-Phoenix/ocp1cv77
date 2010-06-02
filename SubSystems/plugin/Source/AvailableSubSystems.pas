unit AvailableSubSystems;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, FormSubSystemsMain,
  SysUtils, Windows, Messages, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, DB, ADODB, StdVcl;

type
  TAvailableSubSystems = class(TAutoObject, IConnectionPointContainer,
    IAvailableSubSystems)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;

    FEvents: IAvailableSubSystemsEvents;
    frm: TfrmSubSystems;
    List: TListView;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    destructor Destroy; override;

    constructor CreateObj(frmSS: TfrmSubSystems; ListSS: TListView);

    procedure ChoiceAll; safecall;
    procedure UnChoiceAll; safecall;
    procedure Invert; safecall;
    procedure Refresh; safecall;

    procedure SetSubSystems(const vStr: WideString); safecall;
    function GetSelectedSubSystemsID: WideString; safecall;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ;
//------------------------------------------------------------------------------

procedure TAvailableSubSystems.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAvailableSubSystemsEvents;
end;
//------------------------------------------------------------------------------

procedure TAvailableSubSystems.ChoiceAll;
begin
  frm.ToDoMarks(List, 1);
end;
//------------------------------------------------------------------------------

procedure TAvailableSubSystems.UnChoiceAll;
begin
  frm.ToDoMarks(List, 0);
end;
//------------------------------------------------------------------------------

procedure TAvailableSubSystems.Invert;
begin
  frm.ToDoMarks(List, 2);
end;
//------------------------------------------------------------------------------

procedure TAvailableSubSystems.Refresh;
begin
  frm.FullListSubSystems(List, 0, frm.GetItemID(frm.ComboBoxSubconfigsOnASL));
end;
//------------------------------------------------------------------------------

function TAvailableSubSystems.GetSelectedSubSystemsID: WideString;
var
  vSubSystems: WideString;
  i: integer;
begin
  vSubSystems := '';
  for i := 0 to List.Items.Count - 1 do
  begin
    if List.Items.Item[i].Checked = True then
    begin
      if vSubSystems = '' then
        vSubSystems := vSubSystems + IntToStr(Integer(List.Items.Item[i].Data))
      else
        vSubSystems := vSubSystems + ',' +
          IntToStr(Integer(List.Items.Item[i].Data));
    end;
  end;
  Result := vSubSystems;
end;
//------------------------------------------------------------------------------

procedure TAvailableSubSystems.SetSubSystems(const vStr: WideString);
  safecall;
var
  t: TStringList;
  I, J: Integer;
  vID: string;
begin
  t := TStringList.create; //создаём класс
  t.text := stringReplace(vStr, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    for j := 0 to List.Items.Count - 1 do
    begin
      vID := IntTOStr(Integer(List.Items.Item[j].Data));
      if vID = T[i] then
      begin
        List.Items.Item[J].Checked := true;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TAvailableSubSystems.Initialize;
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

constructor TAvailableSubSystems.CreateObj(frmSS: TfrmSubSystems; ListSS:
  TListView);
begin
  inherited Create;
  frm := frmSS;
  List := ListSS;
end;
//------------------------------------------------------------------------------

destructor TAvailableSubSystems.Destroy;
begin
end;
//------------------------------------------------------------------------------
initialization
  TAutoObjectFactory.Create(ComServer, TAvailableSubSystems,
    Class_AvailableSubSystems,
    ciMultiInstance, tmApartment);
end.
