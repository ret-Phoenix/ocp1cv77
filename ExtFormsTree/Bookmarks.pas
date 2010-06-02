unit Bookmarks;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, ExtFormsTree_TLB, StdVcl, ComCtrls,
  Artbear_ActiveFormImpl1, ExtFormsList;

type
  TBookmarks = class(TAutoObject, IBookmarks)
  private
    vBookmarks: TTreeView;
    frm: TTreeeFilesActiveFormX;
    //Config: IConfigurator;
    Tree: TTreeView;
    vEFTree: TExtFrmsList;
    vCurrnetBookmark: TTreeNode;
  public
    constructor CreateObj(frmSS: TTreeeFilesActiveFormX);
    destructor Destroy;
  protected
    function GetBookmarks: WideString; safecall;
    procedure Add; safecall;
    procedure Clear; safecall;
    procedure Delete; safecall;
    procedure GoBookmark(const val: WideString); safecall;
    procedure Next; safecall;
    procedure Previos; safecall;

  end;

implementation

uses ComServ;

function TBookmarks.GetBookmarks: WideString;
var
  i: Integer;
begin
  for i := 0 to vBookmarks.Items.Count - 1 do begin
    Result := Result + vBookmarks.Items.Item[i].Text + #13#10;
  end;
end;

procedure TBookmarks.Add;
var
  vNode: TTreeNode;
  vFullName: string;
  i: Integer;
begin
  vFullName := frm.vExtFrmsLst.ReternFileInfo('dir') + frm.vExtFrmsLst.ReternFileInfo('name');
  for i := 0 to vBookmarks.Items.Count - 1 do begin
    if vFullName = vBookmarks.Items.Item[i].Text then begin
      Break;
      exit;
    end;
  end;
  vCurrnetBookmark := vBookmarks.Items.AddObject(nil, vFullName, Pointer(Tree.Selected));
end;

procedure TBookmarks.Clear;
begin
  vBookmarks.Items.Clear;
end;

procedure TBookmarks.Delete;
begin
  if vCurrnetBookmark.AbsoluteIndex <> 0 then begin
    vBookmarks.Items.Delete(vCurrnetBookmark);
    if vBookmarks.Items.Count <> 0 then
      vCurrnetBookmark := vBookmarks.Items.Item[vCurrnetBookmark.AbsoluteIndex - 1]
    else
      vCurrnetBookmark := nil;
  end
  else begin
    vBookmarks.Items.Delete(vCurrnetBookmark);
    if vBookmarks.Items.Count <> 0 then
      vCurrnetBookmark := vBookmarks.Items.Item[vBookmarks.Items.count - 1]
    else
      vCurrnetBookmark := nil;
  end;

end;

procedure TBookmarks.GoBookmark(const val: WideString);
var
  vNode: TTreeNode;
  vFullName: string;
  i: Integer;
begin
  for i := 0 to vBookmarks.Items.Count - 1 do begin
    if val = vBookmarks.Items.Item[i].Text then begin
      vCurrnetBookmark := vBookmarks.Items.Item[i];
      Break;
    end;
  end;
  Tree.Select(TTreeNode(vCurrnetBookmark.data));
end;

procedure TBookmarks.Next;
begin
  if vCurrnetBookmark.AbsoluteIndex <> vBookmarks.Items.Count - 1 then begin
    vCurrnetBookmark := vBookmarks.Items.Item[vCurrnetBookmark.AbsoluteIndex + 1];
  end
  else begin
    vCurrnetBookmark := vBookmarks.Items.Item[0];
  end;
  Tree.Select(TTreeNode(vCurrnetBookmark.data));
end;

procedure TBookmarks.Previos;
var
  vNode: TTreeNode;
begin
  if vCurrnetBookmark.AbsoluteIndex <> 0 then begin
    vCurrnetBookmark := vBookmarks.Items.Item[vCurrnetBookmark.AbsoluteIndex - 1];
  end
  else begin
    vCurrnetBookmark := vBookmarks.Items.Item[vBookmarks.Items.count - 1];
  end;
  vNode := TTreeNode(vCurrnetBookmark.data);
  Tree.Select(vNode);
end;

constructor TBookmarks.CreateObj(frmSS: TTreeeFilesActiveFormX);
begin
  inherited Create;
  frm := frmSS;
  Tree := frm.TreeView1;
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

