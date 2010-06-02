unit ObjectClasses;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, formSubSystemsMain,
  SysUtils, Controls, ComCtrls, StdVcl;

type
  TObjectClasses = class(TAutoObject, IConnectionPointContainer, IObjectClasses)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IObjectClassesEvents;

    List: TListView;
    frm: TfrmSubSystems;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;

    destructor Destroy; override;

    constructor CreateObj(frmSS: TfrmSubSystems; ListObj: TListView);

    procedure ChoiceAll; safecall;
    procedure UnChoiceAll; safecall;
    procedure Invert; safecall;

    function GetObjClasses: WideString; safecall;
    procedure SetObjClasses(const vID: WideString); safecall;

  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ;

procedure TObjectClasses.ChoiceAll;
begin
  frm.ToDoMarks(frm.ListViewObj, 1);
end;
//------------------------------------------------------------------------------

procedure TObjectClasses.UnChoiceAll;
begin
  frm.ToDoMarks(List, 0);
end;
//------------------------------------------------------------------------------

procedure TObjectClasses.Invert;
begin
  frm.ToDoMarks(List, 2);
end;

procedure TObjectClasses.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IObjectClassesEvents;
end;

procedure TObjectClasses.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

function TObjectClasses.GetObjClasses: WideString;
var
  vObjTypes: WideString;
  i: integer;
begin
  vObjTypes := '';
  for i := 0 to List.Items.Count - 1 do
  begin
    if List.Items.Item[i].Checked = True then
    begin
      if vObjTypes = '' then
      begin
        vObjTypes := vObjTypes + IntToStr(Integer(List.Items.Item[i].Data));
        if Integer(List.Items.Item[i].Data) = 3 then
          vObjTypes := vObjTypes + ',14';
        if Integer(List.Items.Item[i].Data) = 2 then
          vObjTypes := vObjTypes + ',12,13,15'
      end
      else
      begin
        vObjTypes := vObjTypes + ',' +
          IntToStr(Integer(List.Items.Item[i].Data));
        if Integer(List.Items.Item[i].Data) = 3 then
          vObjTypes := vObjTypes + ',14';
        if Integer(List.Items.Item[i].Data) = 2 then
          vObjTypes := vObjTypes + ',12,13,15'
      end;
    end;
  end;
  Result := vObjTypes;
end;

procedure TObjectClasses.SetObjClasses(const vID: WideString);
var
  i, vIDO, j: integer;
  t: TStringList;
  vSSSSS: string;
begin
  t := TStringList.create; //создаём класс
  t.text := stringReplace(vID, ',', #13#10, [rfReplaceAll]);
  for j := 0 to T.Count - 1 do
  begin
    vSSSSS := T[j];
    if vSSSSS <> '' then
    begin
      vIDO := StrToInt(T[j]);
      for i := 0 to List.Items.Count - 1 do
      begin
        if Integer(List.Items.Item[i].Data) = vIDO then
        begin
          //frm.Echo(IntToStr(Integer(List.Items.Item[i].Data)) + ' = ' + IntToStr(vIDO));
          List.Items.Item[i].Checked := True
        end;
      end;
    end;
  end;
end;

constructor TObjectClasses.CreateObj(frmSS: TfrmSubSystems; ListObj: TListView);
begin
  inherited Create;
  frm := frmSS;
  List := ListObj;
end;

destructor TObjectClasses.Destroy;
begin
end;

initialization
  TAutoObjectFactory.Create(ComServer, TObjectClasses, Class_ObjectClasses,
    ciMultiInstance, tmApartment);
end.
