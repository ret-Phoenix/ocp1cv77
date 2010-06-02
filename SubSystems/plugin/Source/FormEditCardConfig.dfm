object frmEditCardConfig: TfrmEditCardConfig
  Left = 192
  Top = 110
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
  ClientHeight = 283
  ClientWidth = 538
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 249
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 88
      Top = 8
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 20
      Width = 73
      Height = 21
      DataField = 'ID'
      DataSource = DS_QDocument
      Enabled = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 20
      Width = 441
      Height = 21
      DataField = 'Name'
      DataSource = DS_QDocument
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 8
      Top = 48
      Width = 521
      Height = 199
      DataField = 'Note'
      DataSource = DS_QDocument
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 249
    Width = 538
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOk: TButton
      Left = 8
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnPost: TButton
      Left = 88
      Top = 2
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 1
      OnClick = btnPostClick
    end
    object btnCancel: TButton
      Left = 168
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
  object QDocument: TADOQuery
    Parameters = <>
    Left = 144
    Top = 112
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 250
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
  end
  object DS_QDocument: TDataSource
    DataSet = QDocument
    Left = 176
    Top = 112
  end
end
