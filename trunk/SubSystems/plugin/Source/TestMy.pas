unit TestMy;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SubSystems_TLB, StdVcl,dialogs;

type
  TTestMy = class(TAutoObject, ITestMy)
  public
    procedure MyMess; safecall;
  protected

  end;

implementation

uses ComServ;

procedure TTestMy.MyMess();
begin
  ShowMessage('ok');
end;


initialization
  TAutoObjectFactory.Create(ComServer, TTestMy, Class_TestMy,
    ciMultiInstance, tmApartment);
end.
