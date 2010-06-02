object frmEditCardRelise: TfrmEditCardRelise
  Left = 616
  Top = 240
  BorderStyle = bsDialog
  Caption = #1056#1077#1083#1080#1079
  ClientHeight = 409
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 80
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 248
    Width = 23
    Height = 13
    Caption = 'Note'
    FocusControl = DBMemo1
  end
  object Label3: TLabel
    Left = 8
    Top = 168
    Width = 116
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' ('#1087#1083#1072#1085')'
  end
  object Label4: TLabel
    Left = 8
    Top = 208
    Width = 118
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' ('#1092#1072#1082#1090')'
  end
  object Label5: TLabel
    Left = 8
    Top = 128
    Width = 109
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1075#1088#1091#1079#1082#1080' ('#1087#1083#1072#1085')'
  end
  object Label6: TLabel
    Left = 8
    Top = 144
    Width = 111
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1075#1088#1091#1079#1082#1080' ('#1092#1072#1082#1090')'
  end
  object Label7: TLabel
    Left = 8
    Top = 3
    Width = 78
    Height = 13
    Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
  end
  object Label8: TLabel
    Left = 8
    Top = 40
    Width = 97
    Height = 13
    Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 96
    Width = 305
    Height = 21
    DataField = 'Name'
    DataSource = DSQDocument
    TabOrder = 3
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 264
    Width = 305
    Height = 105
    DataField = 'Note'
    DataSource = DSQDocument
    TabOrder = 10
  end
  object DBEditDateTimePicker1: TDBEditDateTimePicker
    Left = 128
    Top = 120
    Width = 105
    Height = 21
    Date = 38628.449761817130000000
    Time = 38628.449761817130000000
    DateFormat = dfLong
    TabOrder = 4
    DataField = 'DateLoadPlan'
    DataSource = DSQDocument
    ReadOnly = False
    DefaultEditMask = '!99/99/99;1;_'
    AutoApplyEditMask = True
  end
  object DBEditDateTimePicker2: TDBEditDateTimePicker
    Left = 128
    Top = 144
    Width = 105
    Height = 21
    Date = 38628.449806307870000000
    Time = 38628.449806307870000000
    DateFormat = dfLong
    TabOrder = 5
    DataField = 'DateLoadreal'
    DataSource = DSQDocument
    ReadOnly = False
    DefaultEditMask = '!99/99/99;1;_'
    AutoApplyEditMask = True
  end
  object Button1: TButton
    Left = 8
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 11
    OnClick = Button1Click
  end
  object btnClose: TButton
    Left = 88
    Top = 376
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 12
    OnClick = btnCloseClick
  end
  object DBEdit4: TDBEdit
    Left = 226
    Top = 379
    Width = 89
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = True
    DataField = 'ID'
    DataSource = DSQDocument
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = True
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 16
    Width = 305
    Height = 21
    DataField = 'ConfigID'
    DataSource = DSQDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DSQListConfigs
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 8
    Top = 56
    Width = 289
    Height = 21
    DataField = 'SubconfigID'
    DataSource = DSQDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DSQListSubconfigs
    TabOrder = 1
    OnEnter = DBLookupComboBox2Enter
  end
  object btnClear: TButton
    Left = 295
    Top = 57
    Width = 19
    Height = 19
    Caption = #1061
    TabOrder = 2
    OnClick = btnClearClick
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 8
    Top = 184
    Width = 289
    Height = 21
    DataField = 'UserPlanID'
    DataSource = DSQDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DS_QListUsers
    TabOrder = 6
  end
  object Button2: TButton
    Left = 295
    Top = 184
    Width = 19
    Height = 20
    Caption = #1061
    TabOrder = 7
    OnClick = btnClearClick
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 8
    Top = 224
    Width = 289
    Height = 21
    DataField = 'UserRealID'
    DataSource = DSQDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DS_QListUsers
    TabOrder = 8
  end
  object Button3: TButton
    Left = 295
    Top = 224
    Width = 19
    Height = 20
    Caption = #1061
    TabOrder = 9
    OnClick = btnClearClick
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from Relises')
    Left = 216
    Top = 272
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentConfigID: TIntegerField
      FieldName = 'ConfigID'
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 50
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
    object QDocumentDateLoadPlan: TDateTimeField
      FieldName = 'DateLoadPlan'
    end
    object QDocumentDateLoadreal: TDateTimeField
      FieldName = 'DateLoadreal'
    end
    object QDocumentSubconfigID: TIntegerField
      FieldName = 'SubconfigID'
    end
    object QDocumentUserPlanID: TIntegerField
      FieldName = 'UserPlanID'
    end
    object QDocumentUserRealID: TIntegerField
      FieldName = 'UserRealID'
    end
  end
  object DSQDocument: TDataSource
    DataSet = QDocument
    Left = 248
    Top = 272
  end
  object QListSubconfigs: TADOQuery
    Parameters = <>
    Left = 48
    Top = 288
  end
  object QListConfigs: TADOQuery
    Parameters = <>
    Left = 48
    Top = 320
  end
  object DSQListConfigs: TDataSource
    DataSet = QListConfigs
    Left = 88
    Top = 320
  end
  object DSQListSubconfigs: TDataSource
    DataSet = QListSubconfigs
    Left = 88
    Top = 288
  end
  object QListUsers: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from users')
    Left = 152
    Top = 320
  end
  object DS_QListUsers: TDataSource
    DataSet = QListUsers
    Left = 184
    Top = 320
  end
end
