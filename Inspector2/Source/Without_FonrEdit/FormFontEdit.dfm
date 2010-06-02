object frmFontEdit: TfrmFontEdit
  Left = 655
  Top = 448
  Width = 293
  Height = 242
  Caption = 'frmFontEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cbFont: TJvFontComboBox
    Left = 8
    Top = 32
    Width = 145
    Height = 22
    DroppedDownWidth = 145
    MaxMRUCount = 0
    FontName = 'MS Sans Serif'
    ItemIndex = 16
    Sorted = False
    TabOrder = 1
  end
  object cbColor: TJvColorComboBox
    Left = 160
    Top = 32
    Width = 57
    Height = 22
    ColorNameMap.Strings = (
      'clBlack=Black'
      'clMaroon=Maroon'
      'clGreen=Green'
      'clOlive=Olive green'
      'clNavy=Navy blue'
      'clPurple=Purple'
      'clTeal=Teal'
      'clGray=Gray'
      'clSilver=Silver'
      'clRed=Red'
      'clLime=Lime'
      'clYellow=Yellow'
      'clBlue=Blue'
      'clFuchsia=Fuchsia'
      'clAqua=Aqua'
      'clWhite=White'
      'clMoneyGreen=Money green'
      'clSkyBlue=Sky blue'
      'clCream=Cream'
      'clMedGray=Medium gray'
      'clScrollBar=Scrollbar'
      'clBackground=Desktop background'
      'clActiveCaption=Active window title bar'
      'clInactiveCaption=Inactive window title bar'
      'clMenu=Menu background'
      'clWindow=Window background'
      'clWindowFrame=Window frame'
      'clMenuText=Menu text'
      'clWindowText=Window text'
      'clCaptionText=Active window title bar text'
      'clActiveBorder=Active window border'
      'clInactiveBorder=Inactive window border'
      'clAppWorkSpace=Application workspace'
      'clHighlight=Selection background'
      'clHighlightText=Selection text'
      'clBtnFace=Button face'
      'clBtnShadow=Button shadow'
      'clGrayText=Dimmed text'
      'clBtnText=Button text'
      'clInactiveCaptionText=Inactive window title bar text'
      'clBtnHighlight=Button highlight'
      'cl3DDkShadow=Dark shadow 3D elements'
      'cl3DLight=Highlight 3D elements'
      'clInfoText=Tooltip text'
      'clInfoBk=Tooltip background'
      'clGradientActiveCaption=Gradient Active Caption'
      'clGradientInactiveCaption=Gradient Inactive Caption'
      'clHotLight=Hot Light'
      'clMenuBar=Menu Bar'
      'clMenuHighlight=Menu Highlight')
    ColorDialogText = 'Custom...'
    DroppedDownWidth = 57
    NewColorText = 'Custom'
    Options = [coHex]
    TabOrder = 2
  end
  object chkBold: TCheckBox
    Left = 8
    Top = 64
    Width = 97
    Height = 17
    Caption = #1046#1080#1088#1085#1099#1081
    TabOrder = 5
  end
  object chkItalic: TCheckBox
    Left = 8
    Top = 88
    Width = 97
    Height = 17
    Caption = #1053#1072#1082#1083#1086#1085#1085#1099#1081
    TabOrder = 6
  end
  object chkUnderline: TCheckBox
    Left = 8
    Top = 112
    Width = 97
    Height = 17
    Caption = #1055#1086#1076#1095#1077#1088#1082#1085#1091#1090#1099#1081
    TabOrder = 7
  end
  object grp1: TGroupBox
    Left = 120
    Top = 56
    Width = 153
    Height = 73
    Caption = #1055#1088#1080#1084#1077#1088
    TabOrder = 4
    object pnlSample: TPanel
      Left = 2
      Top = 15
      Width = 149
      Height = 56
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSample'
      TabOrder = 0
    end
  end
  object btnOk: TButton
    Left = 120
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 8
  end
  object btnCancel: TButton
    Left = 200
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 9
  end
  object chkAuto: TCheckBox
    Left = 8
    Top = 8
    Width = 57
    Height = 17
    Caption = #1040#1074#1090#1086
    TabOrder = 0
  end
  object seFontSize: TJvCalcEdit
    Left = 224
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 3
    DecimalPlacesAlwaysShown = False
  end
end
