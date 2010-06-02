object Artbear_ActiveFormX: TArtbear_ActiveFormX
  Left = 411
  Top = 277
  Width = 289
  Height = 434
  Caption = 'Artbear_ActiveFormX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 21
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 0
      Top = 0
      Width = 217
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnKeyDown = ComboBox1KeyDown
      OnKeyPress = ComboBox1KeyPress
    end
  end
  object Layers: TTabSet
    Left = 0
    Top = 386
    Width = 281
    Height = 21
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  object TabControl1: TTabControl
    Left = 258
    Top = 21
    Width = 23
    Height = 365
    Align = alRight
    MultiLine = True
    TabOrder = 2
    TabPosition = tpRight
    Visible = False
    OnChange = TabControl1Change
  end
  object PropertyInspector: TExInspector
    Left = 0
    Top = 21
    Width = 258
    Height = 365
    Align = alClient
    CategoryFont.Charset = DEFAULT_CHARSET
    CategoryFont.Color = clPurple
    CategoryFont.Height = -11
    CategoryFont.Name = 'MS Sans Serif'
    CategoryFont.Style = [fsBold]
    NameFont.Charset = DEFAULT_CHARSET
    NameFont.Color = clBtnText
    NameFont.Height = -11
    NameFont.Name = 'MS Sans Serif'
    NameFont.Style = []
    ShowCellTips = False
    TabOrder = 3
    ValueFont.Charset = DEFAULT_CHARSET
    ValueFont.Color = clNavy
    ValueFont.Height = -11
    ValueFont.Name = 'MS Sans Serif'
    ValueFont.Style = []
    OnChanging = PropertyInspectorChanging
  end
  object ColorDialog: TColorDialog
    Left = 200
    Top = 65528
  end
end
