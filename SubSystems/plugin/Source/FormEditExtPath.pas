unit FormEditExtPath;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FileCtrl, ComCtrls, ShellCtrls;

type
  TfrmEditExtPath = class(TForm)
    eName: TLabeledEdit;
    ePath: TLabeledEdit;
    eMask: TLabeledEdit;
    btnChoiceDir: TBitBtn;
    btnOk: TButton;
    btnCancel: TButton;
    eMaskFalse: TLabeledEdit;
    btnSetIB: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnChoiceDirClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSetIBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperation: string;
    vList: TListView;
    IsFolder: Boolean;
    vOldPath: string;
    vIBDir: string;
  end;

var
  frmEditExtPath: TfrmEditExtPath;

implementation
uses FormSubSystemsMain, StrUtils;
{$R *.dfm}

procedure TfrmEditExtPath.FormCreate(Sender: TObject);
begin
  //
end;

procedure TfrmEditExtPath.btnChoiceDirClick(Sender: TObject);
var
  vDir: string;
//  vRoot: WideString;
  vOF: TOpenDialog;
begin
  vDir := Trim(ePath.Text);
  if Copy(vDir, 0, 1) = '@' then
    vDir := vIBDir + Copy(vDir, 2, Length(vDir));
  //ShowMessage(vDir);
  if IsFolder then
  begin
    if SelectDirectory('Выбор каталога', '', vDir) then
    begin
      //vDir := StringReplace(Trim(IncludeTrailingBackslash(vDir)), Trim(vIBDir), '@', [rfReplaceAll,rfIgnoreCase]);
      ePath.Text := vDir;
    end;
  end
  else
  begin
    vOF := TOpenDialog.Create(nil);
    vOF.FileName := vDir;
    if vOF.Execute then
    begin
      ePath.Text := vOF.FileName;
    end;
  end;
end;

procedure TfrmEditExtPath.btnOkClick(Sender: TObject);
var
  itm: TListItem;
begin
  if vOperation = 'insert' then
  begin
    itm := vList.Items.Add;
    with itm do
    begin
      Caption := eName.Text;
      SubItems.Insert(0, ePath.Text);
      SubItems.Insert(1, eMask.Text);
      if IsFolder then
        itm.ImageIndex := 4
      else
        itm.ImageIndex := 69
    end; // with itm
  end; // if oper...

  if vOperation = 'edit' then
  begin
    with vList.Selected do
    begin
      Caption := eName.Text;
      SubItems[0] := ePath.Text;
      SubItems[1] := eMask.Text;
      if IsFolder then
        ImageIndex := 4
      else
        ImageIndex := 69
    end;
  end; // if oper...
  Close;
  ModalResult := mrOk;
end;

procedure TfrmEditExtPath.btnCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TfrmEditExtPath.Button1Click(Sender: TObject);
var
  vDir: string;
  //vRoot: WideString;
  //vOF: TOpenDialog;
  s: WideString;
begin
  {
[Delphi] function SelectDirectory(
 const Caption: string,
 const Root: WideString,
 var Directory: string,
 Options: TSelectDirExtOpts,
 Parent: TWinControl):
 Boolean;
 }

  s := '';
  vDir := Trim(ePath.Text);
  if SelectDirectory('Добавить каталог', s, vDir) then
    ePath.Text := vDir;
end;

procedure TfrmEditExtPath.btnSetIBClick(Sender: TObject);
var
  vDir: string;
begin
  vDir := ePath.Text;
    if IsFolder then
      vDir := StringReplace(Trim(IncludeTrailingBackslash(vDir)), Trim(vIBDir), '@',[rfReplaceAll, rfIgnoreCase])
  else
    vDir := StringReplace(Trim(vDir), Trim(vIBDir), '@',[rfReplaceAll, rfIgnoreCase]);
  ePath.Text := vDir;
end;

end.

