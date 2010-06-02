object frmSubSystems: TfrmSubSystems
  Left = 522
  Top = 228
  Width = 726
  Height = 675
  Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = ActiveFormActivate
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 2
    Top = 222
    Width = 76
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object Label16: TLabel
    Left = 274
    Top = 128
    Width = 58
    Height = 13
    Caption = #1048#1085#1080#1094#1080#1072#1090#1086#1088':'
  end
  object PageControlSubSystems: TPageControl
    Left = 0
    Top = 0
    Width = 718
    Height = 641
    ActivePage = TabSheetConfs
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpBottom
    object TabSheetMainSubSystems: TTabSheet
      Caption = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      OnShow = TabSheetMainSubSystemsShow
      object Splitter3: TSplitter
        Left = 395
        Top = 22
        Height = 593
        Align = alRight
      end
      object tvMetadata: TTreeView
        Left = 0
        Top = 22
        Width = 395
        Height = 593
        Align = alClient
        HideSelection = False
        Images = ImageListSubSustems
        Indent = 19
        ReadOnly = True
        RightClickSelect = True
        RowSelect = True
        StateImages = ImageListSubSustems
        TabOrder = 1
        OnAdvancedCustomDrawItem = tvMetadataAdvancedCustomDrawItem
        OnChange = tvMetadataChange
        OnClick = tvMetadataClick
        OnCompare = tvMetadataCompare
        OnDblClick = tvMetadataDblClick
        OnExpanding = tvMetadataExpanding
        OnKeyUp = tvMetadataKeyUp
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 710
        Height = 22
        AutoSize = True
        Caption = 'ToolBar1'
        EdgeBorders = []
        Flat = True
        HotImages = ImageListSubSustems
        Images = ImageListSubSustems
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object btnFullSubSystemObj: TToolButton
          Left = 0
          Top = 0
          Action = MetFillMetadataTree
        end
        object ToolButton3: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 18
          Style = tbsSeparator
        end
        object btnShowSaveTreeInFile: TToolButton
          Left = 31
          Top = 0
          Action = MetSaveTreeInFile
        end
        object ToolButton4: TToolButton
          Left = 54
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 18
          Style = tbsSeparator
        end
        object btnDelErrors: TToolButton
          Left = 62
          Top = 0
          Action = MetDelErrors
        end
        object btnDelCurrentError: TToolButton
          Left = 85
          Top = 0
          Action = MetDelCurrentError
        end
        object ToolButton2: TToolButton
          Left = 108
          Top = 0
          Action = ChoiceTreeItem
        end
        object ToolButton6: TToolButton
          Left = 131
          Top = 0
          Action = ShowOptionsWnd
        end
        object btn1: TToolButton
          Left = 154
          Top = 0
          Action = actMetExpandType
        end
        object ToolButton9: TToolButton
          Left = 177
          Top = 0
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ComboBoxView: TComboBox
          Left = 185
          Top = 0
          Width = 222
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = ComboBoxViewChange
          Items.Strings = (
            #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
            #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' + '#1089#1080#1085#1086#1085#1080#1084
            #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' + ID'
            #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' + '#1089#1080#1085#1086#1085#1080#1084' + ID')
        end
        object ToolButton25: TToolButton
          Left = 407
          Top = 0
          Width = 8
          Caption = 'ToolButton25'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object ToolButton28: TToolButton
          Left = 415
          Top = 0
          Action = ShowBookmarks
        end
        object ToolButton31: TToolButton
          Left = 438
          Top = 0
          Action = BookmarkNew
        end
        object ToolButton32: TToolButton
          Left = 461
          Top = 0
          Action = BookmarkDelete
        end
        object ToolButton33: TToolButton
          Left = 484
          Top = 0
          Action = BookmarkNext
        end
        object ToolButton34: TToolButton
          Left = 507
          Top = 0
          Action = BookmarkPrevios
        end
        object ToolButton35: TToolButton
          Left = 530
          Top = 0
          Width = 8
          Caption = 'ToolButton35'
          ImageIndex = 81
          Style = tbsSeparator
        end
        object ToolButton29: TToolButton
          Left = 538
          Top = 0
          Action = SetOptionsByName
        end
        object ToolButton30: TToolButton
          Left = 561
          Top = 0
          Action = SaveOptionsByName
        end
      end
      object Panel2: TPanel
        Left = 398
        Top = 22
        Width = 312
        Height = 593
        Align = alRight
        Constraints.MinWidth = 1
        TabOrder = 2
        object PageControlSubSystemsProps: TPageControl
          Left = 1
          Top = 17
          Width = 310
          Height = 575
          ActivePage = TabSheetAvailableSubSystems
          Align = alClient
          Constraints.MinWidth = 1
          MultiLine = True
          TabOrder = 1
          TabPosition = tpBottom
          object TabSheetProps: TTabSheet
            Caption = #1057#1074#1086#1081#1089#1090#1074#1072
            ImageIndex = 1
            OnShow = TabSheetPropsShow
            object Splitter5: TSplitter
              Left = 0
              Top = 456
              Width = 302
              Height = 3
              Cursor = crVSplit
              Align = alBottom
            end
            object PropsValueListEditor: TValueListEditor
              Left = 0
              Top = 0
              Width = 302
              Height = 456
              Align = alClient
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              TitleCaptions.Strings = (
                #1057#1074#1086#1081#1089#1090#1074#1086
                #1047#1085#1072#1095#1077#1085#1080#1077)
              OnClick = PropsValueListEditorClick
              ColWidths = (
                150
                146)
            end
            object Memo1: TMemo
              Left = 0
              Top = 459
              Width = 302
              Height = 54
              TabStop = False
              Align = alBottom
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              WantTabs = True
            end
          end
          object TabSheetLinks: TTabSheet
            Caption = #1057#1089#1099#1083#1082#1080
            ImageIndex = 3
            OnShow = TabSheetLinksShow
            object ToolBar9: TToolBar
              Left = 0
              Top = 0
              Width = 302
              Height = 22
              AutoSize = True
              Caption = 'ToolBar9'
              EdgeBorders = []
              Flat = True
              Images = ImageListSubSustems
              TabOrder = 0
              object ToolButton17: TToolButton
                Left = 0
                Top = 0
                Action = LinksRefresh
              end
              object ToolButton18: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'ToolButton18'
                ImageIndex = 1
                Style = tbsSeparator
              end
              object ToolButton19: TToolButton
                Left = 31
                Top = 0
                Action = LinksToText
              end
            end
            object TreeViewLinks: TTreeView
              Left = 0
              Top = 22
              Width = 302
              Height = 491
              Align = alClient
              HideSelection = False
              Indent = 19
              ReadOnly = True
              RightClickSelect = True
              RowSelect = True
              ShowButtons = False
              ShowLines = False
              ShowRoot = False
              TabOrder = 1
              OnDblClick = TreeViewLinksDblClick
            end
          end
          object TabSheetSSObj: TTabSheet
            Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1099
            OnShow = TabSheetSSObjShow
            object ListViewIncludeSubSystems: TListView
              Left = 0
              Top = 0
              Width = 302
              Height = 513
              Align = alClient
              Checkboxes = True
              Columns = <
                item
                  AutoSize = True
                  Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1072
                end>
              HideSelection = False
              SortType = stText
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
          object TabSheetExpl: TTabSheet
            Caption = 'Explorer'
            ImageIndex = 2
            OnShow = TabSheetExplShow
          end
          object TabSheetAvailableSubSystems: TTabSheet
            Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
            ImageIndex = 4
            OnShow = TabSheetAvailableSubSystemsShow
            object ListViewSubSystems: TListView
              Left = 0
              Top = 22
              Width = 302
              Height = 491
              Align = alClient
              Checkboxes = True
              Columns = <
                item
                  AutoSize = True
                  Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
                end>
              ReadOnly = True
              RowSelect = True
              SortType = stText
              TabOrder = 1
              ViewStyle = vsReport
            end
            object ToolBar4: TToolBar
              Left = 0
              Top = 0
              Width = 302
              Height = 22
              AutoSize = True
              Caption = 'ToolBar4'
              EdgeBorders = []
              Flat = True
              HotImages = ImageListSubSustems
              Images = ImageListSubSustems
              TabOrder = 0
              Transparent = False
              object ToolButton20: TToolButton
                Left = 0
                Top = 0
                Action = MetRefreshSubSystemsList
              end
              object ToolButton7: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'ToolButton7'
                ImageIndex = 11
                Style = tbsSeparator
              end
              object btnSelectAllSubSystems: TToolButton
                Left = 31
                Top = 0
                Action = MetChoiceAllSubSystems
              end
              object btnUnselectAllSubSystems: TToolButton
                Left = 54
                Top = 0
                Action = MetUnChoiceAllSubSystems
              end
              object btnInvertSelectionSubSystems: TToolButton
                Left = 77
                Top = 0
                Action = MetInvertSubSystems
              end
              object ToolButton66: TToolButton
                Left = 100
                Top = 0
                Width = 8
                Caption = 'ToolButton66'
                ImageIndex = 11
                Style = tbsSeparator
              end
              object ComboBoxSubconfigsOnASL: TComboBox
                Left = 108
                Top = 0
                Width = 175
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 0
                OnChange = ComboBoxSubconfigsOnASLChange
              end
            end
          end
          object TabSheetShowMDObj: TTabSheet
            Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1086#1073#1098#1077#1082#1090#1099
            ImageIndex = 5
            OnShow = TabSheetShowMDObjShow
            object ListViewObj: TListView
              Left = 0
              Top = 22
              Width = 302
              Height = 491
              Align = alClient
              Checkboxes = True
              Columns = <
                item
                  AutoSize = True
                  Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100
                end>
              MultiSelect = True
              RowSelect = True
              TabOrder = 1
              ViewStyle = vsReport
            end
            object ToolBar5: TToolBar
              Left = 0
              Top = 0
              Width = 302
              Height = 22
              AutoSize = True
              Caption = 'ToolBar4'
              EdgeBorders = []
              Flat = True
              HotImages = ImageListSubSustems
              Images = ImageListSubSustems
              TabOrder = 0
              Transparent = False
              object btnSelectAllObj: TToolButton
                Left = 0
                Top = 0
                Action = MetChoiceAllObj
              end
              object btnUnselectAllObj: TToolButton
                Left = 23
                Top = 0
                Action = MetUnChoiceAllObj
              end
              object btnInvertSelectionAllObj: TToolButton
                Left = 46
                Top = 0
                Action = MetInvertObj
              end
            end
          end
          object TabSheetNote: TTabSheet
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            ImageIndex = 6
            OnShow = TabSheetNoteShow
            object MemoNote: TMemo
              Left = 0
              Top = 22
              Width = 302
              Height = 491
              Align = alClient
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
            end
            object ToolBar11: TToolBar
              Left = 0
              Top = 0
              Width = 302
              Height = 22
              AutoSize = True
              Caption = 'ToolBar11'
              EdgeBorders = []
              Flat = True
              Images = ImageListSubSustems
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              object ToolButton37: TToolButton
                Left = 0
                Top = 0
                Action = NoteRefreshCurrent
              end
              object ToolButton41: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'ToolButton41'
                ImageIndex = 89
                Style = tbsSeparator
              end
              object ToolButton36: TToolButton
                Left = 31
                Top = 0
                Action = NoteOpenCard
              end
              object ToolButton40: TToolButton
                Left = 54
                Top = 0
                Width = 8
                Caption = 'ToolButton40'
                ImageIndex = 4
                Style = tbsSeparator
              end
              object ToolButton38: TToolButton
                Left = 62
                Top = 0
                Action = NoteSaveFile
              end
              object ToolButton39: TToolButton
                Left = 85
                Top = 0
                Action = NoteLoadFromFile
              end
            end
          end
          object tsToDoObj: TTabSheet
            Caption = #1047#1072#1076#1072#1095#1080
            ImageIndex = 7
            object ToolBar21: TToolBar
              Left = 0
              Top = 0
              Width = 302
              Height = 22
              AutoSize = True
              Caption = 'ToolBar21'
              EdgeBorders = []
              Flat = True
              Images = ImageListSubSustems
              TabOrder = 0
              object ToolButton89: TToolButton
                Left = 0
                Top = 0
                Action = actToDoObjRefresh
              end
              object ToolButton90: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'ToolButton90'
                ImageIndex = 1
                Style = tbsSeparator
              end
              object ToolButton91: TToolButton
                Left = 31
                Top = 0
                Action = actToDoObjEdit
              end
              object ToolButton92: TToolButton
                Left = 54
                Top = 0
                Action = actToDoObjDelete
              end
            end
            object tvToDoObj: TTreeView
              Left = 0
              Top = 22
              Width = 302
              Height = 491
              Align = alClient
              HideSelection = False
              Indent = 19
              ReadOnly = True
              RightClickSelect = True
              RowSelect = True
              TabOrder = 1
              OnDblClick = tvToDoObjDblClick
              OnExpanding = tvToDoObjExpanding
            end
          end
          object tsEditLog: TTabSheet
            Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
            ImageIndex = 8
            object ToolBar23: TToolBar
              Left = 0
              Top = 0
              Width = 302
              Height = 22
              AutoSize = True
              Caption = 'ToolBar23'
              EdgeBorders = []
              Flat = True
              Images = ImageListSubSustems
              TabOrder = 0
              object ToolButton98: TToolButton
                Left = 0
                Top = 0
                Action = actDBCnahgeGetByMDObj
              end
              object ToolButton97: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'ToolButton97'
                ImageIndex = 2
                Style = tbsSeparator
              end
              object ToolButton99: TToolButton
                Left = 31
                Top = 0
                Action = actDBChangeAdd
              end
              object ToolButton100: TToolButton
                Left = 54
                Top = 0
                Action = actDBChangeEdit
              end
              object ToolButton101: TToolButton
                Left = 77
                Top = 0
                Action = actDBChangeDelete
              end
            end
            object lvDBChanges: TListView
              Left = 0
              Top = 22
              Width = 302
              Height = 491
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077
                end
                item
                  Caption = #1044#1072#1090#1072
                  Width = 70
                end>
              ReadOnly = True
              RowSelect = True
              TabOrder = 1
              ViewStyle = vsReport
              OnDblClick = lvDBChangesDblClick
            end
          end
        end
        object PanelCaption: TPanel
          Tag = 1
          Left = 1
          Top = 1
          Width = 310
          Height = 16
          Align = alTop
          Caption = #1044#1086#1087'.'#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103'...'
          TabOrder = 0
          OnClick = PanelCaptionClick
        end
      end
      object TreeViewMetadata: TTreeList
        Left = 0
        Top = 38
        Width = 395
        Height = 577
        Align = alClient
        Images = ImageListSubSustems
        Indent = 19
        StateImages = ImageListSubSustems
        TabOrder = 4
        Visible = True
        OnAdvancedCustomDrawItem = tvMetadataAdvancedCustomDrawItem
        OnChange = tvMetadataChange
        OnClick = tvMetadataClick
        OnCompare = tvMetadataCompare
        OnDblClick = tvMetadataDblClick
        OnExpanding = tvMetadataExpanding
        OnKeyUp = tvMetadataKeyUp
        Columns = <
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
            Image = True
            Width = 300
          end
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #1057#1080#1085#1086#1085#1080#1084
            Width = 150
          end
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #1048#1044
            Width = 50
          end>
        ColumnLines = True
        Separator = ';'
        ItemHeight = 16
        HeaderSettings.AllowResize = True
        HeaderSettings.Color = clBtnFace
        HeaderSettings.Font.Charset = DEFAULT_CHARSET
        HeaderSettings.Font.Color = clWindowText
        HeaderSettings.Font.Height = -11
        HeaderSettings.Font.Name = 'MS Sans Serif'
        HeaderSettings.Font.Style = []
        HeaderSettings.Height = 18
        Version = '1.0.1.0'
      end
    end
    object TabSheetToDo: TTabSheet
      Caption = #1047#1072#1076#1072#1095#1080
      ImageIndex = 3
      OnShow = TabSheetToDoShow
      object Splitter4: TSplitter
        Left = 0
        Top = 476
        Width = 710
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter6: TSplitter
        Left = 0
        Top = 542
        Width = 710
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object ToolBar8: TToolBar
        Left = 0
        Top = 0
        Width = 710
        Height = 24
        AutoSize = True
        Caption = 'ToolBar8'
        EdgeBorders = [ebBottom]
        Flat = True
        Images = ImageListSubSustems
        TabOrder = 0
        object ToolButton10: TToolButton
          Left = 0
          Top = 0
          Action = ToDoRefresh
        end
        object ToolButton11: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton13: TToolButton
          Left = 31
          Top = 0
          Action = ToDoAdd
        end
        object ToolButton15: TToolButton
          Left = 54
          Top = 0
          Action = ToDoEdit
        end
        object ToolButton16: TToolButton
          Left = 77
          Top = 0
          Action = ToDoDelete
        end
        object ToolButton102: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton102'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton103: TToolButton
          Left = 108
          Top = 0
          Action = ToDoCopy
        end
        object ToolButton104: TToolButton
          Left = 131
          Top = 0
          Action = ToDoCreateChild
        end
      end
      object ListViewToDo: TListView
        Left = 0
        Top = 479
        Width = 710
        Height = 63
        Align = alClient
        BiDiMode = bdRightToLeftNoAlign
        Columns = <
          item
            AutoSize = True
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            MinWidth = 150
          end>
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentBiDiMode = False
        StateImages = ImageListToDoList
        TabOrder = 2
        ViewStyle = vsReport
        OnChange = ListViewToDoChange
        OnColumnClick = ListViewToDoColumnClick
        OnCompare = ListViewToDoCompare
        OnCustomDrawItem = ListViewToDoCustomDrawItem
        OnDblClick = ListViewToDoDblClick
        OnKeyUp = ListViewToDoKeyUp
      end
      object PanelDetails: TPanel
        Left = 0
        Top = 24
        Width = 710
        Height = 452
        Align = alTop
        BevelOuter = bvNone
        Constraints.MinHeight = 80
        TabOrder = 1
        object PanelHeader: TPanel
          Tag = 1
          Left = 0
          Top = 0
          Width = 710
          Height = 17
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1089#1087#1080#1089#1082#1086#1084' ...'
          Constraints.MinHeight = 17
          TabOrder = 0
          OnClick = PanelHeaderClick
        end
        object PageControl1: TPageControl
          Left = 0
          Top = 17
          Width = 710
          Height = 435
          ActivePage = TabSheet4
          Align = alClient
          Constraints.MinHeight = 17
          TabOrder = 1
          TabPosition = tpBottom
          object TabSheet4: TTabSheet
            Caption = #1060#1080#1083#1100#1090#1088#1099
            object ListConditions: TValueListEditor
              Left = 0
              Top = 0
              Width = 702
              Height = 409
              Align = alClient
              Strings.Strings = (
                #1042#1072#1088#1080#1072#1085#1090' '#1082#1086#1083#1086#1085#1086#1082'='
                #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103'='
                #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103'='
                #1056#1077#1083#1080#1079'='
                #1055#1086#1076#1089#1080#1089#1090#1077#1084#1072'='
                #1050#1072#1090#1077#1075#1086#1088#1080#1103'='
                #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100'='
                #1057#1086#1089#1090#1086#1103#1085#1080#1077'='
                #1057#1090#1072#1090#1091#1089'='
                #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100'='
                #1048#1085#1080#1094#1080#1072#1090#1086#1088'='
                #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100'='
                #1040#1074#1090#1086#1088'='
                #1048#1079#1084#1077#1085#1080#1083'='
                #1054#1089#1085#1086#1074#1072#1085#1080#1077'='
                #1058#1080#1087#1054#1073#1098#1077#1082#1090#1072'='
                #1044#1083#1103#1054#1090#1095#1077#1090#1072'='
                #1054#1073#1098#1077#1082#1090#1052#1044'='
                #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072'='
                'CR='
                #1057#1090#1077#1087#1077#1085#1100' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1086#1089#1090#1080'=')
              TabOrder = 0
              TitleCaptions.Strings = (
                #1055#1072#1088#1072#1084#1077#1090#1088
                #1047#1085#1072#1095#1077#1085#1080#1077)
              OnGetPickList = ListConditionsGetPickList
              OnStringsChange = ListConditionsStringsChange
              ColWidths = (
                97
                582)
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1050#1086#1083#1086#1085#1082#1080
            ImageIndex = 1
            object ListViewToDoCols: TListView
              Left = 0
              Top = 23
              Width = 702
              Height = 386
              Align = alClient
              Checkboxes = True
              Columns = <
                item
                  AutoSize = True
                  Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                end
                item
                  Caption = #1064#1080#1088#1080#1085#1072
                  Width = 55
                end>
              SortType = stData
              TabOrder = 1
              ViewStyle = vsReport
              OnCompare = ListViewToDoColsCompare
            end
            object ToolBar20: TToolBar
              Left = 0
              Top = 0
              Width = 702
              Height = 23
              AutoSize = True
              ButtonHeight = 21
              ButtonWidth = 37
              Caption = 'ToolBar20'
              EdgeBorders = []
              ShowCaptions = True
              TabOrder = 0
              object btnUp: TToolButton
                Left = 0
                Top = 2
                Caption = #1042#1074#1077#1088#1093
                ImageIndex = 0
                OnClick = btnUpClick
              end
              object btnDown: TToolButton
                Left = 37
                Top = 2
                Caption = #1042#1085#1080#1079
                ImageIndex = 1
                OnClick = btnDownClick
              end
            end
          end
        end
      end
      object pnlChildToDo: TPanel
        Left = 0
        Top = 545
        Width = 710
        Height = 70
        Align = alBottom
        Caption = 'pnlChildToDo'
        TabOrder = 3
        object TreeViewSubToDo: TTreeView
          Left = 1
          Top = 16
          Width = 708
          Height = 53
          Align = alClient
          Indent = 19
          ReadOnly = True
          RightClickSelect = True
          RowSelect = True
          TabOrder = 1
          OnDblClick = TreeViewSubToDoDblClick
          OnExpanding = TreeViewSubToDoExpanding
        end
        object pnlChildToDoCaption: TPanel
          Left = 1
          Top = 1
          Width = 708
          Height = 15
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = #1055#1086#1076#1095#1080#1085#1077#1085#1085#1099#1077' '#1079#1072#1076#1072#1095#1080' ...'
          TabOrder = 0
          OnClick = pnlChildToDoCaptionClick
        end
      end
    end
    object TabSheetTuning: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      ImageIndex = 1
      OnShow = TabSheetTuningShow
      object Splitter2: TSplitter
        Left = 531
        Top = 0
        Height = 615
        Align = alRight
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 531
        Height = 615
        Align = alClient
        TabOrder = 1
      end
      object ListViewConfigMetadata: TListView
        Left = 534
        Top = 0
        Width = 176
        Height = 615
        Align = alRight
        Checkboxes = True
        Columns = <
          item
            AutoSize = True
          end>
        ReadOnly = True
        RowSelect = True
        ShowWorkAreas = True
        SortType = stText
        TabOrder = 2
        ViewStyle = vsReport
        OnMouseUp = ListViewConfigMetadataMouseUp
      end
      object PageControlConfig: TPageControl
        Left = 0
        Top = 0
        Width = 531
        Height = 615
        ActivePage = TabSheetStatuses
        Align = alClient
        MultiLine = True
        TabOrder = 0
        object TabSheetConfData: TTabSheet
          Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1099
          ImageIndex = 2
          OnShow = TabSheetConfDataShow
          object ToolBar7: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar7'
            EdgeBorders = []
            Flat = True
            HotImages = ImageListSubSustems
            Images = ImageListSubSustems
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object btnRefreshSubSystems: TToolButton
              Left = 0
              Top = 0
              Action = CfgRefreshSubSystemsList
            end
            object ToolButton14: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton14'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object btnAddSubSystem: TToolButton
              Left = 31
              Top = 0
              Action = CfgNewSubSystem
            end
            object btnEditSubSystem: TToolButton
              Left = 54
              Top = 0
              Action = CfgEditSubSystem
            end
            object btnDelSubSystem: TToolButton
              Left = 77
              Top = 0
              Action = CfgDelSubSystem
            end
            object ToolButton65: TToolButton
              Left = 100
              Top = 0
              Width = 8
              Caption = 'ToolButton65'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ComboBoxSubconfigsOnSSL: TComboBox
              Left = 108
              Top = 0
              Width = 175
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
          object ListViewSubSystemsList: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                AutoSize = True
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = ListViewSubSystemsListDblClick
          end
        end
        object TabSheetMetObj: TTabSheet
          Caption = #1054#1073#1098#1077#1082#1090#1099' '#1052#1044
          OnShow = TabSheetMetObjShow
          object ToolBar2: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar2'
            EdgeBorders = []
            Flat = True
            HotImages = ImageListSubSustems
            Images = ImageListSubSustems
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object BtnrefreshMetadataTree: TToolButton
              Left = 0
              Top = 0
              Action = CfgMetRefreshList
            end
          end
          object TreeViewConfigMatadata: TTreeView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            HideSelection = False
            Images = ImageListSubSustems
            Indent = 19
            MultiSelect = True
            ReadOnly = True
            TabOrder = 1
            OnChange = TreeViewConfigMatadataChange
            OnClick = TreeViewConfigMatadataClick
            OnDblClick = TreeViewConfigMatadataDblClick
          end
        end
        object TabSheetExtFrms: TTabSheet
          Caption = #1042#1085#1077#1096#1085#1080#1077' '#1092#1086#1088#1084#1099
          ImageIndex = 1
          OnShow = TabSheetExtFrmsShow
          object ListViewExtForms: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 200
              end
              item
                AutoSize = True
                Caption = #1055#1091#1090#1100
              end
              item
                Caption = #1052#1072#1089#1082#1072' ('#1074#1093#1086#1078#1076'.)'
                Width = 150
              end
              item
                Caption = #1052#1072#1089#1082#1072' ('#1080#1089#1082#1083'.)'
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            SmallImages = ImageListSubSustems
            SortType = stText
            StateImages = ImageListSubSustems
            TabOrder = 1
            ViewStyle = vsReport
            OnClick = ListViewExtFormsClick
            OnDblClick = ExtFrmEditExecute
          end
          object ToolBar6: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar6'
            EdgeBorders = []
            Flat = True
            Images = ImageListSubSustems
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object btnExtFrmsRefresh: TToolButton
              Left = 0
              Top = 0
              Action = ExtFrmRefresh
              ParentShowHint = False
              ShowHint = False
            end
            object ToolButton12: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton12'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object btnExtFrmsNewFolder: TToolButton
              Left = 31
              Top = 0
              Action = ExtFrmNewFolder
              ParentShowHint = False
              ShowHint = False
            end
            object btnExtFrmsNewFile: TToolButton
              Left = 54
              Top = 0
              Action = ExtFrmNewFile
              ParentShowHint = False
              ShowHint = False
            end
            object btnExtFrmsEditPath: TToolButton
              Left = 77
              Top = 0
              Action = ExtFrmEdit
              ParentShowHint = False
              ShowHint = False
            end
            object btnExtFrmsDeleteRecord: TToolButton
              Left = 100
              Top = 0
              Action = ExtFrmDel
              ParentShowHint = False
              ShowHint = False
            end
          end
        end
        object TabSheetRelises: TTabSheet
          Caption = #1056#1077#1083#1080#1079#1099
          ImageIndex = 3
          object ToolBar13: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar7'
            EdgeBorders = []
            Flat = True
            HotImages = ImageListSubSustems
            Images = ImageListSubSustems
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object ToolButton48: TToolButton
              Left = 0
              Top = 0
              Action = ReliseRefresh
            end
            object ToolButton49: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton14'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ToolButton50: TToolButton
              Left = 31
              Top = 0
              Action = ReliseAdd
            end
            object ToolButton51: TToolButton
              Left = 54
              Top = 0
              Action = ReliseEdit
            end
            object ToolButton52: TToolButton
              Left = 77
              Top = 0
              Action = ReliseDelete
            end
            object ToolButton67: TToolButton
              Left = 100
              Top = 0
              Width = 8
              Caption = 'ToolButton67'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ComboBoxSubconfigsOnRL: TComboBox
              Left = 108
              Top = 0
              Width = 175
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
          object ListViewRelises: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                MinWidth = 100
                Width = 306
              end
              item
                Caption = #1047#1072#1075#1088#1091#1079#1082#1072'('#1055#1083#1072#1085')'
                Width = 95
              end
              item
                Caption = #1047#1072#1075#1088#1091#1079#1082#1072'('#1056#1077#1072#1083')'
                Width = 95
              end
              item
                Caption = #1044#1072#1090#1072'('#1055#1083#1072#1085')'
                Width = 75
              end
              item
                Caption = #1044#1072#1090#1072'('#1056#1077#1072#1083')'
                Width = 75
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = ListViewRelisesDblClick
          end
        end
        object TabSheetStatuses: TTabSheet
          Caption = #1057#1090#1072#1090#1091#1089#1099
          ImageIndex = 4
          object ToolBar14: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar14'
            EdgeBorders = []
            Flat = True
            Images = ImageListSubSustems
            TabOrder = 0
            object ToolButton53: TToolButton
              Left = 0
              Top = 0
              Action = StatusesRefresh
            end
            object ToolButton54: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton54'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object ToolButton55: TToolButton
              Left = 31
              Top = 0
              Action = StatusesAdd
            end
            object ToolButton56: TToolButton
              Left = 54
              Top = 0
              Action = StatusesEdit
            end
            object ToolButton57: TToolButton
              Left = 77
              Top = 0
              Action = StatusesDelete
            end
          end
          object ListViewStatuses: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
              end
              item
                AutoSize = True
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = ListViewStatusesDblClick
          end
        end
        object TabSheetUsers: TTabSheet
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
          ImageIndex = 5
          object ToolBar16: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar16'
            EdgeBorders = []
            Flat = True
            Images = ImageListSubSustems
            TabOrder = 0
            object ToolButton68: TToolButton
              Left = 0
              Top = 0
              Action = UsersRefresh
            end
            object ToolButton72: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton72'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ToolButton69: TToolButton
              Left = 31
              Top = 0
              Action = UsersNew
            end
            object ToolButton70: TToolButton
              Left = 54
              Top = 0
              Action = UsersEdit
            end
            object ToolButton71: TToolButton
              Left = 77
              Top = 0
              Action = UsersDelete
            end
            object ToolButton73: TToolButton
              Left = 100
              Top = 0
              Width = 8
              Caption = 'ToolButton73'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ComboBoxSubconfigsOnUL: TComboBox
              Left = 108
              Top = 0
              Width = 175
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = ComboBoxSubconfigsOnULChange
            end
          end
          object ListViewUsers: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
              end
              item
                Caption = #1048#1084#1103
                Width = 200
              end
              item
                Caption = #1051#1086#1075#1080#1085
                Width = 150
              end
              item
                Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
                Width = 200
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            SortType = stText
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = ListViewUsersDblClick
          end
        end
        object TabSheet1: TTabSheet
          Caption = #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100
          ImageIndex = 6
          object ToolBar17: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar17'
            EdgeBorders = []
            Flat = True
            Images = ImageListSubSustems
            TabOrder = 0
            object ToolButton74: TToolButton
              Left = 0
              Top = 0
              Action = SeriousnesRefresh
            end
            object ToolButton78: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton78'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ToolButton75: TToolButton
              Left = 31
              Top = 0
              Action = SeriousnesNew
            end
            object ToolButton76: TToolButton
              Left = 54
              Top = 0
              Action = SeriousnesEdit
            end
            object ToolButton77: TToolButton
              Left = 77
              Top = 0
              Action = SeriousnesDelete
            end
          end
          object ListViewSeriousness: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
              end
              item
                AutoSize = True
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = ListViewSeriousnessDblClick
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
          ImageIndex = 7
          object ListViewCategoryes: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
              end
              item
                AutoSize = True
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = ListViewCategoryesDblClick
          end
          object ToolBar18: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar17'
            EdgeBorders = []
            Flat = True
            Images = ImageListSubSustems
            TabOrder = 0
            object ToolButton79: TToolButton
              Left = 0
              Top = 0
              Action = CategoryRefresh
            end
            object ToolButton80: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton78'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ToolButton81: TToolButton
              Left = 31
              Top = 0
              Action = CategoryNew
            end
            object ToolButton82: TToolButton
              Left = 54
              Top = 0
              Action = CategoryEdit
            end
            object ToolButton83: TToolButton
              Left = 77
              Top = 0
              Action = CategoryDelete
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #1050#1086#1083#1086#1085#1082#1080' '#1089#1087#1080#1089#1082#1072' '#1079#1072#1076#1072#1095
          ImageIndex = 8
          object ToolBar19: TToolBar
            Left = 0
            Top = 0
            Width = 523
            Height = 22
            AutoSize = True
            Caption = 'ToolBar19'
            EdgeBorders = []
            Flat = True
            Images = ImageListSubSustems
            TabOrder = 0
            object ToolButton84: TToolButton
              Left = 0
              Top = 0
              Action = ToDoListColRefresh
            end
            object ToolButton85: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton85'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object ToolButton86: TToolButton
              Left = 31
              Top = 0
              Action = ToDoListColNew
            end
            object ToolButton87: TToolButton
              Left = 54
              Top = 0
              Action = ToDoListColEdit
            end
            object ToolButton88: TToolButton
              Left = 77
              Top = 0
              Action = ToDoListColDelete
            end
          end
          object ListViewToDoViewColumns: TListView
            Left = 0
            Top = 22
            Width = 523
            Height = 547
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
              end
              item
                AutoSize = True
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              end>
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            SortType = stText
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = ListViewToDoViewColumnsDblClick
          end
        end
      end
    end
    object TabSheetConfs: TTabSheet
      Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      ImageIndex = 2
      OnShow = TabSheetConfsShow
      object Splitter1: TSplitter
        Left = 0
        Top = 438
        Width = 710
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 710
        Height = 22
        AutoSize = True
        Caption = 'ToolBar3'
        DockSite = True
        EdgeBorders = []
        Flat = True
        HotImages = ImageListSubSustems
        Images = ImageListSubSustems
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object btnRefreshCfg: TToolButton
          Left = 0
          Top = 0
          Action = CfgRefreshList
        end
        object ToolButton5: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object btnAddCfg: TToolButton
          Left = 31
          Top = 0
          Action = CfgAdd
        end
        object btnEditCfg: TToolButton
          Left = 54
          Top = 0
          Action = CfgEdit
        end
        object btnDelCfg: TToolButton
          Left = 77
          Top = 0
          Action = CfgDel
        end
        object ToolButton8: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object btnChoiceCfg: TToolButton
          Left = 108
          Top = 0
          Action = CfgChoice
        end
      end
      object ListViewConfigs: TListView
        Left = 0
        Top = 22
        Width = 710
        Height = 416
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageListSubSustems
        TabOrder = 1
        ViewStyle = vsReport
        OnChange = ListViewConfigsChange
        OnDblClick = ListViewConfigsDblClick
      end
      object ListViewSubconfigs: TListView
        Left = 0
        Top = 465
        Width = 710
        Height = 150
        Align = alBottom
        Columns = <
          item
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 250
          end
          item
            AutoSize = True
            Caption = #1055#1091#1090#1100
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageListSubSustems
        StateImages = ImageListSubSustems
        TabOrder = 3
        ViewStyle = vsReport
        OnDblClick = ListViewSubconfigsDblClick
      end
      object ToolBar15: TToolBar
        Left = 0
        Top = 441
        Width = 710
        Height = 24
        Align = alBottom
        AutoSize = True
        Caption = 'ToolBar15'
        Flat = True
        Images = ImageListSubSustems
        TabOrder = 2
        object ToolButton58: TToolButton
          Left = 0
          Top = 0
          Action = SubConfRefresh
        end
        object ToolButton59: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton59'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton60: TToolButton
          Left = 31
          Top = 0
          Action = SubConfAdd
        end
        object ToolButton61: TToolButton
          Left = 54
          Top = 0
          Action = SubConfEdit
        end
        object ToolButton62: TToolButton
          Left = 77
          Top = 0
          Action = SubConfDelete
        end
        object ToolButton63: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton63'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton64: TToolButton
          Left = 108
          Top = 0
          Action = SubConfChoice
        end
      end
    end
    object TabSheetTemplates: TTabSheet
      Caption = #1064#1072#1073#1083#1086#1085#1099
      ImageIndex = 4
      object TreeViewTemplates: TTreeView
        Left = 0
        Top = 22
        Width = 710
        Height = 593
        Align = alClient
        DragMode = dmAutomatic
        HideSelection = False
        Images = ImageListSubSustems
        Indent = 19
        ReadOnly = True
        RightClickSelect = True
        RowSelect = True
        SortType = stText
        TabOrder = 1
        OnDblClick = TreeViewTemplatesDblClick
        OnDragDrop = TreeViewTemplatesDragDrop
        OnDragOver = TreeViewTemplatesDragOver
      end
      object ToolBar10: TToolBar
        Left = 0
        Top = 0
        Width = 710
        Height = 22
        AutoSize = True
        Caption = 'ToolBar10'
        EdgeBorders = []
        Flat = True
        Images = ImageListSubSustems
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = TemplatesRefresh
        end
        object ToolButton21: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton21'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton27: TToolButton
          Left = 31
          Top = 0
          Action = TempaltesNewFolder
        end
        object ToolButton22: TToolButton
          Left = 54
          Top = 0
          Action = TemplatesAdd
        end
        object ToolButton23: TToolButton
          Left = 77
          Top = 0
          Action = TemplatesEdit
        end
        object ToolButton24: TToolButton
          Left = 100
          Top = 0
          Action = TemplatesDelete
        end
        object ToolButton26: TToolButton
          Left = 123
          Top = 0
          Action = TemplatesSetBuffer
        end
      end
    end
    object TabSheetNoteList: TTabSheet
      Caption = #1054#1087#1080#1089#1072#1085#1080#1103
      ImageIndex = 5
      OnShow = TabSheetNoteListShow
      object ToolBar12: TToolBar
        Left = 0
        Top = 0
        Width = 710
        Height = 22
        AutoSize = True
        Caption = 'ToolBar12'
        EdgeBorders = []
        Flat = True
        Images = ImageListSubSustems
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object ToolButton42: TToolButton
          Left = 0
          Top = 0
          Action = NoteListRefresh
        end
        object ToolButton43: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton43'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object btn2: TToolButton
          Left = 31
          Top = 0
          Action = actNoteNew
        end
        object ToolButton44: TToolButton
          Left = 54
          Top = 0
          Action = NoteListOpen
        end
        object ToolButton45: TToolButton
          Left = 77
          Top = 0
          Action = NoteListDelete
        end
        object ToolButton46: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton46'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton47: TToolButton
          Left = 108
          Top = 0
          Action = NoteListSaveToFile
        end
      end
      object ListViewLNotesList: TListView
        Left = 0
        Top = 22
        Width = 710
        Height = 593
        Align = alClient
        Columns = <
          item
            Caption = #1054#1073#1098#1077#1082#1090
            Width = 250
          end
          item
            AutoSize = True
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentShowHint = False
        ShowHint = False
        SortType = stText
        TabOrder = 1
        ViewStyle = vsReport
        OnDblClick = ListViewLNotesListDblClick
      end
    end
    object tsMDObjBlocks: TTabSheet
      Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1080
      ImageIndex = 6
      object ToolBar22: TToolBar
        Left = 0
        Top = 0
        Width = 710
        Height = 22
        AutoSize = True
        Caption = 'ToolBar22'
        EdgeBorders = []
        Flat = True
        Images = ImageListSubSustems
        TabOrder = 0
        object ToolButton93: TToolButton
          Left = 0
          Top = 0
          Action = actMDBlocksRefresh
        end
        object ToolButton94: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton94'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton95: TToolButton
          Left = 31
          Top = 0
          Action = actMDBlocsEdit
        end
        object ToolButton96: TToolButton
          Left = 54
          Top = 0
          Action = actMDBlocksDelete
        end
      end
      object lvMDObjBlocks: TListView
        Left = 0
        Top = 22
        Width = 710
        Height = 593
        Align = alClient
        Columns = <
          item
            Caption = #1054#1073#1098#1077#1082#1090' '#1052#1044
            Width = 200
          end
          item
            Caption = #1050#1088#1072#1090#1082#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
            Width = 200
          end
          item
            Caption = #1053#1072#1095#1072#1083#1086'('#1087#1083#1072#1085')'
            Width = 80
          end
          item
            Caption = #1050#1086#1085#1077#1094'('#1087#1083#1072#1085')'
            Width = 80
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SortType = stText
        StateImages = ilBlocks
        TabOrder = 1
        ViewStyle = vsReport
        OnDblClick = lvMDObjBlocksDblClick
      end
    end
  end
  object ImageListSubSustems: TImageList
    ShareImages = True
    Left = 184
    Top = 304
    Bitmap = {
      494C010184008600040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002002000001002000000000000020
      0200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF008080800080808000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF0080808000FF0000000000800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C0008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FF00000000FFFF000000800000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000FFFFFF000000
      FF00FFFFFF00C0C0C0000000FF00C0C0C0000000FF00C0C0C0000000FF00C0C0
      C0000000FF000000FF00FFFFFF008080800080808000FFFFFF00FFFFFF000000
      FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF000000FF00FFFF
      FF000000FF000000FF00FFFFFF0080808000FF0000000000800000FFFF000000
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00FF0000000000000000000000000000000000
      00000000000000000000C0C0C0000000000080808000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF000000000080808000FFFFFF00C0C0C0000000
      FF00C0C0C000FFFFFF000000FF00FFFFFF000000FF00FFFFFF000000FF00FFFF
      FF000000FF00FFFFFF000000FF008080800080808000FFFFFF00FFFFFF000000
      FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF000000FF00FFFF
      FF000000FF00FFFFFF000000FF0080808000FF00000000FFFF00000080000000
      FF000000800000FFFF000000FF0000FFFF000000FF0000FFFF000000FF0000FF
      FF000000FF000000FF0000FFFF00FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000080808000C0C0C000FFFFFF000000
      FF00FFFFFF00C0C0C0000000FF000000FF00FFFFFF000000FF000000FF00C0C0
      C0000000FF00C0C0C0000000FF008080800080808000FFFFFF00FFFFFF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF000000FF000000FF00FFFF
      FF000000FF00FFFFFF000000FF0080808000FF0000000000800000FFFF000000
      FF0000FFFF00000080000000FF0000FFFF000000FF0000FFFF000000FF0000FF
      FF000000FF0000FFFF000000FF00FF000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000080808000FFFFFF00C0C0C0000000
      FF00C0C0C000FFFFFF000000FF000000FF00C0C0C0000000FF000000FF00FFFF
      FF000000FF00FFFFFF000000FF008080800080808000FFFFFF00FFFFFF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF000000FF000000FF00FFFF
      FF000000FF00FFFFFF000000FF0080808000FF00000000FFFF00000080000000
      FF000000800000FFFF000000FF000000FF0000FFFF000000FF000000FF0000FF
      FF000000FF0000FFFF000000FF00FF000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000808080000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00FFFFFF000000FF000000FF00C0C0
      C0000000FF000000FF00FFFFFF0080808000808080000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00FFFFFF000000FF000000FF00FFFF
      FF000000FF000000FF00FFFFFF0080808000FF0000000000800000FFFF000000
      FF0000FFFF00000080000000FF000000FF0000FFFF000000FF000000FF0000FF
      FF000000FF0000FFFF000000FF00FF000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C0008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FF0000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00000080000000FF000000FF0000FF
      FF000000FF000000FF0000FFFF00FF000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF008080800080808000FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF0080808000FF0000000000800000FFFF000000
      800000FFFF000000800000FFFF000000800000FFFF000000800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00FF000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FF00000000FFFF000000800000FF
      FF000000800000FFFF000000800000FFFF000000800000FFFF000000800000FF
      FF0000FFFF0000FFFF0000FFFF00FF00000000000000C0C0C000000000008080
      8000C0C0C0000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000008080800080808000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF0080808000FF0000000000800000FFFF000000
      800000FFFF000000800000FFFF000000800000FFFF000000800000FFFF000000
      800000FFFF0000FFFF0000FFFF00FF000000000000000000000000000000FFFF
      FF00FFFFFF000000000000FFFF0000FFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF00FFFFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00808080000000000000000000800000008000000080000000FFFF
      FF00FFFFFF008000000080000000800000008000000080808000808080008080
      8000808080008080800080808000808080000000000000000000000000008000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C0008080800000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008000000080000000FFFFFF00FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF00FFFFFF00808080000000000000000000000000008000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF00C0C0C0000000000000000000000000000000000080000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000000000000000000000808000C0C0
      C000FFFFFF000000FF00C0C0C0000000FF00C0C0C0000000FF000000FF00C0C0
      C000FFFFFF008080800000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008080800080808000808080008080
      8000808080008080800080808000808080000000000080000000C0C0C0008000
      0000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000080000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C00080808000000000000000000000000000C0C0C00080000000FFFF
      FF00FFFFFF008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF00FFFFFF00808080000000000080000000FFFFFF008000
      0000FFFFFF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000FFFFFF00C0C0C0000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000C0C0
      C0000000FF00C0C0C0000000FF000000FF00FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF0080808000000000000000000000000000C0C0C00080000000FFFF
      FF00FFFFFF008000000080000000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000080000000FFFFFF008000
      0000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000080000000FFFF
      FF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C00080808000000000000000000000000000C0C0C000FFFFFF008000
      0000800000008000000080808000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000C0C0C000C0C0C000C0C0C000808080000000000080000000FFFFFF008000
      0000FFFFFF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000FFFFFF00C0C0C0000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000C0C0
      C00080000000C0C0C00080000000C0C0C00080000000C0C0C000FFFFFF00C0C0
      C000FFFFFF0080808000000000000000000000000000C0C0C000FFFFFF008000
      0000800000008000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000080000000FFFFFF008000
      0000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000080000000FFFF
      FF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C00080808000000000000000000000000000C0C0C000FFFFFF00FFFF
      FF0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000080000000FFFFFF008000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000C0C0
      C000FFFFFF0080000000C0C0C00080000000FFFFFF0000808000808080008080
      80008080800080808000000000000000000000000000C0C0C000FFFFFF008000
      000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000080000000FFFFFF008000
      0000800000008000000080000000800000008000000080000000800000008000
      000080000000800000000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C00000808000FFFFFF00C0C0
      C0000080800000000000000000000000000000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      000080000000000000000000000000000000000000000000000000808000C0C0
      C00080000000C0C0C0008000000080000000FFFFFF0000808000C0C0C0000080
      80000000000000000000000000000000000000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C0000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      00000000000080000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C00000808000008080000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000000000000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000808080000000000080808000C0C0C0008080
      8000C0C0C00080808000C0C0C00080808000C0C0C00080808000C0C0C0008080
      8000C0C0C000808080000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000080
      800000FFFF000080800000FFFF000080800000FFFF000080800000FFFF000080
      800000FFFF00000000000000000000000000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C0008080800080808000FFFFFF008080
      80008080800080808000FFFFFF008080800000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080800000FFFF
      FF00C0C0C00080808000000000000000000000000000000000000000000000FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000808000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000808080000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00808080000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080800000808000008080
      0000C0C0C0008080800000000000000000000000000000000000000000000080
      8000FFFFFF0080000000C0C0C00080000000C0C0C00080000000C0C0C000FFFF
      FF0000FFFF00000000000000000000000000FFFFFF00C0C0C00080808000C0C0
      C0008080800080808000FFFFFF00C0C0C00080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800000000000C0C0C000FFFFFF00FFFF
      FF0080808000FFFFFF0080808000C0C0C00080808000C0C0C00080808000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF008080800080808000808080008080800080808000FFFFFF0080800000FFFF
      FF00C0C0C00080808000000000000000000000000000000000000000000000FF
      FF00FFFFFF00C0C0C00080000000C0C0C00080000000C0C0C00080000000FFFF
      FF0000808000000000000000000000000000FFFFFF00FFFFFF0080808000FFFF
      FF008080800080808000C0C0C000FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00808080000000000000000000000000000000000000808000FFFF
      FF00C0C0C0008080800080808000FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0008080800000000000000000000000000000000000000000000080
      8000FFFFFF0080000000C0C0C00080000000C0C0C00080000000C0C0C000FFFF
      FF0000FFFF00000000000000000000000000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C00080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF0080808000C0C0C0008080
      8000FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00080808000000000000000000000000000000000000000000000FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000808000000000000000000000000000FFFFFF00FFFFFF0080808000FFFF
      FF008080800080808000C0C0C000FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00808080000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C00080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0008080800000000000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00000000000000000000000000FFFFFF00C0C0C00080808000C0C0
      C0008080800080808000FFFFFF00C0C0C0008080800080808000808080008080
      80008080800080808000FFFFFF008080800000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF0080808000C0C0C0008080
      8000FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00080808000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000008000C0C0C00000008000C0C0C00000008000C0C0C000FFFF
      FF0000808000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000808080000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00808080000000000000000000000000000000000000808000FFFF
      FF00C0C0C0008080800080808000FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0008080800000000000000000000000000000000000000000000080
      8000FFFFFF00C0C0C00000008000C0C0C00000008000C0C0C00000008000FFFF
      FF0000FFFF00000000000000000000000000FFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080008080800000000000C0C0C000FFFFFF00FFFF
      FF0080808000FFFFFF0080808000C0C0C00080808000C0C0C00080808000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF008080800080808000808080008080800080808000FFFFFF00008080008080
      80008080800080808000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000008000C0C0C00000008000C0C0C00000008000C0C0C000FFFF
      FF0000808000000000000000000000000000FFFFFF0080000000C0C0C0008000
      0000C0C0C00080000000C0C0C000FFFFFF00C0C0C00080000000C0C0C0008000
      0000C0C0C00080000000C0C0C000808080000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00808080000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      800000FFFF00000000000000000000000000FFFFFF00C0C0C00080000000C0C0
      C00080000000C0C0C00080000000C0C0C00080000000C0C0C00080000000C0C0
      C00080000000C0C0C000800000008080800000000000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      80000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080000080
      800000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080000000000080808000C0C0C0008080
      8000C0C0C00080808000C0C0C00080808000C0C0C00080808000C0C0C0008080
      8000C0C0C0008080800000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF000080800000FFFF000080800000FFFF000080800000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000080808000FFFF0000FFFF000080808000FFFF0000FFFF
      000080808000FFFF0000FFFF00008080800080000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFF0000FFFF000080808000FFFF0000FFFF
      000080808000FFFF0000FFFF00008080800080000000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      0000800000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      00000000FF000000000080808000808080008080800080808000808080008080
      800080808000FF00FF00FF00FF008080800080000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080000000C0C0C000C0C0C000C0C0C000C0C0C0008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00FF00FF00FF008080800080000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080000000C0C0C000C0C0C000C0C0C000C0C0C0008000
      0000800000000000FF000000FF00000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFF0000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080000000C0C0C000C0C0C000C0C0C000C0C0C0008000
      00000000FF000000FF000000FF000000FF000000000000000000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080000000000000000000000000000000FF00FFFF0000FFFF
      000080808000FFFF0000FFFF0000FFFF000080808000FFFF0000FFFF0000FFFF
      00000000000000000000000000000000000080000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080000000C0C0C000C0C0C000C0C0C000C0C0C0008000
      00000000FF000000FF000000FF000000FF000000000000000000C0C0C0000000
      0000000000000000000000000000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFF0000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF0000FFFF
      000080808000FFFF0000FFFF0000FFFF000080808000FFFF0000FFFF0000FFFF
      00000000000000000000000000000000000080000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      00000000FF000000FF000000FF000000FF000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000000000000000000000000000FFFF0000FFFF0000FFFF
      000080808000FFFF0000FFFF0000FFFF000080808000FFFF0000FFFF0000FFFF
      00000000000000000000000000000000000080000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      00000000FF000000FF000000FF000000FF000000000000000000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FF000000FF000000FF00
      0000FF000000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFF0000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF0000FFFF
      000080808000FFFF0000FFFF0000FFFF000080808000FFFF0000FFFF0000FFFF
      00000000000000000000000000000000000000000000C0C0C000C0C0C0008000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080000000C0C0C000C0C0
      C0000000FF000000FF000000FF000000FF000000000000000000C0C0C0000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000000000000000000000000000FFFF0000FFFF0000FFFF
      000080808000FFFF0000FFFF0000FFFF000080808000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000C0C0C0008000
      0000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C00080000000C0C0C000C0C0
      C0000000FF000000FF000000FF000000FF000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000FF000000FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FF00
      0000FF000000FF000000000000000000000000000000FFFF0000FFFF0000FFFF
      000080808000FFFF0000FFFF0000FFFF000080808000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000C0C0C0008000
      0000000000000000000000000000000000000000000080000000C0C0C0000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000C0C0C0008000
      0000C0C0C000C0C0C0000000000000000000C0C0C00080000000C0C0C0000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF0080808000FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00
      FF0000000000000000000000000000000000000000000000000000000000C0C0
      C0008000000080000000800000008000000080000000C0C0C000C0C0C0000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF0080808000FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00
      FF0000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9000000
      00000000000000000000000000000000000000000000AA2A2A00AA2A2A00AA2A
      2A00AA2A2A00AA2A2A00AA2A2A00AA2A2A00AA2A2A00AA2A2A00AA2A2A00AA2A
      2A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9C9
      C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C9C9000000
      00000000000000000000000000000000000000000000AA2A2A00D4AAAA00D4AA
      AA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AA
      AA00552A0000000000000000000000000000000000000000000000000000003C
      D400003CD400000000000000000000000000000000000000000000000000003C
      D400003CD4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000439701004397010000000000000000000000
      000000000000000000000000000000000000C9C9C900C9C9C900C9C9C900C9C9
      C900FFFFFF00FFFFCC00CCCC9900FFFFCC00CCCC9900FFFFFF00C9C9C9000000
      00000000000000000000000000000000000000000000AA2A2A00D4AAAA00D4AA
      AA00D4AAAA00D4AAAA002A000000F0CAA600D4AAAA00D4AAAA00D4AAAA00D4AA
      AA00552A0000552A00000000000000000000000000000000000000000000003C
      D400003CD400003CD40000000000000000000000000000000000003CD400003C
      D400003CD4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000439701004397010000000000000000000000
      000000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00996666009393
      93009393930093939300939393000000000000000000AA2A2A00D4AAAA00D4AA
      AA00D4AAAA00D4AAAA002A000000AA2A2A00D4AAAA00D4AAAA00D4AAAA00D4AA
      AA00552A0000AA2A2A0000000000000000000000000000000000000000000000
      0000003CD400003CD400003CD4000000000000000000003CD400003CD400003C
      D400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000043970100439701004397010043970100000000000000
      000000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00CCCC9900CCCC9900FFFFCC00CCCC9900E4E4E400C9C9C900FFFF
      FF00FFFFFF00FFFFFF00939393000000000000000000AA2A2A00D4AAAA00D4AA
      AA00D4AAAA00D4AAAA002A000000AA2A2A00D4AAAA00D4AAAA00D4AAAA00D4AA
      AA00552A0000AA2A2A0000000000000000000000000000000000000000000000
      000000000000003CD400003CD400003CD400003CD400003CD400003CD4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000043970100439701000000000043970100000000000000
      000000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF00000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF00939393000000000000000000AA2A2A00D4AAAA00D4AA
      AA00D4AAAA00D4AAAA002A000000AA2A2A00D4AAAA00D4AAAA00D4AAAA00D4AA
      AA00552A0000AA2A2A0000000000000000000000000000000000000000000000
      00000000000000000000003CD400003CD400003CD400003CD400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004397010043970100000000000000000043970100439701000000
      000000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFCC00CCCC9900E4E4E400FFFFFF0000000000FFFFFF00FFFF
      FF0000CCCC00FFFFFF00939393000000000000000000AA2A2A00D4AAAA00D4AA
      AA00D4AAAA00D4AAAA002A000000AA2A2A00D4AAAA00D4AAAA00D4AAAA00D4AA
      AA00552A0000AA2A2A0000000000000000000000000000000000000000000000
      00000000000000000000003CD400003CD400003CD400003CD400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004397010043970100000000000000000000000000439701000000
      000000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF00E4E4E40000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00939393000000000000000000AA2A2A00D4AAAA00D4AA
      AA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AAAA00D4AA
      AA00552A0000AA2A2A0000000000000000000000000000000000000000000000
      000000000000003CD400003CD400003CD400003CD400003CD400003CD4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000439701004397010000000000000000000000000000000000439701000000
      000000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000CCCC00FFFF
      FF0000CCCC00FFFFFF00939393000000000000000000AA2A2A00F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600D4AA
      AA00552A0000AA2A2A0000000000000000000000000000000000000000000000
      0000003CD400003CD400003CD4000000000000000000003CD400003CD400003C
      D400000000000000000000000000000000000000000000000000000000000000
      0000439701004397010000000000000000000000000000000000000000004397
      010000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00C9C9
      C900C9C9C900C9C9C900C9C9C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0093939300000000000000000000000000F0CAA600D4AA
      AA00552A0000F0CAA600F0CAA600F0CAA600F0CAA600D4AAAA00552A0000F0CA
      A600D4AAAA00AA2A2A000000000000000000000000000000000000000000003C
      D400003CD400003CD40000000000000000000000000000000000003CD400003C
      D400003CD4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004397
      010000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C9C9C900FFFFFF00FFFFFF0000CCCC00FFFFFF0000CCCC00FFFF
      FF0000CCCC00FFFFFF009393930000000000000000000000000000000000F0CA
      A600552A0000FFFFFF00FFFFFF00FFFFFF00D4AAAA00F0CAA600552A0000F0CA
      A600F0CAA600D4AAAA000000000000000000000000000000000000000000003C
      D400003CD400000000000000000000000000000000000000000000000000003C
      D400003CD4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000043970100000000000000000000000000C9C9C900FFFFFF00FFFFFF00FFFF
      FF00C9C9C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009393930000000000000000000000000000000000F0CA
      A600552A00000000000000000000000000000000000000000000552A0000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000429701000000000000000000939393006B6B6B00663333006633
      33006633330099333300993333009966330099663300CC663300CC663300CC99
      0000CC990000CCCC33009393930000000000000000000000000000000000F0CA
      A600AA2A2A00F0CAA600F0CAA6000000000000000000F0CAA600552A0000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093939300663366006699FF006666
      9900663333006633330099333300993333009966330099663300CC663300CC66
      3300CC990000CC99000093939300000000000000000000000000000000000000
      0000D4AAAA00552A0000552A0000552A0000552A0000AA2A2A00D4AAAA00F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009393930093939300939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      9300939393009393930093939300000000000000000000000000000000000000
      0000F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000CCCC0033999900339999003399990099663300996633009966
      3300CC663300A1A1A100C9C9C9000000000000000000C9C9C900C9C9C900C9C9
      C900C9C9C900CCCC3300FFFF6600CCCC330066660000C9C9C900C9C9C9000000
      0000CCCC3300FFFF6600CCCC3300666600000000000000000000000000000000
      0000000000008686860086868600868686008686860086868600868686008686
      8600868686008686860086868600868686000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600868686008686
      8600868686008686860086868600868686000000000000000000000000000000
      0000A1A1A10033FFFF0033FFFF0033FFFF0000CCCC00CC663300996633009966
      3300CC663300CC663300CC663300C9C9C90000000000C9C9C900669999006699
      99006699990093939300C9C9C9008686860000000000FFFFFF00C9C9C9000000
      000093939300C9C9C90086868600000000000000000000000000000000000000
      00000000000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00868686000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0086868600A1A1A100A1A1A10000CCCC003399
      99003399990033999900CCCC6600FFFF0000CC990000CC663300996633009966
      3300CC663300CC990000CC990000CC663300939393009393930099FFFF0099FF
      FF0099FFFF0086868600868686006B6B6B000000000000000000C9C9C9008686
      86006B6B6B008686860000000000000000000000000000000000000000000000
      00000000000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBB
      BB00BBBBBB00BBBBBB00FFFFFF00868686000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600FFFFFF00FFFF
      FF0099333300FFFFFF00FFFFFF0086868600A1A1A1000000000033FFFF0033FF
      FF0033FFFF0000CCCC00CCCC6600FFFF0000CC990000CC663300996633009966
      3300CC663300CC990000CC990000CC66330093939300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0093939300C9C9C900868686006B6B6B0000000000C9C9C9009393
      9300C9C9C9006B6B6B0000000000000000000000000000000000000000000000
      00006B6B6B0086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBB
      BB00FFFFFF00BBBBBB00FFFFFF00868686000000000000000000000000000000
      00006B6B6B000000000000000000000000000000000086868600FFFFFF009933
      3300CC663300CCCC3300FFFFFF0086868600A1A1A10000000000000000000000
      000000000000CC993300CCCC6600FFFF000000CCCC0033999900339999003399
      9900CC663300CC990000CC990000CC66330093939300FFFFFF00FFFFFF00FFFF
      FF006699990093939300C9C9C900868686006B6B6B0000000000000000006B6B
      6B00C9C9C9006B6B6B0000000000000000000000000000000000000000000000
      0000868686006B6B6B00FFFFFF00BBBBBB00BBBBBB00BBBBBB00FFFFFF00BBBB
      BB00BBBBBB00BBBBBB00FFFFFF00868686000000000000000000000000000000
      0000868686006B6B6B0000000000000000000000000086868600FFFFFF00FFFF
      FF00FFFFFF0099333300FFFFFF0086868600A1A1A10000000000000000000000
      000000000000CC993300CCCC66009393930033FFFF0033FFFF0033FFFF0000CC
      CC00CC663300CC990000CC990000CC66330093939300FFFFFF00939393009393
      930099FFFF0066999900868686006B6B6B0000000000000000006B6B6B008686
      86006B6B6B000000000000000000000000000000000000000000000000000000
      000086868600BBBBBB006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00868686000000000000000000000000000000
      000086868600BBBBBB006B6B6B00000000000000000086868600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0086868600A1A1A10000000000000000000000
      00000000000000CCCC00339999003399990033999900CC663300996633009966
      3300CC663300CC990000CC990000CC66330093939300FFFFFF0093939300FFFF
      FF00669999006699990093939300C9C9C9006B6B6B0000000000C9C9C9009393
      9300C9C9C9006B6B6B0000000000000000000000000000000000000000000000
      000086868600BBBBBB006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009933
      33009933330099333300FFFFFF00868686000000000000000000000000000000
      000086868600BBBBBB006B6B6B00000000000000000086868600FFFFFF00FFFF
      FF0099333300FFFFFF00FFFFFF0086868600A1A1A10000000000000000000000
      0000A1A1A10033FFFF0033FFFF0033FFFF0000CCCC00CC663300996633009966
      3300CC663300CC990000CC990000CC66330093939300FFFFFF00939393009393
      930099FFFF0099FFFF0093939300C9C9C9006B6B6B0000000000C9C9C9009393
      9300C9C9C9006B6B6B0000000000000000000000000000000000000000000000
      000086868600BBBBBB006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009933
      3300FFFFFF0099333300FFFFFF00868686000000000000000000000000000000
      000086868600BBBBBB006B6B6B00000000000000000086868600FFFFFF009933
      3300CC663300CCCC3300FFFFFF0086868600A1A1A100A1A1A10000CCCC003399
      99003399990033999900CCCC6600FFFF0000CC990000CC663300996633009966
      3300CC663300CC990000CC990000CC66330093939300FFFFFF0093939300FFFF
      FF00FFFFFF00FFFFFF00CCFFFF008686860000000000FFFFFF00C9C9C9000000
      0000868686000000000000000000000000000000000000000000000000000000
      000086868600BBBBBB006B6B6B00BBBBBB00BBBBBB00BBBBBB00FFFFFF009933
      33009933330099333300FFFFFF00868686000000000000000000000000000000
      000086868600BBBBBB006B6B6B00000000000000000086868600FFFFFF00FFFF
      FF00FFFFFF0099333300FFFFFF0086868600A1A1A1000000000033FFFF0033FF
      FF0033FFFF0000CCCC00CCCC6600FFFF0000CC663300CC663300996633009966
      3300CC663300CC990000CC990000CC66330093939300FFFFFF00669999006699
      99006699990066999900FFFFFF00C9C9C900C9C9C900C9C9C900C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000086868600BBBBBB006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00868686000000000000000000000000000000
      000086868600BBBBBB006B6B6B00000000000000000086868600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0086868600A1A1A10000000000000000000000
      000000000000CC993300CC663300CC663300CCCC6600CCCC6600CCCC6600CCCC
      6600CCCC6600CC663300CC663300CC663300939393009393930099FFFF0099FF
      FF0099FFFF0066999900FFFFFF00C9C9C900FFFFFF00C9C9C900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000086868600BBBBBB006B6B6B0066333300993333009933330099663300CC66
      3300CC990000CCCC3300CCCC3300868686000000000000000000000000000000
      000086868600BBBBBB006B6B6B00000000000000000086868600993333009933
      3300CC663300CC990000CCCC330086868600A1A1A100A1A1A10000CCCC003399
      99003399990033999900CCCC6600CCCC6600CCCC6600CCCC6600CCCC6600CCCC
      6600CCCC6600CCCC6600CCCC6600CC66330093939300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C9C9C900C9C9C90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600BBBBBB00BBBBBB00868686006B6B6B008686860086868600868686008686
      8600868686008686860086868600868686000000000000000000000000008686
      8600BBBBBB00BBBBBB00868686006B6B6B000000000086868600868686008686
      860086868600868686008686860086868600A1A1A1000000000033FFFF0033FF
      FF0033FFFF0000CCCC00CC663300CC990000CCCC6600CCCC6600CCCC6600CCCC
      6600CCCC6600FFFF0000CC990000C9C9C9006699990066999900669999006699
      9900C9C9C900C9C9C900C9C9C900C9C9C9000000000000000000000000000000
      000000000000000000000000000000000000000000000000000086868600BBBB
      BB00FFFFFF00BBBBBB00BBBBBB00868686006B6B6B0000000000000000000000
      000000000000000000000000000000000000000000000000000086868600BBBB
      BB00FFFFFF00BBBBBB00BBBBBB00868686006B6B6B0000000000000000000000
      000000000000000000000000000000000000A1A1A10000000000000000000000
      0000000000000000000000000000C9C9C900CC990000CC990000CC990000FFFF
      0000FFFF0000C9C9C900000000000000000099FFFF0099FFFF0099FFFF006699
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600BBBBBB00FFFF
      FF00FFFFFF00FFFFFF00BBBBBB00BBBBBB00868686006B6B6B00000000000000
      0000000000000000000000000000000000000000000086868600BBBBBB00FFFF
      FF00FFFFFF00FFFFFF00BBBBBB00BBBBBB00868686006B6B6B00000000000000
      00000000000000000000000000000000000000CCCC0033999900339999003399
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008686860086868600868686008686
      86008686860086868600868686008686860086868600868686006B6B6B000000
      0000000000000000000000000000000000008686860086868600868686008686
      86008686860086868600868686008686860086868600868686006B6B6B000000
      00000000000000000000000000000000000033FFFF0033FFFF0033FFFF0000CC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009933330099333300993333009933
      3300FFFFFF00C9C9C90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF00CCCCFF00FFFFFF009933330099333300FFFFFF00FFFF
      FF00FFFFFF00C9C9C90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00CC99FF00FFFFFF00FFFFFF0099333300FFFFFF0099333300FFFF
      FF00FFFFFF00C9C9C90000000000000000000000000000000000000000009933
      3300993333009933330000000000993333000000000099333300993333009933
      3300993333000000000000000000000000009933330099333300993333000000
      0000993333000000000099333300993333009933330099333300000000000000
      0000000000000000000000000000000000009933330099333300993333000000
      0000993333000000000099333300993333009933330099333300000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00CC99FF00FFFFFF00FFFFFF00FFFFFF0099333300FFFFFF00FFFFFF00CC66
      3300FFFFFF00C9C9C90000000000000000000000000000000000000000000000
      0000993333000000000000000000993333000000000000000000993333009933
      3300000000000000000000000000000000000000000099333300000000000000
      0000993333000000000000000000993333009933330000000000000000000000
      0000000000000000000000000000000000000000000099333300000000000000
      0000993333000000000000000000993333009933330000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C9000066
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CC663300C9C9C90000000000000000000000000000000000000000000000
      0000993333000000000093939300993333009393930000000000993333009933
      3300000000000000000000000000000000000000000099333300000000009393
      9300993333009393930000000000993333009933330000000000000000000000
      0000000000009933330000000000000000000000000099333300000000009393
      9300993333009393930000000000993333009933330000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C9000066
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CC663300C9C9C90000000000000000000000000000000000000000000000
      0000993333000000000099333300993333009933330000000000993333009933
      3300000000000000000000000000000000000000000099333300000000009933
      3300993333009933330000000000993333009933330000000000000000000000
      0000000000009933330000000000000000000000000099333300000000009933
      3300993333009933330000000000993333009933330000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C9000033
      CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CC990000C9C9C90000000000000000000000000000000000000000000000
      0000993333000000000099333300939393009933330000000000993333009933
      3300000000000000000000000000000000000000000099333300000000009933
      3300939393009933330000000000993333009933330000000000000000009933
      3300993333009933330099333300993333000000000099333300000000009933
      3300939393009933330000000000993333009933330000000000000000009933
      3300993333009933330099333300993333000000000000000000C9C9C900FFFF
      FF000033CC00FFFFFF00FFFFFF0033339900FFFFFF00FFFFFF00FFFFFF00CC99
      0000FFFFFF00C9C9C90000000000000000000000000000000000000000000000
      0000993333009933330099333300000000000000000099333300993333009933
      3300000000000000000000000000000000000000000099333300993333009933
      3300000000000000000099333300993333009933330000000000000000000000
      0000000000009933330000000000000000000000000099333300993333009933
      3300000000000000000099333300993333009933330000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF0033339900FFFFFF0033339900FFFFFF00FFFFFF00CCCC3300FFFF
      FF00FFFFFF00C9C9C90000000000000000000000000000000000000000000000
      0000993333009933330099333300000000000000000099333300993333009933
      3300000000000000000000000000000000000000000099333300993333009933
      3300000000000000000099333300993333009933330000000000000000000000
      0000000000009933330000000000000000000000000099333300993333009933
      3300000000000000000099333300993333009933330000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF003333990033339900FFFFFF00CCCC9900FFFFFF00FFFF
      FF00FFFFFF00C9C9C90000000000000000000000000000000000000000009933
      3300993333009933330093939300000000000000000093939300993333009933
      3300993333000000000000000000000000009933330099333300993333009393
      9300000000000000000093939300993333009933330099333300000000000000
      0000000000000000000000000000000000009933330099333300993333009393
      9300000000000000000093939300993333009933330099333300000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF0033339900333399003333990033339900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C9C9C90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C9C900C9C9
      C900C9C9C900C9C9C90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E4
      E400C9C9C9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E4E400C9C9
      C900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      000000000000000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993333000000000000000000000000000000
      0000000000000000000000000000000000000000000099333300993333009933
      3300E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400CC9999000000000000000000000000000000000099333300993333009933
      3300E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      00000000CC000000CC000000CC000000CC000000000099333300993333009933
      3300E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      0000993333000000000000000000993333000000000000000000000000000000
      0000000000000000000099333300993333009933330000000000000000000000
      0000000000000000000000000000000000009933330099333300993333009933
      330099333300FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC9999000000000000000000000000009933330099333300993333009933
      330099333300FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      00000000CC000000000000000000000000009933330099333300993333009933
      330099333300FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      0000993333000000000000000000993333000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      0000000000000000CC000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      0000993333009933330099333300993333000000000000000000000000000000
      0000993333009933330099333300993333009933330099333300993333000000
      000000000000000000000000000000000000000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400CC999900000000000000000000000000000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      000000000000000000000000CC0000000000000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      0000993333000000000000000000993333000000000000000000000000009933
      3300993333009933330099333300993333009933330099333300993333009933
      330000000000000000000000000000000000000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC999900000000000000000000000000000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      00000000000000000000000000000000CC00000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      0000993333000000000000000000993333000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      0000000000000000000000000000000000009966330099663300993333009966
      3300996633009966330099663300996633009966330099663300000000000000
      0000000000000000000000000000000000009966330099663300993333009966
      3300996633009966330099663300996633009966330000000000000000000000
      00000000CC000000CC000000CC000000CC009966330099663300993333009966
      3300996633009966330099663300996633009966330000000000000000000000
      0000000000009933330099333300000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000CC999900E4E4E40099333300E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E40099663300000000000000
      000000000000000000000000000000000000CC999900E4E4E40099333300E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E4009966330000000000000000000000
      000000000000000000000000000000000000CC999900E4E4E40099333300E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E4009966330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000CC999900CC99990099333300CC99
      9900CC999900CC999900CC999900CC999900CC99990099663300000000000000
      000000000000000000000000000000000000CC999900CC99990099333300CC99
      9900CC999900CC999900CC999900CC9999009966330000000000000000000000
      000000000000000000000000000000000000CC999900CC99990099333300CC99
      9900CC999900CC999900CC999900CC9999009966330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      000099333300000000000000000099333300000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      00000000CC000000CC000000CC000000CC000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400CC999900000000000000000000000000000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      000099333300000000000000000099333300000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      00000000CC000000000000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC999900000000000000000000000000000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      000099333300993333009933330099333300000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      0000000000000000CC0000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900000000000000000000000000000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      000099333300000000000000000099333300000000000000000099333300CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC9999000000
      000000000000000000000000CC00000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400CC999900000000000000000000000000000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      000099333300000000000000000099333300000000000000000099333300FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400CC9999000000
      00000000000000000000000000000000CC000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC999900000000000000000000000000000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      000000000000993333009933330000000000000000000000000099333300FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00CC9999000000
      00000000CC000000CC000000CC000000CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC9999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000990000000000
      0000000000009900000000000000990000009900000099000000000000000000
      0000000000009900000099000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC9999000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003366000066CC
      330000CCCC000000000033999900000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      0000000000000000000000000000000000000000000000000000990000009900
      0000990000009900000033999900990000000000000000000000990000000000
      0000990000000000000000000000990000000000000000000000000000000000
      00000000000000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC9999000000000000000000000000000000
      000000000000000000000000000000000000000000003366000066CC330000FF
      000066CC33003399990000990000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      0000000000000000000000000000000000000000000000000000990000003399
      9900FFFFFF009900000093939300990000009900000099000000000000000000
      0000990000000000000000000000000000000000000000000000000000009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300996633000000000000000000000000006699990033666600336666003366
      6600336666003366660033666600336666003366000066CC330000FF000066CC
      3300339900000099000000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000000000000000000099000000FFFF
      FF00E4E4E40099000000C9C9C900990000003399990000000000990000000000
      000099000000000000000000000099000000000000000000000000000000CC99
      9900E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E4009966330000000000000000000000000099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC003366000066CC330000FF000066CC33003399
      0000009900003366660000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      0000000000000000000000000000000000000000000033999900FFFFFF009900
      0000990000009393930093939300990000009900000099000000939393009393
      930000000000990000009900000000000000000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      99009966330000000000000000000000000099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0066CC330000FF000066CC3300339900000099
      000099CCCC003366660000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      00000000000000000000000000000000000033999900FFFFFF00E4E4E400C9C9
      C900939393006B6B6B006B6B6B006B6B6B007878780093939300336666003366
      6600939393009393930000000000000000000000000000000000000000000000
      00000000000000000000CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC99990099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0033FFFF0000FFFF0066CC3300339900000099000099CC
      CC0099CCCC003366660000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000FFFFFF00E4E4E400CC6633009933
      33006699000078787800787878006B6B6B006B6B6B0078787800939393007878
      7800336666003366660093939300000000000000000000000000000000000000
      00000000000000000000FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC99990099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0000FFFF0000CCCC00339999000099000099CCCC0099CC
      CC0099CCCC003366660000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000E4E4E400CC663300336666003333
      6600336666003333660033336600787878006B6B6B006B6B6B00C9C9C900FFFF
      FF00C9C9C9007878780033666600939393000000000000000000C9C9C9000099
      000066CC330000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC99990099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC000000000033FFFF0000CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC003366660000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000CC99330066990000669900003366
      660033666600336633003366660099333300CC6633006B6B6B00E4E4E400C9C9
      C900E4E4E400C9C9C90093939300939393000000000000000000C9C9C9000099
      000066CC33009966330099663300996633009966330099663300996633009966
      33009966330000000000000000000000000099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC003366660000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000CC6633006699000066CC6600CC99
      3300CC663300996633003366330033663300996633006B6B6B00C9C9C900E4E4
      E400E4E4E400C9C9C900C9C9C90000000000C9C9C900C9C9C900C9C9C9000099
      000066CC3300E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E4009966330000000000000000000000000099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC003366660000000000000000000000000000000000000000009933
      3300993333009933330099333300993333009933330099333300993333009933
      330000000000000000000000000000000000669900006699000066CC66006699
      9900CCCC6600CC66330033666600336666009933330093939300E4E4E400E4E4
      E400C9C9C900C9C9C900000000000000000066CC330066CC330066CC33000099
      000066CC330066CC330066CC330066CC3300CC999900CC999900CC999900CC99
      99009966330000000000000000000000000099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC003366660000000000000000000000000000000000000000000000
      0000993333009933330099333300993333009933330099333300993333000000
      000000000000000000000000000000000000CC99330066CC6600FFCC9900CCCC
      990066CC660066999900336633003366660099333300C9C9C900E4E4E400C9C9
      C900C9C9C9000000000000000000000000000099000000990000009900000099
      000000990000009900000099000000990000CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC99990099FFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF006699990000000000000000000000000000000000000000000000
      0000000000009933330099333300993333009933330099333300000000000000
      000000000000000000000000000000000000CC99330066990000FFFFCC00CCCC
      990066CC6600669900006699000099663300E4E4E400FFFFFF00C9C9C900C9C9
      C90000000000000000000000000000000000C9C9C900C9C9C900C9C9C9000099
      000066CC330000000000FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC99990099FFFF0099CCCC0099CCCC0099CC
      CC0099FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099333300993333009933330000000000000000000000
      00000000000000000000000000000000000000000000CC993300CC993300CCCC
      6600669900006699000033663300CC663300C9C9C900C9C9C900C9C9C9000000
      0000000000000000000000000000000000000000000000000000C9C9C9000099
      000066CC330000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC9999000000000099FFFF0099FFFF0099FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6633006699
      00006699000033663300CC9933000000000000000000C9C9C900000000000000
      0000000000000000000000000000000000000000000000000000C9C9C9000099
      000066CC33000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000006363
      FF006363FF006363FF006363FF006363FF006363FF006363FF006363FF006363
      FF003163000031FFFF0000CECE00000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      9300939393009393930093939300939393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800080808000808080000000000000000000000000000000000000000000639C
      FF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF003163
      000063CE310000CECE0000000000319C9C00000000000000000093939300E4E4
      E400E4E4E40093939300E4E4E400E4E4E400E4E4E400E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E400939393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF000080800000FFFF0000808000000000
      000000000000808080008080800000000000000000000000000000000000639C
      FF00639CFF00639CFF00639CFF00639CFF00639CFF00639CFF003163000063CE
      310000FF000063CE3100319C9C00009C0000000000000000000093939300C9C9
      C900C9C9C90093939300C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C900939393000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080800000FFFF000080800000FFFF00008080
      0000808000000000000080808000000000000000000000000000000000006363
      FF006363FF006363FF006363FF006363FF006363FF003163000063CE310000FF
      000063CE3100319C0000009C000000000000CC99000099663300996633009966
      33009966330099663300996633009966330099663300E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E4009393930000000000FFFFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF000080800000FFFF0000808000008080
      000080800000808000008080800080808000000000000000000000000000639C
      FF009CCEFF009CCEFF009CCEFF009CCEFF003163000063CE310000FF000063CE
      3100319C0000009C00000000000000000000CCCC6600CC990000CC990000CC99
      0000CC990000CC990000CC990000CC99000099663300C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C900939393000000000000FFFF00FFFFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      000080800000808000000000000080808000000000000000000000000000639C
      FF00639CFF00639CFF00639CFF00639CFF0063CE310000FF000063CE3100319C
      0000009C0000000000000000000000000000CCCC6600CC99000099663300CC99
      000099663300CC99000099663300CC99000099663300E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E4009393930000000000FFFFFF0000FFFF00FFFF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000008080000000000000808080009C6331009C6331009C6331009C63
      31009C6331009C6331009C63310031FFFF0000FFFF0063CE3100319C0000009C
      000000000000000000000000000000000000CCCC6600CCCC6600CCCC6600CCCC
      6600CCCC66000000FF00A1A1A100CCCC6600CC99000000000000000000009393
      9300C9C9C900C9C9C900C9C9C900939393000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      000080808000000000000000000080808000CE9C9C00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E70000FFFF0000CECE00319C9C00009C00000000
      000000000000000000000000000000000000000000000000000093939300E4E4
      E4000000FF000000FF00A1A1A100E4E4E400E4E4E400E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E4009393930000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      000000000000800000000000000080808000CE9C9C00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00CE9C9C00CE9C9C000000000031FFFF0000CECE00000000000000
      0000000000000000000000000000000000000000000000000000939393000000
      FF00939393000000FF00A1A1A100939393009393930093939300939393009393
      9300939393009393930093939300939393000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000000000000000000000000000000000000000000000000000000000000FF00
      000000808000800000000000000080808000000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C0000000000000000000000000000000000000000000000FF00C9C9
      C900C9C9C9000000FF00A1A1A100A1A1A100C9C9C900C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C9009393930000000000FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00000000FF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF00000000FF
      FF00FF000000800000008080800000000000000000000000000000000000FFCE
      CE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700CE9C9C000000000000000000000000000000000000000000939393009393
      930093939300939393000000FF00A1A1A1009393930093939300939393009393
      9300939393009393930093939300939393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FF00
      000080000000000000008080800000000000000000000000000000000000FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00CE9C9C000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00A1A1A100A1A1A10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00000000FF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      000000000000808080000000000000000000000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00A1A1A100A1A1A100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      CE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700CE9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00CE9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000669999006699990066999900669999006699
      9900669999006699990033666600336666000000000000000000000000000000
      0000000000000000000066666600333333003333330033333300333333003333
      3300333333006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006699990066999900669999006699990066999900669999006699
      99003366660099CCCC0099FFFF00336666000000000000000000000000000000
      0000000000000000000066666600333333006666660033333300333333003333
      3300333333006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      9300939393009393930093939300939393000000000000000000000000006699
      99006699990066999900669999006699990066999900669999003366660099CC
      CC0099FFFF0099FFFF0099FFFF00336666000000000000000000000000000000
      0000000000000000000066666600333333006666660033333300333333003333
      3300333333006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300E4E4
      E400E4E4E40093939300E4E4E400E4E4E400E4E4E400E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E400939393000000000000000000000000000000
      00000000000000000000000000009966330099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF00336666000000000000000000000000000000
      0000000000000000000066666600333333003333330033333300333333003333
      3300333333006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300C9C9
      C900C9C9C90093939300C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C9009393930093939300939393009966CC009966
      CC00A1A1A100A1A1A10099663300996633009966330099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF003366660093939300939393009966CC009966
      CC00A1A1A100A1A1A10066666600666666006666660066666600666666006666
      660066666600666666006666660066666600000000000000000000000000CC99
      0000996633009966330099663300996633009966330099663300996633009966
      330000000000000000000000000000000000CC99000099663300996633009966
      33009966330099663300996633009966330099663300E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E400939393009393930000000000000000000000
      000000000000996633009966330099663300996633009966330099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF00336666009393930000000000000000000000
      0000000000000000000066666600669999006699990066999900669999006699
      990066999900669999006699990066666600000000000000000000000000CCCC
      6600CC990000CC990000CC990000CC990000CC990000CC990000CC9900009966
      330000000000000000000000000000000000CCCC6600CC990000CC990000CC99
      0000CC990000CC990000CC990000CC99000099663300C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C900939393009393930000000000000000000000
      00000000000000000000000000009966330099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF00336666009393930000000000000000000000
      00000000000000000000666666006699990099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990066666600000000000000000000000000CCCC
      6600CC99000099663300CC99000099663300CC99000099663300CC9900009966
      330000000000000000000000000000000000CCCC6600CC99000099663300CC99
      000099663300CC99000099663300CC99000099663300E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E400939393009393930000000000939393009393
      9300CC990000CC990000A1A1A10099663300CCFFFF0033666600000000000000
      0000000000009966330000000000000000009393930000000000939393009393
      9300CC990000CC990000666666006699990099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990066666600000000000000000000000000CCCC
      6600CCCC6600CCCC6600CCCC6600CCCC66000000FF00CC990000CCCC6600CC99
      000000000000000000000000000000000000CCCC6600CCCC6600CCCC6600CCCC
      6600CCCC6600CCCC6600CCCC6600CCCC6600CC99000000000000000000009393
      9300C9C9C900C9C9C900C9C9C900939393009393930000000000939393000000
      0000000000000000000000000000996633000000000000000000000000000000
      0000000000009966330000000000000000009393930000000000939393000000
      00000000000000000000666666006699990099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0066999900666666000000000000000000000000000000
      00000000000000000000000000000000FF000000FF00A1A1A100000000000000
      000000000000000000000000000000000000000000000000000093939300E4E4
      E400E4E4E40093939300E4E4E400E4E4E400E4E4E400E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E4009393930093939300939393003399FF003399
      FF00A1A1A100A1A1A10000000000996633000000000000000000000000000000
      00000000000099663300000000000000000093939300939393003399FF003399
      FF00A1A1A100A1A1A10066666600669999006699990066999900669999006699
      9900669999006699990066999900666666000000000000000000000000000000
      000000000000000000000000FF00000000000000FF00A1A1A100000000000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      9300939393009393930093939300939393009393930000000000000000000000
      0000000000000000000000000000996633000000000000000000000000000000
      0000000000009966330000000000000000009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000FF00A1A1A100A1A1A1000000
      000000000000000000000000000000000000000000000000000093939300C9C9
      C900C9C9C90093939300C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C900939393009393930000000000000000000000
      0000000000000000000000000000000000009966330000000000000000000000
      0000996633000000000000000000000000009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00A1A1A1000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      930093939300939393009393930093939300939393009393930066CC660066CC
      6600A1A1A100A1A1A10000000000000000000000000099663300996633009966
      330000000000000000000000000000000000939393009393930066CC660066CC
      6600A1A1A100A1A1A10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00A1A1A100A1A1
      A100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF00A1A1
      A100A1A1A1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00A1A1A100A1A1
      A100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00A1A1A100A1A1
      A100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900999999009999990099999900999999009999
      9900999999009999990099999900999999000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900FFFFFF00FFFFFF00FFFFFF00E3E3E300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      0000000000000000000099999900FFFFFF00FFFFFF0066333300E3E3E300E3E3
      E300FFFFFF00FFFFFF00FFFFFF00999999000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00999999000000000000000000CC993300CC993300CC993300CC99
      3300CC993300CC99330080808000E3E3E300E3E3E3006633330066333300E3E3
      E300E3E3E300FFFFFF00FFFFFF00999999000000000080808000000000000000
      000000000000000000000000000000000000800000008000000080000000FF00
      0000FF000000FF000000000000000000000000000000000000006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00999999000000000000000000CC993300FFCC9900FFCC9900FFCC
      9900FFCC9900FFCC990066333300663333006633330066333300663333006633
      3300E3E3E300E3E3E300FFFFFF00999999000000000080808000808080000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000FF000000FF00000000000000000000000000000000000000CCCCCC00BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBB
      BB006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00CC999900CC999900CCCCCC00CC999900CCCCCC00CC999900CC999900CCCC
      CC00FFFFFF00999999000000000000000000CC993300FFCC9900FFCC9900FFCC
      9900663333006633330066333300663333006633330066333300663333006633
      330066333300FFFFFF00FFFFFF00999999000000000000008000808080000000
      0000000000000000000000000000FF000000FF00000080000000800000008000
      0000000000000000000000000000000000000000000000000000CCCCCC006B6B
      6B006B6B6B00BBBBBB006B6B6B006B6B6B00BBBBBB006B6B6B006B6B6B00BBBB
      BB006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFF
      FF00FFFFFF00999999000000000000000000CC993300FFCC9900FFCC99006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300FFFFFF00FFFFFF00FFFFFF00999999000000000000008000000080008080
      8000000000000000000000000000FF00000000008000FF000000800000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00BBBBBB00BBBBBB00BBBB
      BB006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00CCCCCC00CC999900CC999900CCCCCC00CC999900CC999900CCCCCC00CCCC
      CC00FFFFFF00999999000000000000000000CC993300FFCC9900663333006633
      3300663333006633330099999900FFFFFF00FFFFFF006633330066333300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00999999000000000000008000000080008080
      80008080800000000000000000000000800000008000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC0099999900999999009999990099999900999999009999990099999900BBBB
      BB006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFF
      FF00FFFFFF00999999000000000000000000CC993300FFCC9900663333006633
      330066333300FFCC990099999900FFFFFF00FFFFFF0066333300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00999999000000000000000000000080000000
      80008080800080808000000080000000800000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBB
      BB006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00CCCCCC00CC999900CC999900CCCCCC00CC999900CC999900CCCCCC00CCCC
      CC00FFFFFF00999999000000000000000000CC993300FFCC9900FFCC99006633
      3300FFCC9900FFCC990099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00999999009999990099999900999999000000000000000000808080000000
      8000000080000000800000008000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00BBBB
      BB006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFF
      FF00FFFFFF00999999000000000000000000CC993300FFCC9900FFCC9900FFCC
      9900FFCC9900FFCC990099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099999900FFFFFF00FFFFFF00999999000000000000000000808080000000
      8000000080000000800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC006633
      33006633330099333300996633009966330099660000CC663300CC990000CCCC
      33006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00CC999900CCCCCC00CC999900CCCCCC00CC999900CC999900CC999900CCCC
      CC00FFFFFF00999999000000000000000000CC993300FFCC9900FFCC9900FFCC
      9900FFCC9900FFCC990099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099999900FFFFFF0099999900000000000000000080808000000080000000
      8000000080000000800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC006B6B6B000000000000000000000000000000000000000000CCCCCC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00999999000000000000000000CC993300FFCC9900FFCC9900FFCC
      9900FFCC9900FFCC990099999900999999009999990099999900999999009999
      9900999999009999990000000000000000000000800000008000000080008080
      8000000000000000800000008000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC000000000000000000CC993300FFCC9900FFCC9900FFCC
      9900FFCC9900FFCC9900CC993300FFCC9900FFCC9900CC993300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC993300FFCC9900FFCC9900FFCC
      9900FFCC9900FFCC9900CC993300FFCC9900CC99330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC993300CC993300CC993300CC99
      3300CC993300CC993300CC993300CC9933000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008000000080000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008000000080000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008000000080000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      000080000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      000080000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      000080000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000080808000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080000000000000000000
      0000000000000000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000000000000000000000000000000000008000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000800000000000000000000000000000008080800080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000000000000000000000000000008000000080000000800000000000
      0000000000000000000000000000000000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008000000080000000800000008000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000000000000000000000000000008000000080000000800000000000
      0000000000000000000000000000000000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080000000000000000000
      0000000000008080800080000000000000000000000080000000000000000000
      0000000000000000000000000000000000008000000000000000000000008000
      0000808080000000000000000000000000008000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000800000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      000080000000800000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000080800000FFFF000080800000FFFF000080800000FFFF000080800000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000FFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF000080800000FFFF000080800000FFFF000080800000FFFF000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000008080800000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000808080000000000000000000000000008000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000808080008000000080000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000808080000000000000008000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000808000008080000080800000808000008080000080800000808000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000808000008080000080800000808000008080000080800000808000008080
      0000808080008000000080000000000000000000000000000000000000000000
      0000808000008080000080800000808000008080000080800000808000008080
      0000808080000000000000008000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      0000808080000000000000008000000000000000000000000000FFFFFF007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      000000000000000000000000800000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      8000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000008000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000080000000
      8000000080000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000000000000000000000000000000007F7F
      7F007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000080000000
      8000000080000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800080008000800080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFF000080800000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800080000000000000000000800080008000800080008000800080008000
      8000800080008000800080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000FFFFFF008080800000000000FFFF0000808000008080000080800000FFFF
      0000FFFF00000000000000000000FFFF0000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080008000FFFFFF0000000000000000000000000080808000C0C0C000C0C0
      C000FFFFFF00FFFFFF0080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000FFFFFF008080800000000000FFFF00008080000080800000808000008080
      000080800000FFFF0000FFFF000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      800080008000FFFFFF0000000000C0C0C000FFFFFF0080808000000000000000
      000000000000FFFFFF0080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000FFFFFF00C0C0C00000000000FFFF000080800000FF000000FF000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800080008000
      8000FFFFFF00FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FF
      FF0080808000FFFFFF0080008000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000080808000C0C0C0008080
      8000FFFFFF008080800000000000FFFF0000FFFF0000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFF
      FF0080808000FFFFFF0080008000000000000000000000000000000000000000
      0000CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300999999000000000000000000000000000000000000000000808080008080
      8000FFFFFF008080800000000000FFFF0000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FF
      FF0080808000FFFFFF0080008000000000000000000000000000000000000000
      0000FF996600FF996600FF996600FF996600FF996600FF996600FF996600CC66
      330099999900000000000000000000000000000000000000000080808000C0C0
      C000FFFFFF00C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFF
      FF0080808000FFFFFF0080008000000000000000000000000000000000000000
      0000FF996600FF996600FF996600FF996600FF996600FF996600FF996600CC66
      3300000000000000000000000000000000000000000080808000C0C0C0008080
      8000FFFFFF0080808000808080000000000000000000C0C0C000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FF
      FF0080808000FFFFFF0080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000FFFFFF00808080008080800000000000C0C0C00000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000000000000080008000FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFF
      FF0080808000FFFFFF0080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000FFFFFF00C0C0C000C0C0C000C0C0C0008080800000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000000000000080008000FFFF
      FF00FFFFFF00C0C0C0008080800080808000FFFFFF00FFFFFF00FFFFFF0000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C0008080800080808000808080008080800000000000C0C0C000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FFFF
      FF00FFFFFF008080800000000000000000008080800080808000FFFFFF00FFFF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00080808000FFFFFF0080808000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080008000FFFF
      FF00C0C0C0008080800000000000000000000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000000000000000
      0000000000000000FF0000008000000080000000800000000000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009393
      9300BBBBBB00BBBBBB00BBBBBB00BBBBBB008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0008080800080808000000000008080800080808000808080008080
      8000808080008080800000808000000000000000000000808000C0C0C000C0C0
      C000C0C0C000C0C0C0000000FF0000008000C0C0C000C0C0C000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990000CCCC00339999000000000000000000000000006666
      6600666666006666660066666600BBBBBB00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000808000FFFFFF0000808000FFFFFF0000808000FFFF
      FF0000808000FFFFFF0080808000000000000000000080808000808080008080
      800080808000808080000000FF0000008000FFFFFF000000800000008000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990000000000000000006666660093939300939393006666
      6600000000006666660093939300BBBBBB00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C0000000
      00000000000000000000C0C0C000000000000000000000000000000000000080
      8000FFFFFF0000000000FFFFFF00800000008000000080000000FFFFFF000000
      8000FFFFFF00000080008080800000000000FF00000080000000800000008000
      000080000000800000000000FF0000008000000080000000800080808000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990000CCCC00339999006666660066666600666666000000
      00000000000066666600BBBBBB00BBBBBB00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000FFFFFF000080
      8000008080000000000000FFFF00FF000000FF0000008000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00808080000000000000000000FF000000800000008080
      8000FFFFFF00800000000000FF00000080000000800000008000FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990000000000000000006666660000000000666666000000
      000066666600939393009393930093939300FFFFFF00C0C0C00000000000C0C0
      C0000000000000000000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0000000000000000000FFFFFF0000808000FFFF
      FF000080800000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00808080000000000000000000FF000000800000008080
      8000FFFFFF00FFFFFF000000FF0000008000FFFFFF0000008000FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000009999
      9900999999009999990000CCCC00339999006666660000000000000000000000
      000066666600666666006666660066666600FFFFFF00C0C0C00000000000C0C0
      C0000000000000000000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0000000000000000000FFFFFF00FFFFFF000080
      8000008080000000000000FFFF0080000000800000008000000000FFFF000000
      800000FFFF0000008000808080000000000000000000FF000000800000008080
      8000FFFFFF00FFFFFF000000FF0000008000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900000000000000000000000000000000006666660000000000000000000000
      0000000000000000000066666600BBBBBB00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0000000000000000000FFFFFF00008080000080
      80000080800000000000FFFFFF00FF000000FF00000080000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00808080000000000000000000FF000000800000008080
      8000FFFFFF000000FF00000080000000800000008000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      990000CCCC003399990000000000000000006666660000000000000000000000
      00000000000066666600BBBBBB00BBBBBB00FFFFFF00C0C0C00000000000C0C0
      C0000000000000000000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0000000000000000000FFFFFF00FFFFFF000080
      8000008080000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF00808080000000000000000000FF000000800000008080
      8000FFFFFF00FFFFFF008000000080000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900000000000000000000000000000000006666660000000000000000000000
      000066666600BBBBBB00BBBBBB00BBBBBB00FFFFFF00C0C0C00000000000C0C0
      C0000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      00000000000000000000C0C0C0000000000000000000FFFFFF00008080000080
      80000080800000000000FFFFFF00800000008000000080000000FFFFFF000000
      8000FFFFFF0000008000808080000000000000000000FF00000080000000C0C0
      C000808080008000000080000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000009999
      990000CCCC003399990000000000000000006666660000000000000000006666
      6600BBBBBB00BBBBBB00BBBBBB00BBBBBB00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000000000000000FFFFFF00FFFFFF000080
      8000008080000000000000FFFF00FF000000FF0000008000000000FFFF00FFFF
      FF0000FFFF00FFFFFF008080800000000000FF00000080000000800000008000
      00008000000080000000FFFFFF00000000000000000000000000C0C0C0008080
      8000000000000000000080808000000080000000000000000000000000009999
      9900000000000000000000000000000000006666660000000000666666009393
      9300BBBBBB00BBBBBB00BBBBBB00BBBBBB00FFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080000000000000000000FFFFFF00008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF000000000000000000808080000000
      8000808080000000000000000000808080000000000099999900999999009999
      990000CCCC003399990000000000000000006666660066666600000000009393
      9300BBBBBB00BBBBBB00BBBBBB00BBBBBB00FFFFFF0080000000FFFFFF008000
      0000FFFFFF0080000000FFFFFF00FFFFFF008000000080000000800000008000
      00008000000080000000800000000000000000000000FFFFFF00008080008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF00FFFF
      FF00000000000000000000FFFF00000000000000000000000000000000008080
      8000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009393
      9300BBBBBB00BBBBBB00BBBBBB00BBBBBB00FFFFFF008000000080000000FFFF
      FF008000000080000000800000008000000080000000FFFFFF00800000008000
      0000800000008000000080000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009999990000CCCC003399
      9900000000000000000000000000000000000000000000000000000000009393
      9300BBBBBB00BBBBBB00BBBBBB00BBBBBB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000008000808080000000
      0000000000000000800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00BBBBBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000000000008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      000000000000000000000000FF00000080000000800000008000000000000000
      8000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080000000
      000080808000808080008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C0000000FF0000008000C0C0C000C0C0C0000000
      8000000080008080800000000000000000000000000000000000000000000000
      000000000000000000000000FF00000080000000800000008000000000000000
      80000000800000008000C0C0C00000000000000000000000000080808000FFFF
      FF0000008000C0C0C00080808000C0C0C00080808000C0C0C00080808000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000808080008080
      80008080800080808000808080000000FF0000008000FFFFFF00000080000000
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800080808000000000000000
      800000008000C0C0C0000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000000000000000000000000000FF000000800000008000
      00008000000080000000800000000000FF000000800000008000000080008080
      8000C0C0C0000000000000000000000000000000000000000000808080008080
      80008080800080808000808080000000FF0000008000C0C0C000000080000000
      8000C0C0C000000000000000000000000000000000000000000080808000FFFF
      FF0000008000C0C0C00080808000C0C0C00080808000C0C0C00080808000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000FF0000008000
      000080808000FFFFFF00800000000000FF00000080000000800000008000FFFF
      FF00C0C0C00000000000000000000000000000000000FF000000800000008000
      00008000000080000000800000000000FF000000800000008000000080008080
      800000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008000
      000080808000FFFFFF00FFFFFF000000FF0000008000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FF0000008000
      00008080800000000000800000000000FF00000080000000800000008000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF0000008000C0C0C00080808000C0C0C00080808000C0C0C00080808000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF0000008000
      000080808000FFFFFF00FFFFFF000000FF0000008000FFFFFF00FFFFFF000000
      8000808080008080800000000000000000000000000000000000FF0000008000
      00008080800000000000000000000000FF00000080008080800000008000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000FF0000008000
      000080808000FFFFFF000000FF00000080000000800000008000FFFFFF000000
      8000000080000000800000000000000000000000000000000000FF0000008000
      00008080800000000000000000000000FF000000800080808000000000000000
      800080808000808080000000000000000000000000000000000080808000FFFF
      FF0000008000C0C0C00080808000C0C0C00080808000C0C0C00080808000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF0000008000
      000080808000FFFFFF00FFFFFF008000000080000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FF0000008000
      000080808000000000000000FF00000080000000800000008000000000000000
      800000008000000080000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000FF0000008000
      0000C0C0C000808080008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FF0000008000
      0000808080000000000000000000800000008000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C00080808000FFFFFF00C0C0C00080808000FFFFFF00C0C0C0008080
      8000C0C0C0000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FF000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF00FFFFFF00008080008080
      8000808080000000000000000000000000000000000000000000FF0000008000
      0000C0C0C0008080800080000000800000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000C0C0C00000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C0008080800000000000000000000000000000000000FF000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080000000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00000000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008000000080000000800000008000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000C0C0C000C0C0C0000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008080000000808000FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008080000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000800000008000
      00008000000080000000FFFF000000000000C0C0C000C0C0C000000000000000
      000000FFFF00000000000000000000FFFF000000000000FFFF000000000000FF
      FF0000000000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008080000000000000000000000000000000000000000000000000
      0000FFFFFF008000000000000000FFFFFF008000000080000000800000008000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000C0C0C000C0C0C0000000000000FF
      FF00000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0008080000000808000FFFFFF00FFFF
      FF000000FF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF000000000080800000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000800000008000
      00008000000080000000FFFF000000000000C0C0C000C0C0C000000000000000
      00000000000000FFFF00000000000000000000FFFF000000000000FFFF000000
      000000FFFF0000000000C0C0C000C0C0C0008080000000808000FFFFFF00FFFF
      FF000000FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000080800000000000000000000000000000FFFFFF00800000000000
      0000FFFFFF008000000000000000FFFFFF008000000080000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000C0C0C000C0C0C000000000000000
      000000FFFF00000000000000000000FFFF000000000000FFFF000000000000FF
      FF0000000000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF000000000080800000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000080000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00808080000000000000000000FFFF0000800000008000
      0000FFFF0000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF00FFFF
      FF000000FF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF000000000080800000000000000000000000000000FFFFFF00800000000000
      0000FFFFFF008000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000FFFF0000FFFF
      0000FFFF000000000000FFFF000000000000C0C0C000C0C0C000000000000000
      00000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000080800000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF008000
      000080000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00808080008080800000000000FFFF0000FFFF0000FFFF
      0000FFFF0000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000080800000000000000000000000000000FFFFFF00800000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      00000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000080800000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000808080008080800080808000FFFFFF000000
      80000000800000008000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000C0C0C0000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C000000000008080000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000C0C0C0000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
      C00000000000808000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000808000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0008080000000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000808000FFFFFF00FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000008000000080000000800000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000
      00008080800000000000000000000000000000000000000000000000000000FF
      000000FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000808000FFFFFF008000
      000080000000800000008000000080000000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000008000000080000000800000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF000000
      00008080800000000000000000000000000000000000000000000000000000FF
      000000FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000
      00008080800000000000000000000000000000000000000000000000000000FF
      000000FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000808000FFFFFF00FFFF
      FF00800000008000000080000000FFFFFF000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF000000
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0C000C0C0C0000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000808000FFFFFF008000
      0000800000008000000080000000FFFFFF0000808000C0C0C000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000808080000000000080808000000000008080
      800000000000C0C0C000C0C0C000C0C0C0000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000C0C0C0008080800000000000808080000000
      00008080800000000000C0C0C000C0C0C0000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000C0C0C0000000
      0000C0C0C0008080800000000000C0C0C0000000000080808000000000008080
      8000000000000000000000000000C0C0C0000000000080808000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00800000008000000080000000800000008000000080000000800000008000
      0000C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00800000008000000080000000FFFFFF00000080000000800000008000FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000C0C0C0000000
      0000808080000000000080808000000000008080800000000000808080000000
      0000808080000000000000000000000000000000000080808000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0080000000C0C0C000FFFFFF0080000000FFFFFF0080000000FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00800000008000000080000000C0C0C000000080000000800000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000C0C0C0008080800000000000808080000000000080808000000000008080
      8000000000000000000000000000000000000000000080808000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0080000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00800000008000000080000000FFFFFF00000080000000800000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF008000000080000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00800000008000000080000000C0C0C000000080000000800000008000FFFF
      FF00C0C0C000000000000000000000000000C0C0C00000000000FFFF0000C0C0
      C000FFFF0000C0C0C0000000000000000000FFFF000000000000FFFF00000000
      0000000000000000000000000000000000000000000080808000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0080000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00000080000000800000008000FFFF
      FF00C0C0C000000000000000000000000000C0C0C00000000000C0C0C000FFFF
      0000C0C0C000FFFF000000000000FFFF000000000000FFFF000000000000FFFF
      000000000000C0C0C00000000000000000000000000080808000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF008000000080000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000000080000000800000008000FFFF
      FF00C0C0C000000000000000000000000000C0C0C00000000000FFFF0000C0C0
      C000FFFF0000C0C0C0000000000000000000FFFF000000000000FFFF00000000
      000000000000C0C0C00000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000000000000000000000000000000000000000000000808000FFFF
      FF0080000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00000080000000800000008000FFFF
      FF00C0C0C000000000000000000000000000C0C0C00000000000C0C0C000FFFF
      0000C0C0C000FFFF000000000000FFFF000000000000FFFF000000000000FFFF
      000000000000C0C0C00000000000C0C0C0000000000080808000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000808000FFFF
      FF008000000080000000FFFFFF00C0C0C000FFFFFF00C0C0C000008080000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000008080000000
      000000000000000000000000000000000000C0C0C00000000000FFFF0000C0C0
      C000FFFF0000C0C0C0000000000000000000FFFF000000000000FFFF00000000
      000000000000C0C0C00000000000C0C0C0000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080000000000000000000000000000000000000808000FFFF
      FF0080000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000808000C0C0
      C00080808000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000808000C0C0
      C00080808000000000000000000000000000C0C0C00000000000C0C0C000FFFF
      0000C0C0C000FFFF000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      800000000000000000000000000000000000C0C0C00000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      000000000000000000000000000000000000C0C0C000C0C0C000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000080
      8000FFFFFF00800000008000000080000000800000008000000080000000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000008080
      8000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFFFF00C0C0C000000000000000000000000000000000000080
      8000FFFFFF00800000008000000080000000800000008000000080000000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00008000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C0008080
      8000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000C0C0C000000000000000000000000000000000000080
      8000FFFFFF00800000008000000080000000800000008000000080000000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00008000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00000000008080
      8000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFFFF00C0C0C000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000808000FFFF000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00008000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000C0C0C000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000808000FFFF000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00008000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00000000008080
      8000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFFFF00C0C0C000000000000000000000000000000000000080
      8000FFFFFF00000080000000800000008000000080000000800000008000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      000000000000800000008000000080000000FFFF000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00008000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000C0C0C000000000000000000000000000000000000080
      8000FFFFFF00000080000000800000008000000080000000800000008000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00008000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000080
      8000FFFFFF00000080000000800000008000000080000000800000008000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000FFFF00008000000080000000800000008000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008080
      8000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080000080
      8000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000FFFF00008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000008080000080
      800000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF00FFFFFF0000008000FFFFFF00FFFFFF00FFFFFF0000008000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000C0C0C0000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF0080000000800000008000000080000000800000008000
      0000FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF0000008000C0C0C00000008000C0C0C00000008000C0C0C00000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000800000FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF0080000000800000008000000080000000800000008000
      0000FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF0080000000800000008000000080000000800000008000
      0000FFFFFF000080800000000000000000000000000000000000008080000000
      8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      8000C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF0000008000000080000000800000008000000080000000
      8000FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF0000008000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C00000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF0000008000000080000000800000008000000080000000
      8000FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF008080800000000000000000000000000000000000FFFFFF000080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF0000008000000080000000800000008000000080000000
      8000FFFFFF00008080000000000000000000000000000000000000808000FFFF
      FF00C0C0C00000008000FFFFFF00C0C0C000FFFFFF0000008000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      8000C0C0C000808080000000000000000000000000000000000000808000FFFF
      FF008080800000000000000000000000000000000000FFFFFF00008080000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080000080
      800000808000008080000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      800080808000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C00080808000000000000000000000000000000000000000000000808000FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000808000FFFFFF000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080000080
      8000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000808080000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000000000000000000000000000000000000FFFFFF000080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000FFFFFF00FFFFFF0000008000FFFFFF00FFFFFF00FFFFFF0000008000FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C0000080
      8000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      8000FFFFFF00C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF000080
      8000FFFFFF0000008000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C0000000
      8000FFFFFF00C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00800000000080
      8000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      8000FFFFFF00C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000000000000000000080808000FFFFFF00800000000080
      800000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF0000008000C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000C0C0C000000000008080800000000000000000000000000000000000C0C0
      C000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00008080800000000000000000000000000080808000FFFFFF00800000000080
      8000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      8000FFFFFF00C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C000000000008080800000000000000000000000000000000000C0C0
      C000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000808080000000000000000000000000008080800080000000FFFFFF000080
      8000FFFFFF0000008000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C0000000
      8000FFFFFF00C0C0C00000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C0008080800080808000000000000000000000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080008000000080000000800000008000000080000000800000000080
      8000C0C0C000000000008080800000000000000000000000000000000000C0C0
      C000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00008080800000000000000000000000000080808000FFFFFF00800000000080
      8000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      8000FFFFFF00C0C0C00000000000000000000000000000808000008080000000
      00000000000000000000808080008080800080808000C0C0C000000000000000
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000000080
      8000C0C0C000000000008080800000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0008080800000000000000000000000000080808000FFFFFF00800000000080
      8000FFFFFF00C0C0C00000008000FFFFFF00C0C0C000FFFFFF00000080000000
      0000000000000000000000000000000000000000000000808000008080000000
      000000000000000000000000000080808000808080000000000000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080008000000080000000800000008000000080000000800000000080
      8000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00800000000080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000080
      8000C0C0C0000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00C0C0C0000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF0000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF00808080000000000000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000008080800080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF0000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00C0C0C000000000008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000C0C0C000FF000000FF000000FF00
      0000FF000000FF00000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00080808000000000008080800000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C000000000000000000000000000C0C0C000FF000000FF000000FF00
      0000FF000000FF00000080000000000000000000000080808000800000008000
      0000800000008000000080000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000000000000000000000000000080808000FFFFFF00C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF0000000000808080008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000C0C0C000FFFF0000FF000000FF00
      0000FF000000FF000000800000000000000000000000C0C0C000FF000000FF00
      0000FF000000FF0000008000000000000000000000000000000000000000C0C0
      C000800080008000800080008000800080008000800080008000800080008000
      80008000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800000000000C0C0C0008080800000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C000000000000000000000000000C0C0C000FFFF0000FF000000FF00
      0000FF000000FF000000800000000000000000000000C0C0C000FFFF0000FFFF
      0000FFFF0000FF0000008000000000000000000000000000000000000000C0C0
      C000800080008000800080008000800080008000800080008000800080008000
      8000800000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000FFFF008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000C0C0C000FFFF0000FF000000FFFF
      0000FF000000FF000000800000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0008080800000000000000000000000000000000000C0C0
      C000800080008000800080008000800080008000800080008000800080008000
      8000800000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF00C0C0C0008080800000000000000000000000000080808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000800000000000000000000000000000000000000080808000FFFFFF0000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C000FFFFFF0080808000808080008080
      800080808000808080008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00080808000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000800000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FFFFFF00FF000000FF000000FFFFFF00FF000000FF000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C0000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000800000000000000080808000000000000000000000000000FFFFFF00FF00
      000000000000FF00000000000000FF000000FF000000FF00000000000000FF00
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00080808000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000000000000000000000000
      000080808000000000008080800000000000000000000000000000000000FF00
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000080808000C0C0C000C0C0
      C00000000000FFFFFF0000000000C0C0C000C0C0C0000000000000000000FF00
      0000FF0000008080800000000000000000008080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000808080000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000000000000000000000000000FF000000FFFFFF00C0C0C000C0C0
      C0000000FF000000FF000000FF000000FF00FFFFFF00C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000080808000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000C0C0C0000000
      0000FF000000FF00000080808000000000000000000000808000C0C0C0008000
      000080000000800000008000000080000000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000808080008080800000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000000000000000000000000000FF000000FFFFFF00FFFFFF00C0C0
      C0000000800000008000000080000000800000008000C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C0000000
      000000000000FF00000080808000000000000000000000808000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000808080000080800080808000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000800000008000
      0000800000000000000080808000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000C0C0C0000000000080808000000000000000000000808000C0C0C000FFFF
      000080808000FFFF000080808000FFFF000080808000FFFF0000FFFFFF00C0C0
      C0008080800080808000008080000000000000000000000000000000000000FF
      FF000080800000FFFF000080800000FFFF000080800000FFFF000080800000FF
      FF000080800000000000000000000000000000000000FF0000000000000000FF
      FF000080800000FFFF000080800000FFFF000080800000FFFF000080800000FF
      FF00000000000000000080808000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000080000000FFFFFF000000
      0000C0C0C0000000000000000000000000000000000000808000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000808080000080800080808000000000000000000000000000000000000080
      800000FFFF000080800000FFFF000080800000FFFF000080800000FFFF000080
      80000080800000000000000000000000000000000000FF000000808080000000
      000000000000000000000000000000000000000000000000000000FFFF000080
      8000000000000000000080808000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00800000008000000080000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000808000FF000000FF00
      0000FF0000008080800080808000808080008080800080808000808080008080
      8000808080008080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000808080008080
      80008080800080808000808080008080800080808000C0C0C000000000000000
      0000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000008000
      0000FFFFFF000000000000000000000000000000000080000000800000008000
      000080000000C0C0C00080808000008080008080800000808000C0C0C0000080
      8000808080000080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008000
      0000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000080808000000000000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF00800000008000000080000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000080
      80008080800000808000C0C0C000008080008080800000808000808080000080
      8000808080000080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FF000000C0C0C000FF00000080000000C0C0C00080000000808080008000
      0000808080008000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF00000080000000000000000000000000000000000000000000000000FF
      FF00008080008080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00808080008080
      8000FFFFFF008080800080808000808080008080800080808000FFFFFF008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00808080008080
      8000FFFFFF008080800080808000808080008080800080808000FFFFFF008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000000000C0C0
      C000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000808000C0C0C000FFFFFF008000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000008000000080000000800000008000000080000000800000008000000080
      0000808080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000000000C0C0
      C000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008000000000000000000000000000000080000000FFFFFF00808000008080
      0000C0C0C000FFFFFF00C0C0C000008080008080800000808000C0C0C0000000
      000080808000000000008080800080808000000000000000000000000000C0C0
      C000008000000080000000800000008000000080000000800000008000000080
      0000808080000000000000000000000000000000000000000000000000000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF00000000000000000000000000000000000000000000000000C0C0
      C000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008000000000000000000000000000000080000000FFFFFF0080800000C0C0
      C00000808000C0C0C00000808000808080000080800080808000008080000080
      800000808000808080008080000080800000000000000000000000000000C0C0
      C000008000000080000000800000008000000080000000800000008000000080
      0000808080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0008000000000000000000000000000000080000000FFFFFF00FFFFFF008080
      8000C0C0C0000080800080808000008080008080800000808000C0C0C000C0C0
      C00080808000008080000080800000808000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      000080808000C0C0C000008080008080800000808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C00000808000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000808080008080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000000000000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007FA199008000000080000000800000008000
      000080000000800000008000000080000000FF00000000000000FF0000000000
      0000FF00000000000000FF000000000000000080000080808000008000008080
      8000008000008080800000800000808080000080000080808000008000008080
      8000008000008080800000800000808080000000800080008000000080008000
      8000000080008000800000008000800080000000800080008000000080008000
      8000000080008000800000008000800080000000000000000000000000000000
      00000000000000000000000000007FA199000000000000000000A5E5D6007FA1
      9900000000000000000000000000000000008000000080000000800000008000
      00008000000080000000800000008000000000000000FF00000000000000FF00
      000000000000FF00000000000000FF0000008080800000800000808080000080
      0000808080000080000080808000008000008080800000800000808080000080
      0000808080000080000080808000008000008000800000008000800080000000
      8000800080000000800080008000000080008000800000008000800080000000
      8000800080000000800080008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF0000000000000000800000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000800000808080000000800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000008000800080000000000000000000000000000050
      3900005039007F7F7F007FA19900E7F7F50000876E0000503900000000000000
      0000000000000000000000000000000000008000000080808000C0C0C0008000
      00008000000080808000C0C0C000FF00000080000000FF00000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FF0000008080800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000008000008080
      8000008000008080800080808000008000008000800080808000C0C0C0008000
      80008000800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080008000000080000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007FA19900A5E5
      D600005039000050390000000000000000008000000080808000808080008000
      00008000000080808000C0C0C000800000008000000080000000FF000000C0C0
      C000FFFFFF00FFFFFF00FF0000000000000000800000C0C0C000C0C0C0008080
      8000808080008080800080808000008000008080800000800000C0C0C0000080
      0000808080000080000000800000808080000000800080808000C0C0C0008080
      8000C0C0C0000000800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000008000800080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080808000C0C0C0008000
      00008000000080808000C0C0C000800000008000000080000000000000008080
      8000FFFFFF00FFFFFF0000000000FF0000008080800080808000C0C0C0008080
      80000080000080808000008000008080800000800000C0C0C000008000008080
      800000800000C0C0C00080808000008000008000800080808000C0C0C0008000
      800080808000C0C0C000800080008000800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080008000000080003BD4E0003BD4E0003BD4E0003BD4
      E0003BD4E0003BD4E0003BD4E0003BD4E0003BD4E00000000000000000000000
      0000000000000000000000000000000000008000000080808000808080008000
      00008000000080000000FF000000800000008000000080000000800000000000
      0000FFFFFF00FFFFFF00FF0000000000000000800000C0C0C000C0C0C0000080
      000080808000008000008080800080808000C0C0C00000800000808080000080
      000080808000FFFFFF0000800000808080000000800080808000FFFFFF008080
      80008000800080808000C0C0C000C0C0C0000000800080008000800080008080
      8000FFFFFF00FFFFFF0000008000800080003BD4E0003BD4E00000876E000050
      39003BD4E00000876E0000876E003BD4E0003BD4E00000000000000000000000
      0000000000000000000000000000000000008000000080808000C0C0C0008000
      000080000000800000008000000080000000800000008000000080000000FF00
      0000C0C0C000FFFFFF0000000000FF0000000080000080808000FFFFFF008080
      8000008000008080800080808000C0C0C0008080800080808000008000008080
      800000800000FFFFFF0080808000008000000000800080808000FFFFFF00FFFF
      FF0080808000800080008000800080808000C0C0C000C0C0C000C0C0C0000000
      800080808000FFFFFF0080008000000080003BD4E0003BD4E000000000003BD4
      E0003BD4E00000503900000000003BD4E0003BD4E00000000000000000000000
      0000000000000000000000000000000000008000000080808000808080008000
      0000FF000000C0C0C0008000000080000000FF000000C0C0C000800000008000
      000080808000FFFFFF00800000008000000000800000C0C0C000FFFFFF00FFFF
      FF008080800080808000C0C0C00080808000808080000080000080808000C0C0
      C000C0C0C000FFFFFF0000800000808080000000800080808000FFFFFF00FFFF
      FF00C0C0C000800080000000800080008000808080008080800080808000C0C0
      C00000008000FFFFFF0000008000800080003BD4E0003BD4E0003BD4E0000000
      00003BD4E0000050390000000000005039003BD4E00000000000000000000000
      0000005039000000000000000000000000008000000080808000808080008000
      000080808000C0C0C000800000008000000080000000C0C0C000800000008000
      000000000000FFFFFF0080000000800000000080000080808000FFFFFF00C0C0
      C00080808000C0C0C0008080800080808000008000008080800000800000C0C0
      C000FFFFFF00FFFFFF0080808000008000000000800080808000FFFFFF00FFFF
      FF00FFFFFF00C0C0C00080008000000080008000800000008000800080008000
      800080008000FFFFFF0080008000000080003BD4E0003BD4E0003BD4E0003BD4
      E0003BD4E0003BD4E0003BD4E0003BD4E0003BD4E00000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      000080808000C0C0C000800000008000000080000000C0C0C000800000008000
      00008000000080808000800000008000000000800000C0C0C000C0C0C0008080
      8000808080008080800080808000008000008080800000800000808080000080
      0000C0C0C000FFFFFF0000800000808080000000800080808000FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000008000800080000000800080008000000080008000
      800000008000FFFFFF0000008000800080003BD4E000ABFFFF00ABFFFF00C6F7
      ED00A5E5D600ABFFFF0072DAD00072DAD0003BD4E00000000000000000000000
      0000005039000000000000000000000000008000000080000000800000008000
      000080000000FF000000800000008000000080000000FF000000800000008000
      0000800000008000000080000000800000000080000080808000C0C0C0008080
      800080808000808080000080000080808000C0C0C00080808000008000008080
      800000800000FFFFFF0080808000008000000000800080808000FFFFFF00FFFF
      FF00FFFFFF00C0C0C00080008000000080008000800080008000808080000000
      800080008000FFFFFF0080008000000080000050390000C2D20000C2D20000C2
      D20000C2D200000000000089560000876E0000876E0000000000000000000000
      0000000000000000000000000000000000008000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00080808000C0C0C000800000008000000000800000C0C0C000C0C0C0000080
      0000808080000080000080808000C0C0C000FFFFFF00C0C0C000808080000080
      000080808000FFFFFF0000800000808080000000800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000800080000000800080008000808080008000
      8000C0C0C000FFFFFF0000008000800080000000000000000000000000000050
      3900000000000000000000000000000000000000000000000000E7F7F500C6F7
      ED00008956000050390000000000000000008000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000800000000080000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0
      C000C0C0C000FFFFFF0080808000008000000000800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF00FFFFFF0080008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000072DAD000E7F7F50072DA
      D000005039000000000000000000000000008000000080000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080008000000080000000008000008080800080808000C0C0
      C00080808000C0C0C00080808000C0C0C00080808000C0C0C00080808000C0C0
      C00080808000C0C0C00000800000808080000000800080008000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000008000800080000000000000000000000000000050
      39000050390000876E003BD4E0003BD4E0000089560000895600000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000808080000080000080808000008000000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000800080000000800080008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393009933
      3300993333009933330099333300993333009933330099333300993333009933
      3300993333009933330093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000093939300993333009933
      3300993333009933330099333300993333009933330099333300993333009933
      3300993333009933330099333300939393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000099333300993333009933
      33009933330099333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009933
      3300993333009933330099333300993333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000009393930099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C00000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000009933330099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000009933330099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000000000000000000000000000000000000000000000000000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000009933330099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000009933330099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000000000000000000000000000000000000000000000000000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000009933330099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000009933330099333300993333009933
      33009933330099333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000080808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000009933330099333300993333009933
      3300993333009933330099333300993333009933330099333300993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000808080000000000000000000000000009393930099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000C0C0C000C0C0C00000000000C0C0C0000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000C0C0
      C000808080000000000000000000000000000000000099333300993333009933
      3300993333009933330099333300FFFFFF00FFFFFF00FFFFFF00993333009933
      3300993333009933330099333300993333000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000000000000000000000000000000000000000000093939300993333009933
      3300993333009933330099333300993333009933330099333300993333009933
      3300993333009933330099333300939393000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000939393009933
      3300993333009933330099333300993333009933330099333300993333009933
      3300993333009933330093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000939393009933330099333300993333009933330099333300993333009933
      3300939393000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000FFFFFF0000000000C0C0C0000000
      0000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00000008000FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C0000000800000000000FFFFFF0000000000000000000000
      0000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0080808000808080008080
      800080808000808080000000000000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000C0C0C0000000
      0000C0C0C000808080000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000808080000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000BFBFBF0000000000FF000000FF000000FF00
      00000000FF00FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000C0C0C000000080000000000000000000FFFFFF008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000C0C0C0000000800000000000FFFFFF000000
      0000C0C0C00000000000C0C0C000808080000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000008000FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF000000
      00000000000000000000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF000000000000000000000000007F7F7F000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000FFFF
      FF00C0C0C000000000000000000000000000000000000000FF000000FF000000
      FF000000FF00C0C0C000C0C0C000C0C0C0000000FF000000FF000000FF000000
      FF000000FF00C0C0C000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000C0C0C00000000000000000000000000000000000000000000000FF000000
      FF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF00C0C0C000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000800000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      FF00FFFFFF00C0C0C000FFFFFF00FFFFFF000000FF000000FF000000FF000000
      FF00C0C0C000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000008080
      80000000FF00C0C0C000FFFFFF000000FF000000FF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000008080
      80000000FF00C0C0C000FFFFFF000000FF000000FF000000FF00C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000008080
      8000FFFFFF000000FF000000FF000000FF000000FF000000FF00C0C0C000C0C0
      C000C0C0C000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000008080
      8000FFFFFF000000FF000000FF000000FF000000FF00FFFFFF00C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF008080800000000000000000000000000000000000FFFFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF000000FF000000FF000000FF000000FF00FFFFFF00C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000000000000000008080
      8000FFFFFF00C0C0C0000000FF000000FF000000FF00C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B006B6B6B006B6B6B006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      9900CC999900CC999900CC999900CC9999006B6B6B00CC999900CC9999006B6B
      6B00FFFFFF006B6B6B0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E4006B6B6B006B6B6B006B6B6B00FFFF
      FF00FFFFFF006B6B6B0000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000000000000808080000000
      0000000000000000000000000000000000000000000066999900336666003366
      6600336666003366660033666600336666003366660033666600336666003366
      660033666600336666003333330000000000000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC006B6B6B00FFFFFF006B6B6B00FFFF
      FF006B6B6B009393930093939300939393000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      00000000000000000000000000008000000000000000FF000000800000008080
      8000000000000000000000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990000000000000000000000000000000000CC99
      9900CC999900CC999900CC999900CC9999006B6B6B00FFFFFF00FFFFFF00FFFF
      FF006B6B6B006B6B6B006B6B6B006B6B6B000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      000000000000000000008000000000000000FF000000FF000000FF0000008000
      0000808080000000000000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990000000000000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E4006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006B6B6B00000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000800000008080800000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990000000000000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006B6B6B0000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000008000000000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0066999900000000009966330099663300993333009966
      3300996633009966330099663300996633006B6B6B00FFFFFF00FFFFFF00FFFF
      FF006B6B6B000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000000
      80000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990000000000CC999900E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E4006B6B6B00FFFFFF00FFFFFF006B6B
      6B00000000000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFF000000000000FFFF000000000000FFFF000000000000FFFF
      0000000000000080800000000000000000000000000000000000000080000000
      0000808080000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990000000000CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC9999006B6B6B00FFFFFF006B6B6B000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000FFFF0000FFFFFF00FFFF000000000000FFFF000000000000FFFF00000000
      0000000000000080800000000000000000000000000000008000000000000000
      FF0000008000808080000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990000000000000000000000000000000000CC99
      9900CC999900CC999900CC999900CC9999006B6B6B006B6B6B00CC999900CC99
      9900CC9999000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFF0000FFFFFF00FFFF000000000000FFFF000000000000FFFF
      00000000000000808000000000000000000000008000000000000000FF000000
      FF000000FF000000800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099CCCC0000000000000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E4006B6B6B00E4E4E400E4E4E400E4E4
      E400CC9999000000000000000000000000000000000000000000008080000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF000000000000FFFF00000000
      000000000000008080000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000008000808080000000000000000000000000000000
      8000000080000000800000000000000000000000000099FFFF0099CCCC0099CC
      CC0099CCCC0099CCCC0099FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC9999000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF000000000000FFFF
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000080000000000000000000000000000000
      00000000FF0000008000000000000000000000000000FFFFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900CC9999000000000000000000000000000000000000000000008080000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      FF00000000000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400CC9999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC9999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC999900000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      99003366000033FFFF0000CCCC00000000000000000000000000000000000000
      00000000000000000000CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC9999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC999900000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E4003366
      000066CC330000CCCC000000000033FFFF000000000000000000000000000000
      00000000000000000000FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC9999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC999900000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC003366000066CC
      330000FF000066CC330033FFFF00009900000000000000000000000000000000
      00000000000000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC9999000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC999900000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC9999003366000066CC330000FF
      000066CC33003399000000990000000000000000000000000000000000000000
      00000000000000000000CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC9999000000000000000000000000000000
      0000000000008080800000000000000080000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC999900000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E4003366000066CC330000FF000066CC
      3300339900000099000000000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC9999000000000000000000000000000000
      0000800000000000000000000000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC999900000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00BBBBBB0066CC330000FF000066CC33003399
      0000009900000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC9999000000000000000000000000008000
      00000000000000000000000000000000800000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300996633000000000000000000000000009966330099663300996633009966
      330099663300996633009966330033FFFF0000FFFF0066CC3300339900000099
      0000000000000000000000000000000000000000000000000000000000009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300996633000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000000000000000000000000000CC99
      9900E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E40099663300000000000000000000000000CC999900E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E40000FFFF0000CCCC0033999900009900000000
      000000000000000000000000000000000000000000000000000000000000CC99
      9900E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400996633000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      990099663300000000000000000000000000CC999900CC999900CC999900CC99
      9900CC999900CC999900CC9999000000000033FFFF0000CCCC00000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900996633000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000000000000000000000CC
      FF00BBBBBB00BBBBBB00CC999900CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC999900000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900CC9999000000000000000000000000000033CC003366FF00000000000000
      0000000000003366FF000033CC00CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC9999000000000000000000000000008000
      0000000000000000000080000000000000000000000000000000000080000000
      0000000000000000000000000000000000000000000000CCFF0000FFFF0000CC
      FF0000FFFF0000CCFF00FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC999900000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400CC9999000000000000000000000000003366FF000033CC003366FF000000
      00003366FF000033CC003366FF00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC9999000000000000000000000000000000
      0000800000000000000080000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000FFFF0000CCFF0000FF
      FF0000CCFF0000FFFF00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC999900000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC999900000000000000000000000000000000003366FF000033CC003366
      FF000033CC003366FF00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC9999000000000000000000000000000000
      0000000000008000000080000000000000008080800000000000000000000000
      00000000000000000000000000000000000000CCFF0000CCFF0000FFFF00FFFF
      FF0000FFFF0000CCFF0000CCFF00CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC999900000000000000000000000000CC99
      9900CC999900CC999900CC999900CC999900CC999900CC999900CC999900CC99
      9900CC99990000000000000000000000000000000000000000003366FF000033
      CC003366FF00BBBBBB00FFCCCC00CC999900CC999900CC999900CC999900CC99
      9900CC999900CC999900CC999900CC9999000000000000000000000000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000CCFF0000FF
      FF0000CCFF0000FFFF00FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC999900000000000000000000000000FFCC
      CC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400CC999900000000000000000000000000000000003366FF000033CC003366
      FF000033CC003366FF00FFCCCC00E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400CC9999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CCFF0000FFFF0000CC
      FF0000FFFF0000CCFF00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC999900000000000000000000000000FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC9999000000000000000000000000003366FF000033CC003366FF000000
      00003366FF000033CC003366FF00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC9999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000CC
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000033CC003366FF00000000000000
      0000000000003366FF000033CC00000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200200000100010000000000001100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      000000000000F8C0000000000000F840000000000000C000000000000000C000
      000000000000C000000000000000C000000000000000C0000000000000000000
      00000000000000000000000000000000000000000000C00000000000FFFFC000
      FFFFFFFFFFFFC000FFFFFFFFFFFFC000FFFFFC00FFFFFFFFC0038000E001FFFF
      C0030000E001C003C00380008001C003C00380008001C003C00380008001C003
      C00380008001C003C00380008001C003C00380008001C003C003800F8001C003
      C003800F8001C003C007800F8001C003C00F801F8003F803C01F803FF007FC07
      C03F807FF80FFFFFFFFF80FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFC003FFFF
      00008003C003E00700008003C003E00700008003C003E00700008003C003E007
      00008003C003E00700008003C003E00700008003C003E00700008003C003E007
      00008003C003E00700008003C003E00700008003C007E00700008003C00FE00F
      00008003C01FE01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00001FFFFFFFFFF400
      0009FFFFFFFF80000001FFFFFFFFB400000780018001BFF80001800180010007
      0000800180010007000080018001000700008001800100070000800180010007
      8000800180010007C000800180010007CF90800180010007C310FFFFFFFF0007
      E019FFFFFFFF0007E03FFFFFFFFF0007FFFFFFFFFFFFFFFFFFFFFFFFE01F800F
      FFFFFFFFE01F8007E7E7FE7F001F8003E3C7FE7F00018003F18FFC3F00018003
      F81FFCBF01C18003FC3FF99F00418003FC3FF9DF00818003F81FF3DF01018003
      F18FF3EF0001C003E3C7FFEF0001E003E7E7FFF70001E7CFFFFFFFFB0001E18F
      FFFFFFFF0001F00FFFFFFFFF0001F01FFFFFFFFFFFFFF8018010F800FF80F000
      8010F800FF8000000000F800FF8040000000F000F78078000000F000F3807800
      0001F000F18078000001F000F18070000001F000F18000000013F000F1804000
      001FF000F1807800003FF000F1800000007FE000E080400000FFC07FC07F7E03
      0FFF803F803F0FFFFFFF001F001F0FFFC003FFFFFFFFFFFFC003FFFFFFFFFFFF
      C003FFFFFFFFFFFFC003E287143F143FC003F6CFB67FB67FC003F44FA27BA27F
      C003F44FA27BA27FC003F44FA260A260C003F18F8C7B8C7FC003F18F8C7B8C7F
      C003E1870C3F0C3FC003FFFFFFFFFFFFC003FFFFFFFFFFFFC007FFFFFFFFFFFF
      C00FFFFFFFFFFFFFC01FFFFFFFFFFFFFFFFFC007C01FC01FFEFF800780108016
      FC7F000700170016F83FC007C01BC010F01FC007C01DC016E00FC007C01EC016
      F83F003F00700079F83F003F007F007FF83F003F007F007FF83FC007C016C010
      F83FC007C016C017F83FC007C010C01BF83FC007C016C01DF83FC007C016C01E
      F83FC007C019C010FFFFFFFFFFFFFFFFFFFFFC00FFFFFFFFDA39FC00FFC1F83F
      C0D6FC00FF81F83FC037E0070003F83FC056E0070003F83F8009E0070003F83F
      0003FC000003F83F0001FC000003F83F0000C4000003F83F0000C0070003F83F
      000100070003E00F000300070003F01F000700000003F83F000F040007FFFC7F
      801FC4008FFFFEFFC1BFC7FFFFFFFFFFFFFFFFFFFE0FE001C000FFFFFC03E000
      C000001FFC01E000C000000FFC01E00100000007FC00E00300000003FC00E007
      00000001FBE0000F00600001F3F0001FC000001FE000003FC000001FC000E007
      C000001F8001E007C0008FF10001E007FC7FFFF98003E007FE3FFF75C01FE007
      FF7FFF8FE3FFE007FFFFFFFFF7FFFFFFFE00FC00FFFFFFFFF800FC00FFFFC000
      E000FC00FFFFC000FE00FC00FFFFC00000000000E00F000078007C00E00F0000
      7E007C00E00F0000403B4000E00F00605EFB5C00FE3FC00002FB0000FD3FC000
      7EFB7FFFFB1FC0007F777FFFFF9FC000038F03FFFF8FFFFF7FFF7FFFFFC7FFFF
      7FFF7FFFFFEFFFFF0FFF0FFFFFFFFFFFFFFFFFFFFFFFFC007F8FFFFFFFFFFC00
      BF07FFFFC003FC00DE03FFFFC0030000AE01C007C00300009601C007C0030000
      9803C007C00300008C0FC007C0030000860FC007C0030000C00FC007C0030000
      C09FC007C0030000C1DFC007C003000180EFC007C003000308FFFFFFC003003F
      FC7FFFFFFFFF007FFE3FFFFFFFFF00FF0000FFFFFFFFFFFFFFFF7FFFBFC7BFC7
      80C0BFC7DF83DF83BEC0DF83EF01EF01BAE1EF01F700F700AEE1F700FB00FB00
      BEF3FB00FC01FC0180F3FC01FE07FE07FFFFFE07FF07FF07FF87FF07FF87FF87
      EFC7FF879FCFFE4FEFC7FFCF3C2F0F2FE737FFEF7E371FB7F07FFFF77E3F1FBF
      FFFFFFFF39BF673FFFFFFFFF83FFF07FFFFFFFFFFFFF0000FFFFC83FF801FFFF
      FFFFD83FF00180C0FF01DFFFE001BEC0FE01DC83C001BAE1FC01DD838001AEE1
      E001DDFF0001BEF3E003DC83000180F3E007DD830003FFFFE007DFFF0007E1FF
      E007C83F000FE3F7FFFFD83F001FE3F7FFFFFFFF003FECE7FFFF83FF81FFFE0F
      FFFF83FF81FFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFFFFFFFFFF8FFFFFFFFFFFF
      C0F8FFFFFFFFFFFF80FEFFFFFFFFFFFF81FCFFFFFF01FFFFFFFCFFFFFE01FFFF
      FFFEF807F801F805FBFCF007F001F005F3FCF007F007F005C009F007F00FF00D
      8001FFC3FFFFFFF88013FF81FFFFFFFDE3FCFF00FFFFFFFFF7F8FFFFFFFFFFFF
      FFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1FFFFFF1FFFFFFE007FFF8
      E000FFFF8001FFF8E000FFFF000081FFE000FFFF800081FCC000FFFF8001FFFC
      8000F8070007FFFF8000F007801FFFFC8000F007803FF7FC8000F00F001FE7FF
      8000FFFF803F80138000FFFF803F80138001FFFF001FE7FF8307FFFF803FF7F8
      83C7FFFFC0FFFFF8C7FFFFFFE3FFFFFFFFFFFFFFFFFFFFFFF0008007FFE00000
      E0008007F8E00000E0008007FB080000C0000004F818000000008000FB500000
      00008001E070000000008003EF7C000000008007E37800000000800FEF700000
      0000801EE36000000000000CEF400000000080468320000003FF88EFBFE00000
      0FFF89FF8FE00000FFFFFF1BFFE0FFFFC003FFFFFE21FFFFC003FFFFC003FE11
      C003C000C003FC21C0038000C003FE23C00380008003C007C0030000C003800F
      C0030000C003C40FC003C000C003C60FC003C000C003C623C003C000C003C423
      C003C000C003C67FC003C0008003C0FFC003E001C00781FFC003FC01C00FFFFF
      E007FC01C01FFFFFFFFFFFFFFFFFFFFF00000007FC03FFFF00000003FC03FF00
      15400003E003FF0008000003E000F00012A000030000F000040000030000F000
      115000030000000002A0000300000000054000030000000002A0000300000001
      054000030000000302A000030000000F000000030000001F00000003C00000FF
      00000003C00001FF00000003C00003FFFFFFFFFFFFFFFFFFE00FC0008007FFFF
      E007C0008007FFFFE00380008007FFFFE00180008007FFFFE00180008007FFFF
      F801C0008007E1C3F801C0018007E003F801C0018007E003F801C0018007E1C3
      F803C0018007FFFFF803E001800FFFFFF803F801801FFFFFFC03FC01803FFFFF
      FE03FC01807FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFC003C0030000
      8003C003C00302008003C003C00302008003C003C00300008003C003C0030000
      8003C003C00300A08003C003C00301508003C003C00300A08003C003C0030150
      8003C003C00300A08003C003C00301508003C007C0070000FFFFC00FC00F0000
      FFFFC01FC01F0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFE007FF9FFFFFE000
      E007FF1FFFFFE000E007FF1FFF3F0000E007FF1FFE3F0000E007FE1FFE3F0000
      E007FC1FFE3F0000E007FE03FE3F0000E007F803FE3F0000E007F807F8070000
      E007FC7FF0070000E007F00FF00F0000E00FE00FFFFF0007E01FE01FFFFF0007
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE001FFFFFFFFC003E001C003F003
      C0038001C003C003C0038001C003C003C0038001C003C003C0038001C003C003
      C0038001C003C003C0038001C003C003C0038001C003C003C0038001C003C003
      C0038001C003C003C0038003C003C003C0078007C007C007C00F800FC00FC00F
      C01F801FC01FC01FFFFF803FFFFFFFFFFFFFE001FFFFE0019123C001FFFFE001
      8000C001FFFF00018000C001FFFF00018000C001FFFF00018000C001FFFF0001
      8000C001E00700018000C001E00700018000C001E00700018000C001E0070001
      8000C001E00700018620C001FFFF00038320C003FFFF0007F1FCC003FFFF000F
      F9FEFFFFFFFF003FF1FFFFFFFFFF007FFFFFFFFFFFFFFFFFFFFFC003FFFFFFFF
      E000C003FFFFFFFFC000C003FFFFFFFFC000C00301FFFFFF8000C00301FFFFFF
      8000C0030181E0070000C0030181E0070000C0030001E0070000C0030181E007
      8000C00301FFE0078000C003FFFFFFFF8001C007FFFFFFFFC07FC00FFFFFFFFF
      E0FFC01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0007FFFF0007801F
      0003FFFF0001800F0001FFFF000080070000FFFF000080030000FFFF00008001
      0000E007000080008000E007000080008001E007800080008001E0078000C000
      8001E0078000E0008001FFFF8000F0038001FFFFC000F803C001FFFFE000FC03
      E1FFFFFFF001FFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFF
      FFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFF
      E007000FE007E007E007000FE007E007E0070004E007E007E0070000E007E007
      E0070000E007E007FFFF0000FFFFFFFFFFFFF800FFFFFFFFFFFFFC00FFFFFFFF
      FFFFFE0CFFFFFFFFFFFFFFFFFFFFFFFFFEC0000000000000FE00000000000000
      E067000000000000C003000000000000FF830000000000000003000000000000
      003F0000000000000007000000000000003F0000000000000007000000000000
      003F0000000000000007000000000000007F00000000000087C3000000000000
      C003000000000000C03F000000000000FFFFC001FFFFFFFFC0038000FFFFE007
      C00380008003E007C00300008003E007C00300008003E007C00300008003E007
      C00300008003E007C00300008003E007C00300008003E007C00300008003E007
      C00300008003E007C00300008003E00FC00780008003E01FC00F80008003E03F
      C01FC0018003FFFFFFFFF007FFFFFFFFFFFFFF03FFFFFF00F01FFE03C83FFF00
      F01FFC03D83FFF00F01FF903DFFFFF00F01F0303DC830000F01F0303DD830000
      F01F0303DDFF0000F01F03FFDC830000F01F01FFDD830023F01F00C0DFFF0001
      F01F0240C83F0000F01FFF00D83F0023F01FFF80FFFF0063F01FFFC083FF00C3
      F01FFFC083FF0107F01FFFC0FFFF03FFFFFFFFFFFFFFFFFFC003E0008003F01F
      C003E0008003F01FC00380008003F01FC003C0008003F01FC003E0008023F11F
      C003E0008003F01FC003E0008003F01FC003E0008003F01FC003E0008003F01F
      C003E0008003F01FC003E0008003F01FC007E0008803F11FC00FE0018003F01F
      C01FE0038003F01FFFFFE0078003F01FFFFFFFE1FFFFFFFFFFFFE001C001FF9F
      FFFFE0038031FF4F8001E0008031FE878001E0008031FD038001E0018001FE01
      8001E0038001FF03800100078001E7838001000F82A1D3C78001001F8151A1EF
      8001E00780A140FF8001E0078051806381FFE0078021C0F383FFE0078015E0EB
      FFFFE0078001F1DFFFFFE007FFFFFBFFFFFFFC00E001FC00FFFFFC00E002FC00
      FFFFFC00E000FC00FE1FFC00E001FC00FA7FFC00E003FC00F6BFFC00E007FC00
      EEDFE007000FE007DFEFE007001FE007DFEFE007013FE007DFEFE000E0073800
      EDDF8000E0071000F5BF8000E0078000F97F0000E007C000E1FF8000E0078000
      FFFF8000E0071000FFFFEFFFFFFF39FF00000000000000000000000000000000
      000000000000}
  end
  object SubSystemConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SubSystemsData'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 152
    Top = 296
  end
  object ActionList1: TActionList
    Images = ImageListSubSustems
    Left = 460
    Top = 220
    object actNoteNew: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077
      Caption = 'actNoteNew'
      ImageIndex = 1
      OnExecute = actNoteNewExecute
    end
    object CategoryNew: TAction
      Category = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Caption = 'CategoryRefresh'
      ImageIndex = 1
      OnExecute = CategoryNewExecute
    end
    object CategoryEdit: TAction
      Category = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Caption = 'CategoryRefresh'
      ImageIndex = 2
      OnExecute = CategoryEditExecute
    end
    object CategoryDelete: TAction
      Category = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Caption = 'CategoryRefresh'
      ImageIndex = 3
      OnExecute = CategoryDeleteExecute
    end
    object StatusesRefresh: TAction
      Category = #1057#1090#1072#1090#1091#1089#1099
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = StatusesRefreshExecute
    end
    object ReliseRefresh: TAction
      Category = #1056#1077#1083#1080#1079#1099
      Caption = 'ReliseRefresh'
      ImageIndex = 0
      OnExecute = ReliseRefreshExecute
    end
    object MetRefreshSubSystemsList: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      ImageIndex = 0
      OnExecute = MetRefreshSubSystemsListExecute
    end
    object MetFillMetadataTree: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' '
      ImageIndex = 13
      OnExecute = MetFillMetadataTreeExecute
    end
    object MetShowSubSystemsObj: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 7
      OnExecute = MetShowSubSystemsObjExecute
    end
    object MetSaveTreeInFile: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1074' '#1092#1072#1081#1083
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1074' '#1092#1072#1081#1083
      ImageIndex = 15
      OnExecute = MetSaveTreeInFileExecute
    end
    object MetDelErrors: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1096#1080#1073#1082#1080
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1096#1080#1073#1082#1080
      ImageIndex = 71
      OnExecute = MetDelErrorsExecute
    end
    object MetChoiceAllSubSystems: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 11
      OnExecute = MetChoiceAllSubSystemsExecute
    end
    object MetUnChoiceAllSubSystems: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 12
      OnExecute = MetUnChoiceAllSubSystemsExecute
    end
    object MetInvertSubSystems: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      Hint = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      ImageIndex = 10
      OnExecute = MetInvertSubSystemsExecute
    end
    object MetChoiceAllObj: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      ImageIndex = 11
      OnExecute = MetChoiceAllObjExecute
    end
    object MetUnChoiceAllObj: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      ImageIndex = 12
      OnExecute = MetUnChoiceAllObjExecute
    end
    object MetInvertObj: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
      Hint = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
      ImageIndex = 10
      OnExecute = MetInvertObjExecute
    end
    object CfgRefreshSubSystemsList: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      ImageIndex = 0
      OnExecute = CfgRefreshSubSystemsListExecute
    end
    object CfgNewSubSystem: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      Caption = #1053#1086#1074#1072#1103' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1072
      Hint = #1053#1086#1074#1072#1103' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1072
      ImageIndex = 1
      OnExecute = CfgNewSubSystemExecute
    end
    object CfgEditSubSystem: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1091
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1091
      ImageIndex = 2
      OnExecute = CfgEditSubSystemExecute
    end
    object CfgDelSubSystem: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1076#1089#1080#1089#1090#1077#1084
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1091
      ImageIndex = 3
      OnExecute = CfgDelSubSystemExecute
    end
    object CfgMetRefreshList: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1084#1077#1090#1072#1076#1072#1085#1085#1099#1093
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 0
      OnExecute = CfgMetRefreshListExecute
    end
    object CfgMetShowSubSystems: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1084#1077#1090#1072#1076#1072#1085#1085#1099#1093
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 7
      OnExecute = CfgMetShowSubSystemsExecute
    end
    object CfgMetSaveSubSystems: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1084#1077#1090#1072#1076#1072#1085#1085#1099#1093
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 6
      OnExecute = CfgMetSaveSubSystemsExecute
    end
    object ExtFrmRefresh: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1086#1088#1084
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 0
      OnExecute = ExtFrmRefreshExecute
    end
    object ExtFrmNewFolder: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1086#1088#1084
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1087#1082#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1087#1082#1091
      ImageIndex = 4
      OnExecute = ExtFrmNewFolderExecute
    end
    object ExtFrmNewFile: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1086#1088#1084
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 1
      OnExecute = ExtFrmNewFileExecute
    end
    object ExtFrmEdit: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1086#1088#1084
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 2
      OnExecute = ExtFrmEditExecute
    end
    object ExtFrmDel: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1086#1088#1084
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = ExtFrmDelExecute
    end
    object ExtFrmShowSubSystems: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1086#1088#1084
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 7
      OnExecute = ExtFrmShowSubSystemsExecute
    end
    object ExtFrmSaveSubSystems: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1092#1086#1088#1084
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 6
      OnExecute = ExtFrmSaveSubSystemsExecute
    end
    object CfgRefreshList: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      ImageIndex = 0
      OnExecute = CfgRefreshListExecute
    end
    object CfgAdd: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102
      ImageIndex = 1
      OnExecute = CfgAddExecute
    end
    object CfgEdit: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 2
      OnExecute = CfgEditExecute
    end
    object CfgDel: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = CfgDelExecute
    end
    object CfgChoice: TAction
      Category = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 5
      OnExecute = CfgChoiceExecute
    end
    object ChoiceTreeItem: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102' '#1074' '#1076#1077#1088#1077#1074#1077
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102' '#1074' '#1076#1077#1088#1077#1074#1077
      ImageIndex = 5
      OnExecute = ChoiceTreeItemExecute
    end
    object ToDoRefresh: TAction
      Category = #1047#1072#1076#1072#1095#1080
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 0
      OnExecute = ToDoRefreshExecute
    end
    object ToDoAdd: TAction
      Category = #1047#1072#1076#1072#1095#1080
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = ToDoAddExecute
    end
    object ToDoEdit: TAction
      Category = #1047#1072#1076#1072#1095#1080
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 2
      OnExecute = ToDoEditExecute
    end
    object ToDoDelete: TAction
      Category = #1047#1072#1076#1072#1095#1080
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = ToDoDeleteExecute
    end
    object LinksRefresh: TAction
      Category = #1057#1089#1099#1083#1082#1080
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 0
      OnExecute = LinksRefreshExecute
    end
    object LinksToText: TAction
      Category = #1057#1089#1099#1083#1082#1080
      Caption = #1042' '#1090#1077#1082#1089#1090
      ImageIndex = 16
      OnExecute = LinksToTextExecute
    end
    object TemplatesRefresh: TAction
      Category = #1064#1072#1073#1083#1086#1085#1099
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = TemplatesRefreshExecute
    end
    object TemplatesAdd: TAction
      Category = #1064#1072#1073#1083#1086#1085#1099
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = TemplatesAddExecute
    end
    object TemplatesEdit: TAction
      Category = #1064#1072#1073#1083#1086#1085#1099
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 2
      OnExecute = TemplatesEditExecute
    end
    object TemplatesDelete: TAction
      Category = #1064#1072#1073#1083#1086#1085#1099
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = TemplatesDeleteExecute
    end
    object TemplatesChangeParent: TAction
      Category = #1064#1072#1073#1083#1086#1085#1099
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 77
      OnExecute = TemplatesChangeParentExecute
    end
    object TempaltesNewFolder: TAction
      Category = #1064#1072#1073#1083#1086#1085#1099
      Caption = #1053#1086#1074#1072#1103' '#1075#1088#1091#1087#1087#1072
      ImageIndex = 4
      OnExecute = TempaltesNewFolderExecute
    end
    object MetDelCurrentError: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1086#1096#1080#1073#1086#1095#1085#1091#1102' '#1089#1089#1099#1083#1082#1091
      ImageIndex = 3
      OnExecute = MetDelCurrentErrorExecute
    end
    object ShowOptionsWnd: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = #1054#1087#1094#1080#1080
      ImageIndex = 25
      OnExecute = ShowOptionsWndExecute
    end
    object NewObj: TAction
      Category = #1050#1086#1084#1072#1085#1076#1099' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1090#1086#1088#1072
      Caption = #1053#1086#1074#1099#1081' '#1086#1073#1098#1077#1082#1090
      ImageIndex = 1
      OnExecute = NewObjExecute
    end
    object DeleteObj: TAction
      Category = #1050#1086#1084#1072#1085#1076#1099' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1090#1086#1088#1072
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
      ImageIndex = 3
      OnExecute = DeleteObjExecute
    end
    object ShowBookmarks: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = #1042#1099#1079#1086#1074' '#1079#1072#1082#1083#1072#1076#1086#1082
      ImageIndex = 78
      OnExecute = ShowBookmarksExecute
    end
    object SetOptionsByName: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = 'SetOptionsByName'
      ImageIndex = 79
      OnExecute = SetOptionsByNameExecute
    end
    object SaveOptionsByName: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      ImageIndex = 80
      OnExecute = SaveOptionsByNameExecute
    end
    object BookmarkNew: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = 'BookmarkNew'
      ImageIndex = 81
      OnExecute = BookmarkNewExecute
    end
    object BookmarkDelete: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = 'BookmarkDelete'
      ImageIndex = 84
      OnExecute = BookmarkDeleteExecute
    end
    object BookmarkNext: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = 'BookmarkNext'
      ImageIndex = 82
      OnExecute = BookmarkNextExecute
    end
    object BookmarkPrevios: TAction
      Category = #1044#1077#1081#1089#1090#1074#1080#1103
      Caption = 'BookmarkPrevios'
      ImageIndex = 83
      OnExecute = BookmarkPreviosExecute
    end
    object TemplatesSetBuffer: TAction
      Category = #1064#1072#1073#1083#1086#1085#1099
      Caption = 'TemplatesSetBuffer'
      ImageIndex = 87
      OnExecute = TemplatesSetBufferExecute
    end
    object NoteOpenCard: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077
      Caption = 'NoteOpenCard'
      ImageIndex = 60
      OnExecute = NoteOpenCardExecute
    end
    object NoteDelete: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077
      Caption = 'NoteDelete'
      ImageIndex = 3
      OnExecute = NoteDeleteExecute
    end
    object NoteSaveFile: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077
      Caption = 'NoteSaveFile'
      ImageIndex = 15
      OnExecute = NoteSaveFileExecute
    end
    object NoteLoadFromFile: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077
      Caption = 'NoteLoadFromFile'
      ImageIndex = 88
      OnExecute = NoteLoadFromFileExecute
    end
    object NoteRefreshCurrent: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077
      Caption = 'NoteRefreshCurrent'
      ImageIndex = 0
      OnExecute = NoteRefreshCurrentExecute
    end
    object NoteListRefresh: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1087#1080#1089#1086#1082
      Caption = 'NoteListRefresh'
      ImageIndex = 0
      OnExecute = NoteListRefreshExecute
    end
    object NoteListOpen: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1087#1080#1089#1086#1082
      Caption = 'NoteListOpen'
      ImageIndex = 60
      OnExecute = NoteListOpenExecute
    end
    object NoteListDelete: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1087#1080#1089#1086#1082
      Caption = 'NoteListDelete'
      ImageIndex = 3
      OnExecute = NoteListDeleteExecute
    end
    object NoteListSaveToFile: TAction
      Category = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1087#1080#1089#1086#1082
      Caption = 'NoteListSaveToFile'
      ImageIndex = 15
      OnExecute = NoteListSaveToFileExecute
    end
    object ReliseAdd: TAction
      Category = #1056#1077#1083#1080#1079#1099
      Caption = 'ReliseAdd'
      ImageIndex = 1
      OnExecute = ReliseAddExecute
    end
    object ReliseEdit: TAction
      Category = #1056#1077#1083#1080#1079#1099
      Caption = 'ReliseEdit'
      ImageIndex = 2
      OnExecute = ReliseEditExecute
    end
    object ReliseDelete: TAction
      Category = #1056#1077#1083#1080#1079#1099
      Caption = 'ReliseDelete'
      ImageIndex = 3
      OnExecute = ReliseDeleteExecute
    end
    object StatusesAdd: TAction
      Category = #1057#1090#1072#1090#1091#1089#1099
      Caption = #1053#1086#1074#1099#1081
      ImageIndex = 1
      OnExecute = StatusesAddExecute
    end
    object StatusesEdit: TAction
      Category = #1057#1090#1072#1090#1091#1089#1099
      Caption = 'StatusesEdit'
      ImageIndex = 2
      OnExecute = StatusesEditExecute
    end
    object StatusesDelete: TAction
      Category = #1057#1090#1072#1090#1091#1089#1099
      Caption = 'StatusesDelete'
      ImageIndex = 3
      OnExecute = StatusesDeleteExecute
    end
    object SubConfAdd: TAction
      Category = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = 'SubConfAdd'
      ImageIndex = 1
      OnExecute = SubConfAddExecute
    end
    object SubConfEdit: TAction
      Category = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = 'SubConfEdit'
      ImageIndex = 2
      OnExecute = SubConfEditExecute
    end
    object SubConfDelete: TAction
      Category = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = 'SubConfDelete'
      ImageIndex = 3
      OnExecute = SubConfDeleteExecute
    end
    object SubConfRefresh: TAction
      Category = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = 'SubConfRefresh'
      ImageIndex = 0
      OnExecute = SubConfRefreshExecute
    end
    object SubConfChoice: TAction
      Category = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
      Caption = 'SubConfChoice'
      ImageIndex = 5
      OnExecute = SubConfChoiceExecute
    end
    object UsersRefresh: TAction
      Category = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Caption = 'UsersRefresh'
      ImageIndex = 0
      OnExecute = UsersRefreshExecute
    end
    object UsersNew: TAction
      Category = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Caption = 'UsersNew'
      ImageIndex = 1
      OnExecute = UsersNewExecute
    end
    object UsersEdit: TAction
      Category = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Caption = 'UsersEdit'
      ImageIndex = 2
      OnExecute = UsersEditExecute
    end
    object UsersDelete: TAction
      Category = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Caption = 'UsersDelete'
      ImageIndex = 3
      OnExecute = UsersDeleteExecute
    end
    object CategoryRefresh: TAction
      Category = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Caption = 'CategoryRefresh'
      ImageIndex = 0
      OnExecute = CategoryRefreshExecute
    end
    object SeriousnesRefresh: TAction
      Category = #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100
      Caption = 'SeriousnesRefresh'
      ImageIndex = 0
      OnExecute = SeriousnesRefreshExecute
    end
    object SeriousnesNew: TAction
      Category = #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100
      Caption = 'SeriousnesNew'
      ImageIndex = 1
      OnExecute = SeriousnesNewExecute
    end
    object SeriousnesEdit: TAction
      Category = #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100
      Caption = 'SeriousnesEdit'
      ImageIndex = 2
      OnExecute = SeriousnesEditExecute
    end
    object SeriousnesDelete: TAction
      Category = #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100
      Caption = 'SeriousnesDelete'
      ImageIndex = 3
      OnExecute = SeriousnesDeleteExecute
    end
    object ToDoListColRefresh: TAction
      Category = #1050#1086#1083#1086#1085#1082#1080#1047#1072#1076#1072#1095
      ImageIndex = 0
      OnExecute = ToDoListColRefreshExecute
    end
    object ToDoListColNew: TAction
      Category = #1050#1086#1083#1086#1085#1082#1080#1047#1072#1076#1072#1095
      Caption = 'ToDoListColNew'
      ImageIndex = 1
      OnExecute = ToDoListColNewExecute
    end
    object ToDoListColEdit: TAction
      Category = #1050#1086#1083#1086#1085#1082#1080#1047#1072#1076#1072#1095
      Caption = 'ToDoListColEdit'
      ImageIndex = 2
      OnExecute = ToDoListColEditExecute
    end
    object ToDoListColDelete: TAction
      Category = #1050#1086#1083#1086#1085#1082#1080#1047#1072#1076#1072#1095
      Caption = 'ToDoListColDelete'
      ImageIndex = 3
      OnExecute = ToDoListColDeleteExecute
    end
    object actToDoObjRefresh: TAction
      Category = #1047#1072#1076#1072#1095#1080#1054#1073#1098#1077#1082#1090#1072
      Caption = 'actToDoObjRefresh'
      ImageIndex = 0
      OnExecute = actToDoObjRefreshExecute
    end
    object actToDoObjEdit: TAction
      Category = #1047#1072#1076#1072#1095#1080#1054#1073#1098#1077#1082#1090#1072
      Caption = 'actToDoObjEdit'
      ImageIndex = 2
      OnExecute = actToDoObjEditExecute
    end
    object actToDoObjDelete: TAction
      Category = #1047#1072#1076#1072#1095#1080#1054#1073#1098#1077#1082#1090#1072
      Caption = 'actToDoObjDelete'
      ImageIndex = 3
      OnExecute = actToDoObjDeleteExecute
    end
    object actMDBlocksRefresh: TAction
      Category = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1080' '#1052#1044
      Caption = 'actMDBlocksRefresh'
      ImageIndex = 0
      OnExecute = actMDBlocksRefreshExecute
    end
    object actMDBlocsEdit: TAction
      Category = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1080' '#1052#1044
      Caption = 'actMDBlocsEdit'
      ImageIndex = 2
      OnExecute = actMDBlocsEditExecute
    end
    object actMDBlocksDelete: TAction
      Category = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1080' '#1052#1044
      Caption = 'actMDBlocks'
      ImageIndex = 3
      OnExecute = actMDBlocksDeleteExecute
    end
    object actDBCnahgeGetByMDObj: TAction
      Category = 'ChangeLog'
      Caption = 'actDBCnahgeGetByMDObj'
      ImageIndex = 0
      OnExecute = actDBCnahgeGetByMDObjExecute
    end
    object actDBChangeAdd: TAction
      Category = 'ChangeLog'
      Caption = 'actDBChangeAdd'
      ImageIndex = 1
      OnExecute = actDBChangeAddExecute
    end
    object actDBChangeEdit: TAction
      Category = 'ChangeLog'
      Caption = 'actDBChangeEdit'
      ImageIndex = 2
      OnExecute = actDBChangeEditExecute
    end
    object actDBChangeDelete: TAction
      Category = 'ChangeLog'
      Caption = 'actDBChangeDelete'
      ImageIndex = 3
      OnExecute = actDBChangeDeleteExecute
    end
    object ToDoCopy: TAction
      Category = #1047#1072#1076#1072#1095#1080
      Caption = 'ToDoCopy'
      ImageIndex = 97
      OnExecute = ToDoCopyExecute
    end
    object ToDoCreateChild: TAction
      Category = #1047#1072#1076#1072#1095#1080
      Caption = 'ToDoCreateChild'
      ImageIndex = 87
      OnExecute = ToDoCreateChildExecute
    end
    object actMetExpandType: TAction
      Category = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Caption = 'actMetExpandType'
      ImageIndex = 131
      OnExecute = actMetExpandTypeExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 492
    Top = 268
  end
  object OpenDialog1: TOpenDialog
    Left = 408
    Top = 312
  end
  object SaveDialog1: TSaveDialog
    Left = 440
    Top = 272
  end
  object ImageListToDoList: TImageList
    Left = 256
    Top = 239
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      930093939300939393009393930093939300000000000000000000000000C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300E4E4
      E400E4E4E40093939300E4E4E400E4E4E400E4E4E400E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E40093939300000000000000000000000000C9C9
      C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300C9C9
      C900C9C9C90093939300C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C90093939300C9C9C900C9C9C900C9C9C900C9C9
      C900FFFFFF00FFFFCC00CCCC9900FFFFCC00CCCC9900FFFFFF00C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC99000099663300996633009966
      33009966330099663300996633009966330099663300E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E40093939300C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00996666009393
      9300939393009393930093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCC6600CC990000CC990000CC99
      0000CC990000CC990000CC990000CC99000099663300C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C90093939300C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00CCCC9900CCCC9900FFFFCC00CCCC9900E4E4E400C9C9C900FFFF
      FF00FFFFFF00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCC6600CC99000099663300CC99
      000099663300CC99000099663300CC99000099663300E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E40093939300C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF00000000000000000000000000C9C9C900FFFF
      FF00FFFFFF00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCC6600CCCC6600CCCC6600CCCC
      6600CCCC6600CCCC6600CCCC6600CCCC6600CC99000000000000000000009393
      9300C9C9C900C9C9C900C9C9C90093939300C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFCC00CCCC9900E4E4E400FFFFFF0000000000FFFFFF00FFFF
      FF0000CCCC00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300E4E4
      E400E4E4E40093939300E4E4E400E4E4E400E4E4E400E4E4E400FFCC66009393
      9300FFFFFF00CC99CC00E4E4E40093939300C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF00E4E4E40000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      930093939300939393009393930093939300C9C9C900FFFFFF00FFFFFF00C9C9
      C900FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000CCCC00FFFF
      FF0000CCCC00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300C9C9
      C900C9C9C90093939300C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9009393
      9300C9C9C900C9C9C900C9C9C90093939300C9C9C900FFFFFF00FFFFFF00C9C9
      C900C9C9C900C9C9C900C9C9C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      930093939300939393009393930093939300C9C9C900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C9C9C900FFFFFF00FFFFFF0000CCCC00FFFFFF0000CCCC00FFFF
      FF0000CCCC00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FFFFFF00FFFFFF00FFFF
      FF00C9C9C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000939393006B6B6B00663333006633
      33006633330099333300993333009966330099663300CC663300CC663300CC99
      0000CC990000CCCC330093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093939300663366006699FF006666
      9900663333006633330099333300993333009966330099663300CC663300CC66
      3300CC990000CC99000093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009393930093939300939393009393
      9300939393009393930093939300939393009393930093939300939393009393
      9300939393009393930093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000868686008686860086868600868686008686860086868600868686008686
      8600868686009933330099333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099333300FFFFFF0086868600993333000000000000000000000000000000
      00000000000000000000CC993300CC993300CC663300CC663300996633009966
      3300996633000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009966330099663300996633009966330099663300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099333300FFFFFF008686860000000000000000000000000000000000CCCC
      CC00CCCCCC00CCCCCC00CCCC6600CC993300CC993300CC663300CC6633009966
      3300996633000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393000000
      0000000000009966330099663300996633009966330099663300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099333300FFFFFF008686860099333300000000000000000000000000CCCC
      CC000000000000000000CCCC6600CCCC6600CC993300CC993300CC663300CC66
      3300996633000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00993333009933330000000000000000000000000000000000CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC9900009966330099663300996633009966330099663300996633009966
      3300996633000000000000000000000000000000000000000000939393000000
      00000000000000000000939393009393930093939300CC663300CC663300CC66
      3300CC663300CC66330000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF0099333300993333009933
      3300FFFFFF00FFFFFF008686860000000000000000000000000000000000CCCC
      CC000000000000000000CC993300CC993300CC663300CC663300996633009966
      3300996633000000000000000000000000000000000000000000000000000000
      0000CCCC6600CC990000CC990000CC990000CC990000CC990000CC990000CC99
      0000996633000000000000000000000000000000000000000000939393000000
      00000000000000000000939393000000000000000000CC663300CC663300CC66
      3300CC663300CC66330000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF0099333300FFFFFF00FFFF
      FF0099333300FFFFFF008686860000000000000000000000000000000000CCCC
      CC00CCCCCC00CCCCCC00CCCC6600CC993300CC993300CC663300CC6633009966
      3300996633000000000000000000000000000000000000000000000000000000
      0000CCCC6600CC99000099663300CC99000099663300CC99000099663300CC99
      0000996633000000000000000000000000000000000000000000939393000000
      0000000000000000000093939300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF0099333300993333009933
      3300FFFFFF00FFFFFF008686860000000000000000000000000000000000CCCC
      CC000000000000000000CCCC6600CCCC6600CC993300CC993300CC663300CC66
      3300996633000000000000000000000000000000000000000000000000000000
      0000CCCC6600CCCC6600CCCC6600CCCC6600CCCC6600CCCC6600CCCC6600CCCC
      6600CC9900000000000000000000000000000000000000000000939393000000
      00000000000000000000939393009393930093939300CC663300CC663300CC66
      3300CC663300CC66330000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF0099333300FFFFFF00FFFF
      FF0099333300FFFFFF008686860000000000000000000000000000000000CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393000000
      00000000000000000000939393000000000000000000CC663300CC663300CC66
      3300CC663300CC66330000000000000000000000000000000000000000000000
      000086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF0099333300993333009933
      3300FFFFFF00FFFFFF008686860000000000000000000000000000000000CCCC
      CC000000000000000000CC993300CC993300CC663300CC663300996633009966
      3300996633000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393000000
      0000000000000000000093939300000000000000000000000000000000000000
      0000000000000000000000000000000000009999990099999900999999009999
      990099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008686860000000000000000000000000000000000CCCC
      CC00CCCCCC00CCCCCC00CCCC6600CC993300CC993300CC663300CC6633009966
      3300996633000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393009393
      9300939393009966330099663300996633009966330099663300000000000000
      0000000000000000000000000000000000009999990000000000000000000000
      000099999900FFFFFF0099333300FFFFFF00FFFFFF0099333300FFFFFF00CCCC
      CC00CCCCCC00CCCCCC008686860000000000000000000000000000000000CCCC
      CC000000000000000000CCCC6600CCCC6600CC993300CC993300CC663300CC66
      3300996633000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393000000
      0000000000009966330099663300996633009966330099663300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0099333300FFFFFF00FFFFFF0099333300FFFFFF00FFFF
      FF00FFFFFF00868686000000000000000000000000000000000000000000CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009999990000000000000000000000
      000099999900FFFFFF0099333300993333009933330099333300FFFFFF00FFFF
      FF0086868600000000000000000000000000000000000000000000000000CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099000000990000009900
      0000990000009900000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009999990099999900999999009999
      990099999900FFFFFF0099333300FFFFFF00FFFFFF0099333300FFFFFF008686
      860000000000000000000000000000000000000000000000000000000000CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099000000990000009900
      0000990000009900000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008686860086868600993333009933330086868600868686000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000C000E01F00000000
      C000E01F00000000C000001F0000000000000001000000000000000100000000
      000001C1000000000060004100000000C000008100000000C000010100000000
      C000000100000000C000000100000000FFFF000100000000FFFF000100000000
      FFFF000100000000FFFF000100000000FFFFF001FFFFFFFFFFFFF000FC07FFFF
      C03FC001E007FFFFD83FD000EC07FFFFDFFFD001EFFFF007DC03D001EC07F007
      DD83D001E007F007DDFFD001EC07F007DC03D001EFFFFFFFDD83D001EC07FFFF
      DDFF0001E007FFFFC03F7001EC07FFFFD83F0003EFFFFFFFDFFF7007EFFFFFFF
      83FF000FEFFFFFFF83FFF81FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageListButtonsManagment: TImageList
    Left = 212
    Top = 140
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFDFFFFFFFFF0000FF8FFE7FF39F0000
      F81FFE7FF93F0000F73FF81FFC7F0000EFBFF81FFC7F0000EFBFFE7FF93F0000
      EFBFFE7FF39F0000F77FFFFFFFFF0000F8FFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object ilBlocks: TImageList
    Left = 116
    Top = 108
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      FF000000FF000000FF00000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF00000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000FF000000FF000000FF000000FF0000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF00000000000000000000000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF00000000000000000000000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      00000000FF00000000000000000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      00000000FF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF0000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF0000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFF7FFFF000000008023803F00000000
      0017001F00000000001F001F000000000017001F000000000017001F00000000
      0017001F000000008037803F00000000EEE3EEFF00000000EEE3EEFF00000000
      F1F7F1FF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object qryTmp: TADOQuery
    Parameters = <>
    Left = 284
    Top = 108
  end
  object ImageList1: TImageList
    Left = 392
    Top = 185
    Bitmap = {
      494C01012F003100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000008080
      0000808000008080000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000008080
      0000808000008080000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000008080
      0000808000008080000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      00000000000000000000FFFF0000FFFF000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF0000FFFF
      00000000000000000000FFFF0000FFFF000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF0000FFFF
      00000000000000000000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00FFFF000000000000FFFF00008080000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000808000008080000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C0C0C000FFFF
      FF00000000000000000000000000808000008080000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C0C0C000FFFF
      FF00000000000000000000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C00000000000FFFFFF0000000000C0C0
      C000FFFFFF000000000080800000808000008080000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0C000FFFFFF00C0C0
      C000000000008080000080800000808000008080000080800000000000000000
      FF0000000000C0C0C000C0C0C000C0C0C00000000000C0C0C000FFFFFF00C0C0
      C000000000008080000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C000000000000000000000000000FFFF
      FF00000000008080000080800000808000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C00000000000FFFFFF00000000000000
      0000000000000000000080800000808000008080000080800000000000000000
      FF0000000000FF000000FF000000C0C0C00000000000FFFFFF00000000000000
      0000000000000000000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C000000000000000000000000000C0C0
      C000000000000000000080800000808000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C00000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C00000000000808000008080000080800000000000000000
      FF0000000000FF000000FF000000C0C0C00000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C00000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C0000000000000000000C0C0C000FFFF
      FF00C0C0C000FFFFFF0000000000808000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C00000000000FFFFFF00C0C0C000FFFF
      FF00C0C0C0000000000000000000808000008080000080800000000000000000
      FF0000000000FF000000FF000000C0C0C00000000000FFFFFF00C0C0C000FFFF
      FF00C0C0C0000000000000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFFFF0000000000C0C0
      C000FFFFFF00C0C0C00000000000808000008080000000000000C0C0C000FF00
      0000FF000000FF000000FF000000C0C0C00000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C00000000000808000008080000080800000000000000000
      FF0000000000FF000000FF000000C0C0C00000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C00000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080800000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C00000000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000008080000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000008080000080800000000000000000
      FF0000000000C0C0C000C0C0C000C0C0C00000000000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000808000000000000000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FF00000000000000808000008080000080800000000000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF00C0C0
      C000FF000000C0C0C00000000000808000008080000080800000000000000000
      FF0000000000000000000000000000000000FFFFFF0000000000FFFFFF00C0C0
      C000FF000000C0C0C00000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000808000000000000000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00808080000000000000000000FFFF
      FF00C0C0C000FFFFFF0000000000808000008080000080800000808000008080
      00000000000000000000000000000000000000000000FFFFFF00C0C0C000FFFF
      FF00000000000000000080800000808000008080000080800000000000000000
      FF000000000080800000808000000000000000000000FFFFFF00C0C0C000FFFF
      FF00000000000000000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000808000000000000000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000808000008080000080800000808000008080
      00000000000000000000000000000000000080808000C0C0C000FFFFFF00C0C0
      C000FFFFFF000000000080800000808000000000000000000000000000000000
      FF000000000000000000000000008080000080808000C0C0C000FFFFFF00C0C0
      C000FFFFFF000000000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080800000808000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000808000008080000080800000808000008080
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF000000000080800000808000008080000080800000000000000000FF000000
      FF000000FF00000000008080000000000000000000000000000080808000FFFF
      FF00000000008080000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080800000808000008080
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000080800000808000008080000080800000808000008080
      0000808000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000808000008080000080800000000000000000
      FF00000000008080000000000000000000000000000000000000000000000000
      0000000000000000000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080800000808000008080
      0000808000000000000000000000000000000000000000000000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008080000000000000000000000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000000000
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000008080000080800000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008000
      000080000000800000008000000080808000000000000000FF00000080000000
      8000C0C0C0000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00008000000080808000800000008000000080808000808080000000FF000000
      8000C0C0C0000000800000008000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00008000000080808000000000008000000080000000808080000000FF000000
      800080808000000080000000800000000000000000000000000000000000C0C0
      C000C0C0C00000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000008080
      8000000000008080800000000000808080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00008000000080808000000000008000000080000000808080000000FF000000
      80000000800000008000C0C0C000000000000000000000000000000000000000
      0000C0C0C00000000000C0C0C000C0C0C0000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00008000000080808000000000008000000080000000808080000000FF000000
      8000C0C0C0000000800000008000000080000000000000000000000000000000
      0000C0C0C00000000000C0C0C000C0C0C0000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000008080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00008000000080808000000000008000000080000000000000000000FF000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00000000000C0C0C000C0C0C0000000000000000000000000000000
      000000FFFF0000FFFF0000808000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00008000000080808000800000008000000000000000000000000000FF000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00000000000C0C0C000C0C0C000000000000000000000FFFF0000FF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000C0C0
      C000C0C0C00080808000C0C0C00000808000C0C0C00000808000C0C0C0000080
      8000C0C0C0000000000000000000000000000000000000000000FF0000008000
      000080000000800000008000000000000000000000000000FF00000080000000
      800000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00000000000FFFFFF00C0C0C000000000000000000000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000080800000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0008080800000808000C0C0C00000808000C0C0C00000808000C0C0
      C000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0000000000080808000808080008080800000FFFF0000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000080800000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080808000C0C0C00000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0008080
      80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000080800000FFFF000080800000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000808000C0C0C00000808000C0C0C00000808000C0C0
      C000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000808080000000
      000000FFFF0000FFFF0000000000000000008080800000FFFF00008080000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF000080800000FFFF000080800000FFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C00000808000C0C0C00000808000C0C0C0000080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000808080000000
      000000FFFF0000FFFF0000FFFF00000000000000000000FFFF00008080000000
      0000000000000000000000000000000000000000000000000000008080000080
      800000FFFF000080800000FFFF000080800000FFFF000080800000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      000000FFFF000000000000000000808080000000000000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000080800000FFFF0000000000000000000080800000FFFF000080800000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      00008080800000000000808080000000000000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF0000FFFF0080000000FFFFFF00000000000080800000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000080800000FFFF000080800000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000008080
      8000000000008080800000000000808080000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000808000808080000080800080808000008080008080
      80000080800000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000080808000808080008080800080808000808080008080
      80008080800000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000080808000808080008080800080808000808080008080
      800000000000000000000000000000000000000000008080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000000000C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C0008080800000000000000000000000000000000000000000000000000000FF
      FF0000000000FFFF0000C0C0C000FFFF0000C0C0C000FFFF0000C0C0C000FFFF
      00008080800000000000000000000000000000000000000000000000000000FF
      FF0000000000C0C0C000FFFF0000C0C0C000FFFF0000C0C0C000FFFF00008080
      800000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0008000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF000080800000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000FFFF0000C0C0C000FFFF0000C0C0C000FFFF0000C0C0
      C0008080800000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000C0C0C000FFFF0000C0C0C000FFFF0000C0C0C0008080
      800000000000000000000000000000000000000000008080800000000000C0C0
      C000C0C0C0008000000080000000800000008000000080000000800000008000
      00008000000000000000000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0008080800000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080
      80008080800000000000000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFF0000C0C0C000FFFF0000C0C0C000FFFF00008080
      800000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080000000FF000000FF000000FF000000FF000000FF000000FF00
      00008000000000000000000000000000000000000000000000000080800000FF
      FF0000FFFF0000000000C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF000080800000000000000000000000000000000000000000000080800000FF
      FF0000FFFF0000000000FFFF0000C0C0C000FFFF0000C0C0C000FFFF0000C0C0
      C0008080800000000000000000000000000000000000000000000080800000FF
      FF0000FFFF0000000000FFFFFF00FFFF0000C0C0C000FFFF0000C0C0C0008080
      800000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080000000C0C0C000FF000000FF000000FF000000FF000000FF00
      0000800000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFF0000C0C0C000FFFF0000C0C0C000FFFF
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFF0000C0C0C000FFFF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000080000000FF000000FF000000FF000000FF000000FF000000FF00
      00008000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF0000FFFF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      00000000000080000000C0C0C000C0C0C000FF000000C0C0C000FF000000FF00
      00008000000000000000000000000000000000000000FFFFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000C0C0C000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000000000000000000000FF
      FF0000000000FF000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000C0C0C000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008000800000000000000000000000000000000000808080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800000000000000000000000000000000000FFFF0000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000080000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000C0C0C000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008000800000000000000000000000000000000000C0C0C000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008000800000000000000000000000000000000000FFFF0000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000080000000000000000000000000000000000000000000000000FF
      FF0000000000FF000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF000080808000000000000000000000000000000000000080800000FF
      FF0000FFFF0000000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF0000FFFF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000000
      000000000000000000008080800000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000808000FFFFFF0000000000C0C0C0000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C0008080800000000000000000000000000000808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000FF000000FF00
      0000FF000000FF000000FF000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000FFFFFF000080800000000000C0C0C000FFFFFF0080808000808080000000
      000000000000C0C0C0008080800000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000FF000000FF00
      0000FF000000FF000000FF000000800000000000000000000000808080008000
      000080000000800000008000000080000000000000000000000000808000FFFF
      FF0000808000FFFFFF0000000000C0C0C00000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000C0C0C0008080800000000000000000000000000000808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000FFFFFF008080
      8000808080008080800080808000000000000000000000000000C0C0C0008080
      80008080800080808000808080000000000000000000C0C0C000FFFF0000FF00
      0000FF000000FF000000FF000000800000000000000000000000C0C0C000FF00
      0000FF000000FF000000FF00000080000000000000000000000000808000FFFF
      FF00FFFFFF000080800000000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000000000C0C0C0008080800000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000FFFFFF008080
      8000808080008080800080808000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00808080000000000000000000C0C0C000FFFF0000FF00
      0000FF000000FF000000FF000000800000000000000000000000C0C0C000FFFF
      0000FFFF0000FFFF0000FF00000080000000000000000000000000808000FFFF
      FF0000808000FFFFFF0000000000C0C0C00000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000C0C0C0008080800000000000000000000000000000808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000FFFFFF008080
      8000FFFFFF008080800080808000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C000FFFF0000FF00
      0000FFFF0000FF000000FF000000800000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00080808000000000000000000000808000FFFF
      FF00FFFFFF000080800000000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000000000C0C0C0008080800000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF0000808000FFFFFF000000000000000000FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000000000C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFFFF00008080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000808000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00808080008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000808000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000C0C0C0000080
      8000808080008000000080000000FFFFFF00FFFFFF0080000000800000008080
      8000FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000FFFFFF00C0C0C000FFFFFF00808080000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF0080000000800000008000000080000000800000008000000080000000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF008000000080000000FFFFFF00800000008000000080000000FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000008080008080
      80008000000080000000FFFFFF00FFFFFF00800000008000000080808000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      000080808000808080008080800000000000FFFFFF00C0C0C000FFFFFF00C0C0
      C00080808000000000000000000000000000000000000000000000808000FFFF
      FF0080000000800000008000000080000000800000008000000080000000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF008000000080000000FFFFFF00800000008000000080000000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF008000000080000000FFFFFF00800000008000000080000000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000080
      8000008080000080800000000000808080000000000080808000C0C0C000FFFF
      FF00FFFFFF00C0C0C0008080800000000000000000000000000000808000FFFF
      FF0080000000800000008000000080000000800000008000000080000000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00800000008000000080000000FFFFFF008000000080000000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF008000000080000000FFFFFF00800000008000000080000000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000008080000080
      8000008080000000000080808000FFFFFF000080800000808000000000008080
      8000C0C0C000FFFFFF00C0C0C00000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00800000008000000080000000FFFFFF008000000080000000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00800000008000000080000000FFFFFF008000000080000000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000008080000080
      80000000000080808000FFFFFF00008080000080800000808000008080000080
      80000000000080808000C0C0C00000000000000000000000000000808000FFFF
      FF0000008000000080000000800000008000000080000000800000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF008000000080000000FFFFFF00FFFFFF008000000080000000FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00800000008000000080000000FFFFFF008000000080000000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000008080000000
      000080808000FFFFFF0000808000008080000080800000808000008080000080
      800000808000008080000000000000000000000000000000000000808000FFFF
      FF0000008000000080000000800000008000000080000000800000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000808080008000000080000000FFFFFF00FFFFFF0080000000800000008080
      800080808000808080000000000000000000000000000000000000808000FFFF
      FF008000000080000000FFFFFF00FFFFFF008000000080000000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000000000008080
      8000FFFFFF00008080000080800000FFFF0000FFFF0000808000008080000080
      800000808000008080000000000000000000000000000000000000808000FFFF
      FF0000008000000080000000800000008000000080000000800000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      8000C0C0C0008080800000000000000000000000000000000000008080008080
      80008000000080000000FFFFFF00FFFFFF00800000008000000080808000FFFF
      FF00C0C0C000000000000000000000000000000000000000000080808000FFFF
      FF000080800000FFFF0000FFFF00008080000080800000FFFF0000FFFF000080
      800000808000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080000000
      0000000000000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      800080808000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080000000
      0000000000000000000000000000000000000000000080808000FFFFFF000080
      800000808000008080000080800000FFFF0000FFFF0000808000008080000080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000808000FFFFFF000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000FFFF00008080000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000808080000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000808000000000000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000C0C0C0000080
      8000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000C0C0C0000080
      8000FFFFFF008000000080000000800000008000000080000000800000008000
      0000FFFFFF00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF008000000080000000800000008000000080000000800000008000
      0000FFFFFF00C0C0C00000000000000000000000000000000000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000800000FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF008000000080000000800000008000000080000000800000008000
      0000FFFFFF00C0C0C000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000080000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000080000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF000000800000008000000080000000800000008000000080000000
      8000FFFFFF00C0C0C000000000000000000000000000000000000000FF00FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000C0C0
      C000000080000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF000000800000008000000080000000800000008000000080000000
      8000FFFFFF00C0C0C000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000080000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF008080800000000000000000000000000000000000FFFFFF000080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF000000800000008000000080000000800000008000000080000080
      80008080800080808000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      8000C0C0C000808080000000000000000000000000000000000000808000FFFF
      FF00C0C0C0000000000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      8000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      800080808000000000000000000000000000000000000000000000808000FFFF
      FF008080800000000000000000000000000000000000FFFFFF00008080000000
      0000000000000000000000000000000000000000000000808000FFFFFF000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000808000FFFFFF000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000808080000000
      000000000000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000FFFFFF00FFFFFF0000008000FFFFFF00FFFFFF00FFFFFF000000
      8000FFFFFF00FFFFFF00C0C0C00000000000000000000000000000808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000FFFFFF008080
      8000C0C0C000C0C0C00080808000000000000000000000000000C0C0C000C0C0
      C000C0C0C000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C00000808000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF0000008000FFFFFF00C0C0C00000000000000000000000000000808000FFFF
      FF00FFFFFF0000008000FFFFFF00FFFFFF00FFFFFF0000008000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000008080
      80000080800000808000FFFFFF00C0C0C000C0C0C000C0C0C000000000000000
      000080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF0000808000FFFFFF0000008000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C00000008000FFFFFF00C0C0C00000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF008080
      800000FFFF000080800000808000008080000080800000808000FFFFFF00C0C0
      C00080000000FFFFFF0000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000080808000FFFFFF008000
      000000808000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF0000008000FFFFFF00C0C0C00000000000000000000000000000808000FFFF
      FF0000008000C0C0C00000008000C0C0C00000008000C0C0C00000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000008080
      8000008080000080800000808000008080000080800000808000008080000080
      800080000000FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000080808000FFFFFF008000
      00000080800000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF0000008000C0C0C00000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF008080
      800000FFFF000080800000808000008080000080800000808000008080000080
      800080000000FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000000000000C0C0
      C000808080000000000000000000000000000000000080808000FFFFFF008000
      000000808000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF0000008000FFFFFF00C0C0C000000000000000000000000000008080000000
      8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      8000C0C0C0000000000000000000000000000000000000000000000000008080
      8000008080000080800000808000008080000080800000808000008080000080
      800080000000FFFFFF0000000000000000000000000000000000C0C0C0000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000C0C0
      C00080808000000000000000000000000000000000008080800080000000FFFF
      FF0000808000FFFFFF0000008000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C00000008000FFFFFF00C0C0C00000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF008080
      800000FFFF008000000080000000800000000080800000808000008080000080
      800080000000FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C00000000000000000000000000000000000000000000000000000000000C0C0
      C000808080000000000000000000000000000000000080808000FFFFFF008000
      000000808000FFFFFF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF0000008000FFFFFF00C0C0C00000000000000000000000000000808000FFFF
      FF0000008000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C00000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000008080
      80000080800080000000FFFFFF00FFFFFF008080800080000000800000000080
      800080000000FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000080808000FFFFFF008000
      000000808000FFFFFF00C0C0C00000008000FFFFFF00C0C0C000FFFFFF000000
      800000000000000000000000000000000000000000000000000000808000FFFF
      FF0000008000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000008000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000FFFFFF008080
      800000FFFF00800000008000000080808000FFFFFF00FFFFFF00800000000080
      800080000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF008000
      000000808000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF0000808000C0C0C0000080800000000000000000000000000000808000FFFF
      FF00C0C0C00000008000FFFFFF00C0C0C000FFFFFF0000008000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000FFFF000080800000808000008080008000000080000000800000000080
      8000800000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000808000008080000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000808000C0C0
      C000808080000000000000000000000000000000000000000000000000008080
      8000808080008080800000FFFF0000FFFF000080800000808000008080000080
      8000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00008080000080800000808000008080000080800000808000008080000080
      800000808000000000000000000000000000000000000000000000808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008080800080808000808080008080800000FFFF000080
      8000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000000000000000000000000000000000000FFFFFF000080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800080808000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000008000808080000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000008080008080
      8000008080008080800000808000808080000080800080808000008080008080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000008000808080000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000C0C0C000000000008080800000000000000000000000000000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000080008080
      8000000000000000000000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080008080
      8000000000000000000000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000C0C0C000000000008080800000000000000000000000000000FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF0000000000000000000000FF000000
      8000808080000000000000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C000808080000000000000FFFF0000FFFF0000000000FF00
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000080808000000000000000000000000000C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      FF00000080008080800000000000000000000000000000808000008080000000
      0000C0C0C000C0C0C0008080800080808000000000000000000000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080008000000080000000800000008000000080000000800000000080
      8000C0C0C000000000008080800000000000000000000000000000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF008080800000000000000000000000000000808000008080000000
      00000000000000000000808080008080800080808000C0C0C000000000000000
      0000FF0000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000000080
      8000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0080808000000000000000000000808000008080000000
      000000000000C0C0C000C0C0C00080808000808080000000000000000000FF00
      0000FF0000008000000080000000000000000000000000000000000000000080
      8000008080008000000080000000800000008000000080000000800000000080
      8000C0C0C0000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008080800000000000000000000000
      0000000000008000000080000000000000000000000000000000FFFFFF000080
      8000FFFFFF000080800000808000008080000080800000808000008080000080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C00080000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF0080808000008080000000000000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00080808000008080000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFF0000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF00000000000000000080808000FFFFFF00C0C0C00000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C0008080
      800080808000008080000000000000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000C0C0C000008080000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFF0000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF0000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800000FFFF00008080000000000000000000000000000000000080808000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C0000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000080808000FFFFFF0000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF0000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF00008080000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FF000000FF000000FF00
      0000FF000000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFF0000FFFFFF0080808000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00008080000000000000000000000000000000000080808000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000080808000FFFFFF0000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF000080800000808000008080000080
      800000808000008080000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000808080000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000FF000000FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FF00
      0000FF000000FF0000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000800000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FFFFFF00FF000000FF000000FFFFFF00FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000800000000000000080808000000000000000000000000000FFFFFF00FF00
      000000000000FF00000000000000FF000000FF000000FF00000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000000000000000000FF000000FFFFFF00C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000000000000000000000000
      000080808000000000008080800000000000000000000000000000000000FF00
      0000808080000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000008080000000000000000000FF000000FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000080808000C0C0C000C0C0
      C00000000000FFFFFF0000000000C0C0C000C0C0C0000000000000000000FF00
      0000FF000000808080000000000000000000000000000000000000000000C0C0
      C000800000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C000C0C0C000008080000000000000000000FF000000FFFFFF00C0C0C000C0C0
      C0000000FF000000FF000000FF000000FF00FFFFFF00C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000080808000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000C0C0C0000000
      0000FF000000FF0000008080800000000000000000000000000000000000C0C0
      C000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000080808000FFFFFF0000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00C0C0C000008080000000000000000000FF000000FFFFFF00FFFFFF00C0C0
      C0000000800000008000000080000000800000008000C0C0C000C0C0C000C0C0
      C000800000000000000080808000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C0000000
      000000000000FF0000008080800000000000000000000000000000000000C0C0
      C000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C000C0C0C00000808000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000800000008000
      0000800000000000000080808000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000C0C0C000000000008080800000000000000000000000000000000000C0C0
      C000FFFF0000FF000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000080808000FFFFFF0000FF
      FF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FF
      FF00C0C0C00000808000000000000000000000000000FF0000000000000000FF
      FF000080800000FFFF000080800000FFFF000080800000FFFF000080800000FF
      FF00000000000000000080808000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000080000000FFFFFF000000
      0000C0C0C000000000000000000000000000000000000000000000000000C0C0
      C000FFFF0000FF000000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C000C0C0C00000808000000000000000000000000000FF000000808080000000
      000000000000000000000000000000000000000000000000000000FFFF000080
      8000000000000000000080808000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00800000008000000080000000FFFFFF00FFFFFF000000
      0000FFFFFF00000000000000000000000000000000000000000000000000C0C0
      C000FFFF0000FFFF0000FF000000FF000000FF000000FF000000FF0000008000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000808000000000000000000000000000FF000000808080008080
      80008080800080808000808080008080800080808000C0C0C000000000000000
      0000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000008000
      0000FFFFFF00000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080008080800080808000808080008080
      8000808080000080800000000000000000000000000000000000FF0000008000
      0000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000080808000000000000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF00800000008000000080000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FF000000C0C0C000FF00000080000000C0C0C00080000000808080008000
      0000808080008000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF0000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00C0C0C00000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800000000000FFFFFF000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008000000080000000800000008000
      0000FFFF000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C00080808000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF0000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C0000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000FFFFFF00C0C0C00000000000FFFFFF000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF008000000000000000FFFFFF008000000080000000800000008000
      0000FFFF000000000000FFFFFF000000000000000000C0C0C000C0C0C000C0C0
      C00080808000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080008080
      8000008080008080800000808000808080000080800080808000008080008080
      80000080800000000000000000000000000080808000FFFFFF00C0C0C0008080
      8000FFFFFF00C0C0C00000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00800000000000
      0000FFFFFF008000000000000000FFFFFF008000000080000000FFFF00000000
      00000000000000000000FFFFFF00000000008080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      800080808000000000000000000000000000000000000000000000808000C0C0
      C00000808000C0C0C00000808000C0C0C00000808000C0C0C00000808000C0C0
      C0008080800000000000000000000000000080808000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00008080800080808000FFFFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFF0000FFFFFF00FFFF0000FFFFFF000000
      00000000000080000000FFFFFF00000000000000000000808000C0C0C0008000
      000080000000800000008000000080000000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000808080008080800000000000000000000000000000000000C0C0C0000080
      8000C0C0C00000808000C0C0C00000808000C0C0C00000808000C0C0C0000080
      80000080800000000000000000000000000080808000FFFFFF00C0C0C0008080
      8000FFFFFF00C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00800000000000
      0000FFFFFF008000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000808000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00080808000008080008080800000000000000000000000000000808000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00C0C0
      C0008080800000000000000000000000000080808000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800080808000FFFFFF008080
      800080808000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF008000
      000080000000FFFFFF00FFFFFF00000000000000000000808000C0C0C000FFFF
      000080808000FFFF000080808000FFFF000080808000FFFF0000FFFFFF00C0C0
      C000808080008080800000808000000000000000000000000000C0C0C0000080
      8000C0C0C00000808000C0C0C00000808000C0C0C00000808000C0C0C0000080
      80000080800000000000000000000000000080808000FFFFFF00C0C0C0008080
      80008080800080808000808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00800000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000808000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00080808000008080008080800000000000000000000000000000808000C0C0
      C00000808000C0C0C00000808000C0C0C00000808000C0C0C00000808000C0C0
      C0000080800000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080008080800080808000FFFFFF00FFFF
      FF008080800080808000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000808080008080800080808000FFFFFF000000
      80000000800000008000FFFFFF00000000000000000000808000FF000000FF00
      0000FF0000008080800080808000808080008080800080808000808080008080
      8000808080008080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      80008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000080000000800000008000
      000080000000C0C0C00080808000008080008080800000808000C0C0C0000080
      8000808080000080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000000000FFFF000080
      80008080800000808000C0C0C000008080008080800000808000808080000080
      8000808080000080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000000000000000000000FF
      FF00008080008080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008020FFC0FFC00000802C804C804C0000
      7FC480558055000040FE7F8E7F8E000040A440882888000040E840BC28BC0000
      40EC40822882000040C240862886000040A24082288200003F21408128810000
      24123F422F42000022620F8C298C000022360F04EE04000011FE0FC845C80000
      083C07FC2BFC000007C003F811F80000FFFFC080FCFFFE7FFFFFE001E07FFC3F
      557FE201C07CF83FAAFFE201C078F87F401FE200E070F83F801FE24FC061F83F
      4003E0CFE043F87F8003C18FC007F83F4003FFFFC00FF03FC003FFFF000FE01F
      C003FFFF000FC00FF803FFFF000F8007F803FFFF101F8007FFFFFFFF003FC00F
      FFFFFFFF807FE01FFFFFFFFFF1FFF03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF557FEFFFEFFFEFFFAAFFC003C003C007401FC003C003C007801F
      C003C003C0074003C003C003C0078003C003C003C0074003800780038007C003
      000F000F0007C00301FF01FF0007F80301FF01FF01FFF80383FF83FF83FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC003FFFFEFFFFFFFC003FFFFC007C003C003FFFFC007
      C003FFFFC003C007C003C003C003C007C003C003C003C007C003C003C0038007
      FFFFFFFFFFFF0007FFFFC003FFFF0007FFFFC003FFFF01FFFFFFC003FFFF83FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FFC003FFFFFFFF
      E000C003FFFFFFFFE000C003FFFFFFFFE000C00380FF80FF8000C00380FF80FF
      8000C00380C080C08000C00380C080C08000C003800080008000C00380C080C0
      8000C00380FF80FF8000C003FFFFFFFF8303C007FFFFFFFF83C7C00FFFFFFFFF
      C7FFC01FFFFFFFFFEFFFFFFFFFFFFFFFFFFFE001FFFFFFFFC003E001C003FCFF
      C0038001C003F83FC0038001C003F00FC0038001C003E003C0038001C003C000
      C0038001C0038001C0038001C0030001C0038001C0030000C0038001C0030001
      C0038003C0030003C0038007C0030007C007800FC007800FC00F801FC00FE01F
      C01F803FC01FF83FFFFFFFFFFFFFFE7FFFFFE001FFFFE001FFFFE001C003E001
      FFFF8001C0038001FFFF8001C0038001E0038001C0038001C0038001C0038001
      C0038001C0038001C0038001C0038001C0038001C0038001C0038001C0038001
      C00F8003C0038003FFFF8007C0038007FFFF800FC007800FFFFF801FC00F801F
      FFFF803FC01F803FFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFE003FFFFF000C003
      C001FFFF8000C003C001FFFF8000C003C001E0038000C003C001C0038000C003
      C001C0038000C003C001C0038000C003C001C0038000C003C001C0038000C003
      C001C00F8000C003C001FFFF8001C003C001FFFF8003C007E005FFFF8007C00F
      FC07FFFF801FC01FFFC7FFFF803FFFFFFFFFFFFFFFFFE001FFFFFFFF9123C001
      FFFFFF7F8000C001FFFFFF3F8000C001E003FF1F8000C001C003FF1F8000C001
      C003FF0F8000C001C003FE0F8000C001C003FCC78000C001C007FBE38000C001
      C00FFFF38000C001FFFFFFF98020C001FFFFFFFD8020C003FFFFFFFFC1F0C003
      FFFFFFFFE1F8FFFFFFFFFFFFF1FFFFFFFFFFFFFFFFFFFFFFFFFFC003FFFFFFFF
      E001C003FFFFFFFFC001C003FFFFFFFFC001C003800180018001C00380018001
      0001C003800180010001C003800180010001C003800180018001C00380018001
      8001C003800180018001C00380018001C0FFC00780018001E1FFC00FFFFFFFFF
      FFFFC01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0007801FFFFFFFFF
      0001800FFFFFC00100008007FFFF800100008003E007800100008001E0078001
      00008000E007800100008000E007800180008000E00780018000C000E0078001
      8000E000E00780018000F003E0078001C000F803FFFFC0FFE000FC03FFFFE1FF
      F001FFC7FFFFFFFFFFFFFFFFFFFFFFFFFC03FC03FFFFFFFFFC03FC030007FFFF
      E003E0030003FFFFE000E0000001FFFF000000000000E003000000000000C003
      000000000000C003000000008000C003000000008001C003000000008001C003
      000000008001C007000000008001FFFF000000008001FFFFC000C000C001FFFF
      C000C000E1FFFFFFC000C000FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
