unit History;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SubSystems_TLB, StdVcl,
  XMLDom, XMLDoc, XMLIntf, SysUtils, ShellAPI, FileCtrl,
  FormSubSystemsMain, ComCtrls, OpenConf_TLB;

type
  THistory = class(TAutoObject, IConnectionPointContainer, IHistory)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IHistoryEvents;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    frm: TfrmSubSystems;
    List: TListView;
    Config: IConfigurator;
    Tree: TTreeView;

    XMLDocument: IXMLDocument;
    RootNode, XMLNode: IXMLNode;
    vFileName: string;

    LastPath: string;

    F: TextFile;

    constructor CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
    destructor Destroy;


    procedure Initialize; override;

    procedure Delete; safecall;
    procedure Open; safecall;
    procedure Refresh; safecall;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation
uses ComServ;

procedure THistory.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IHistoryEvents;
end;

procedure THistory.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;

constructor THistory.CreateObj(frmSS: TfrmSubSystems; vConfig: IConfigurator);
begin
  inherited Create;
  frm := frmSS;
  List := frm.ListViewToDo;
  Config := vConfig;
  Tree := frm.TreeViewMetadata;
end;

destructor THistory.Destroy;
begin
end;


procedure THistory.Delete;
begin

end;
               {
procedure THistory.Insert();
var
  vList: TStringList;
begin
     {
  if LastPath <> vPath then begin
    LastPath := vPath;

    vList := TStringList.Create;
    vList.Add(IntToStr(vID));
    vList.Add(IntToStr(vKind));
    vList.Add(LastPath);
    vList.Add(IntToStr(vType));
    vList.Add(DateToStr(Now));

    AssignFile(F, vFileName);
    //Rewrite(F);
    Append(F);
    //Eof(F);
    //SeekEof(F);
    WriteLn(F,vlist.commatext);
    CloseFile(F);
  end;
  
end;
  }
procedure THistory.Open;
begin

end;

procedure THistory.Refresh;
var
  t: TStringList;
  S : string;
  i : integer;
  Node : TTreeNode;
  vFind : boolean;
begin

  vFileName := IncludeTrailingBackslash(Config.IBDir) + Config.AppProps[appUserName] + '_history.txt';

  t := TStringList.Create;
  //t.text := stringReplace(Mask, ',', #13#10, [rfReplaceAll]);

  Reset(F);
  while not EOF(F) do begin
    Readln(F, S); // читаем строку
    t.text := stringReplace(S, ',', #13#10, [rfReplaceAll]);
    vFind := false;
    if frm.ComboBoxGroupBy.ItemIndex = 0 then begin
    {
      Node := frm.TreeViewHistory.Items.GetFirstNode();
      while Node <> nil do begin
        if Node.Text = T[1] then begin
          vFind := true;
          frm.TreeViewHistory.Items.AddChildObject(Node,T[0],Pointer(T[0]));
          break;
        end;
        Node := Node.GetNext;
      end;
      if vFind = false then begin
        Node := frm.TreeViewHistory.Items.AddObject(Node,T[1],Pointer(T[1]));
        frm.TreeViewHistory.Items.AddChildObject(Node,T[0],Pointer(T[0]));
      end;
     }
      frm.TreeViewHistory.Items.AddObject(Node,T[1],Pointer(T[1]));
    end;

  end;
  CloseFile(F);



  //  if FileExists(vFileName) then begin
  //    XMLDocument := NewXMLDocument('1.0');
  //    XMLDocument.Encoding := 'UTF-8';
  //    XMLDocument.FileName := vFileName;
  //    XMLDocument.Active := True;
  //    //XMLDocument.LoadFromFile(vFileName);
  //  end else begin
  //    try
  //      XMLDocument := NewXMLDocument('1.0');
  //      XMLDocument.Encoding := 'UTF-8';
  //      //      RootNode := XMLDocument.AddChild('Подсистемы');
  //      XMLDocument.SaveToFile(vFileName);
  //    except
  //      on E: Exception do begin
  //        frm.Echo('Подсистемы: Сохранение истории открываемых объектов'#13#10 +
  //          'Возникло исключение:'#13#10 + E.Message
  //          );
  //      end;
  //    end;
  //  end;

end;

initialization
  TAutoObjectFactory.Create(ComServer, THistory, Class_History,
    ciMultiInstance, tmApartment);
end.

