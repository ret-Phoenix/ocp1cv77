object frmOptions: TfrmOptions
  Left = 476
  Top = 409
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 352
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 313
    Height = 311
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1082#1083#1072#1076#1082#1080
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 64
        Height = 13
        Caption = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      end
      object todo: TCheckBox
        Left = 8
        Top = 176
        Width = 97
        Height = 17
        Caption = #1047#1072#1076#1072#1095#1080
        TabOrder = 10
      end
      object tuning: TCheckBox
        Left = 8
        Top = 192
        Width = 81
        Height = 17
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
        TabOrder = 12
      end
      object confs: TCheckBox
        Left = 8
        Top = 208
        Width = 97
        Height = 17
        Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
        TabOrder = 13
      end
      object templates: TCheckBox
        Left = 8
        Top = 224
        Width = 97
        Height = 17
        Caption = #1064#1072#1073#1083#1086#1085#1099
        TabOrder = 14
      end
      object props: TCheckBox
        Left = 24
        Top = 24
        Width = 97
        Height = 17
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072
        TabOrder = 1
      end
      object links: TCheckBox
        Left = 24
        Top = 40
        Width = 97
        Height = 17
        Caption = #1057#1089#1099#1083#1082#1080
        TabOrder = 2
      end
      object ssobj: TCheckBox
        Left = 24
        Top = 56
        Width = 137
        Height = 17
        Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1086#1073#1098#1077#1082#1090#1072
        TabOrder = 3
      end
      object expl: TCheckBox
        Left = 24
        Top = 72
        Width = 97
        Height = 17
        Caption = 'Explorer'
        TabOrder = 4
      end
      object AvlbSS: TCheckBox
        Left = 24
        Top = 88
        Width = 145
        Height = 17
        Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099
        TabOrder = 5
      end
      object ObjShowing: TCheckBox
        Left = 24
        Top = 104
        Width = 137
        Height = 17
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1086#1073#1098#1077#1082#1090#1099
        TabOrder = 6
      end
      object NoteShowing: TCheckBox
        Left = 24
        Top = 120
        Width = 137
        Height = 17
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        TabOrder = 7
      end
      object NoteListShowing: TCheckBox
        Left = 8
        Top = 240
        Width = 137
        Height = 17
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1087#1080#1089#1072#1085#1080#1081
        TabOrder = 15
      end
      object ComboBoxPlacePanel: TComboBox
        Left = 88
        Top = 5
        Width = 209
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          #1044#1086#1087' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1089#1087#1088#1072#1074#1072
          #1044#1086#1087' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1074#1085#1080#1079#1091)
      end
      object ComboBoxSS: TComboBox
        Left = 88
        Top = 189
        Width = 209
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 11
        Items.Strings = (
          #1055#1072#1085#1077#1083#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084' '#1089#1087#1088#1072#1074#1072
          #1055#1072#1085#1077#1083#1100' '#1087#1086#1076#1089#1080#1089#1090#1077#1084' '#1089#1085#1080#1079#1091)
      end
      object cbToDoObj: TCheckBox
        Left = 24
        Top = 136
        Width = 105
        Height = 17
        Caption = #1047#1072#1076#1072#1095#1080' '#1086#1073#1098#1077#1082#1090#1072
        TabOrder = 8
      end
      object cbMDObjBlocks: TCheckBox
        Left = 8
        Top = 256
        Width = 153
        Height = 17
        Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1080' '#1086#1073#1098#1077#1082#1090#1086#1074' '#1052#1044
        TabOrder = 16
      end
      object chkLogList: TCheckBox
        Left = 24
        Top = 152
        Width = 129
        Height = 17
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1086#1073#1098#1077#1082#1090#1072
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1042#1072#1088#1080#1072#1085#1090#1099' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      ImageIndex = 1
      object rgMetadataView: TRadioGroup
        Left = 0
        Top = 0
        Width = 169
        Height = 57
        Caption = #1044#1077#1088#1077#1074#1086' '#1084#1077#1090#1072#1076#1072#1085#1085#1099#1093
        Items.Strings = (
          #1044#1077#1088#1077#1074#1086' '#1089' '#1082#1086#1083#1086#1085#1082#1072#1084#1080
          #1044#1077#1088#1077#1074#1086' ('#1089#1090#1072#1088#1099#1081' '#1074#1072#1088#1080#1072#1085#1090')')
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 311
    Width = 313
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
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
end
