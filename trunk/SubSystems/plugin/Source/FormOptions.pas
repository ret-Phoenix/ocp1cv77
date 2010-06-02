unit FormOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmOptions = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    todo: TCheckBox;
    tuning: TCheckBox;
    confs: TCheckBox;
    templates: TCheckBox;
    props: TCheckBox;
    links: TCheckBox;
    ssobj: TCheckBox;
    expl: TCheckBox;
    AvlbSS: TCheckBox;
    ObjShowing: TCheckBox;
    btnOk: TButton;
    NoteShowing: TCheckBox;
    NoteListShowing: TCheckBox;
    Label1: TLabel;
    ComboBoxPlacePanel: TComboBox;
    ComboBoxSS: TComboBox;
    cbToDoObj: TCheckBox;
    cbMDObjBlocks: TCheckBox;
    chkLogList: TCheckBox;
    TabSheet2: TTabSheet;
    rgMetadataView: TRadioGroup;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vSelectedTabs: string;
    vPlacePanel: integer;
    vPlacePanelSS: integer;
    vToDoListType: integer;
  end;

var
  frmOptions: TfrmOptions;

implementation
uses FormSubSystemsMain;
{$R *.dfm}

procedure TfrmOptions.btnOkClick(Sender: TObject);
begin
  vSelectedTabs := 'subsystems';

  if todo.Checked then
    vSelectedTabs := vSelectedTabs + ',todo';
  if tuning.Checked then
    vSelectedTabs := vSelectedTabs + ',tuning';
  if confs.Checked then
    vSelectedTabs := vSelectedTabs + ',confs';
  if templates.Checked then
    vSelectedTabs := vSelectedTabs + ',templates';
  if props.Checked then
    vSelectedTabs := vSelectedTabs + ',props';
  if links.Checked then
    vSelectedTabs := vSelectedTabs + ',links';
  if ssobj.Checked then
    vSelectedTabs := vSelectedTabs + ',ssobj';
  if expl.Checked then
    vSelectedTabs := vSelectedTabs + ',expl';
  if AvlbSS.Checked then
    vSelectedTabs := vSelectedTabs + ',avlbss';
  if ObjShowing.Checked then
    vSelectedTabs := vSelectedTabs + ',objshowing';
  if NoteShowing.Checked then
    vSelectedTabs := vSelectedTabs + ',note';
  if cbToDoObj.Checked then
    vSelectedTabs := vSelectedTabs + ',todoobj';
  if NoteListShowing.Checked then
    vSelectedTabs := vSelectedTabs + ',notelist';
  if cbMDObjBlocks.Checked then
    vSelectedTabs := vSelectedTabs + ',mdobjblocks';
  if chkLogList.Checked then
    vSelectedTabs := vSelectedTabs + ',logedits';

  vPlacePanel := ComboBoxPlacePanel.ItemIndex;
  vPlacePanelSS := ComboBoxSS.ItemIndex;
  close;
end;

end.
