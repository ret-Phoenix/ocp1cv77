object frmEditCardStatus: TfrmEditCardStatus
  Left = 559
  Top = 217
  BorderStyle = bsDialog
  Caption = #1057#1090#1072#1090#1091#1089
  ClientHeight = 270
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 50
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    FocusControl = DBMemo1
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 337
    Height = 21
    DataField = 'Name'
    DataSource = DataSource2
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 64
    Width = 337
    Height = 161
    DataField = 'Note'
    DataSource = DataSource2
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 280
    Top = 240
    Width = 70
    Height = 21
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    DataField = 'ID'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object btnOk: TButton
    Left = 8
    Top = 234
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnPost: TButton
    Left = 88
    Top = 234
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 3
    OnClick = btnPostClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 234
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from Statuses')
    Left = 112
    Top = 72
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 50
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
  end
  object DataSource2: TDataSource
    DataSet = QDocument
    Left = 152
    Top = 96
  end
end
