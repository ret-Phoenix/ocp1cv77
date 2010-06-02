unit Bookmarks;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, AxCtrls, Classes, SubSystems_TLB, MDTree,
  Messages, Controls, Forms, Dialogs, SysUtils,
  OpenConf_TLB, ComCtrls, FormSubSystemsMain, StdVcl;

type
  TBookmarks = class(TAutoObject, IBookmarks)
  private
    vBookmarks: TTreeView;

    frm: TfrmSubSystems;
//    Config: IConfigurator;
    Tree: TTreeView;
    vMDTree: TMDTree;
    vCurrnetBookmark: TTreeNode;
  public
    constructor CreateObj(frmSS: TfrmSubSystems);
    destructor Destroy;

    function GetBookmarks: WideString; safecall;
    procedure Add; safecall;
    procedure Delete; safecall;
    procedure Clear; safecall;
    procedure Next; safecall;
    procedure Previos; safecall;
    procedure GoBookmark(var vName: WideString); safecall;
  protected

  end;

implementation

uses ComServ;

function TBookmarks.GetBookmarks: WideString;
var
  i: Integer;
begin
  for i := 0 to vBookmarks.Items.Count - 1 do
  begin
    Result := Result + vBookmarks.Items.Item[i].Text + #13#10;
  end;
end;

procedure TBookmarks.Add;
var
//  vNode: TTreeNode;
  vFullName: string;
  i: Integer;
begin
  if frm.TreeViewMetadata.Selected = nil then
    exit;

  vFullName := frm.vMDTree.GetCurrentMDObjFullName;
  if vFullName = '' then
    vFullName := Tree.Selected.Text;
  for i := 0 to vBookmarks.Items.Count - 1 do
  begin
    if vFullName = vBookmarks.Items.Item[i].Text then
    begin
      Break;
      exit;
    end;
  end;
  vCurrnetBookmark := vBookmarks.Items.AddObject(nil, vFullName,
    Pointer(Tree.Selected));
  //PMyRec(Tree.Selected).IsBookmark := true;
end;

procedure TBookmarks.Delete;
begin
  if vBookmarks.Items.Count = 0 then
    exit;

  if vCurrnetBookmark.AbsoluteIndex <> 0 then
  begin
    vBookmarks.Items.Delete(vCurrnetBookmark);
    if vBookmarks.Items.Count <> 0 then
      vCurrnetBookmark := vBookmarks.Items.Item[vCurrnetBookmark.AbsoluteIndex -
        1]
    else
      vCurrnetBookmark := nil;
  end
  else
  begin
    vBookmarks.Items.Delete(vCurrnetBookmark);
    if vBookmarks.Items.Count <> 0 then
      vCurrnetBookmark := vBookmarks.Items.Item[vBookmarks.Items.count - 1]
    else
      vCurrnetBookmark := nil;
  end;
  //PMyRec(Tree.Selected).IsBookmark := false;
end;

procedure TBookmarks.Clear;
begin
  vBookmarks.Items.Clear;
end;

procedure TBookmarks.Next;
begin
  if vBookmarks.Items.Count = 0 then
    exit;

  if vCurrnetBookmark.AbsoluteIndex <> vBookmarks.Items.Count - 1 then
  begin
    vCurrnetBookmark := vBookmarks.Items.Item[vCurrnetBookmark.AbsoluteIndex +
      1];
  end
  else
  begin
    vCurrnetBookmark := vBookmarks.Items.Item[0];
  end;
  vMDTree.List.Select(TTreeNode(vCurrnetBookmark.data));
end;

procedure TBookmarks.Previos;
var
  vNode: TTreeNode;
begin
  if vBookmarks.Items.Count = 0 then
    exit;

  if vCurrnetBookmark.AbsoluteIndex <> 0 then
  begin
    vCurrnetBookmark := vBookmarks.Items.Item[vCurrnetBookmark.AbsoluteIndex -
      1];
  end
  else
  begin
    vCurrnetBookmark := vBookmarks.Items.Item[vBookmarks.Items.count - 1];
  end;
  vNode := TTreeNode(vCurrnetBookmark.data);
  frm.TreeViewMetadata.Select(vNode);
end;

procedure TBookmarks.GoBookmark(var vName: WideString);
var
//  vNode: TTreeNode;
//  vFullName: string;
  i: Integer;
begin
  for i := 0 to vBookmarks.Items.Count - 1 do
  begin
    if vName = vBookmarks.Items.Item[i].Text then
    begin
      vCurrnetBookmark := vBookmarks.Items.Item[i];
      Break;
    end;
  end;
  vMDTree.List.Select(TTreeNode(vCurrnetBookmark.data));
end;

constructor TBookmarks.CreateObj(frmSS: TfrmSubSystems);
begin
  inherited Create;
  frm := frmSS;
  Tree := frm.TreeViewMetadata;
  vMDTree := TMDTree.CreateObj(frm, frm.FConfigurator);
  vBookmarks := TTreeView.Create(nil);
  vBookmarks.Parent := frm;
  vBookmarks.Visible := false;
end;

destructor TBookmarks.Destroy;
begin
end;

initialization
  TAutoObjectFactory.Create(ComServer, TBookmarks, Class_Bookmarks,
    ciMultiInstance, tmApartment);
end.
