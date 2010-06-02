unit Options;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, ExtFormsTree_TLB, StdVcl, IniFiles,
  SysUtils, Artbear_ActiveFormImpl1;

type
  TOptions = class(TAutoObject, IConnectionPointContainer, IOptions)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IOptionsEvents;

    frm: TTreeeFilesActiveFormX;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    constructor CreateObj(frmEF: TTreeeFilesActiveFormX);
    destructor Destroy;

  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure Get(const vPath: WideString); safecall;
    procedure Save(const vPath: WideString); safecall;
    function GetDoVariant: SYSINT; safecall;
    function GetFileOperation: SYSINT; safecall;
    function GetMDObjView: SYSINT; safecall;
    function GetViewIBDir: SYSINT; safecall;
    procedure SetDoVariant(val: SYSINT); safecall;
    procedure SetFileOperation(val: SYSINT); safecall;
    procedure SetMDObjView(val: SYSINT); safecall;
    procedure SetViewIBDir(val: SYSINT); safecall;
    function GetMDObjViewVariant: SYSINT; safecall;
    procedure SetMDObjViewVariant(val: SYSINT); safecall;
  end;

implementation

uses ComServ;

procedure TOptions.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IOptionsEvents;
end;

procedure TOptions.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;

procedure TOptions.Get(const vPath: WideString);
var
  OptIni: TIniFile;
  vPathL, vNameL: string;
begin
  if vPath = '' then
    vPathL := IncludeTrailingBackslash(frm.FConfigurator.IBDir) + 'ExtFrmsTree.ini'
  else
    vPathL := vPath;
  vNameL := 'Last';
  OptIni := TIniFile.Create(vPathL);
  with OptIni do begin
    SetDoVariant(ReadInteger(vNameL, 'DoVariant', 0));
    SetFileOperation(ReadInteger(vNameL, 'FileOperation', 0));
    SetViewIBDir(ReadInteger(vNameL, 'ViewIBDir', 1));
    SetMDObjView(ReadInteger(vNameL, 'ObjFromMD', 1));
    SetMDObjViewVariant(ReadInteger(vNameL, 'ObjFromMDView', 1));
    Free;
  end;
end;

procedure TOptions.Save(const vPath: WideString);
var
  OptIni: TIniFile;
  vFolder: WideString;
  vPathL, vNameL: string;
begin
  if vPath = '' then
    vPathL := IncludeTrailingBackslash(frm.FConfigurator.IBDir) + 'ExtFrmsTree.ini'
  else
    vPathL := vPath;
  vNameL := 'Last';
  OptIni := TIniFile.Create(vPathL);
  with OptIni do begin
    WriteInteger(vNameL, 'DoVariant', GetDoVariant);
    WriteInteger(vNameL, 'FileOperation', GetFileOperation);
    WriteInteger(vNameL, 'ViewIBDir', GetViewIBDir);
    WriteInteger(vNameL, 'ObjFromMD', GetMDObjView);
    WriteInteger(vNameL, 'ObjFromMDView', GetMDObjViewVariant);
    Free;
  end;
end;

constructor TOptions.CreateObj(frmEF: TTreeeFilesActiveFormX);
begin
  inherited Create;
  frm := frmEF;
end;
//------------------------------------------------------------------------------

destructor TOptions.Destroy;
begin
end;

function TOptions.GetDoVariant: SYSINT;
begin
  Result := frm.ComboBoxToDoWithSameName.ItemIndex;
end;

function TOptions.GetFileOperation: SYSINT;
begin
  if frm.cbMove.Checked = true then
    Result := 1
  else
    Result := 0;
end;

function TOptions.GetMDObjView: SYSINT;
begin
  if frm.cbObjFromMD.Checked = true then
    Result := 1
  else
    Result := 0;
end;

function TOptions.GetViewIBDir: SYSINT;
begin
  if frm.cbIBDirFiles.Checked = true then
    Result := 1
  else
    Result := 0;
end;

procedure TOptions.SetDoVariant(val: SYSINT);
begin
  frm.ComboBoxToDoWithSameName.ItemIndex := val;
end;

procedure TOptions.SetFileOperation(val: SYSINT);
begin
  if val = 1 then
    frm.cbMove.Checked := true
  else
    frm.cbMove.Checked := false;
end;

procedure TOptions.SetMDObjView(val: SYSINT);
begin
  if val = 1 then
    frm.cbObjFromMD.Checked := true
  else
    frm.cbObjFromMD.Checked := false;
end;

procedure TOptions.SetViewIBDir(val: SYSINT);
begin
  if val = 1 then
    frm.cbIBDirFiles.Checked := true
  else
    frm.cbIBDirFiles.Checked := false;
end;

function TOptions.GetMDObjViewVariant: SYSINT;
begin
  Result := frm.ComboBoxMDViewVariant.ItemIndex;
end;

procedure TOptions.SetMDObjViewVariant(val: SYSINT);
begin
  frm.ComboBoxMDViewVariant.ItemIndex := val;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TOptions, Class_Options,
    ciMultiInstance, tmApartment);
end.

