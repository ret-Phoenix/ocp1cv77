unit ListUsers;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, ExtMD_TLB, StdVcl, Classes, AxCtrls, Dialogs, ParsingMD;


type
  TListUsers = class(TAutoObject, IListUsers)
  protected
    function ReadNamesList: WideString; safecall;
    procedure CloseFile; safecall;
    procedure OpenFile(var vFileName: WideString); safecall;
  public
    FileName : string;
    RootStorage: IStorage;
  end;

implementation

uses ComServ;

function TListUsers.ReadNamesList: WideString;
//var
//  MDStream: IStream;
//  DocStorage : IStorage;
//  Ole: TOleStream;
//  Contents, IDList, PromList, PList1, PList2, PList3, PList4,
//    PList5, PList6: TStringList;
//  s: WideString;
//  i, j, k, q: integer;
//  B: Char;
//  BakupNum: integer;
begin
  if StgOpenStorage(StringToOleStr(FileName),
    nil,
    STGM_DIRECT or STGM_READ or STGM_SHARE_DENY_WRITE,
    nil,
    0,
    RootStorage) <> S_OK then
    Exit;
    Result := ReadNamesFromContainerContents(RootStorage);
end;

procedure TListUsers.CloseFile;
begin
  RootStorage._Release;
  //RootStorage := nil;
end;

procedure TListUsers.OpenFile(var vFileName: WideString);
begin
  FileName := vFileName;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TListUsers, Class_ListUsers,
    ciMultiInstance, tmApartment);
end.
