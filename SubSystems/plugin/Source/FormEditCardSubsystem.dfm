object frmEditCardSubsystem: TfrmEditCardSubsystem
  Left = 192
  Top = 110
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1072
  ClientHeight = 313
  ClientWidth = 405
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
    Width = 76
    Height = 13
    Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 95
    Height = 13
    Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    FocusControl = DBEdit1
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    FocusControl = DBMemo1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 112
    Top = 8
    Width = 281
    Height = 21
    DataField = 'ConfigID'
    DataSource = DS_QDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DS_QListConfigs
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 112
    Top = 32
    Width = 257
    Height = 21
    DataField = 'SubconfigID'
    DataSource = DS_QDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DS_QListSubconfigs
    TabOrder = 1
    OnEnter = DBLookupComboBox2Enter
  end
  object DBEdit1: TDBEdit
    Left = 112
    Top = 56
    Width = 281
    Height = 21
    DataField = 'Name'
    DataSource = DS_QDocument
    TabOrder = 3
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 96
    Width = 385
    Height = 169
    DataField = 'Note'
    DataSource = DS_QDocument
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 256
    Top = 280
    Width = 134
    Height = 21
    BorderStyle = bsNone
    DataField = 'ID'
    DataSource = DS_QDocument
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object btnOk: TButton
    Left = 8
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
    OnClick = btnOkClick
  end
  object btnPost: TButton
    Left = 88
    Top = 280
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 6
    OnClick = btnPostClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object btnClear: TButton
    Left = 373
    Top = 32
    Width = 20
    Height = 21
    Caption = #1061
    TabOrder = 2
    OnClick = btnClearClick
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from Subsystems')
    Left = 240
    Top = 112
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentConfigID: TIntegerField
      FieldName = 'ConfigID'
      OnChange = QDocumentConfigIDChange
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 70
    end
    object QDocumentSubconfigID: TIntegerField
      FieldName = 'SubconfigID'
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
  end
  object QListConfigs: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from configs')
    Left = 240
    Top = 144
  end
  object QListSubconfigs: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from subconfigs')
    Left = 240
    Top = 176
  end
  object DS_QDocument: TDataSource
    DataSet = QDocument
    Left = 272
    Top = 112
  end
  object DS_QListConfigs: TDataSource
    DataSet = QListConfigs
    Left = 272
    Top = 144
  end
  object DS_QListSubconfigs: TDataSource
    DataSet = QListSubconfigs
    Left = 272
    Top = 176
  end
end
