object frmToDoAccessoryTuning: TfrmToDoAccessoryTuning
  Left = 434
  Top = 158
  Width = 434
  Height = 434
  AutoSize = True
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1079#1072#1076#1072#1095#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 426
    Height = 366
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1099
      object ListViewSubSystems: TListView
        Left = 0
        Top = 0
        Width = 418
        Height = 333
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            AutoSize = True
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1080#1087#1099' '#1084#1077#1090#1072#1076#1072#1085#1085#1099#1093
      ImageIndex = 1
      object ListViewTypeMetadataObj: TListView
        Left = 0
        Top = 0
        Width = 418
        Height = 333
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            AutoSize = True
          end>
        ColumnClick = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1073#1098#1077#1082#1090#1099' '#1084#1077#1090#1072#1076#1072#1085#1085#1099#1093
      ImageIndex = 2
      OnShow = TabSheet3Show
      object TreeViewMetadataObj: TTreeView
        Left = 0
        Top = 169
        Width = 418
        Height = 171
        Align = alClient
        HideSelection = False
        Indent = 19
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        OnDblClick = TreeViewMetadataObjDblClick
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 418
        Height = 169
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 0
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 418
          Height = 23
          AutoSize = True
          ButtonHeight = 21
          ButtonWidth = 145
          Caption = 'ToolBar1'
          EdgeBorders = []
          ShowCaptions = True
          TabOrder = 0
          object ToolButton1: TToolButton
            Left = 0
            Top = 2
            AutoSize = True
            Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1089#1099#1083#1082#1091' '#1085#1072' '#1086#1073#1098#1077#1082#1090
            Wrap = True
            OnClick = ToolButton1Click
          end
        end
        object ListViewObj: TListView
          Left = 0
          Top = 23
          Width = 418
          Height = 146
          Align = alClient
          Columns = <
            item
              AutoSize = True
            end>
          TabOrder = 1
          ViewStyle = vsReport
          OnCustomDrawItem = ListViewObjCustomDrawItem
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 366
    Width = 426
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOk: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnClose: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
end
