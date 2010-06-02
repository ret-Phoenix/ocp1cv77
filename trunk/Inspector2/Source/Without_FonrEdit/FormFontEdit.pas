unit FormFontEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvColorCombo, JvExStdCtrls, JvCombobox, Spin,
  Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
  TfrmFontEdit = class(TForm)
    cbFont: TJvFontComboBox;
    cbColor: TJvColorComboBox;
    chkBold: TCheckBox;
    chkItalic: TCheckBox;
    chkUnderline: TCheckBox;
    grp1: TGroupBox;
    pnlSample: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    chkAuto: TCheckBox;
    seFontSize: TJvCalcEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFontEdit: TfrmFontEdit;

implementation

{$R *.dfm}

end.
