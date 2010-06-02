unit ExtTreeFiles;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  AxCtrls, ExtCtrls, ComCtrls;

procedure AddFilesInTree(
  vTree: TTreeView;
  vParentNodeGrp: TTreeNode;
  StartFolder, Mask, MaskFalse: string;
  ScanSubFolders: Boolean = True;
  vDirIn: string = ''
  );

//function CreateDataNode(StartFolder, vName, vfext: string; vIsFolder, vFromMD: integer): PMyRec;

procedure SetImgOnfile(vNode: TTreeNode; vExt: string);
var
  //  vDir: string;
  AcNode: TTreeNode;
  AcNode1: TTreeNode;

const
  ImgFolder = 4;
  ImgErt = 8;
  ImgMxl = 9;
  ImgTxt = 16;
  ImgOther = 69;
  ImgArc = 20;
  ImgWord = 21;
  ImgExl = 22;
  ImgAcs = 23;
  ImgMD = 58;
  ImgExe = 70;

implementation
uses SysUtils, FormSubSystemsMain;
//------------------------------------------------------------------------------

function Like(AString, Pattern: string): boolean;
var
  i, n, n1, n2: integer;
  p1, p2: pchar;
label
  match, nomatch;
begin
  AString := UpperCase(AString);
  Pattern := UpperCase(Pattern);
  n1 := Length(AString);
  n2 := Length(Pattern);
  if n1 < n2 then
    n := n1
  else
    n := n2;
  p1 := pchar(AString);
  p2 := pchar(Pattern);
  for i := 1 to n do
  begin
    if p2^ = '*' then
      goto match;
    if (p2^ <> '?') and (p2^ <> p1^) then
      goto nomatch;
    inc(p1);
    inc(p2);
  end;
  if n1 > n2 then
  begin
    nomatch:
    Result := False;
    exit;
  end
  else if n1 < n2 then
  begin
    for i := n1 + 1 to n2 do
    begin
      if not (p2^ in ['*', '?']) then
        goto nomatch;
      inc(p2);
    end;
  end;
  match:
  Result := True;
end;
//------------------------------------------------------------------------------

function MatchesSpec(const FileName, Specification: string): boolean;
var
  SName, SExt, FName, FExt: string;
begin
  FName := ExtractFileName(FileName);
  SName := ExtractFileName(Specification);
  FExt := ExtractFileExt(FName);
  SExt := ExtractFileExt(SName);
  SetLength(FName, Length(FName) - Length(FExt));
  SetLength(SName, Length(SName) - Length(SExt));
  if SName = '' then
    SName := '*';
  if SExt = '' then
    SExt := '.*';
  if FExt = '' then
    FExt := '.';
  Result := Like(FName, SName) and Like(FExt, SExt);
end;
//------------------------------------------------------------------------------

function MatchesMask(Name: string; Mask: string): Boolean;
var
  t: TStringList;
  I: Integer;
