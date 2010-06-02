unit FormEditPath;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  Dialogs, Buttons, StdCtrls, FileCtrl, ComCtrls, ExtCtrls;

type
  TfrmEditPath = class(TForm)
    eName: TLabeledEdit;
    ePath: TLabeledEdit;
    eMask: TLabeledEdit;
    btnOk: TButton;
    btnCancel: TButton;
    btnSelectDir: TBitBtn;
    cbInIBDir: TCheckBox;
    Label1: TLabel;
    ComboBoxsaveVar: TComboBox;
    eMaskAbort: TLabeledEdit;
    cbNotRecource: TCheckBox;
    procedure btnSelectDirClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vTypeOperation: string;
    vListDir: TListView;
  end;

var
  frmEditPath: TfrmEditPath;

implementation

uses Artbear_ActiveFormImpl1;

{$R *.dfm}

procedure TfrmEditPath.btnSelectDirClick(Sender: TObject);
var
  vDir: string;
begin
  vDir := Trim(ePath.Text);
  if SelectDirectory('Добавить каталог', '', vDir) then
    ePath.Text := vDir;
end;
//------------------------------------------------------------------------------

procedure TfrmEditPath.btnOkClick(Sender: TObject);
var
  itm: TListItem;
begin
  if vTypeOperation = 'Insert' then begin
    itm := vListDir.Items.Add;
    with itm do begin
      Caption := eName.Text;
      SubItems.Insert(0, ePath.Text);
      SubItems.Insert(1, eMask.Text);
      SubItems.Insert(2, BoolToStr(cbInIBDir.Checked));
      ImageIndex := 17 + ComboBoxsaveVar.ItemIndex;
    end;
  end;

  if vTypeOperation = 'Edit' then begin
    with vListDir.Selected do begin
      Caption := eName.Text;
      SubItems[0] := ePath.Text;
      SubItems[1] := eMask.Text;
      SubItems[2] := BoolToStr(cbInIBDir.Checked);
      ImageIndex := 17 + ComboBoxsaveVar.ItemIndex;
    end;
  end;
  Close;
end;

procedure TfrmEditPath.FormShow(Sender: TObject);
begin
  if vTypeOperation = 'Edit' then begin
    cbInIBDir.Checked := StrToBool(vListDir.Selected.SubItems[2]);
    eName.Text := vListDir.Selected.Caption;
    if cbInIBDir.Checked then
      ePath.Text := StringReplace(vListDir.Selected.SubItems[0], vIBFolder, '', [rfReplaceAll])
    else
      ePath.Text := vListDir.Selected.SubItems[0];
    eMask.Text := vListDir.Selected.SubItems[1];
    ComboBoxsaveVar.ItemIndex := vListDir.Selected.ImageIndex - 17;
  end
  else begin
    eName.Text := '';
    ePath.Text := '';
    eMask.Text := '*.*';
    eMaskAbort.Text := '';
    cbInIBDir.Checked := False;
    cbNotRecource.Checked := False;
    ComboBoxsaveVar.ItemIndex := 0;
    Caption := Caption + ' (Новый)';
  end;
end;

procedure TfrmEditPath.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
