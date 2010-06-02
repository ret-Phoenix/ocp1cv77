object frmEditCardMDObjBlock: TfrmEditCardMDObjBlock
  Left = 352
  Top = 177
  BorderStyle = bsDialog
  Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1086#1073#1098#1077#1082#1090#1072' '#1052#1044
  ClientHeight = 384
  ClientWidth = 442
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
  object Label3: TLabel
    Left = 8
    Top = 36
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 60
    Width = 76
    Height = 13
    Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1083':'
  end
  object Label5: TLabel
    Left = 8
    Top = 84
    Width = 82
    Height = 13
    Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1083':'
  end
  object Label6: TLabel
    Left = 8
    Top = 108
    Width = 96
    Height = 13
    Caption = #1047#1072#1076#1072#1095#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label11: TLabel
    Left = 8
    Top = 200
    Width = 50
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    FocusControl = DBMemo1
  end
  object lblMDObjName: TLabel
    Left = 8
    Top = 8
    Width = 71
    Height = 13
    Caption = 'lblMDObjName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnManageParentToDoShow: TSpeedButton
    Left = 400
    Top = 104
    Width = 17
    Height = 20
    Glyph.Data = {
      62000000424D62000000000000003E0000002800000009000000090000000100
      01000000000024000000C40E0000C40E0000020000000000000000000000FFFF
      FF00FE800000FC000000C0800000B98000007D8000007D8000007D800000BB80
      0000C7800000}
    OnClick = btnManageParentToDoShowClick
  end
  object btnManageParentToDoChoice: TSpeedButton
    Left = 416
    Top = 104
    Width = 17
    Height = 20
    Glyph.Data = {
      62000000424D62000000000000003E0000002800000009000000090000000100
      010000000000240000000000000000000000020000000200000000000000FFFF
      FF00FF80E600B680E600B6800000FF800000FF800000FF80E600FF800000FF80
      E600FF800000}
    OnClick = btnManageParentToDoChoiceClick
  end
  object DBCheckBox1: TDBCheckBox
    Left = 336
    Top = 8
    Width = 97
    Height = 17
    Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085
    DataField = 'Blocked'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = DBCheckBox1Click
  end
  object DBEdit3: TDBEdit
    Left = 112
    Top = 32
    Width = 321
    Height = 21
    DataField = 'Name'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 216
    Width = 425
    Height = 129
    DataField = 'Note'
    DataSource = DataSource1
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object JvDBLookupCombo1: TJvDBLookupCombo
    Left = 112
    Top = 56
    Width = 321
    Height = 21
    DataField = 'UserBlockID'
    DataSource = DataSource1
    LookupField = 'id'
    LookupDisplay = 'Name'
    LookupSource = DS_QListUsers
    TabOrder = 2
  end
  object JvDBLookupCombo2: TJvDBLookupCombo
    Left = 112
    Top = 80
    Width = 321
    Height = 21
    DataField = 'UserUnBlockID'
    DataSource = DataSource1
    LookupField = 'id'
    LookupDisplay = 'Name'
    LookupSource = DS_QListUsers
    TabOrder = 3
  end
  object JvDBLookupCombo3: TJvDBLookupCombo
    Left = 112
    Top = 104
    Width = 289
    Height = 21
    DataField = 'ToDoID'
    DataSource = DataSource1
    LookupField = 'ID'
    LookupDisplay = 'Name'
    LookupSource = DS_QListToDo
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 128
    Width = 425
    Height = 65
    Caption = #1044#1072#1090#1099
    TabOrder = 5
    object Label7: TLabel
      Left = 8
      Top = 15
      Width = 100
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' ('#1087#1083#1072#1085'):'
    end
    object Label8: TLabel
      Left = 213
      Top = 15
      Width = 101
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' ('#1092#1072#1082#1090'):'
    end
    object Label9: TLabel
      Left = 8
      Top = 39
      Width = 95
      Height = 13
      Caption = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072' ('#1087#1083#1072#1085'):'
    end
    object Label10: TLabel
      Left = 213
      Top = 39
      Width = 96
      Height = 13
      Caption = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072' ('#1092#1072#1082#1090'):'
    end
    object JvDBDateEdit1: TJvDBDateEdit
      Left = 112
      Top = 12
      Width = 97
      Height = 21
      DataField = 'DateStartBlockPlan'
      DataSource = DataSource1
      TabOrder = 0
    end
    object JvDBDateEdit2: TJvDBDateEdit
      Left = 317
      Top = 12
      Width = 97
      Height = 21
      DataField = 'DateStartBlockReal'
      DataSource = DataSource1
      TabOrder = 1
    end
    object JvDBDateEdit3: TJvDBDateEdit
      Left = 112
      Top = 36
      Width = 97
      Height = 21
      DataField = 'DateEndBlockPlan'
      DataSource = DataSource1
      TabOrder = 2
    end
    object JvDBDateEdit4: TJvDBDateEdit
      Left = 317
      Top = 36
      Width = 97
      Height = 21
      DataField = 'DateEndBlockReal'
      DataSource = DataSource1
      TabOrder = 3
    end
  end
  object btnOk: TButton
    Left = 8
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 7
    OnClick = btnOkClick
  end
  object btnPost: TButton
    Left = 88
    Top = 352
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 8
    OnClick = btnPostClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 352
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 9
    OnClick = btnCancelClick
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from MDObjBlocks')
    Left = 88
    Top = 248
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentMDObj: TIntegerField
      FieldName = 'MDObj'
    end
    object QDocumentBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 100
    end
    object QDocumentUserBlockID: TIntegerField
      FieldName = 'UserBlockID'
    end
    object QDocumentUserUnBlockID: TIntegerField
      FieldName = 'UserUnBlockID'
    end
    object QDocumentToDoID: TIntegerField
      FieldName = 'ToDoID'
    end
    object QDocumentDateStartBlockPlan: TDateTimeField
      FieldName = 'DateStartBlockPlan'
    end
    object QDocumentDateStartBlockReal: TDateTimeField
      FieldName = 'DateStartBlockReal'
    end
    object QDocumentDateEndBlockPlan: TDateTimeField
      FieldName = 'DateEndBlockPlan'
    end
    object QDocumentDateEndBlockReal: TDateTimeField
      FieldName = 'DateEndBlockReal'
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
    object QDocumentSubconfig: TIntegerField
      FieldName = 'SubconfigID'
    end
  end
  object DataSource1: TDataSource
    DataSet = QDocument
    Left = 120
    Top = 248
  end
  object QListUsers: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    Left = 296
    Top = 232
  end
  object QListToDo: TADOQuery
    LockType = ltReadOnly
    Parameters = <>
    Left = 296
    Top = 264
  end
  object DS_QListToDo: TDataSource
    DataSet = QListToDo
    Left = 328
    Top = 264
  end
  object DS_QListUsers: TDataSource
    DataSet = QListUsers
    Left = 328
    Top = 232
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 184
    Top = 232
  end
end
