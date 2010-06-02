unit FormChoiceParentToDo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ADODB, FormSubSystemsMain, DB;

type
  TfrmChoiceParentToDo = class(TForm)
    tvToDo: TTreeView;
    QList: TADOQuery;
    procedure tvToDoExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvToDoDblClick(Sender: TObject);
    procedure tvToDoCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vReturnID: Integer;
    frmSSM: TfrmSubSystems;
  end;

var
  frmChoiceParentToDo: TfrmChoiceParentToDo;

implementation

{$R *.dfm}

procedure TfrmChoiceParentToDo.tvToDoExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  Q: TADOQuery;
  vLever: Integer;
  vNode: TTreeNode;
  i: Integer;
  vSQLText: string;
begin
  vLever := Node.Level;

  if vLever = 0 then
  begin
    Node.DeleteChildren;
    vNode := tvToDo.Items.AddChildObject(Node, 'Общие для всей конфигурации',
      Pointer(0));
    frmSSM.GrfNode(vNode, 5);
    tvToDo.Items.AddChild(vNode, 'system');
    Q := frmSSM.RunSQL(nil, 'select id,name from subconfigs where configid = ' +
      IntToStr(Integer(Node.Data)) + ' order by name');
    Q.First;
    while not Q.Eof do
    begin
      vNode := tvToDo.Items.AddChildObject(Node, Q.Fields[1].AsString,
        Pointer(Q.Fields[0].AsInteger));
      frmSSM.GrfNode(vNode, 4);
      tvToDo.Items.AddChild(vNode, 'system');
      Q.Next;
    end;
  end;

  if vLever = 1 then
  begin
    Node.DeleteChildren;
    vSQLText := 'select id,name,parentToDoID,' +
      '(select count(TL.id) from ToDo TL where TL.ParentToDoId=ToDo.id)'
      + ' AS HasChild from ToDo where subconfigid = '
      + IntToStr(Integer(Node.Data)) + ' order by Name';
    if Integer(Node.Data) = 0 then
      vSQLText := vSQLText + ' and configid=' +
        IntToStr(Integer(Node.Parent.data));
    Q := frmSSM.RunSQL(nil, vSQLText);
    Q.First;
    while not Q.Eof do
    begin
      vNode := tvToDo.Items.AddChildObject(Node, Q.Fields[1].AsString,
        Pointer(Q.Fields[0].AsInteger));

      if (Q.FieldByName('HasChild').AsInteger <> 0) and
        (Q.FieldByName('ParentToDoID').AsInteger = 0) then
        i := 0
      else if (Q.FieldByName('HasChild').AsInteger <> 0) and
        (Q.FieldByName('ParentToDoID').AsInteger <> 0) then
        i := 1
      else if (Q.FieldByName('ParentToDoID').AsInteger <> 0) then
        i := 2
      else
        i := 3;
      frmSSM.GrfNode(vNode, i);
      //tvToDo.Items.AddChild(vNode, 'system');
      Q.Next;
    end;
  end;

end;

procedure TfrmChoiceParentToDo.tvToDoDblClick(Sender: TObject);
var
  vNode: TTreeNode;
begin
  vNode := tvToDo.Selected;
  if vNode = nil then
    Exit;
  if vNode.Level < 2 then
    Exit;
  vReturnID := Integer(vNode.data);
  Close;
end;

procedure TfrmChoiceParentToDo.tvToDoCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Node.Level = 0 then
    Sender.Canvas.Font.Style := [fsBold];
  if Node.Level = 1 then
    Sender.Canvas.Font.Style := [fsUnderline];
  DefaultDraw := True;
end;

end.

