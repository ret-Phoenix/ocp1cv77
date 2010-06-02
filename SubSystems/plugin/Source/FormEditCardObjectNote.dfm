object frmEditCardObjectNote: TfrmEditCardObjectNote
  Left = 0
  Top = 0
  Width = 434
  Height = 392
  Caption = 'frmEditCardObjectNote'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo1: TDBMemo
    Left = 0
    Top = 0
    Width = 426
    Height = 324
    Align = alClient
    DataField = 'Note'
    DataSource = DataSource1
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 324
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
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnClose: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object DataSource1: TDataSource
    DataSet = QObjNote
    Left = 200
    Top = 144
  end
  object QObjNote: TADOQuery
    Connection = frmSubSystems.SubSystemConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from ObjectNote')
    Left = 136
    Top = 56
  end
end
