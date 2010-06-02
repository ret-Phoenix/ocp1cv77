unit TestEvents;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, StdVcl, Dialogs;

type
  TTestEvents = class(TAutoObject, IConnectionPointContainer, ITestEvents)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ITestEventsEvents;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    procedure MsgMy; safecall;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ;

procedure TTestEvents.MsgMy; safecall
begin
  ShowMessage('TestMyNew + Event');
end;

procedure TTestEvents.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITestEventsEvents;
end;

procedure TTestEvents.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTestEvents, Class_TestEvents,
    ciMultiInstance, tmApartment);
end.
