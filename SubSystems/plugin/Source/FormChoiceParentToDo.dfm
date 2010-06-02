object frmChoiceParentToDo: TfrmChoiceParentToDo
  Left = 427
  Top = 284
  Width = 503
  Height = 359
  Caption = #1047#1072#1076#1072#1095#1080
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
  object tvToDo: TTreeView
    Left = 0
    Top = 0
    Width = 495
    Height = 332
    Align = alClient
    Indent = 19
    TabOrder = 0
    OnCustomDrawItem = tvToDoCustomDrawItem
    OnDblClick = tvToDoDblClick
    OnExpanding = tvToDoExpanding
  end
  object QList: TADOQuery
    Parameters = <>
    Left = 96
    Top = 56
  end
end
