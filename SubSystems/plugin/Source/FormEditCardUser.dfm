object frmEditCardUser: TfrmEditCardUser
  Left = 353
  Top = 203
  BorderStyle = bsDialog
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  ClientHeight = 324
  ClientWidth = 417
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
    Top = 48
    Width = 73
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 26
    Height = 13
    Caption = 'Login'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 176
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = DBMemo1
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 92
    Height = 13
    Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
  end
  object Label5: TLabel
    Left = 8
    Top = 136
    Width = 25
    Height = 13
    Caption = 'Email'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 400
    Height = 21
    DataField = 'SubconfigID'
    DataSource = DS_QDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DS_QListSubconfigs
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 64
    Width = 400
    Height = 21
    DataField = 'Name'
    DataSource = DS_QDocument
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 112
    Width = 400
    Height = 21
    DataField = 'Login'
    DataSource = DS_QDocument
    TabOrder = 2
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 192
    Width = 401
    Height = 89
    DataField = 'Note'
    DataSource = DS_QDocument
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 320
    Top = 294
    Width = 89
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = True
    DataField = 'id'
    DataSource = DS_QDocument
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = True
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object btnCancel: TButton
    Left = 168
    Top = 290
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object btnPost: TButton
    Left = 88
    Top = 290
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 6
    OnClick = btnPostClick
  end
  object btnOk: TButton
    Left = 8
    Top = 290
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
    OnClick = btnOkClick
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 152
    Width = 401
    Height = 21
    DataField = 'Email'
    DataSource = DS_QDocument
    TabOrder = 3
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from Users')
    Left = 24
    Top = 224
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentSubconfigID: TIntegerField
      FieldName = 'SubconfigID'
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 50
    end
    object QDocumentLogin: TWideStringField
      FieldName = 'Login'
      Size = 50
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
    object QDocumentEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
  end
  object DS_QDocument: TDataSource
    DataSet = QDocument
    Left = 56
    Top = 224
  end
  object DS_QListSubconfigs: TDataSource
    DataSet = QListSubconfigs
    Left = 152
    Top = 232
  end
  object QListSubconfigs: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from SubConfigs')
    Left = 120
    Top = 232
  end
end
