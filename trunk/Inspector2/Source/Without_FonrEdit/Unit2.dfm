object Form2: TForm2
  Left = 192
  Top = 107
  Width = 296
  Height = 242
  BorderIcons = []
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 184
    Width = 288
    Height = 31
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Button1: TButton
      Left = 21
      Top = 5
      Width = 110
      Height = 22
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 157
      Top = 5
      Width = 110
      Height = 22
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 288
    Height = 184
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
