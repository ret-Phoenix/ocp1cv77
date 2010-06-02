object frmEditCardSubconfig: TfrmEditCardSubconfig
  Left = 356
  Top = 215
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
  ClientHeight = 289
  ClientWidth = 379
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
    Top = 48
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit1
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 24
    Height = 13
    Caption = #1055#1091#1090#1100
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 8
    Top = 128
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = DBMemo1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 361
    Height = 21
    DataField = 'ConfigID'
    DataSource = DS_QDocument
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DS_QListConfigs
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 64
    Width = 361
    Height = 21
    DataField = 'Name'
    DataSource = DS_QDocument
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 104
    Width = 335
    Height = 21
    DataField = 'Path'
    DataSource = DS_QDocument
    TabOrder = 3
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 144
    Width = 361
    Height = 105
    DataField = 'Note'
    DataSource = DS_QDocument
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 168
    Top = 256
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object btnPost: TButton
    Left = 88
    Top = 256
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 6
    OnClick = btnPostClick
  end
  object btnOk: TButton
    Left = 8
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
    OnClick = btnOkClick
  end
  object btnChoiceDir: TBitBtn
    Left = 345
    Top = 103
    Width = 25
    Height = 25
    TabOrder = 2
    OnClick = btnChoiceDirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
      6666666666666666666666666666666666666666666666666666000000000006
      66667777777777766666003333333330666677666666666766660B0333333333
      066676766666666676660FB033333333306676676666666667660BFB03333333
      330676667666666666760FBFB0000000000076666777777777770BFBFBFBFB06
      666676666666667666660FBFBFBFBF06666676666666667666660BFB00000006
      6666766677777776666660006666666600066777666666667776666666666666
      6006666666666666677666666666066606066666666676667676666666666000
      6666666666666777666666666666666666666666666666666666}
    NumGlyphs = 2
  end
  object QDocument: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from subconfigs')
    Left = 176
    Top = 168
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
    object QDocumentPath: TStringField
      FieldName = 'Path'
      Size = 255
    end
  end
  object QListConfigs: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from configs')
    Left = 176
    Top = 200
  end
  object DS_QDocument: TDataSource
    DataSet = QDocument
    Left = 208
    Top = 168
  end
  object DS_QListConfigs: TDataSource
    DataSet = QListConfigs
    Left = 208
    Top = 200
  end
end
