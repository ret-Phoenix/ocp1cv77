library Project1;

{$R 'string.res' 'string.rc'}

uses
  ComServ,
  Project1_TLB in 'Project1_TLB.pas',
  SinkObject in 'SinkObject.pas',
  OpenConfEvents in 'OpenConfEvents.pas',
  Artbear_ActiveFormImpl1 in 'Artbear_ActiveFormImpl1.pas' {Artbear_ActiveFormX: TActiveForm} {Artbear_ActiveFormX: CoClass},
  OpenConf_TLB in '..\OpenConf_TLB.pas';

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
