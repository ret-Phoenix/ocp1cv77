unit OpenConfEvents;

// =======================================================================
// добавление обработки событий от Опенконф
// =======================================================================
//
// общая схема работы:
//
// определение поля класса-формы
//	var    FActivateWindowEventSink : TOpenConfEventSink;
//
//	при инициализации плагина
//
//  FActivateWindowEventSink := TOpenConfEventSink.Create;
//  FActivateWindowEventSink.OnTimer := OnTimer;
//  FActivateWindowEventSink.OnActivateWindow := OnActivateWindow;
//  FActivateWindowEventSink.Connect(FConfigurator);
//
//  OnTimer и  OnActivateWindow - соотвествующие методы формы
//
// =======================================================================

{$WARN SYMBOL_PLATFORM OFF}

interface

uses Windows, ActiveX, ComObj, SysUtils, OpenConf_TLB, SinkObject;

type

  EInvalidParamCount = class(Exception)
  end;

  EInvalidParamType = class(Exception)
  end;

  // Обработчик события, связанного с активацией окна
  TOpenConf_AllPluginsInit = procedure  of object;
  TOpenConf_OnTimer = procedure (TimerID: Integer) of object;
	TOpenConf_OnIdle = procedure of object;
  TOpenConf_OnActivateWindow = procedure (const Wnd: ICfgWindow;
  		bActive: WordBool) of object;
  TOpenConf_OnActivateMainWnd = procedure (bActive: WordBool) of object;
	TOpenConf_OnFileSaved = procedure(const Doc: ICfgDoc) of object;
	TOpenConf_OnQueryQuit = function: WordBool of object;
	TOpenConf_OnQuit = procedure of object;
  TOpenConf_OnDialogChange = procedure (const Dialog: IDialogDoc) of object;

  TOpenConfEventSink = class(TBaseSink)
  private
    FOnAllPluginsInit: TOpenConf_AllPluginsInit;
    FOnTimer: TOpenConf_OnTimer;
    FOnIdle : TOpenConf_OnIdle;
    FOnActivateWindow : TOpenConf_OnActivateWindow;
    FOnActivateMainWnd : TOpenConf_OnActivateMainWnd;
    FOnFileSaved: TOpenConf_OnFileSaved;
    FOnQueryQuit: TOpenConf_OnQueryQuit;
    FOnQuit: TOpenConf_OnQuit;
    FOnDialogChange: TOpenConf_OnDialogChange;

  protected
  	// для возможности порождения в потомках
    procedure DoAllPluginsInit; virtual;
    procedure DoTimer(TimerID: Integer); virtual;
    procedure DoIdle; virtual;
    procedure DoActivateWindow(const Wnd: ICfgWindow;
  		bActive: WordBool); virtual;
    procedure DoActivateMainWnd(bActive: WordBool); virtual;
    procedure DoFileSaved(const Doc: ICfgDoc);
    function	DoQueryQuit: WordBool;
    procedure DoQuit;
    procedure DoDialogChange(const Dialog: IDialogDoc);

    function DoInvoke (DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var dps : TDispParams; pDispIds : PDispIdList;
      VarResult, ExcepInfo, ArgErr: Pointer): HResult; override;
  public
    constructor Create;
    property AllPluginsInit: TOpenConf_AllPluginsInit read FOnAllPluginsInit write FOnAllPluginsInit;
    property OnTimer: TOpenConf_OnTimer read FOnTimer write FOnTimer;
    property OnIdle: TOpenConf_OnIdle read FOnIdle write FOnIdle;
    property OnActivateWindow: TOpenConf_OnActivateWindow read FOnActivateWindow write FOnActivateWindow;
    property OnActivateMainWnd: TOpenConf_OnActivateMainWnd read FOnActivateMainWnd write FOnActivateMainWnd;
    property OnFileSaved: TOpenConf_OnFileSaved read FOnFileSaved write FOnFileSaved; //dispid 10;
    property OnQueryQuit: TOpenConf_OnQueryQuit read FOnQueryQuit write FOnQueryQuit; //dispid 11;
    property OnQuit: TOpenConf_OnQuit read FOnQuit write FOnQuit; //dispid 12;
    property OnDialogChange: TOpenConf_OnDialogChange read FOnDialogChange write FOnDialogChange; //dispid 13;
  end;

