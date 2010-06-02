unit FormEditCardTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, Buttons, FormSubSystemsMain;

type
  TfrmEditCardTemplate = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery1ID: TAutoIncField;
    ADOQuery1IsFolder: TBooleanField;
    ADOQuery1ParentID: TIntegerField;
    ADOQuery1Name: TWideStringField;
    ADOQuery1Note: TMemoField;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    btnOk: TButton;
    btnClose: TButton;
    ADOQuery1IsModule: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    btnLoadFromFile: TButton;
    btnLoadFromFileChoice: TBitBtn;
    btnSaveToFile: TBitBtn;
    btnSetBuffer: TBitBtn;
    procedure btnSetBufferClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure btnLoadFromFileChoiceClick(Sender: TObject);
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    frmSS: TfrmSubSystems;
  end;

var
  frmEditCardTemplate: TfrmEditCardTemplate;

implementation
uses Templates, SubSystems_TLB;
{$R *.dfm}

procedure TfrmEditCardTemplate.btnOkClick(Sender: TObject);
begin
  ADOQuery1.Post;
  close;
end;

procedure TfrmEditCardTemplate.btnCloseClick(Sender: TObject);
begin
  ADOQuery1.Cancel;
  close;
end;

procedure TfrmEditCardTemplate.SpeedButton1Click(Sender: TObject);
begin
  //T.SetTextToClipboard(0);
end;

procedure TfrmEditCardTemplate.btnLoadFromFileClick(Sender: TObject);
var
  vFileName: WideString;
  vStr: string;
begin
  vFileName := frmSS.vTemplates.ImportFileName;
  vStr := frmSS.vTemplates.GetTextFromFile(vFileName);
  DBMemo1.Text := vStr;
end;

procedure TfrmEditCardTemplate.btnLoadFromFileChoiceClick(Sender: TObject);
var
  vFileName: WideString;
  vStr: string;
begin
  if frmSS.OpenDialog1.Execute then
  begin
    vFileName := frmSS.OpenDialog1.FileName;
    vStr := frmSS.vTemplates.GetTextFromFile(vFileName);
    frmSS.vTemplates.ImportFileName := vFileName;
    ADOQuery1Note.AsString := vStr;
    if DBEdit2.Text = '' then
      DBEdit2.Text := ExtractFileName(frmSS.OpenDialog1.FileName);
  end;
end;

procedure TfrmEditCardTemplate.btnSaveToFileClick(Sender: TObject);
var
  F: TextFile;
begin
  if frmSS.SaveDialog1.Execute then
  begin
    AssignFile(F, frmSS.SaveDialog1.FileName);
    Rewrite(F);
    Writeln(F, DBMemo1.Text);
    CloseFile(F);
  end;
end;

procedure TfrmEditCardTemplate.btnSetBufferClick(Sender: TObject);
begin
  frmSS.vTemplates.SetTextToClipboard(ADOQuery1ID.AsInteger);
end;

end.
