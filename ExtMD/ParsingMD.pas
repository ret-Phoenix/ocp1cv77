unit ParsingMD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,

  ComCtrls, ToolWin, ActiveX, AxCtrls, ZLibEx,
  ExtCtrls, Consts;

{ TMyParser }
type
  TMyParser = class(TObject)
  private
    FStream: TStringStream;
    FStartParamPos: Longint;
    FEndParamPos: Longint;
    FStartProcBody: Longint;
    FEndProcBody: Longint;
    FProcName: string;
    FParamList: string;
    procedure SkipBlanks;
    function Read: Char; overload;
    function Read(var B: Char): Char; overload;
  public
    constructor Create(Stream: TStream); overload;
    constructor Create(Stream: string); overload;
    destructor Destroy; override;
    procedure Reset;
    function GetNextProc: boolean;
    function GetStartProc: Longint;
    function GetStartModule: Longint;
    function IsEndStream: boolean;
    function ReadNextToken: string;
    function FindToken(StartPos, EndPos: Longint; Token: string): boolean;
    function ReadString(P, L: Longint): string;
    function GetLastBlanks(P: Longint): string;
  end;

  //
  // хранение данных в списке баз
type
  ListData = ^TListData;
  TListData = record
    ID: string;
    TypeValue: string;
    WorkWithMD: Integer;
  end;

var
  vSave: Boolean;
  { описание процедур и функций }
procedure CopyStreamFromStream(inStream, outStream: TStream);
//  procedure ReadModules(vClass : String ; vPart : String ; vID : String ; vModule : String);
//procedure ReadModules(vClass: WideString; vPart: WideString; vID: string;
//  vModule: string);
procedure ReadModules(
  RootStorage: IStorage;
  vClass: WideString;
  vPart: WideString;
  vID: string;
  vModule: string;
  vFileName: string
  );
//procedure ReadModule(MDStream: IStream);
function ReadModule(MDStream: IStream; vFileName: string): TStringStream;
//procedure ReadForm(MDStream: IStream);
function ReadForm(MDStream: IStream; vFileName: string): TStringStream;
function PackString(Source: string): string;
procedure DecompressData(S: TMemoryStream);
procedure CompressData(S: TMemoryStream);
function ParseString(Source: string): TStringList;
procedure ReadStorageData(vStorage: IStorage; vModule: string; vFileName:
  string);

function _GetNameByID(vList: TStringList; vID: string; vNumStr: Integer):
  string;

function ReadNamesFromContainerContents(Root:IStorage): WideString;

implementation

uses FormExtMD;

{==============================================================================}
{*********** процедуры и функции парсера **************}
{----------- Private -----------}

procedure TMyParser.SkipBlanks;
var
  B: Char;