// проверяет соответствие аргумента с заданным индексом заданному типу
function ValidType(Argument: TVariantArg; TypeId: Integer;
  RaiseException: Boolean): Boolean;

// проверяет количество переданных аргументов
function CheckArgCount(Count: Integer; Accepted: array of Integer;
  RaiseException: Boolean): Boolean;

// получает целое число из аргумента с заданным индексом
function IntValue(Argument: TVariantArg): Integer;

implementation

uses Dialogs;

// проверяет соответствие аргумента с заданным индексом заданному типу
function ValidType(Argument: TVariantArg; TypeId: Integer;
  RaiseException: Boolean): Boolean;
begin
//ShowMessage(IntToStr(Argument.vt));
 Result := Argument.vt = TypeId;
 if RaiseException and (not Result) then
   raise EInvalidParamType.Create('EInvalidParamType');
end;

// проверяет количество переданных аргументов
function CheckArgCount(Count: Integer; Accepted: array of Integer;
  RaiseException: Boolean): Boolean;
var
  I: Integer;
begin
  Result := FALSE;
  for I := Low(Accepted) to High(Accepted) do begin
    Result := Accepted[I] = Count;
    if Result then
      Break;
  end;
  if RaiseException and (not Result) then
    raise EInvalidParamCount.Create('EInvalidParamCount');
end;

// получает целое число из аргумента с заданным индексом
function IntValue(Argument: TVariantArg): Integer;
var
 VT: Word;
 ByRef: Boolean;
begin
 VT := Argument.vt;
 ByRef := (VT and VT_BYREF) = VT_BYREF;
 if ByRef then begin
   VT := VT and (not VT_BYREF);
   case VT of
     VT_I1: Result := Argument.pbVal^;
     VT_I2: Result := Argument.piVal^;
     VT_VARIANT: Result := Argument.pvarVal^;
   else
     Result := Argument.plVal^;
   end;
 end else
 case VT of
   VT_I1: Result := Argument.bVal;
   VT_I2: Result := Argument.iVal;
 else
   Result := Argument.lVal;
 end;
end;

{ TOpenConfEventSink }

constructor TOpenConfEventSink.Create;
begin
  inherited;
  // Устанавливаем корректный идентификатор приемника событий
  FSinkIID := IConfigEvents;
end;

procedure TOpenConfEventSink.DoAllPluginsInit;
begin
  if Assigned(FOnAllPluginsInit) then
    FOnAllPluginsInit;
end;

procedure TOpenConfEventSink.DoTimer(TimerID: Integer);
begin
  if Assigned(FOnTimer) then
    FOnTimer(TimerID);
end;

procedure TOpenConfEventSink.DoIdle;
begin
  if Assigned(FOnIdle) then
    FOnIdle;
end;

procedure TOpenConfEventSink.DoActivateWindow(const Wnd: ICfgWindow;
  		bActive: WordBool);
begin
  if Assigned(FOnActivateWindow) then
    FOnActivateWindow(Wnd, bActive);
end;

procedure TOpenConfEventSink.DoActivateMainWnd(bActive: WordBool);
begin
try
//	ShowMessage('1 DoActivateMainWnd');
finally
end;
  if Assigned(FOnActivateMainWnd) then
  begin
try
//	ShowMessage('2 DoActivateMainWnd');
finally
end;
    FOnActivateMainWnd(bActive);
  end;
end;

procedure TOpenConfEventSink.DoFileSaved(const Doc: ICfgDoc);
begin
  if Assigned(FOnFileSaved) then
    FOnFileSaved(Doc);
end;

function TOpenConfEventSink.DoQueryQuit: WordBool;
begin
  Result := false;{ TODO : OnQueryQuit - возвращаемое значение должно разрешать выход по умолчанию }
  if Assigned(FOnQueryQuit) then
    Result := FOnQueryQuit;
end;

procedure TOpenConfEventSink.DoQuit;
begin
  if Assigned(FOnQuit) then
    FOnQuit;
end;

procedure TOpenConfEventSink.DoDialogChange(const Dialog: IDialogDoc);
begin
  if Assigned(FOnDialogChange) then
    FOnDialogChange(Dialog);
end;

