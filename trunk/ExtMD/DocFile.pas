unit DocFile;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, ExtMD_TLB, StdVcl;

type
  TDocFile = class(TAutoObject, IDocFile)
  protected

  end;

implementation

uses ComServ;

initialization
  TAutoObjectFactory.Create(ComServer, TDocFile, Class_DocFile,
    ciMultiInstance, tmApartment);
end.
