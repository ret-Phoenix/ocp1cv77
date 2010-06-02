object frmEditCardToDo: TfrmEditCardToDo
  Left = 477
  Top = 200
  Width = 468
  Height = 571
  Caption = #1047#1072#1076#1072#1095#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClick = FormClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 146
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 75
      Width = 79
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      FocusControl = DBEditName
    end
    object Label7: TLabel
      Left = 8
      Top = 27
      Width = 70
      Height = 13
      Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100':'
    end
    object Label3: TLabel
      Left = 349
      Top = 102
      Width = 8
      Height = 13
      Caption = '%'
      FocusControl = DBEditprcnt
    end
    object Label8: TLabel
      Left = 8
      Top = 100
      Width = 34
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089
    end
    object Label9: TLabel
      Left = 8
      Top = 6
      Width = 34
      Height = 13
      Caption = #1056#1077#1083#1080#1079':'
    end
    object Label15: TLabel
      Left = 8
      Top = 53
      Width = 81
      Height = 13
      Caption = #1047#1072#1076#1072#1095#1072' ('#1086#1089#1085#1086#1074'.):'
    end
    object btnManageReliseShow: TSpeedButton
      Left = 400
      Top = 3
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        01000000000024000000C40E0000C40E0000020000000000000000000000FFFF
        FF00FE800000FC000000C0800000B98000007D8000007D8000007D800000BB80
        0000C7800000}
      OnClick = btnManageReliseShowClick
    end
    object btnManageReliseAdd: TSpeedButton
      Left = 416
      Top = 3
      Width = 17
      Height = 20
      Glyph.Data = {
        56000000424D56000000000000003E0000002800000006000000060000000100
        010000000000180000000000000000000000020000000000000000000000FFFF
        FF00CC020000CC0000000000000000000000CC000000CC000000}
      OnClick = btnManageReliseAddClick
    end
    object btnManageReliseClear: TSpeedButton
      Left = 432
      Top = 3
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000200000000000000FFFF
        FF00FF80E4009C80E400C9800000E380FFFFE3803300C98066009C800000FF80
        0000FF80E400}
      OnClick = btnManageReliseClearClick
    end
    object btnManageRecipientShow: TSpeedButton
      Left = 400
      Top = 27
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        01000000000024000000C40E0000C40E0000020000000000000000000000FFFF
        FF00FE800000FC000000C0800000B98000007D8000007D8000007D800000BB80
        0000C7800000}
      OnClick = btnManageRecipientShowClick
    end
    object btnManageRecipientAdd: TSpeedButton
      Left = 416
      Top = 27
      Width = 17
      Height = 20
      Glyph.Data = {
        56000000424D56000000000000003E0000002800000006000000060000000100
        010000000000180000000000000000000000020000000000000000000000FFFF
        FF00CC020000CC0000000000000000000000CC000000CC000000}
      OnClick = btnManageRecipientAddClick
    end
    object btnManageRecipientClear: TSpeedButton
      Left = 432
      Top = 27
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000200000000000000FFFF
        FF00FF80E4009C80E400C9800000E380FFFFE3803300C98066009C800000FF80
        0000FF80E400}
      OnClick = btnManageRecipientClearClick
    end
    object btnManageParentToDoShow: TSpeedButton
      Left = 400
      Top = 51
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        01000000000024000000C40E0000C40E0000020000000000000000000000FFFF
        FF00FE800000FC000000C0800000B98000007D8000007D8000007D800000BB80
        0000C7800000}
      OnClick = btnManageParentToDoShowClick
    end
    object btnManageParentToDoChoice: TSpeedButton
      Left = 416
      Top = 51
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000200000000000000FFFF
        FF00FF80E600B680E600B6800000FF800000FF800000FF80E600FF800000FF80
        E600FF800000}
      OnClick = btnManageParentToDoChoiceClick
    end
    object btnManageParentToDoClear: TSpeedButton
      Left = 432
      Top = 51
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000200000000000000FFFF
        FF00FF80E4009C80E400C9800000E380FFFFE3803300C98066009C800000FF80
        0000FF80E400}
      OnClick = btnManageParentToDoClearClick
    end
    object btnManageStatusShow: TSpeedButton
      Left = 296
      Top = 99
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        01000000000024000000C40E0000C40E0000020000000000000000000000FFFF
        FF00FE800000FC000000C0800000B98000007D8000007D8000007D800000BB80
        0000C7800000}
      OnClick = btnManageStatusShowClick
    end
    object btnManageStatusAdd: TSpeedButton
      Left = 312
      Top = 99
      Width = 17
      Height = 20
      Glyph.Data = {
        56000000424D56000000000000003E0000002800000006000000060000000100
        010000000000180000000000000000000000020000000000000000000000FFFF
        FF00CC020000CC0000000000000000000000CC000000CC000000}
      OnClick = btnManageStatusAddClick
    end
    object btnManageStatusClear: TSpeedButton
      Left = 328
      Top = 99
      Width = 17
      Height = 20
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000200000000000000FFFF
        FF00FF80E4009C80E400C9800000E380FFFFE3803300C98066009C800000FF80
        0000FF80E400}
      OnClick = btnManageStatusClearClick
    end
    object Label19: TLabel
      Left = 8
      Top = 126
      Width = 66
      Height = 13
      Caption = #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100
    end
    object Label5: TLabel
      Left = 320
      Top = 126
      Width = 57
      Height = 13
      Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
    end
    object DBEditName: TDBEdit
      Left = 104
      Top = 75
      Width = 345
      Height = 21
      DataField = 'Name'
      DataSource = DS_QDocument
      TabOrder = 3
    end
    object DBCheckBoxDone: TDBCheckBox
      Left = 400
      Top = 101
      Width = 49
      Height = 17
      Caption = 'Done'
      DataField = 'Done'
      DataSource = DS_QDocument
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEditprcnt: TDBEdit
      Left = 360
      Top = 99
      Width = 33
      Height = 21
      DataField = 'Complete'
      DataSource = DS_QDocument
      TabOrder = 5
    end
    object JvDBLookupCombo2: TJvDBLookupCombo
      Left = 104
      Top = 3
      Width = 295
      Height = 21
      DataField = 'ReliseID'
      DataSource = DS_QDocument
      LookupField = 'ID'
      LookupDisplay = 'Name'
      LookupSource = DSQListRelises
      TabOrder = 0
      OnDropDown = DBLookupComboBoxRlsEnter
    end
    object JvDBLookupCombo3: TJvDBLookupCombo
      Left = 104
      Top = 27
      Width = 295
      Height = 21
      DataField = 'RecipientID'
      DataSource = DS_QDocument
      LookupField = 'ID'
      LookupDisplay = 'Name'
      LookupSource = DS_QListUsers
      TabOrder = 1
    end
    object JvDBLookupCombo4: TJvDBLookupCombo
      Left = 104
      Top = 51
      Width = 295
      Height = 21
      DataField = 'ParentToDoID'
      DataSource = DS_QDocument
      LookupField = 'ID'
      LookupDisplay = 'Name'
      LookupSource = DS_QListToDo
      TabOrder = 2
    end
    object JvDBLookupCombo5: TJvDBLookupCombo
      Left = 104
      Top = 99
      Width = 191
      Height = 21
      DataField = 'StatusID'
      DataSource = DS_QDocument
      LookupField = 'ID'
      LookupDisplay = 'Name'
      LookupSource = DS_QListStatuses
      TabOrder = 4
      OnChange = JvDBLookupCombo5Change
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 104
      Top = 123
      Width = 191
      Height = 21
      DataField = 'SeriousnessID'
      DataSource = DS_QDocument
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DS_QListSeriousness
      TabOrder = 7
    end
    object Button2: TButton
      Left = 296
      Top = 123
      Width = 17
      Height = 18
      Caption = 'X'
      TabOrder = 8
      OnClick = btnClearParentToDoClick
    end
    object JvDBSpinEdit1: TJvDBSpinEdit
      Left = 384
      Top = 123
      Width = 49
      Height = 21
      TabOrder = 9
      DataField = 'Priority'
      DataSource = DS_QDocument
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 146
    Width = 460
    Height = 350
    ActivePage = TabSheet6
    Align = alClient
    MultiLine = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      object Splitter1: TSplitter
        Left = 0
        Top = 206
        Width = 452
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Splitter2: TSplitter
        Left = 0
        Top = 112
        Width = 452
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 452
        Height = 112
        Align = alClient
        DataField = 'Note'
        DataSource = DS_QDocument
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object JvRollOut1: TJvRollOut
        Left = 0
        Top = 115
        Width = 452
        Height = 91
        Align = alBottom
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1090' '#1085#1077#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        TabOrder = 1
        FAWidth = 145
        FAHeight = 91
        FCWidth = 22
        FCHeight = 22
        object dbmmo1: TDBMemo
          Left = 1
          Top = 21
          Width = 450
          Height = 69
          Align = alClient
          DataField = 'UnsolvedProblem'
          DataSource = DS_QDocument
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object JvRollOut2: TJvRollOut
        Left = 0
        Top = 209
        Width = 452
        Height = 95
        Align = alBottom
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1087#1086' '#1093#1086#1076#1091' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        TabOrder = 2
        FAWidth = 145
        FAHeight = 95
        FCWidth = 22
        FCHeight = 22
        object DBMemo3: TDBMemo
          Left = 1
          Top = 21
          Width = 450
          Height = 73
          Align = alClient
          DataField = 'Comments'
          DataSource = DS_QDocument
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1083#1103' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 1
      object DBMemo2: TDBMemo
        Left = 0
        Top = 0
        Width = 452
        Height = 311
        Align = alClient
        DataField = 'ReportText'
        DataSource = DS_QDocument
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1080#1074#1085#1099#1077
      ImageIndex = 2
      object Label11: TLabel
        Left = 5
        Top = 10
        Width = 33
        Height = 13
        Caption = #1040#1074#1090#1086#1088':'
      end
      object Label12: TLabel
        Left = 232
        Top = 11
        Width = 80
        Height = 13
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103':'
      end
      object Label13: TLabel
        Left = 5
        Top = 35
        Width = 49
        Height = 13
        Caption = #1048#1079#1084#1077#1085#1080#1083':'
      end
      object Label14: TLabel
        Left = 232
        Top = 35
        Width = 88
        Height = 13
        Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
      end
      object Label20: TLabel
        Left = 8
        Top = 128
        Width = 71
        Height = 13
        Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 56
        Top = 8
        Width = 177
        Height = 21
        DataField = 'AuthorID'
        DataSource = DS_QDocument
        KeyField = 'ID'
        ListField = 'Name'
        ListSource = DS_QListUsers
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 320
        Top = 8
        Width = 105
        Height = 21
        DataField = 'DateTimeCreate'
        DataSource = DS_QDocument
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 56
        Top = 32
        Width = 177
        Height = 21
        DataField = 'LastEditorID'
        DataSource = DS_QDocument
        KeyField = 'ID'
        ListField = 'Name'
        ListSource = DS_QListUsers
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 320
        Top = 32
        Width = 105
        Height = 21
        DataField = 'LastEditDateTime'
        DataSource = DS_QDocument
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object DBCheckBoxRep: TDBCheckBox
        Left = 344
        Top = 96
        Width = 81
        Height = 17
        Caption = #1044#1083#1103' '#1086#1090#1095#1077#1090#1072
        DataField = 'ForReport'
        DataSource = DS_QDocument
        TabOrder = 5
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 56
        Width = 329
        Height = 68
        Caption = #1055#1077#1088#1080#1086#1076' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        TabOrder = 4
        object Label2: TLabel
          Left = 8
          Top = 40
          Width = 96
          Height = 13
          Caption = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072' ('#1092#1072#1082#1090'):'
        end
        object Label1: TLabel
          Left = 8
          Top = 19
          Width = 101
          Height = 13
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' ('#1092#1072#1082#1090'):'
        end
        object Label16: TLabel
          Left = 200
          Top = 43
          Width = 30
          Height = 13
          Caption = '('#1087#1083#1072#1085')'
        end
        object Label17: TLabel
          Left = 200
          Top = 22
          Width = 30
          Height = 13
          Caption = '('#1087#1083#1072#1085')'
        end
        object JvDBDateEdit1: TJvDBDateEdit
          Left = 112
          Top = 16
          Width = 85
          Height = 21
          DataField = 'DateStart'
          DataSource = DS_QDocument
          TabOrder = 0
        end
        object JvDBDateEdit2: TJvDBDateEdit
          Left = 112
          Top = 40
          Width = 84
          Height = 21
          DataField = 'DateEnd'
          DataSource = DS_QDocument
          TabOrder = 2
        end
        object JvDBDateEdit3: TJvDBDateEdit
          Left = 240
          Top = 16
          Width = 84
          Height = 21
          DataField = 'DateStartPlan'
          DataSource = DS_QDocument
          TabOrder = 1
        end
        object JvDBDateEdit4: TJvDBDateEdit
          Left = 240
          Top = 40
          Width = 84
          Height = 21
          DataField = 'DateEndPlan'
          DataSource = DS_QDocument
          TabOrder = 3
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 222
        Width = 452
        Height = 82
        Align = alBottom
        Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
        TabOrder = 8
        object DBMemo4: TDBMemo
          Left = 2
          Top = 15
          Width = 448
          Height = 65
          Align = alClient
          DataField = 'KeyWords'
          DataSource = DS_QDocument
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 8
        Top = 144
        Width = 225
        Height = 21
        DataField = 'ManagerID'
        DataSource = DS_QDocument
        KeyField = 'ID'
        ListField = 'Name'
        ListSource = DS_QListUsers
        TabOrder = 6
      end
      object Button3: TButton
        Left = 235
        Top = 145
        Width = 17
        Height = 18
        Caption = 'X'
        TabOrder = 7
        OnClick = Button3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1055#1086#1076#1095#1080#1085#1077#1085#1080#1077
      ImageIndex = 3
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 452
        Height = 73
        Align = alTop
        TabOrder = 0
        object SpeedButton3: TSpeedButton
          Left = 424
          Top = 6
          Width = 17
          Height = 20
          Glyph.Data = {
            62000000424D62000000000000003E0000002800000009000000090000000100
            010000000000240000000000000000000000020000000200000000000000FFFF
            FF00FF80E4009C80E400C9800000E380FFFFE3803300C98066009C800000FF80
            0000FF80E400}
          OnClick = btnManageParentToDoClearClick
        end
        object Label18: TLabel
          Left = 8
          Top = 9
          Width = 78
          Height = 13
          Caption = 'Change request:'
        end
        object JvDBLookupCombo6: TJvDBLookupCombo
          Left = 156
          Top = 6
          Width = 269
          Height = 21
          DataField = 'CRT'
          DataSource = DS_QDocument
          LookupField = 'ID'
          LookupDisplay = 'Name'
          LookupSource = dsListCR
          TabOrder = 1
        end
        object rgTypeChilds: TRadioGroup
          Left = 10
          Top = 32
          Width = 231
          Height = 33
          Caption = #1042#1072#1088#1080#1072#1085#1090
          Columns = 2
          Items.Strings = (
            #1055#1086#1076#1095#1080#1085#1077#1085#1085#1099#1077
            #1042#1089#1077' '#1079#1072#1076#1072#1095#1080' '#1087#1086' CR')
          TabOrder = 2
          OnClick = rgTypeChildsClick
        end
        object DBEdit1: TDBEdit
          Left = 88
          Top = 6
          Width = 65
          Height = 21
          DataField = 'CRT'
          DataSource = DS_QDocument
          TabOrder = 0
        end
      end
      object TreeList1: TTreeList
        Left = 0
        Top = 89
        Width = 452
        Height = 215
        Align = alClient
        HideSelection = False
        Indent = 19
        ReadOnly = True
        RightClickSelect = True
        RowSelect = True
        TabOrder = 2
        Visible = True
        OnDblClick = TreeList1DblClick
        OnExpanding = TreeList1Expanding
        Columns = <
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Image = True
            Width = 250
          end
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #1057#1090#1072#1090#1091#1089
            Width = 100
          end
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
            Width = 100
          end>
        ColumnLines = True
        Separator = ';'
        ItemHeight = 16
        HeaderSettings.AllowResize = True
        HeaderSettings.Color = clBtnFace
        HeaderSettings.Flat = True
        HeaderSettings.Font.Charset = DEFAULT_CHARSET
        HeaderSettings.Font.Color = clWindowText
        HeaderSettings.Font.Height = -11
        HeaderSettings.Font.Name = 'MS Sans Serif'
        HeaderSettings.Font.Style = []
        HeaderSettings.Height = 18
        Version = '1.0.1.0'
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1055#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1100' ('#1052#1044')'
      ImageIndex = 4
      object btnManageSubConfigAdd: TSpeedButton
        Left = 416
        Top = 25
        Width = 17
        Height = 20
        Glyph.Data = {
          56000000424D56000000000000003E0000002800000006000000060000000100
          010000000000180000000000000000000000020000000000000000000000FFFF
          FF00CC020000CC0000000000000000000000CC000000CC000000}
        OnClick = btnManageSubConfigAddClick
      end
      object Label6: TLabel
        Left = 8
        Top = 5
        Width = 90
        Height = 13
        Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 27
        Width = 95
        Height = 13
        Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
      end
      object btnManageSubConfigShow: TSpeedButton
        Left = 400
        Top = 25
        Width = 17
        Height = 20
        Glyph.Data = {
          62000000424D62000000000000003E0000002800000009000000090000000100
          01000000000024000000C40E0000C40E0000020000000000000000000000FFFF
          FF00FE800000FC000000C0800000B98000007D8000007D8000007D800000BB80
          0000C7800000}
        OnClick = btnManageSubConfigShowClick
      end
      object btnManageSubConfigClear: TSpeedButton
        Left = 432
        Top = 25
        Width = 17
        Height = 20
        Glyph.Data = {
          62000000424D62000000000000003E0000002800000009000000090000000100
          010000000000240000000000000000000000020000000200000000000000FFFF
          FF00FF80E4009C80E400C9800000E380FFFFE3803300C98066009C800000FF80
          0000FF80E400}
        OnClick = btnManageSubConfigClearClick
      end
      object btnSSChoice: TButton
        Left = 2
        Top = 45
        Width = 17
        Height = 264
        Caption = '...'
        TabOrder = 2
        OnClick = btnSSChoiceClick
      end
      object MemoSubSystems: TMemo
        Left = 24
        Top = 48
        Width = 425
        Height = 78
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object MemoObjTypes: TMemo
        Left = 24
        Top = 133
        Width = 425
        Height = 67
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object ListViewObj: TListView
        Left = 24
        Top = 208
        Width = 425
        Height = 102
        Columns = <
          item
            AutoSize = True
          end>
        ColumnClick = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        TabOrder = 5
        ViewStyle = vsReport
        OnDblClick = ListViewObjDblClick
      end
      object DBLookupComboBoxCfg: TDBLookupComboBox
        Left = 104
        Top = 1
        Width = 346
        Height = 21
        DataField = 'ConfigID'
        DataSource = DS_QDocument
        KeyField = 'ID'
        ListField = 'Name'
        ListSource = DS_QListConfigs
        TabOrder = 0
      end
      object JvDBLookupCombo1: TJvDBLookupCombo
        Left = 104
        Top = 25
        Width = 295
        Height = 21
        DataField = 'SubconfigID'
        DataSource = DS_QDocument
        LookupField = 'ID'
        LookupDisplay = 'Name'
        LookupSource = DSQListSubconfigs
        TabOrder = 1
        OnDropDown = DBLookupComboBoxSubCfgEnter
      end
    end
    object TabSheet7: TTabSheet
      Caption = #1048#1085#1080#1094#1080#1072#1090#1086#1088#1099
      ImageIndex = 6
      object DBGrid1: TDBGrid
        Left = 0
        Top = 22
        Width = 452
        Height = 258
        Align = alClient
        DataSource = DS_QSubListIniciators
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Iniciator'
            Title.Caption = #1048#1085#1080#1094#1080#1072#1090#1086#1088
            Visible = True
          end>
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 452
        Height = 22
        AutoSize = True
        Caption = 'ToolBar1'
        EdgeBorders = []
        Flat = True
        TabOrder = 0
        object btnIniciatorsRefresh: TToolButton
          Left = 0
          Top = 0
          Caption = 'btnIniciatorsRefresh'
          ImageIndex = 0
          OnClick = btnIniciatorsRefreshClick
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object btnIniciatorsNew: TToolButton
          Left = 31
          Top = 0
          Caption = 'btnIniciatorsNew'
          ImageIndex = 1
          OnClick = btnIniciatorsNewClick
        end
        object btnIniciatorsSave: TToolButton
          Left = 54
          Top = 0
          Caption = 'btnIniciatorsSave'
          ImageIndex = 6
          OnClick = btnIniciatorsSaveClick
        end
        object btnIniciatorsDelete: TToolButton
          Left = 77
          Top = 0
          Caption = 'btnIniciatorsDelete'
          ImageIndex = 3
          OnClick = btnIniciatorsDeleteClick
        end
        object btnInitiatorsCancel: TToolButton
          Left = 100
          Top = 0
          Caption = 'btnInitiatorsCancel'
          ImageIndex = 94
          OnClick = btnInitiatorsCancelClick
        end
      end
    end
    object tsFiles: TTabSheet
      Caption = #1060#1072#1081#1083#1099
      ImageIndex = 8
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 452
        Height = 22
        AutoSize = True
        Caption = 'ToolBar3'
        EdgeBorders = []
        Flat = True
        TabOrder = 0
        object btnFilesRefresh: TToolButton
          Left = 0
          Top = 0
          Caption = 'btnFilesRefresh'
          ImageIndex = 0
          OnClick = btnFilesRefreshClick
        end
        object btn2: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'btn2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object btnFilesNew: TToolButton
          Left = 31
          Top = 0
          Caption = 'btnFilesNew'
          ImageIndex = 1
          OnClick = btnFilesNewClick
        end
        object btnFilesSave: TToolButton
          Left = 54
          Top = 0
          Caption = 'btnFilesSave'
          ImageIndex = 6
          OnClick = btnFilesSaveClick
        end
        object btnFilesDelete: TToolButton
          Left = 77
          Top = 0
          Caption = 'btnFilesDelete'
          ImageIndex = 3
          OnClick = btnFilesDeleteClick
        end
        object btnFilesCancel: TToolButton
          Left = 100
          Top = 0
          Caption = 'btnFilesCancel'
          ImageIndex = 94
          OnClick = btnFilesCancelClick
        end
        object ToolButton1: TToolButton
          Left = 123
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object btnFilesChoiceFile: TToolButton
          Left = 131
          Top = 0
          Caption = 'btnFilesChoiceFile'
          ImageIndex = 93
          OnClick = btnFilesChoiceFileClick
        end
        object btnFilesOpenFile: TToolButton
          Left = 154
          Top = 0
          Caption = 'btnFilesOpenFile'
          ImageIndex = 88
          OnClick = btnFilesOpenFileClick
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 22
        Width = 452
        Height = 258
        Align = alClient
        DataSource = DS_QListFiles
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Name'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Path'
            Width = 203
            Visible = True
          end>
      end
    end
    object ts1: TTabSheet
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1090#1072#1090#1091#1089#1086#1074
      ImageIndex = 11
      object dbgrd2: TDBGrid
        Left = 0
        Top = 22
        Width = 452
        Height = 258
        Align = alClient
        DataSource = ds_qryQSubListStatusHistory
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DateChange'
            Title.Caption = #1044#1072#1090#1072
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'User'
            Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status'
            Title.Caption = #1053#1086#1074#1099#1081' '#1089#1090#1072#1090#1091#1089
            Width = 100
            Visible = True
          end>
      end
      object tlb1: TToolBar
        Left = 0
        Top = 0
        Width = 452
        Height = 22
        AutoSize = True
        Caption = 'tlb1'
        EdgeBorders = []
        Flat = True
        TabOrder = 0
        object btnSHRefresh: TToolButton
          Left = 0
          Top = 0
          Caption = 'btnSHRefresh'
          ImageIndex = 0
          OnClick = btnSHRefreshClick
        end
        object btn1: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'btn1'
          Style = tbsSeparator
        end
        object btnSHDelete: TToolButton
          Left = 31
          Top = 0
          Caption = 'btnSHDelete'
          ImageIndex = 3
          OnClick = btnSHDeleteClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      ImageIndex = 11
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 452
        Height = 304
        ActivePage = TabSheet8
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object tsLogEdits: TTabSheet
          Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
          ImageIndex = 10
          object ToolBar5: TToolBar
            Left = 0
            Top = 0
            Width = 444
            Height = 22
            AutoSize = True
            Caption = 'ToolBar4'
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            object btnLogRefresh: TToolButton
              Left = 0
              Top = 0
              Caption = 'btnBlocksRefresh'
              ImageIndex = 0
              OnClick = btnLogRefreshClick
            end
            object ToolButton6: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object btnLogEdit: TToolButton
              Left = 31
              Top = 0
              Caption = 'btnBlocksEdit'
              ImageIndex = 2
              OnClick = btnLogEditClick
            end
          end
          object JvDBGrid2: TJvDBGrid
            Left = 0
            Top = 22
            Width = 444
            Height = 251
            Align = alClient
            DataSource = dsQSubListLog
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Name'
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 275
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DateChange'
                Title.Caption = #1044#1072#1090#1072
                Width = 70
                Visible = True
              end>
          end
        end
        object tsBlocks: TTabSheet
          Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1080
          ImageIndex = 9
          object ToolBar4: TToolBar
            Left = 0
            Top = 0
            Width = 444
            Height = 22
            AutoSize = True
            Caption = 'ToolBar4'
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            object btnBlocksRefresh: TToolButton
              Left = 0
              Top = 0
              Caption = 'btnBlocksRefresh'
              ImageIndex = 0
              OnClick = btnBlocksRefreshClick
            end
            object ToolButton5: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object btnBlocksEdit: TToolButton
              Left = 31
              Top = 0
              Caption = 'btnBlocksEdit'
              ImageIndex = 2
              OnClick = btnBlocksEditClick
            end
          end
          object JvDBGrid1: TJvDBGrid
            Left = 0
            Top = 22
            Width = 444
            Height = 251
            Align = alClient
            DataSource = dsQSubListBlocks
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Name'
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 270
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Blocked'
                Title.Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085
                Width = 80
                Visible = True
              end>
          end
        end
        object TabSheet8: TTabSheet
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
          ImageIndex = 7
          object ToolBar2: TToolBar
            Left = 0
            Top = 0
            Width = 444
            Height = 22
            AutoSize = True
            Caption = 'ToolBar1'
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            object btnCategoryesRefresh: TToolButton
              Left = 0
              Top = 0
              Caption = 'btnIniciatorsRefresh'
              ImageIndex = 0
              OnClick = btnCategoryesRefreshClick
            end
            object ToolButton3: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object btnCategoryesNew: TToolButton
              Left = 31
              Top = 0
              Caption = 'btnIniciatorsNew'
              ImageIndex = 1
              OnClick = btnCategoryesNewClick
            end
            object btnCategoryesSave: TToolButton
              Left = 54
              Top = 0
              Caption = 'btnIniciatorsSave'
              ImageIndex = 6
              OnClick = btnCategoryesSaveClick
            end
            object btnCategoryesDelete: TToolButton
              Left = 77
              Top = 0
              Caption = 'btnIniciatorsDelete'
              ImageIndex = 3
              OnClick = btnCategoryesDeleteClick
            end
            object btnCategoryesCancel: TToolButton
              Left = 100
              Top = 0
              Caption = 'btnCategoryesCancel'
              ImageIndex = 94
              OnClick = btnCategoryesCancelClick
            end
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 22
            Width = 444
            Height = 251
            Align = alClient
            DataSource = DS_QSubListCategoryes
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Category'
                Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
                Visible = True
              end>
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 496
    Width = 460
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnOk: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnPost: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 1
      OnClick = btnPostClick
    end
    object DBEdit4: TDBEdit
      Left = 376
      Top = 12
      Width = 81
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = True
      DataField = 'id'
      DataSource = DS_QDocument
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 72
    object xcx1: TMenuItem
      Caption = 'xcx'
      OnClick = xcx1Click
    end
  end
  object QDocument: TADOQuery
    AutoCalcFields = False
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from ToDo where id=86')
    Left = 48
    Top = 312
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentConfigID: TIntegerField
      FieldName = 'ConfigID'
      OnChange = QDocumentConfigIDChange
    end
    object QDocumentName: TWideStringField
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 50
    end
    object QDocumentPriority: TIntegerField
      FieldName = 'Priority'
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
    object QDocumentDone: TBooleanField
      FieldName = 'Done'
    end
    object QDocumentDateStart: TDateTimeField
      FieldName = 'DateStart'
    end
    object QDocumentDateEnd: TDateTimeField
      FieldName = 'DateEnd'
    end
    object QDocumentComplete: TIntegerField
      FieldName = 'Complete'
    end
    object QDocumentReliseID: TIntegerField
      FieldName = 'ReliseID'
    end
    object QDocumentStatusID: TIntegerField
      FieldName = 'StatusID'
    end
    object QDocumentForReport: TBooleanField
      FieldName = 'ForReport'
    end
    object QDocumentReportText: TMemoField
      FieldName = 'ReportText'
      BlobType = ftMemo
    end
    object QDocumentSubconfigID: TIntegerField
      FieldName = 'SubconfigID'
    end
    object QDocumentAuthorID: TIntegerField
      FieldName = 'AuthorID'
    end
    object QDocumentRecipientID: TIntegerField
      FieldName = 'RecipientID'
    end
    object QDocumentDateTimeCreate: TDateTimeField
      FieldName = 'DateTimeCreate'
    end
    object QDocumentParentToDoID: TIntegerField
      FieldName = 'ParentToDoID'
    end
    object QDocumentLastEditorID: TIntegerField
      FieldName = 'LastEditorID'
    end
    object QDocumentLastEditDateTime: TDateTimeField
      FieldName = 'LastEditDateTime'
    end
    object QDocumentDateStartPlan: TDateTimeField
      FieldName = 'DateStartPlan'
    end
    object QDocumentDateEndPlan: TDateTimeField
      FieldName = 'DateEndPlan'
    end
    object QDocumentSeriousness: TIntegerField
      FieldName = 'SeriousnessID'
    end
    object QDocumentCRT: TIntegerField
      FieldName = 'CRT'
    end
    object QDocumentUnsolvedProblem: TMemoField
      FieldName = 'UnsolvedProblem'
      BlobType = ftMemo
    end
    object QDocumentKeyWords: TMemoField
      FieldName = 'KeyWords'
      BlobType = ftMemo
    end
    object QDocumentManagerID: TIntegerField
      FieldName = 'ManagerID'
    end
    object mQDocumentComments: TMemoField
      FieldName = 'Comments'
      BlobType = ftMemo
    end
  end
  object DS_QDocument: TDataSource
    DataSet = QDocument
    Left = 80
    Top = 312
  end
  object PopupMenuSS: TPopupMenu
    Left = 168
    Top = 72
    object SubSystems1: TMenuItem
      Caption = 'SubSystems'
      OnClick = SubSystems1Click
    end
  end
  object QListRelises: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from Relises')
    Left = 248
    Top = 424
  end
  object DSQListRelises: TDataSource
    DataSet = QListRelises
    Left = 280
    Top = 424
  end
  object DS_QListStatuses: TDataSource
    DataSet = QListStatuses
    Left = 240
    Top = 40
  end
  object QListStatuses: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from Statuses')
    Left = 216
    Top = 56
  end
  object DS_QListConfigs: TDataSource
    DataSet = QListConfigs
    Left = 336
    Top = 296
  end
  object QListConfigs: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from Configs')
    Left = 304
    Top = 296
  end
  object QListSubconfigs: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from subconfigs')
    Left = 132
    Top = 40
  end
  object DSQListSubconfigs: TDataSource
    DataSet = QListSubconfigs
    Left = 164
    Top = 40
  end
  object QListUsers: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from Users')
    Left = 220
    Top = 296
  end
  object DS_QListUsers: TDataSource
    DataSet = QListUsers
    Left = 252
    Top = 296
  end
  object QListToDo: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select id,name from ToDo order by Name')
    Left = 280
    Top = 40
    object QListToDoID: TIntegerField
      FieldName = 'ID'
    end
    object QListToDoName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object DS_QListToDo: TDataSource
    DataSet = QListToDo
    Left = 312
    Top = 40
  end
  object QListSeriousness: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select ID,Name from Seriousness')
    Left = 308
    Top = 99
  end
  object DS_QListSeriousness: TDataSource
    DataSet = QListSeriousness
    Left = 340
    Top = 99
  end
  object QSubListIniciators: TADOQuery
    OnNewRecord = QSubListIniciatorsNewRecord
    Parameters = <>
    SQL.Strings = (
      'select * from ToDoAccessory whereTypeDataID=4')
    Left = 148
    Top = 427
    object QSubListIniciatorsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QSubListIniciatorsToDoID: TIntegerField
      FieldName = 'ToDoID'
    end
    object QSubListIniciatorsTypeDataID: TIntegerField
      FieldName = 'TypeDataID'
    end
    object QSubListIniciatorsObjId: TIntegerField
      FieldName = 'ObjId'
    end
    object QSubListIniciatorsIniciator: TStringField
      FieldKind = fkLookup
      FieldName = 'Iniciator'
      LookupDataSet = QListUsers
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ObjId'
      Size = 50
      Lookup = True
    end
  end
  object DS_QSubListIniciators: TDataSource
    DataSet = QSubListIniciators
    Left = 172
    Top = 427
  end
  object QSubListCategoryes: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from ToDoAccessory where TypeDataID=5')
    Left = 164
    Top = 387
    object QSubListCategoryesID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QSubListCategoryesToDoID: TIntegerField
      FieldName = 'ToDoID'
    end
    object QSubListCategoryesTypeDataID: TIntegerField
      FieldName = 'TypeDataID'
    end
    object QSubListCategoryesObjId: TIntegerField
      FieldName = 'ObjId'
    end
    object QSubListCategoryesCategory: TStringField
      FieldKind = fkLookup
      FieldName = 'Category'
      LookupDataSet = QListCategoryes
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ObjId'
      Size = 50
      Lookup = True
    end
  end
  object DS_QSubListCategoryes: TDataSource
    DataSet = QSubListCategoryes
    Left = 196
    Top = 387
  end
  object QListCategoryes: TADOQuery
    LockType = ltReadOnly
    BeforeInsert = QListCategoryesBeforeInsert
    Parameters = <>
    SQL.Strings = (
      'select ID,Name from Categoryes where Isfolder=false')
    Left = 332
    Top = 403
  end
  object DS_QListCategoryes: TDataSource
    DataSet = QListCategoryes
    Left = 364
    Top = 403
  end
  object QSubListFiles: TADOQuery
    OnNewRecord = QSubListFilesNewRecord
    Parameters = <>
    SQL.Strings = (
      'select * from ToDoFiles where ToDoID=0')
    Left = 132
    Top = 315
    object QSubListFilesID: TIntegerField
      FieldName = 'ID'
    end
    object QSubListFilesToDoID: TIntegerField
      FieldName = 'ToDoID'
    end
    object QSubListFilesName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object QSubListFilesPath: TStringField
      FieldName = 'Path'
      Size = 255
    end
  end
  object DS_QListFiles: TDataSource
    DataSet = QSubListFiles
    Left = 164
    Top = 315
  end
  object QSubListBlocks: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    Left = 292
    Top = 349
  end
  object dsQSubListBlocks: TDataSource
    DataSet = QSubListBlocks
    Left = 324
    Top = 349
  end
  object QSubListLog: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    Left = 68
    Top = 389
  end
  object dsQSubListLog: TDataSource
    DataSet = QSubListLog
    Left = 100
    Top = 389
  end
  object ds_qryQSubListStatusHistory: TDataSource
    DataSet = qryQSubListStatusHistory
    Left = 412
    Top = 261
  end
  object qryQSubListStatusHistory: TADOQuery
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from ToDoStatusHistory')
    Left = 412
    Top = 293
    object dQSubListStatusHistoryDateChange: TDateTimeField
      FieldName = 'DateChange'
    end
    object sQSubListStatusHistoryUser: TStringField
      FieldKind = fkLookup
      FieldName = 'User'
      LookupDataSet = QListUsers
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'UserID'
      Size = 50
      Lookup = True
    end
    object sQSubListStatusHistoryStatus: TStringField
      FieldKind = fkLookup
      FieldName = 'Status'
      LookupDataSet = QListStatuses
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'StatusID'
      Size = 50
      Lookup = True
    end
    object iQSubListStatusHistoryID: TIntegerField
      FieldName = 'ID'
    end
    object iQSubListStatusHistoryToDoID: TIntegerField
      FieldName = 'ToDoID'
    end
    object iQSubListStatusHistoryUserID: TIntegerField
      FieldName = 'UserID'
    end
    object iQSubListStatusHistoryStatusID: TIntegerField
      FieldName = 'StatusID'
    end
  end
  object QListCR: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id,name,stateSystem, stateReal from refCR')
    Left = 44
    Top = 461
    object QListCRid: TIntegerField
      FieldName = 'id'
    end
    object QListCRname: TStringField
      FieldName = 'name'
      Size = 150
    end
    object QListCRstateSystem: TIntegerField
      FieldName = 'stateSystem'
    end
    object QListCRstateReal: TIntegerField
      FieldName = 'stateReal'
    end
    object QListCRStateSystemText: TStringField
      FieldKind = fkLookup
      FieldName = 'StateSystemText'
      LookupDataSet = QListStatuses
      LookupKeyFields = 'id'
      LookupResultField = 'Name'
      KeyFields = 'stateSystem'
      Size = 50
      Lookup = True
    end
  end
  object dsListCR: TDataSource
    DataSet = QListCR
    Left = 84
    Top = 461
  end
end
