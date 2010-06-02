object frmEditCardDBChangeRecord: TfrmEditCardDBChangeRecord
  Left = 508
  Top = 267
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1080#1089#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1073#1098#1077#1082#1090#1072' '#1052#1044
  ClientHeight = 369
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
    Top = 29
    Width = 95
    Height = 13
    Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
  end
  object Label3: TLabel
    Left = 8
    Top = 50
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 8
    Top = 144
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
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
  object Label5: TLabel
    Left = 8
    Top = 99
    Width = 76
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object Label6: TLabel
    Left = 8
    Top = 120
    Width = 39
    Height = 13
    Caption = #1047#1072#1076#1072#1095#1072':'
  end
  object btnManageParentToDoShow: TSpeedButton
    Left = 376
    Top = 120
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
    Left = 392
    Top = 120
    Width = 17
    Height = 20
    Glyph.Data = {
      62000000424D62000000000000003E0000002800000009000000090000000100
      010000000000240000000000000000000000020000000200000000000000FFFF
      FF00FF80E600B680E600B6800000FF800000FF800000FF80E600FF800000FF80
      E600FF800000}
    OnClick = btnManageParentToDoChoiceClick
  end
  object DBEdit1: TDBEdit
    Left = 275
    Top = 1
    Width = 134
    Height = 21
    DataField = 'ID'
    DataSource = dsQDocument
    Enabled = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 0
  end
  object JvDBDateEdit1: TJvDBDateEdit
    Left = 105
    Top = 72
    Width = 97
    Height = 21
    DataField = 'DateChange'
    DataSource = dsQDocument
    TabOrder = 3
  end
  object JvDBLookupCombo1: TJvDBLookupCombo
    Left = 105
    Top = 24
    Width = 305
    Height = 21
    DataField = 'SubconfigID'
    DataSource = dsQDocument
    LookupField = 'id'
    LookupDisplay = 'name'
    LookupSource = dsQListSubconfigs
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 105
    Top = 48
    Width = 305
    Height = 21
    DataField = 'Name'
    DataSource = dsQDocument
    TabOrder = 2
  end
  object JvDBLookupCombo2: TJvDBLookupCombo
    Left = 105
    Top = 96
    Width = 305
    Height = 21
    DataField = 'UserID'
    DataSource = dsQDocument
    LookupField = 'id'
    LookupDisplay = 'name'
    LookupSource = dsQListUsers
    TabOrder = 4
  end
  object JvDBLookupCombo3: TJvDBLookupCombo
    Left = 105
    Top = 120
    Width = 270
    Height = 21
    DataField = 'ToDoID'
    DataSource = dsQDocument
    LookupField = 'ID'
    LookupDisplay = 'Name'
    LookupSource = dsQListToDo
    TabOrder = 5
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 160
    Width = 401
    Height = 169
    DataField = 'Note'
    DataSource = dsQDocument
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object btnOk: TButton
    Left = 8
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 7
    OnClick = btnOkClick
  end
  object btnPost: TButton
    Left = 88
    Top = 336
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 8
    OnClick = btnPostClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 336
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 9
    OnClick = btnCancelClick
  end
  object QDocument: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from MDObjBlocksChange')
    Left = 24
    Top = 168
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentDateChange: TDateTimeField
      FieldName = 'DateChange'
    end
    object QDocumentSubconfigID: TIntegerField
      FieldName = 'SubconfigID'
    end
    object QDocumentMDObj: TIntegerField
      FieldName = 'MDObj'
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 100
    end
    object QDocumentUserID: TIntegerField
      FieldName = 'UserID'
    end
    object QDocumentToDoID: TIntegerField
      FieldName = 'ToDoID'
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
  end
  object dsQDocument: TDataSource
    DataSet = QDocument
    Left = 56
    Top = 168
  end
  object QListSubconfigs: TADOQuery
    Parameters = <>
    Left = 24
    Top = 200
  end
  object QListUsers: TADOQuery
    Parameters = <>
    Left = 24
    Top = 232
  end
  object QListToDo: TADOQuery
    Parameters = <>
    Left = 24
    Top = 264
  end
  object dsQListSubconfigs: TDataSource
    DataSet = QListSubconfigs
    Left = 56
    Top = 200
  end
  object dsQListUsers: TDataSource
    DataSet = QListUsers
    Left = 56
    Top = 232
  end
  object dsQListToDo: TDataSource
    DataSet = QListToDo
    Left = 56
    Top = 264
  end
end
