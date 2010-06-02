object frmEditExtPath: TfrmEditExtPath
  Left = 425
  Top = 305
  BorderStyle = bsDialog
  Caption = #1042#1085#1077#1096#1085#1080#1077' '#1092#1086#1088#1084#1099
  ClientHeight = 207
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object eName: TLabeledEdit
    Left = 8
    Top = 24
    Width = 401
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 0
  end
  object ePath: TLabeledEdit
    Left = 8
    Top = 64
    Width = 329
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1091#1090#1100
    TabOrder = 1
  end
  object eMask: TLabeledEdit
    Left = 8
    Top = 104
    Width = 401
    Height = 21
    EditLabel.Width = 91
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1089#1082#1072' '#1074#1082#1083#1102#1095#1077#1085#1080#1103
    TabOrder = 4
  end
  object btnChoiceDir: TBitBtn
    Left = 341
    Top = 64
    Width = 25
    Height = 25
    TabOrder = 2
    OnClick = btnChoiceDirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
      6666666666666666666666666666666666666666666666666666000000000006
      66667777777777766666003333333330666677666666666766660B0333333333
      066676766666666676660FB033333333306676676666666667660BFB03333333
      330676667666666666760FBFB0000000000076666777777777770BFBFBFBFB06
      666676666666667666660FBFBFBFBF06666676666666667666660BFB00000006
      6666766677777776666660006666666600066777666666667776666666666666
      6006666666666666677666666666066606066666666676667676666666666000
      6666666666666777666666666666666666666666666666666666}
    NumGlyphs = 2
  end
  object btnOk: TButton
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 6
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object eMaskFalse: TLabeledEdit
    Left = 8
    Top = 144
    Width = 401
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1089#1082#1072' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1103
    TabOrder = 5
  end
  object btnSetIB: TButton
    Left = 368
    Top = 64
    Width = 41
    Height = 25
    Caption = 'IBDir\'
    TabOrder = 3
    OnClick = btnSetIBClick
  end
end
