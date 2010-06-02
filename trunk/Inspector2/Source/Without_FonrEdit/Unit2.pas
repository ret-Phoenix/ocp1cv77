unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(InStr:String):String;
  end;

var
  Form2: TForm2;

implementation
var OutStr:String;
{$R *.dfm}
function TForm2.Execute(InStr:String):String;
begin
  OutStr:=InStr;
  Memo1.Text:=InStr;
  ShowModal;
  Result:=OutStr;
end;
procedure TForm2.Button1Click(Sender: TObject);
begin
 OutStr:=Memo1.Text;
 Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 Close;

end;

end.
