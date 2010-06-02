library ExtMD;

{$R 'string.res' 'string.rc'}

uses
  ComServ,
  ExtMD_TLB in 'ExtMD_TLB.pas',
  FormExtMD in 'FormExtMD.pas' {frmExtMD: TActiveForm},
  MD in 'MD.pas',
  ListUsers in 'ListUsers.pas';

{$E dll}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