begin
  t := TStringList.create; //создаём класс
  t.text := stringReplace(Mask, ',', #13#10, [rfReplaceAll]);
  for i := 0 to T.Count - 1 do
  begin
    if MatchesSpec(Name, T[i]) then
    begin
      Result := True;
      exit;
    end;
  end;
  Result := False;
end;
//------------------------------------------------------------------------------

function _GetParentNode(StartFolder: string; MyNode: TTreeNode): TTreeNode;
//var
//  i: Integer;
begin
  try
    if MyNode.Parent <> nil then
    begin
      if PMyRec(MyNode.Data).FolderName = StartFolder then
        Result := MyNode;
      if PMyRec(MyNode.Data).FolderName <> StartFolder then
        Result := _GetParentNode(StartFolder, MyNode.Parent);
    end
    else
      Result := MyNode;
  except
    // nothing
  end;
end;
//------------------------------------------------------------------------------

procedure SetImgOnfile(vNode: TTreeNode; vExt: string);
var
  vExtArc: string;
  vImgID: Integer;
begin
  vExtArc := '.zip,.rar,.arj,1.part*';
  vImgID := ImgOther;
  if Pos(vExt, vExtArc) > 0 then
    vImgID := ImgArc;
  if vExt = '.doc' then
    vImgID := ImgWord;
  if vExt = '.xls' then
    vImgID := ImgExl;
  if vExt = '.mdb' then
    vImgID := ImgAcs;
  if vExt = '.efd' then
    vImgID := ImgTxt;
  if vExt = '.txt' then
    vImgID := ImgTxt;
  if vExt = '.ert' then
    vImgID := ImgErt;
  if vExt = '.mxl' then
    vImgID := ImgMxl;
  if vExt = '.prm' then
    vImgID := ImgTxt;
  if vExt = '.md' then
    vImgID := ImgMD;
  if vExt = '.exe' then
    vImgID := ImgExe;
  vNode.ImageIndex := vImgID;
  vNode.SelectedIndex := vImgID;
end;

function CreateDataNode(StartFolder, vName, vfext: string; vIsFolder, vFromMD: integer):  PMyRec;
var
  MyRecPtr: PMyRec;
begin
  New(MyRecPtr);
  MyRecPtr.FolderName := IncludeTrailingBackslash(StartFolder + vName);
  MyRecPtr.FileName := vName;
  MyRecPtr.ISFolder := 1;
  MyRecPtr.fext := vfext;
end;

//------------------------------------------------------------------------------

procedure AddFilesInTree(
  vTree: TTreeView;
  vParentNodeGrp: TTreeNode;
  StartFolder, Mask, MaskFalse: string;
  ScanSubFolders: Boolean = True;
  vDirIn: string = ''
  );
var
  SearchRec: TSearchRec;
  FindResult: Integer;
 // MyRecPtr: PMyRec;
  vParent: TTreeNode;
  vImgID: Integer;
  My: TTreeNode;
  vExt, vExtArc: string;
begin
  try
    vExtArc := '.zip,.rar,.arj,1.part*';
    StartFolder := IncludeTrailingBackslash(StartFolder);
    FindResult := FindFirst(StartFolder + '*.*', faAnyFile, SearchRec);
    try
      while FindResult = 0 do
        with SearchRec do
        begin
          if (Attr and faDirectory) <> 0 then
          begin
            if ScanSubFolders and (Name <> '.') and (Name <> '..') then
            begin
              if StartFolder = vDirIn then
              begin
                AcNode1 := vTree.Items.AddChildObject(vParentNodeGrp, Name,
                  CreateDataNode(StartFolder, Name, '', 1, 0));
                AcNode := AcNode1;
                AcNode.ImageIndex := ImgFolder;
              end;
              if StartFolder <> vDirIn then
              begin
                vParent := _GetParentNode(StartFolder, AcNode);
                //arent := _GetParentNode(StartFolder, vParentNodeGrp);

                AcNode1 := vTree.Items.AddChildObject(vParent, Name,
                  CreateDataNode(StartFolder, Name, '', 1, 0));
                AcNode := AcNode1;
                AcNode.ImageIndex := ImgFolder;
                AcNode.SelectedIndex := ImgFolder;
              end;
              AddFilesInTree(vTree, vParentNodeGrp, StartFolder + Name, Mask,
                MaskFalse, ScanSubFolders, vDirIn);
            end
          end
          else
          begin // file
            if MatchesMask(Name, Mask) = True then
            begin
              vExt := LowerCase(ExtractFileExt(Name));
              //            FConfigurator.Message('|' + vExt + '|',mNone);
              vImgID := ImgOther;
              if Pos(vExt, vExtArc) > 0 then
                vImgID := ImgArc;
              if vExt = '.doc' then
                vImgID := ImgWord;
              if vExt = '.xls' then
                vImgID := ImgExl;
              if vExt = '.mdb' then
                vImgID := ImgAcs;
              if vExt = '.efd' then
                vImgID := ImgTxt;
              if vExt = '.txt' then
                vImgID := ImgTxt;
              if vExt = '.ert' then
                vImgID := ImgErt;
              if vExt = '.mxl' then
                vImgID := ImgMxl;
              if vExt = '.prm' then
                vImgID := ImgTxt;
              if vExt = '.md' then
                vImgID := ImgMD;
              if vExt = '.exe' then
                vImgID := ImgExe;
              if vExt = '' then
                vExt := '.';

              if StartFolder <> vDirIn then
              begin
                vParent := _GetParentNode(StartFolder, AcNode);
                My := vTree.Items.AddChildObject(vParent, Name,
                  CreateDataNode(StartFolder, Name, vExt, 0, 0));
                My.ImageIndex := vImgID;
                My.SelectedIndex := vImgID;
              end;

              if StartFolder = vDirIn then
              begin
                My := vTree.Items.AddChildObject(vParentNodeGrp, Name,
                  CreateDataNode(StartFolder, Name, vExt, 0, 0));
                My.ImageIndex := vImgID;
                My.SelectedIndex := vImgID;
              end;
            end;
          end;
          FindResult := FindNext(SearchRec);
        end;
    finally
      FindClose(SearchRec); //!
    end;
  finally
    //List.EndUpdate;
  end;

end;

end.

