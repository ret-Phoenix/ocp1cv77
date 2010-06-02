unit TuningExtformsList;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, ExtFormsTree_TLB, StdVcl,
  Artbear_ActiveFormImpl1, ComCtrls, SysUtils, Dialogs, Controls, formEditPath;

type
  TTuningExtformsList = class(TAutoObject, IConnectionPointContainer, ITuningExtformsList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ITuningExtformsListEvents;

    frm: TTreeeFilesActiveFormX;
    List: TListView;

    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure Initialize; override;
    constructor CreateObj(frmEF: TTreeeFilesActiveFormX);
    destructor Destroy;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure DeletePath; safecall;
    procedure EditPath; safecall;
    procedure NewParh; safecall;
    procedure Refresh; safecall;
  end;

implementation

uses ComServ;

procedure TTuningExtformsList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITuningExtformsListEvents;
end;

procedure TTuningExtformsList.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else
    FConnectionPoint := nil;
end;
//------------------------------------------------------------------------------

procedure SaveToCSV(ListVw: TListView; FileName: string; Separator: Char; IDImg: Integer);
var
  st: string;
  fich: textfile;
  I, J: Integer;
begin
  AssignFile(fich, FileName);
  Rewrite(fich);
  for I := 0 to ListVw.Items.Count - 1 do begin

    if ListVw.Items[I].ImageIndex <> IDImg then
      Continue;

    if ListVw.Items[I].SubItems[2] = '-1' then
      ListVw.Items[I].SubItems[0] := StringReplace(ListVw.Items[I].SubItems[0], vIBFolder, '', [rfReplaceAll]);

    st := ListVw.Items[I].Caption;
    if Pos(Separator, st) <> 0 then
      st := '"' + st + '"';
    for J := 0 to ListVw.Items[I].Subitems.Count - 1 do begin
      if Pos(Separator, ListVw.Items[I].Subitems[J]) = 0 then
        st := st + Separator + ListVw.Items[I].Subitems[J]
      else
        st := st + Separator + '"' + ListVw.Items[I].Subitems[J] + '"';
    end;
    Writeln(fich, st);
  end;
  CloseFile(fich);
end;

procedure LoadFromCSV(ListVw: TListView; FileName: string; Separator: Char; IDGrf: Integer; Clearing: Boolean = True);
var
  st, st2: string;
  fich: textfile;
  Size, Current: Integer;
  t: TListItem;
  f: file of Byte;
  I, J, k, l: Integer;
begin

  if not FileExists(FileName) then
    exit;

  if Clearing then
    ListVw.Items.Clear;

  AssignFile(f, FileName);
  Reset(f);
  Size := FileSize(f);
  CloseFile(f);

  AssignFile(fich, FileName);
  Reset(fich);
  Current := 0;
  while not Eof(fich) do begin
    Readln(fich, st);
    Current := Current + Length(st) + 2;
    t := ListVw.Items.Add;

    t.ImageIndex := IDGrf;

    J := 0;
    k := 1;
    for I := 1 to Length(st) do
      if st[I] = '"' then
        J := (J + 1) mod 2
      else if st[I] = Separator then
        if J = 0 then
          Inc(k);
    if k <> 1 then begin
      I := Pos(Separator, st);
      J := Pos('"', st);
      l := 0;

      while I <> 0 do begin
        if (J = 0) or (J > I) then begin
          st2 := Copy(st, 1, I - 1);
          st := Copy(st, I + 1, Length(st));
        end
        else begin
          st := Copy(st, J + 1, Length(st));
          J := Pos('"', st);
          if J = 0 then begin
            st2 := st;
            st := '';
          end
          else begin
            st2 := Copy(st, 1, J - 1);
            st := Copy(st, J + 1, Length(st));
            J := Pos(Separator, st);
            st := Copy(st, J + 1, Length(st));
          end;
        end;
        if l = 0 then begin
          t.Caption := st2;
          Inc(l);
        end
        else
          t.Subitems.Add(st2);
        Dec(k);

        I := Pos(Separator, st);
        J := Pos('"', st);
      end;

      if k = 1 then
        t.Subitems.Add(st);
    end
    else begin
      if Pos('"', st) = 0 then
        t.Caption := st
      else
        st := Copy(st, Pos('"', st) + 1, Length(st));
      if Pos('"', st) = 0 then
        t.Caption := st
      else
        t.Caption := Copy(st, 1, Pos('"', st) - 1);
    end;
  end;
  CloseFile(fich);
end;

procedure TTuningExtformsList.DeletePath;
begin
  if List.Selected <> nil then
    if MessageDlg('Удалить запись?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      List.Selected.Delete;
    end;
  SaveToCSV(List, vOptionsFile, ';', 17);
  SaveToCSV(List, vOptionsPersonalFile, ';', 18);
  SaveToCSV(List, vOptionsLocalFile, ';', 19);
end;

procedure TTuningExtformsList.EditPath;
begin
  if List.Selected = nil then
    exit;

  with TfrmEditPath.Create(nil) do begin
    vListDir := List;
    vTypeOperation := 'Edit';
    ShowModal;
    Free;
  end;
  SaveToCSV(List, vOptionsFile, ';', 17);
  SaveToCSV(List, vOptionsPersonalFile, ';', 18);
  SaveToCSV(List, vOptionsLocalFile, ';', 19);
  Refresh;
end;

procedure TTuningExtformsList.NewParh;
begin
  with TfrmEditPath.Create(nil) do begin
    vListDir := List;
    vTypeOperation := 'Insert';
    ShowModal;
    Free;
  end;
  SaveToCSV(List, vOptionsFile, ';', 17);
  SaveToCSV(List, vOptionsPersonalFile, ';', 18);
  SaveToCSV(List, vOptionsLocalFile, ';', 19);

  Refresh;
end;

procedure TTuningExtformsList.Refresh;
var
  i: Integer;
begin

  if not FileExists(vOptionsFile) then begin
    FileClose(FileCreate(vOptionsFile));
    SaveToCSV(List, vOptionsFile, ';', 17);
    SaveToCSV(List, vOptionsPersonalFile, ';', 18);
    SaveToCSV(List, vOptionsLocalFile, ';', 19);
  end;

  List.Items.BeginUpdate;

  LoadFromCSV(List, vOptionsFile, ';', 17);
  LoadFromCSV(List, vOptionsPersonalFile, ';', 18, False);
  LoadFromCSV(List, vOptionsLocalFile, ';', 19, False);

  try
    for i := 0 to List.Items.Count - 1 do begin
      if List.Items.Item[i].SubItems[2] = '-1' then
        List.Items.Item[i].SubItems[0] := IncludeTrailingBackslash(frm.FConfigurator.IBDir) + List.Items.Item[i].SubItems[0]
      else
        List.Items.Item[i].SubItems[2] := '0';
    end;
  except
    //
  end;
  List.Items.EndUpdate;
end;

constructor TTuningExtformsList.CreateObj(frmEF: TTreeeFilesActiveFormX);
begin
  inherited Create;
  frm := frmEF;
  List := frm.ListViewDirs;
end;
//------------------------------------------------------------------------------

destructor TTuningExtformsList.Destroy;
begin
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTuningExtformsList, Class_TuningExtformsList,
    ciMultiInstance, tmApartment);
end.
