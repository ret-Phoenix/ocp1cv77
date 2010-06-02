object frmEditCardSeriousness: TfrmEditCardSeriousness
  Left = 191
  Top = 110
  BorderStyle = bsDialog
  Caption = #1057#1077#1088#1100#1077#1079#1085#1086#1089#1090#1100
  ClientHeight = 323
  ClientWidth = 397
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 11
    Height = 13
    Caption = 'ID'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 80
    Top = 8
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit2
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 65
    Height = 21
    DataField = 'ID'
    DataSource = DataSource1
    Enabled = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 80
    Top = 24
    Width = 305
    Height = 21
    DataField = 'Name'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 48
    Width = 377
    Height = 233
    DataField = 'Note'
    DataSource = DataSource1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 168
    Top = 290
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object btnPost: TButton
    Left = 88
    Top = 290
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 4
    OnClick = btnPostClick
  end
  object btnOk: TButton
    Left = 8
    Top = 290
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = btnOkClick
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from Seriousness where ID=0')
    Left = 160
    Top = 88
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
  object DataSource1: TDataSource
    DataSet = QDocument
    Left = 240
    Top = 176
  end
end
