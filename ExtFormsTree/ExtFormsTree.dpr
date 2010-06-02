library ExtFormsTree;

{$R 'string.res' 'string.rc'}

uses
  ComServ,
  Artbear_ActiveFormImpl1 in 'Artbear_ActiveFormImpl1.pas' {TreeeFilesActiveFormX: TActiveForm} {iExtFormsTree_ActiveFormX: CoClass},
  OpenConf_TLB in '..\OpenConf_TLB.pas',
  ExtFormsTree_TLB in 'ExtFormsTree_TLB.pas',
  FormEditPath in 'FormEditPath.pas' {frmEditPath},
  ExtFormsList in 'ExtFormsList.pas' {ExtFrmsList: CoClass},
  TuningExtformsList in 'TuningExtformsList.pas' {TuningExtformsList: CoClass},
  Options in 'Options.pas' {Options: CoClass},
  Bookmarks in 'Bookmarks.pas' {Bookmarks: CoClass};

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