begin
  B := #0;
  if not IsEndStream then
  begin
    while Read(B) in [#1..#32] do
      ;
    if B = '/' then
      if Read = '/' then
      begin
        {пропускаем комментарий до конца строки}
        while not (Read in [#0, #10, #13]) do
          ;
        SkipBlanks;
      end
      else
        FStream.Seek(-1, soFromCurrent)
    else
      FStream.Seek(-1, soFromCurrent);
  end;
end;
//---------------------------------------------------------------------------

function TMyParser.Read(var B: Char): Char;
begin
  if IsEndStream then
    B := #0
  else
    FStream.Read(B, 1);
  Result := B;
end;
//---------------------------------------------------------------------------

function TMyParser.Read: Char;
var
  B: Char;
begin
  Result := Read(B);
end;
//---------------------------------------------------------------------------
{----------- Private end -----------}
//
{----------- Public -----------}
{TMyParser - начало описания методов}

constructor TMyParser.Create(Stream: TStream);
begin
  FStream := TStringStream.Create('');
  CopyStreamFromStream(Stream, FStream);
  Reset;
end;
//---------------------------------------------------------------------------

constructor TMyParser.Create(Stream: string);
begin
  FStream := TStringStream.Create(Stream);
  Reset;
end;
//---------------------------------------------------------------------------

destructor TMyParser.Destroy;
begin
  FStream.Free;
end;
//---------------------------------------------------------------------------

procedure TMyParser.Reset;
begin
  FStream.Position := 0;
  FStartParamPos := 0;
  FEndParamPos := 0;
  FStartProcBody := 0;
  FProcName := '';
  FParamList := '';
end;
//---------------------------------------------------------------------------

function TMyParser.GetNextProc: boolean;
var
  St: string;
  B, D: Char;
begin
  Result := False;
  SkipBlanks;
  while not IsEndStream do
  begin
    {попробуем найти начало процедуры}
    St := ReadNextToken;
    if (ANSIUPPERCASE(St) = ANSIUPPERCASE('Процедура')) or
      (ANSIUPPERCASE(St) = ANSIUPPERCASE('Procedure')) or
      (ANSIUPPERCASE(St) = ANSIUPPERCASE('Функция')) or
      (ANSIUPPERCASE(St) = ANSIUPPERCASE('Function')) then
    begin
      {пытаемся получить имя процедуры}
      FProcName := ReadNextToken;
      {теперь ищем параметры процедуры}
      SkipBlanks;
      while not (Read(B) in [#0, '(']) do
        ;
      if B = #0 then
        Exit;
      FStartParamPos := FStream.Position;
      {выбираем имена параметров}
      FParamList := '';
      while True do
      begin
        case Read of
          #0: Exit;
          ',': SkipBlanks;
          ')': Break;
          '=':
            begin
              SkipBlanks;
              while not (Read(B) in [',', ')', #0]) do
              begin
                if B in ['"', ''''] then
                begin
                  D := B;
                  while True do
                  begin
                    while not (Read(B) in [#0, D]) do
                      ;
                    if B = #0 then
                      Exit;
                    if Read <> D then
                      Break;
                  end;
                end;
                SkipBlanks;
              end;
              FStream.Seek(-1, soFromCurrent);
            end
        else
          begin
            FStream.Seek(-1, soFromCurrent);
            SkipBlanks;
            FParamList := FParamList + ReadNextToken + #13#10;
          end;
        end;
      end;
      FEndParamPos := FStream.Position - 1;
      FStartProcBody := GetStartProc;
      SkipBlanks;
      if IsEndStream then
        Exit;
      St := ReadNextToken;
      {проверим на предварительное определение}
      if (ANSIUPPERCASE(St) = ANSIUPPERCASE('Далее')) or
        (ANSIUPPERCASE(St) = ANSIUPPERCASE('Forward')) then
        Exit;
      FStream.Position := FEndParamPos + 1;
      repeat
        FEndProcBody := FStream.Position;
        St := ReadNextToken;
      until (ANSIUPPERCASE(St) = ANSIUPPERCASE('КонецПроцедуры'))
        or
        (ANSIUPPERCASE(St) = ANSIUPPERCASE('EndProcedure')) or
        (ANSIUPPERCASE(St) = ANSIUPPERCASE('КонецФункции')) or
        (ANSIUPPERCASE(St) = ANSIUPPERCASE('EndFunction')) or
        IsEndStream;
      if (ANSIUPPERCASE(St) <> ANSIUPPERCASE('КонецПроцедуры'))
        and
        (ANSIUPPERCASE(St) <> ANSIUPPERCASE('EndProcedure')) and
        (ANSIUPPERCASE(St) <> ANSIUPPERCASE('КонецФункции')) and
        (ANSIUPPERCASE(St) <> ANSIUPPERCASE('EndFunction')) and
        IsEndStream then
        FEndProcBody := FStream.Position;
      Result := True;
      Break;
    end;
  end;
end;
//---------------------------------------------------------------------------

function TMyParser.GetStartProc: Longint;
var
  S, L: Longint;
  St: string;
  B: Char;
begin
  repeat
    SkipBlanks;
    S := FStream.Position;
    while (Read(B) in ['A'..'Z', 'a'..'z', 'А'..'Я', 'а'..'я', ';']) and not
      IsEndStream do
      ;
    if B <> #0 then
      FStream.Seek(-1, soFromCurrent);
    L := FStream.Position - S;
    St := ReadString(S, L);
    if (ANSIUPPERCASE(St) = ANSIUPPERCASE('Перем')) or
      (ANSIUPPERCASE(St) = ANSIUPPERCASE('Var')) then
    begin
      {пропустим переменные процедуры}
      while (Read(B) <> ';') and not IsEndStream do
        if B in [#0..#32, '/'] then
          SkipBlanks;
      S := FStream.Position;
      if IsEndStream then
        Break;
    end
    else
      Break;
  until False;
  FStream.Position := S;
  Result := S;
end;
//---------------------------------------------------------------------------

function TMyParser.GetStartModule: Longint;
begin
  FStream.Position := 0;
  Result := GetStartProc;
end;
//---------------------------------------------------------------------------

function TMyParser.IsEndStream: boolean;
begin
  Result := FStream.Position >= FStream.Size;
end;
//---------------------------------------------------------------------------

function TMyParser.ReadNextToken: string;
var
  B: Char;
begin
  SkipBlanks;
  Result := '';
  while Read(B) in ['A'..'Z', 'a'..'z', 'А'..'Я', 'а'..'я', '0'..'9', '_']
    do
    Result := Result + B;
  if (B <> #0) and (Result <> '') then
    FStream.Seek(-1, soFromCurrent);
end;
//---------------------------------------------------------------------------

function TMyParser.FindToken(StartPos, EndPos: Longint; Token: string): boolean;
var
  S: Longint;
begin
  Result := False;
  S := FStream.Position;
  FStream.Position := StartPos;
  while (FStream.Position < EndPos) and not IsEndStream do
    if ANSIUPPERCASE(ReadNextToken) = ANSIUPPERCASE(Token) then
    begin
      Result := True;
      Break;
    end;
  FStream.Position := S;
end;
//---------------------------------------------------------------------------

function TMyParser.ReadString(P, L: Longint): string;
var
  S: Longint;
begin
  S := FStream.Position;
  FStream.Position := P;
  Result := FStream.ReadString(L);
  FStream.Position := S;
end;
//---------------------------------------------------------------------------

function TMyParser.GetLastBlanks(P: Longint): string;
var
  L, D: Longint;
begin
  L := 0;
  D := FStream.Position;
  FStream.Position := P;
  FStream.Seek(-1, soFromCurrent);
  while FStream.Position > 0 do
  begin
    if not (Read in [#1..#9, #11, #12, #14..#31]) then
      Break;
    L := L + 1;
    FStream.Seek(-2, soFromCurrent);
  end;
  Result := FStream.ReadString(L);
  FStream.Position := D;
end;
{----------- Public end -----------}
{*********** процедуры и функции парсера **************}
//
{*********** вспомогательные процедуры и функции ***********}

procedure CopyStreamFromStream(inStream, outStream: TStream);
var
  B: Byte;
begin
  inStream.Position := 0;
  outStream.Position := 0;
  while inStream.Position < inStream.Size do
  begin
    inStream.Read(B, 1);
    outStream.Write(B, 1);
  end;
end;
//---------------------------------------------------------------------------

function ParseString(Source: string): TStringList;
var
  P, S: PChar;
  InClass: boolean;
  ClassCount, ParamNum: integer;
  St: string;
  vStr: TStringList;
begin
  vStr := TStringList.Create;
  St := PackString(Source);
  P := PChar(St);
  InClass := False;
  ParamNum := 0;
  while P^ <> #0 do
    case P^ of
      '{': // открывается подкласс
        if not InClass then
        begin
          InClass := True;
          Inc(P);
        end
        else
        begin
          S := P;
          ClassCount := 1;
          Inc(P);
          while True do
            case P^ of
              '}':
                begin
                  ClassCount := ClassCount - 1;
                  if ClassCount = 0 then
                    Break;
                  Inc(P);
                end;
              '{':
                begin
                  ClassCount := ClassCount + 1;
                  Inc(P);
                end;
              '"':
                while True do
                begin
                  Inc(P);
                  while not (P^ in [#0, '"']) do
                  begin
                    Inc(P);
                  end;
                  if P^ = #0 then
                    Break;
                  Inc(P);
                  if P^ <> '"' then
                    Break;
                end;
              #0: Break;
            else
              Inc(P);
            end;
          vStr.Values['Param' + IntToStr(ParamNum)] := Copy(S, 1, P - S + 1);
          if P^ <> #0 then
            Inc(P);
        end;
      '}': //закрывается класс
        Break;
      ',': //разделитель параметров
        begin
          ParamNum := ParamNum + 1;
          Inc(P);
        end;
      '"': //новый параметр
        begin
          Inc(P);
          S := P;
          while True do
          begin
            while not (P^ in [#0, '"']) do
              Inc(P);
            if P^ = #0 then
              Break;
            Inc(P);
            if P^ <> '"' then
              Break;
            Inc(P);
          end;
          vStr.Values['Param' + IntToStr(ParamNum)] := Copy(S, 1, P - S - 1);
        end;
    else
      Inc(P);
    end;
  //ShowMessage('from Parser: ' + IntToStr(ParamNum));
  if vSave then
  begin
    vStr.SaveToFile('\tmp\' + vStr.Values['Param0']);
  end;
  Result := vStr;
end;
//---------------------------------------------------------------------------

function PackString(Source: string): string;
var
  P: PChar;
begin
  P := PChar(Source);
  Result := '';
  while P^ <> #0 do
  begin
    if P^ = #13 then
      Result := Result + '¶'
    else if P^ <> #10 then
      Result := Result + P^;
    Inc(P);
  end;
end;
//---------------------------------------------------------------------------
{******* компрес и декомпрес потока ********}
{*** Расшифровка зипованного потока ***}

procedure DecompressData(S: TMemoryStream);
var
  InStream: TMemoryStream;
  ZStream: TZDecompressionStream;
  L, i: Longint;
  buf: array[0..$EFFFF] of Byte;
begin
  InStream := TMemoryStream.Create;
  try
    CopyStreamFromStream(S, InStream);
    InStream.Position := 0;
    ZStream := TZDecompressionStream.Create(InStream);
    try
      TMemoryStream(S).Clear;
      L := ZStream.Read(buf, SizeOf(buf));
      for i := 0 to L - 1 do
        S.Write(buf[i], 1);
    finally
      ZStream.Free;
    end;
  finally
    InStream.Free;
  end;
end;
//---------------------------------------------------------------------------
{*** Зипование потока ***}

procedure CompressData(S: TMemoryStream);
var
  OutStream: TMemoryStream;
  ZStream: TZCompressionStream;
  B: Byte;
begin
  OutStream := TMemoryStream.Create;
  try
    ZStream := TZCompressionStream.Create(OutStream, zcDefault);
    try
      S.Position := 0;
      while S.Position < S.Size do
      begin
        S.Read(B, 1);
        ZStream.Write(B, 1);
      end;
    finally
      ZStream.Free;
    end;
    TMemoryStream(S).Clear;
    S.Write(OutStream.Memory^, OutStream.Size);
  finally
    OutStream.Free;
  end;
end;

procedure ReadStorageData(vStorage: IStorage; vModule: string; vFileName:
  string);
var
  S: WideString;
  MDStream: IStream;
  WorkBookStorage, MDStorage: IStorage;
begin
  try
    if vStorage.OpenStorage('WorkBook',
      nil,
      //OF_READWRITE or STGM_SHARE_EXCLUSIVE,
      STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE,
      nil,
      0,
      MDStorage) <> S_OK then
      //Exit;
      MDStorage := vStorage;

    if vModule = 'Form' then
    begin
      s := 'Dialog Stream';
      if MDStorage.OpenStream(PWideChar(S),
        nil,
        //OF_READWRITE or STGM_SHARE_EXCLUSIVE,
        STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE,
        0,
        MDStream) = S_OK then
        ReadForm(MDStream, vFileName);
    end;

    if vModule = 'Module' then
    begin
      s := 'MD Programm text';
      if MDStorage.OpenStream(PWideChar(S),
        nil,
        //OF_READWRITE or STGM_SHARE_EXCLUSIVE,
        STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE,
        0,
        MDStream) = S_OK then
        ReadModule(MDStream, vFileName);
    end;
    //except
  finally
    // nothing
  end;
end;
{************ proc & func for geting data from MD ***********}
//---------------------------------------------------------------------------

procedure ReadModules(
  RootStorage: IStorage;
  vClass: WideString;
  vPart: WideString;
  vID: string;
  vModule: string;
  vFileName: string
  );
var
  MDStream: IStream;
  //  MDStorage, DocStorage, RootStorage, WorkBookStorage: IStorage;
  MDStorage, DocStorage, WorkBookStorage: IStorage;
  MemoStream: TStream;
  Ole: TOleStream;
  s: WideString;
  vStr: PChar;
begin
  try
    if RootStorage = nil then
      exit;

    if RootStorage.OpenStorage(pWideChar(vClass),
      nil, //RootStorage,
      //OF_READWRITE or STGM_SHARE_EXCLUSIVE,
      STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE,
      nil,
      0,
      DocStorage) <> S_OK then
      Exit;
    s := vPart + '_Number' + vID;
    if DocStorage.OpenStorage(pWideChar(S),
      nil,
      //OF_READWRITE or STGM_SHARE_EXCLUSIVE,
      STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE,
      nil,
      0,
      WorkBookStorage) <> S_OK then
      Exit;
    ReadStorageData(WorkBookStorage, vModule, vFileName);
  finally
    // nothing
  end;
end;
//---------------------------------------------------------------------------

//procedure ReadModule(MDStream: IStream);
//var
//  MemoStream: TMemoryStream;
//  Ole: TOleStream;
//  j, k, ParamNum: integer;
//  Parser: TMyParser;
//  P0, P1, P2, P3: string;
//  P: Longint;
//  outStream: TStringStream;
//  vL: TStringList;
//begin
//  Ole := TOleStream.Create(MDStream);
//  MemoStream := TMemoryStream.Create;
//  CopyStreamFromStream(Ole, MemoStream);
//  DecompressData(MemoStream);
//  MemoStream.Position := 0;
//  Parser := TMyParser.Create(MemoStream);
//  try
//    vL := TStringList.Create;
//    vL.LoadFromStream(Parser.FStream);
//    vL.SaveToFile('c:\test1.md_text');
//    Parser.Reset;
//  finally
//    Parser.Free;
//    MemoStream.Free;
//    Ole.Free;
//  end;
//
//end;

function ReadModule(MDStream: IStream; vFileName: string): TStringStream;
var
  MemoStream: TMemoryStream;
  Ole: TOleStream;
  j, k, ParamNum: integer;
  Parser: TMyParser;
  P0, P1, P2, P3: string;
  P: Longint;
  outStream: TStringStream;
  vL: TStringList;

begin
  try
    Ole := TOleStream.Create(MDStream);
    MemoStream := TMemoryStream.Create;
    CopyStreamFromStream(Ole, MemoStream);
    DecompressData(MemoStream);
    MemoStream.Position := 0;
    Parser := TMyParser.Create(MemoStream);

    vL := TStringList.Create;
    vL.LoadFromStream(Parser.FStream);
    vL.SaveToFile(vFileName);

    Result := Parser.FStream;
    Parser.Reset;
  finally
    Parser.Free;
    MemoStream.Free;
    Ole.Free;
  end;

end;

function ReadForm(MDStream: IStream; vFileName: string): TStringStream;
var
  MemoStream: TMemoryStream;
  Ole: TOleStream;
  j, k, ParamNum: integer;
  Parser: TMyParser;
  P0, P1, P2, P3: string;
  P: Longint;
  outStream: TStringStream;
  vL: TStringList;
begin
  try
    Ole := TOleStream.Create(MDStream);
    MemoStream := TMemoryStream.Create;
    MemoStream.Position := 0;
    CopyStreamFromStream(Ole, MemoStream);
    Parser := TMyParser.Create(MemoStream);
    Result := Parser.FStream;
    vL := TStringList.Create;
    vL.LoadFromStream(Parser.FStream);
    vL.SaveToFile(vFileName);
    Parser.Reset;
  finally
    Parser.Free;
    MemoStream.Free;
    Ole.Free;
  end;
  //frmMainMDViewer.MDText.Lines.LoadFromStream(Parser.FStream);
end;

//---------------------------------------------------------------------------

//procedure ReadForm(MDStream: IStream);
//var
//  MemoStream: TMemoryStream;
//  Ole: TOleStream;
//  j, k, ParamNum: integer;
//  Parser: TMyParser;
//  P0, P1, P2, P3: string;
//  P: Longint;
//  outStream: TStringStream;
//begin
//  Ole := TOleStream.Create(MDStream);
//  MemoStream := TMemoryStream.Create;
//  MemoStream.Position := 0;
//  CopyStreamFromStream(Ole, MemoStream);
//  Parser := TMyParser.Create(MemoStream);
//  //frmMainMDViewer.MDText.Lines.LoadFromStream(Parser.FStream);
//end;

function _GetNameByID(vList: TStringList; vID: string; vNumStr: Integer):
  string;
var
  vRec: Integer;
  ParseList1: TStringList;
  vStr: string;
  i, vStart, vEnd: Integer;
  vSub: string;
begin

  for i := vNumStr to vList.Count - 1 do
  begin
    vStr := vList.Strings[i];
    vStart := Pos('{"' + vID + '","', vStr);
    if vStart <> 0 then
    begin
      vSub := Copy(vStr, vStart + Length(vID) + 5, vStart + 128);
      vEnd := Pos('","', vSub);
      Result := Copy(vSub, 0, vEnd - 1);
    end;
  end;

end;
//------------------------------------------------------------------------------
function ReadNamesFromContainerContents(Root:IStorage): WideString;
var
  MDStream: IStream;
  DocStorage : IStorage;
  Ole: TOleStream;
  Contents, IDList, PromList, PList1, PList2, PList3, PList4,
    PList5, PList6: TStringList;
  s: WideString;
  i, j, k, q: integer;
  B: Char;
  BakupNum: integer;
begin
  if Root = nil then
    Exit;
  if Root.OpenStream('Container.Contents', nil,
    STGM_DIRECT or STGM_READ or STGM_SHARE_EXCLUSIVE,
    0, MDStream) <> S_OK then
    Exit;
  Ole := TOleStream.Create(MDStream);
  IDList := TStringList.Create;
  try
    PromList := TStringList.Create;
    try
      Ole.Position := 0;
      k := 0;
      repeat
        Ole.Read(B, 1);
        k := k + 1;
      until B <> #255;
      for i := 100 to k do
        Ole.Read(B, 1);
      with TStringList.Create do
      try
        LoadFromStream(Ole);
        PromList := ParseString('{' + Text);
      finally
        Free;
      end;
      s := '';
      for i := 0 to PromList.Count - 1 do
      begin
        PList1 := ParseString(PromList.Values[PromList.Names[i]]);
        if PList1.Count <> 0 then
        begin
          if Result <> '' then
            s := ',';
          Result := Result + s + PList1.Values[PList1.Names[2]];
        end;
      end;
    finally
    end;
  finally
  end;
end;

//---------------------------------------------------------------------------

end.

