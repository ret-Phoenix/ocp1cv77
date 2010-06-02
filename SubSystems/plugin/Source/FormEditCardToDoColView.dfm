object frmEditCardToDoColView: TfrmEditCardToDoColView
  Left = 719
  Top = 278
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1099#1074#1086#1076#1072' '#1082#1086#1083#1086#1085#1086#1082' '#1074' '#1089#1087#1080#1089#1082#1077' '#1079#1072#1076#1072#1095
  ClientHeight = 492
  ClientWidth = 404
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
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 80
    Top = 24
    Width = 313
    Height = 21
    DataField = 'Name'
    DataSource = DataSource1
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 8
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnPost: TButton
    Left = 88
    Top = 456
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 4
    OnClick = btnPostClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 456
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 385
    Height = 401
    Caption = #1050#1086#1083#1086#1085#1082#1080
    TabOrder = 2
    object btnUp: TButton
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = #1042#1074#1077#1088#1093
      TabOrder = 0
      OnClick = btnUpClick
    end
    object btnDown: TButton
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = #1042#1085#1080#1079
      TabOrder = 1
      OnClick = btnDownClick
    end
    object ListViewCol: TListView
      Left = 6
      Top = 48
      Width = 373
      Height = 345
      Checkboxes = True
      Columns = <
        item
          AutoSize = True
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        end
        item
          Caption = #1064#1080#1088#1080#1085#1072
          Width = 55
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      OnCompare = ListViewColCompare
      OnDblClick = ListViewColDblClick
      OnMouseUp = ListViewColMouseUp
    end
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from ToDoViewColumns')
    Left = 152
    Top = 112
    object QDocumentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QDocumentName: TWideStringField
      FieldName = 'Name'
      Size = 50
    end
    object QDocumentFName: TWideStringField
      FieldName = 'FName'
      Size = 8
    end
    object QDocumentFPriority: TWideStringField
      FieldName = 'FPriority'
      Size = 8
    end
    object QDocumentFSeriousnessName: TWideStringField
      FieldName = 'FSeriousnessName'
      Size = 8
    end
    object QDocumentFStatusName: TWideStringField
      FieldName = 'FStatusName'
      Size = 8
    end
    object QDocumentFDateStart: TWideStringField
      FieldName = 'FDateStart'
      Size = 8
    end
    object QDocumentFDateEnd: TWideStringField
      FieldName = 'FDateEnd'
      Size = 8
    end
    object QDocumentFDateStartPlan: TWideStringField
      FieldName = 'FDateStartPlan'
      Size = 8
    end
    object QDocumentFDateEndPlan: TWideStringField
      FieldName = 'FDateEndPlan'
      Size = 8
    end
    object QDocumentFRecipientName: TWideStringField
      FieldName = 'FRecipientName'
      Size = 8
    end
    object QDocumentFConfigName: TWideStringField
      FieldName = 'FConfigName'
      Size = 8
    end
    object QDocumentFSubconfigName: TWideStringField
      FieldName = 'FSubconfigName'
      Size = 8
    end
    object QDocumentFSubsystems: TWideStringField
      FieldName = 'FSubsystems'
      Size = 8
    end
    object QDocumentFMDObjTypes: TWideStringField
      FieldName = 'FMDObjTypes'
      Size = 8
    end
    object QDocumentFMDObj: TWideStringField
      FieldName = 'FMDObj'
      Size = 8
    end
    object QDocumentFManagerName: TWideStringField
      FieldName = 'FManagerName'
      Size = 8
    end
    object QDocumentFReliseName: TWideStringField
      FieldName = 'FReliseName'
      Size = 8
    end
    object sQDocumentFCR: TStringField
      FieldName = 'FCRT'
      Size = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = QDocument
    Left = 152
    Top = 144
  end
end
