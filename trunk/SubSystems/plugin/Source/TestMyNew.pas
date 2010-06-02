unit TestMyNew;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, StdVcl, Messages, Dialogs;

type
  TTestMyNew = class(TAutoObject, ITestMyNew)
  public
    procedure MsgMy; safecall;
  protected

  end;

implementation

uses ComServ;

procedure TTestMyNew.MsgMy; safecall
begin
  ShowMessage('TestMyNew');
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTestMyNew, Class_TestMyNew,
    ciMultiInstance, tmApartment);
end.
