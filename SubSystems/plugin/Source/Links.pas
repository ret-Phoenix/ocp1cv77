unit Links;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, AxCtrls, Classes, SubSystems_TLB, MDTree,
  Windows, Controls, SysUtils, ComCtrls,
  OpenConf_TLB, FormSubSystemsMain, StdVcl;

type
  TLinks = class(TAutoObject, ILinks)
  private
    frm: TfrmSubSystems;
    List: TTreeView;
    Config: IConfigurator;
  public
    procedure Initialize; override;
    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy;

    procedure Refresh; safecall;
    procedure ListToText; safecall;
    function GetObj: OleVariant; safecall;
    function GetText: WideString; safecall;
  protected

  end;

implementation

uses ComServ;
//------------------------------------------------------------------------------

procedure TLinks.Refresh;
var
  Met: IMetaDataObj;
  vMet: IMetaDataObjArray;
  i: Integer;
//  LItem: TListItem;
  vMDTree: TMDTree;
begin
  vMDTree := TMDTree.CreateObj(frm, Config);
  //List.Items.BeginUpdate;
  List.Items.Clear;
  Met := vMDTree.ObjByCursor; //ObjByCursor();
  if Met = nil then
    exit;
  vMet := Config.MetaData.TestRefers(Met.ID, True);
  for i := 0 to vMet.Count - 1 do
  begin
    frm.TreeViewLinks.Items.AddChildObject(nil, vMet.item[i].FullName,
      frm.CreateData(vMet.item[i], 0, 0, 0, '-'));
  end;
  //frm.TreeViewLinks.Items.EndUpdate;
end;
//------------------------------------------------------------------------------

procedure TLinks.ListToText;
var
  i: integer;
begin
  for i := 0 to list.Items.Count - 1 do
  begin
    frm.Echo(list.Items.Item[i].Text);
  end;
end;
//------------------------------------------------------------------------------

function TLinks.GetObj: OleVariant;
begin
  Result := varEmpty;
  if list.Selected = nil then
    exit;
  Result := PMyRec(List.Selected.Data).MDObj;
end;
//------------------------------------------------------------------------------

function TLinks.GetText: WideString;
begin
  Result := '';
  if List.Selected = nil then
    exit;
  Result := List.Selected.Text;
end;
//------------------------------------------------------------------------------

constructor TLinks.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.TreeViewLinks;
  Config := vConfig;
end;
//------------------------------------------------------------------------------

destructor TLinks.Destroy;
begin
end;
//------------------------------------------------------------------------------

procedure TLinks.Initialize;
begin
  inherited Initialize;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TLinks, Class_Links,
    ciMultiInstance, tmApartment);
end.
