unit ext_icon;

interface
uses Windows, controls, contnrs, classes;
type

  TExtFileIcon = class(TObject)
  private
    fExtName: string;
    fExtIcon: HICON;
    fPosInImageList: integer;
  public
    property ExtName: string read fExtName write fExtName;
    property ExtIcon: HICON read fExtIcon write fExtIcon;
    property PosInImageList: integer read fPosInImageList write fPosInImageList;
    constructor Create(aExtname: string;
      aExtIcon: HICON;
      aPosInImageList: integer);
    destructor Destroy; override;
  end;

  TExtIconList = class(TObjectList)
  private
    fExtImageList: TImageList;
    procedure SetExtImageList(Value: TImageList);
  public
    property
      ExtImageList: TImageList read fExtImageList write SetExtImageList;
    function GetPosInImageList(aExtName: string): integer;
    destructor Destroy; override;
  end;

function GetAssociatedIcon(const AExtension: string; ASmall: Boolean): HIcon;

implementation

uses
  ShellApi, SysUtils, graphics;

function GetAssociatedIcon(const AExtension: string; ASmall: Boolean): HIcon;
var
  Info: TSHFileInfo;
  Flags: Cardinal;
begin
  if ASmall then
    Flags := SHGFI_ICON or SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES
  else
    Flags := SHGFI_ICON or SHGFI_LARGEICON or SHGFI_USEFILEATTRIBUTES;

  SHGetFileInfo(PChar(AExtension), FILE_ATTRIBUTE_NORMAL, Info, SizeOf(TSHFileInfo),
    Flags);
  Result := Info.hIcon;
end;

constructor TExtFileIcon.Create(aExtname: string;
  aExtIcon: HICON;
  aPosInImageList: integer);
begin
  inherited Create;
  fExtName := fExtName;
  fExtIcon := aExtIcon;
  fPosInImageList := aPosInImageList;
end;

destructor TExtFileIcon.Destroy;
begin
  fExtName := '';
  if fExtIcon <> 0 then DestroyIcon(fExtIcon);
  fExtIcon := 0;
  inherited Destroy;
end;

procedure TExtIconList.SetExtImageList(Value: TImageList);
begin
  fExtImageList := Value;
end;

function TExtIconList.GetPosInImageList(aExtName: string): integer;
var
  j: integer;
  xIcon: TIcon;
  s: string;
begin
  Result := -1;
  if Assigned(fExtImageList) then begin
    s := lowercase(ExtractFileExt(aExtName));
    for j := 0 to Count - 1 do begin
      if TExtFileIcon(Items[j]).ExtName = s then begin
        Result := TExtFileIcon(Items[j]).PosInImageList;
        Exit;
      end
    end;
    xIcon := TIcon.Create;
    xIcon.Handle := GetAssociatedIcon(s, true);
    Result := fExtImageList.AddIcon(xIcon);
    Add(TExtFileIcon.Create(s, xIcon.Handle, Result));
  end;
end;

destructor TExtIconList.Destroy;
begin
  fExtImageList := nil;
  Clear;
  inherited Destroy;
end;

end.

