object frmEditCardNote: TfrmEditCardNote
  Left = 295
  Top = 231
  Width = 426
  Height = 431
  Caption = #1054#1087#1080#1089#1072#1085#1080#1077
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
  object Panel1: TPanel
    Left = 0
    Top = 363
    Width = 418
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
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
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 52
    Width = 418
    Height = 311
    Align = alClient
    DataField = 'Note'
    DataSource = DS_QDocument
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 97
      Height = 13
      Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103':'
    end
    object Label2: TLabel
      Left = 8
      Top = 35
      Width = 62
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090' '#1052#1044':'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 104
      Top = 5
      Width = 307
      Height = 21
      DataField = 'SubconfigID'
      DataSource = DS_QDocument
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DS_QListSubconfigs
      TabOrder = 0
    end
    object dblkcbbMDObj: TJvDBLookupCombo
      Left = 104
      Top = 27
      Width = 307
      Height = 21
      DataField = 'ObjID'
      DataSource = DS_QDocument
      LookupField = 'MDObjID'
      LookupDisplay = 'MDObjName'
      LookupSource = dsListMDStruct
      TabOrder = 1
    end
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from ObjectNote')
    Left = 256
    Top = 104
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentObjID: TIntegerField
      FieldName = 'ObjID'
    end
    object QDocumentNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
    end
    object QDocumentSubconfigID: TIntegerField
      FieldName = 'SubconfigID'
    end
    object QDocumentMDObjName: TWideStringField
      FieldName = 'MDObjName'
      Size = 100
    end
  end
  object DS_QDocument: TDataSource
    DataSet = QDocument
    Left = 200
    Top = 144
  end
  object QListSubconfigs: TADOQuery
    Parameters = <>
    Left = 72
    Top = 88
  end
  object DS_QListSubconfigs: TDataSource
    DataSet = QListSubconfigs
    OnDataChange = DS_QListSubconfigsDataChange
    Left = 104
    Top = 88
  end
  object qryQListMDStruct: TADOQuery
    AutoCalcFields = False
    ParamCheck = False
    Parameters = <>
    Left = 88
    Top = 144
  end
  object dsListMDStruct: TDataSource
    DataSet = qryQListMDStruct
    OnDataChange = dsListMDStructDataChange
    Left = 120
    Top = 144
  end
end