function TOpenConfEventSink.DoInvoke(DispID: Integer;
  const IID: TGUID; LocaleID: Integer; Flags: Word; var dps: TDispParams;
  pDispIds: PDispIdList; VarResult, ExcepInfo, ArgErr: Pointer): HResult;

 function _ValidType(Index, TypeId: Integer; RaiseException: Boolean): Boolean;
 // Проверяет параметр с номером Index на совпадение типа
 begin
   Result := ValidType(dps.rgvarg^[pDispIds^[Index]], TypeId, RaiseException);
 end;
 
//var v:IUnknown;p:pointer;b:wordBool;i:integer;
begin
//  Этот метод будет вызываться при возникновении события
//  в него могут быть переданы идентификаторы DispId, соответствующие идентификаторам
//  методов интерфейса, к которому мы подключены
//
//  IConfigEvents = dispinterface
//    ['{FF862868-BB20-44B2-949C-5EA7C09842EE}']
//    procedure ConfigWindowCreate; dispid 0;
//    procedure AllPluginsInit; dispid 1;
//    procedure MetaDataSaved(const FileName: WideString); dispid 2;
//    procedure OnMsgBox(const text: WideString; Style: MsgBoxStyles; DefAnswer: MsgBoxAnswers;
//                       var Answer: OleVariant); dispid 3;
//    procedure OnFileDialog(Saved: WordBool; const Caption: WideString; const Filter: WideString;
//                           var FileName: OleVariant; var Answer: OleVariant); dispid 4;
//    procedure OnDoModal(hWnd: Integer; const Caption: WideString; var Answer: OleVariant); dispid 5;
//    procedure OnTimer(TimerID: Integer); dispid 6;
//    procedure OnIdle; dispid 7;
//    procedure OnActivateWindow(const Wnd: ICfgWindow; bActive: WordBool); dispid 8;
//    procedure OnActivateMainWnd(bActive: WordBool); dispid 9;
//    procedure OnFileSaved(const Doc: ICfgDoc); dispid 10;
//    function OnQueryQuit: WordBool; dispid 11;
//    procedure OnQuit; dispid 12;
//    procedure OnDialogChange(const Dialog: IDialogDoc); dispid 13;
//  end;
//
//  Таким образом, для обработки события OnActivateWindow надо реализовать вызов с DispId = 8
//  и двумя параметрами типа ICfgWindow и WordBool

  Result := S_OK;

  case DispID of
    1 : begin
        CheckArgCount(dps.cArgs, [0], TRUE);
        DoAllPluginsInit;
      end;
    6 : begin
        CheckArgCount(dps.cArgs, [1], TRUE);
	    	DoTimer( dps.rgvarg^ [pDispIds^ [0]].plVal^ );
      end;
    7 : begin
        CheckArgCount(dps.cArgs, [0], TRUE);
	    	DoIdle;
			end;

    8 : begin
          try
            CheckArgCount(dps.cArgs, [2], TRUE);
            if _ValidType(0, varDispatch, true) then ;
            if _ValidType(1, varBoolean, true) then ;

            DoActivateWindow(IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as ICfgWindow,
                    dps.rgvarg^ [pDispIds^ [1]].vbool);
          except
//            on E: Exception do ShowMessage('Событие ActivateWindow: возникла ошибка - '+E.Message);
          end;
        end;

    9: begin
        CheckArgCount(dps.cArgs, [1], TRUE);
	    	if _ValidType(0, varBoolean, true) then ;
	    	DoActivateMainWnd( dps.rgvarg^ [pDispIds^ [0]].vbool );
    	end;
    10: begin
          CheckArgCount(dps.cArgs, [1], TRUE);
          if _ValidType(0, varDispatch, true) then ;
    			DoFileSaved(IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as ICfgDoc);
      	end;
    11: begin
          CheckArgCount(dps.cArgs, [0], TRUE);
        	OleVariant(VarResult^) := DoQueryQuit;
        end;
    12: begin
          CheckArgCount(dps.cArgs, [0], TRUE);
	    		DoQuit;
      	end;
    13: begin
          CheckArgCount(dps.cArgs, [1], TRUE);
          if _ValidType(0, varDispatch, true) then ;
    			DoDialogChange(IUnknown (dps.rgvarg^ [pDispIds^ [0]].unkval) as IDialogDoc);
      	end;
  else
    Result := DISP_E_MEMBERNOTFOUND;
  end;
end;

end.

