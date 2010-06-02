object Form1: TForm1
  Left = 271
  Top = 218
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 483
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = #1060#1072#1081#1083' '#1076#1072#1085#1085#1099#1093':'
  end
  object DataFileName: TJvFilenameEdit
    Left = 88
    Top = 8
    Width = 393
    Height = 21
    TabOrder = 0
    Text = 'DataFileName'
    OnChange = DataFileNameChange
  end
  object btnRunUpdate: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 1
    OnClick = btnRunUpdateClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 72
    Width = 473
    Height = 25
    ReadOnly = True
    TabOrder = 2
  end
  object chkSQL: TCheckBox
    Left = 104
    Top = 40
    Width = 121
    Height = 17
    Caption = #1041#1044' '#1074' '#1092#1086#1088#1084#1072#1090#1077' SQL'
    TabOrder = 3
  end
  object btnCreateSQLViews: TButton
    Left = 256
    Top = 40
    Width = 169
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103' SQL'
    TabOrder = 4
    OnClick = btnCreateSQLViewsClick
  end
  object Memo2: TMemo
    Left = 8
    Top = 104
    Width = 473
    Height = 377
    Lines.Strings = (
      'CREATE PROCEDURE spGetToDoCardMainData (@ID int) AS'
      ''
      'SELECT     '
      #9'T.ID, '
      #9'T.Name, '
      #9'T.Priority, '
      #9'T.Note, '
      #9'T.Done, '
      #9'T.DateStart, '
      #9'T.DateEnd, '
      #9'T.ForReport, '
      #9'T.ReportText, '
      #9'T.DateStartPlan, '
      #9'T.DateEndPlan, '
      #9'T.UnsolvedProblem, '
      '             dbo.RefCR.ID AS CR_ID, '
      #9'dbo.RefCR.Name AS CR_Name, '
      #9'dbo.Seriousness.Name AS Seriousness, '
      #9'dbo.Statuses.Name AS Status, '
      '             dbo.Users.Name AS RecipientName'
      'FROM         '
      #9'dbo.ToDo T'
      
        #9'left JOIN dbo.Seriousness ON dbo.Seriousness.ID = T.Seriousness' +
        'ID '
      #9'left JOIN dbo.RefCR ON T.CRT = dbo.RefCR.ID '
      #9'left JOIN dbo.Statuses ON T.StatusID = dbo.Statuses.ID '
      #9'left JOIN dbo.Users ON T.RecipientID = dbo.Users.ID'
      ''
      'WHERE'
      #9'T.ID = @ID'
      ''
      'CREATE VIEW dbo.ListCR'
      'AS'
      
        'SELECT     dbo.RefCR.ID, dbo.RefCR.Name, dbo.RefCR.Note, dbo.Ref' +
        'CR.DateStartPlan, '
      'dbo.RefCR.DateEndPlan, dbo.Statuses.Name AS '#1057#1090#1072#1090#1091#1089', '
      
        '                      Statuses_1.Name AS '#1057#1090#1072#1090#1091#1089#1056#1077#1072#1083#1100#1085#1099#1081', dbo.Use' +
        'rs.Name AS '#1048#1085#1080#1094#1080#1072#1090#1086#1088', '
      'Users_1.Name AS '#1050#1091#1088#1072#1090#1086#1088
      'FROM         dbo.RefCR LEFT OUTER JOIN'
      
        '                      dbo.Users AS Users_1 ON dbo.RefCR.Curator ' +
        '= Users_1.ID LEFT OUTER JOIN'
      
        '                      dbo.Users ON dbo.RefCR.Initiator = dbo.Use' +
        'rs.ID LEFT OUTER JOIN'
      
        '                      dbo.Statuses AS Statuses_1 ON dbo.RefCR.St' +
        'ateReal = Statuses_1.ID LEFT '
      'OUTER JOIN'
      
        '                      dbo.Statuses ON dbo.RefCR.StateSystem = db' +
        'o.Statuses.ID'
      ''
      ''
      'CREATE VIEW dbo.ToDoCardsMainInfo'
      'AS'
      
        'SELECT     T.ID, T.Name, T.Priority, T.Note, T.Done, T.DateStart' +
        ', T.DateEnd, T.ForReport, '
      
        'T.ReportText, T.DateStartPlan, T.DateEndPlan, T.UnsolvedProblem,' +
        ' '
      
        '                      dbo.RefCR.ID AS CR_ID, dbo.RefCR.Name AS C' +
        'R_Name, dbo.Seriousness.Name '
      'AS Seriousness, dbo.Statuses.Name AS Status, '
      '                      dbo.Users.Name AS RecipientName'
      'FROM         dbo.Statuses RIGHT OUTER JOIN'
      
        '                      dbo.ToDo T ON dbo.Statuses.ID = T.StatusID' +
        ' LEFT OUTER JOIN'
      
        '                      dbo.Users ON T.RecipientID = dbo.Users.ID ' +
        'LEFT OUTER JOIN'
      
        '                      dbo.RefCR ON T.CRT = dbo.RefCR.ID LEFT OUT' +
        'ER JOIN'
      
        '                      dbo.Seriousness ON T.SeriousnessID = dbo.S' +
        'eriousness.ID'
      ''
      'CREATE VIEW dbo.ToDoForFilter'
      'AS'
      ''
      'SELECT'
      #9'Configs.Name AS ConfigName, '
      #9'Subconfigs.Name AS SubconfigName, '
      #9'Relises.Name AS ReliseName, '
      #9'Statuses.Name AS StatusName, '
      '        Author.Name AS AuthorName, '
      #9'Seriousness.Name AS SeriousnessName, '
      #9'ListCategoryes.ObjId AS ListCategoryesObjId, '
      '        ListCategoryes.Name AS ListCategoryeName, '
      #9'ListSubSystems.ObjId AS ListSubSystemsObjId, '
      #9'ListSubSystems.Name AS ListSubSystemsName, '
      '        ListIniciators.ObjId AS ListIniciatorsObjId, '
      #9'ListIniciators.Name AS ListIniciatorsName, '
      #9'Recipient.Name AS RecipientName, '
      '        LastEditor.Name AS LastEditorName, '
      #9'Manager.Name AS ManagerName, '
      #9'ParentToDo.Name AS ParentToDoName, '
      #9'ListMDObjects.ObjId AS MDObj, '
      '        ListTypeOjects.ObjId AS MDObjTypes, '
      #9'ToDo.ID, '
      #9'ToDo.ConfigID, '
      #9'ToDo.Name, '
      #9'ToDo.Priority, '
      #9'ToDo.Done, '
      #9'ToDo.DateStart, '
      '        ToDo.DateEnd, '
      #9'ToDo.Complete,'
      
        '        (SELECT COUNT(TL.id) FROM ToDo TL WHERE TL.ParentToDoId ' +
        '= ToDo.id) AS HasChild, '
      #9'ToDo.SubconfigID, '
      #9'ToDo.RecipientID, '
      #9'ToDo.ReliseID, '
      #9'ToDo.SeriousnessID, '
      '        ToDo.StatusID, '
      #9'ToDo.ManagerID, '
      #9'ToDo.CRT, '
      #9'ToDo.AuthorID, '
      #9'ToDo.LastEditorID, '
      #9'ToDo.ForReport, '
      #9'ToDo.DateStartPlan, '
      '        ToDo.DateEndPlan, '
      #9'ToDo.ParentToDoID, '
      #9'ToDo.Note, '
      #9'ToDo.UnsolvedProblem'
      'FROM         '
      #9'ToDo '
      #9'LEFT OUTER JOIN Configs ON '
      #9#9'ToDo.ConfigID = Configs.ID '
      #9'LEFT OUTER JOIN Subconfigs ON '
      #9#9'ToDo.SubconfigID = Subconfigs.ID '
      #9'LEFT OUTER JOIN Relises ON '
      #9#9'ToDo.ReliseID = Relises.ID '
      #9'LEFT OUTER JOIN Statuses ON '
      #9#9'ToDo.StatusID = Statuses.ID '
      #9'LEFT OUTER JOIN Seriousness ON '
      #9#9'ToDo.SeriousnessID = Seriousness.ID '
      #9'LEFT OUTER JOIN Users Author ON '
      #9#9'ToDo.AuthorID = Author.ID '
      #9'LEFT OUTER JOIN '
      #9#9'(SELECT     '
      #9#9#9'ToDoAccessory.ID, '
      #9#9#9'ToDoAccessory.ToDoID, '
      #9#9#9'ToDoAccessory.TypeDataID, '
      #9#9#9'ToDoAccessory.ObjId, '
      #9#9#9'Categoryes.Name'
      #9#9'FROM '
      #9#9#9'ToDoAccessory '
      #9#9#9'LEFT JOIN Categoryes ON '
      #9#9#9#9'ToDoAccessory.ObjId = Categoryes.ID'
      #9#9'WHERE      '
      #9#9#9'ToDoAccessory.TypeDataID = 5'
      #9#9') ListCategoryes ON '
      #9#9#9'ToDo.ID = ListCategoryes.ToDoID '
      #9'LEFT OUTER JOIN '
      #9#9'(SELECT     '
      #9#9#9'ToDoAccessory.ID, '
      #9#9#9'ToDoAccessory.ToDoID, '
      #9#9#9'ToDoAccessory.TypeDataID, '
      #9#9#9'ToDoAccessory.ObjId, '
      #9#9#9'Users.Name'
      #9#9'FROM '
      #9#9#9'ToDoAccessory '
      #9#9#9'LEFT JOIN Users ON '
      #9#9#9#9'ToDoAccessory.ObjId = Users.ID'
      #9#9'WHERE      '
      #9#9#9'ToDoAccessory.TypeDataID = 4'
      #9#9') ListIniciators ON '
      #9#9#9'ToDo.ID = ListIniciators.ToDoID '
      #9'LEFT OUTER JOIN Users Recipient ON '
      #9#9'ToDo.RecipientID = Recipient.ID '
      #9'LEFT OUTER JOIN Users LastEditor ON '
      #9#9'ToDo.LastEditorID = LastEditor.ID '
      #9'LEFT OUTER JOIN Users Manager ON '
      #9#9'ToDo.ManagerID = Manager.ID '
      #9'LEFT OUTER JOIN ToDo ParentToDo ON '
      #9#9'ToDo.ParentToDoID = ParentToDo.ID '
      #9'LEFT OUTER JOIN '
      #9#9'(SELECT     '
      #9#9#9'ToDoAccessory.ID, '
      #9#9#9'ToDoAccessory.ToDoID, '
      #9#9#9'ToDoAccessory.TypeDataID, '
      #9#9#9'ToDoAccessory.ObjId, '
      #9#9#9'SubSystems.Name'
      #9#9'FROM          '
      #9#9#9'ToDoAccessory '
      #9#9#9'LEFT JOIN SubSystems ON '
      #9#9#9#9'ToDoAccessory.ObjId = SubSystems.ID'
      #9#9'WHERE      '
      #9#9#9'ToDoAccessory.TypeDataID = 1'
      #9#9') ListSubSystems ON '
      #9#9#9'ToDo.ID = ListSubSystems.ToDoID '
      #9'LEFT OUTER JOIN '
      #9#9'(SELECT     '
      #9#9#9'ToDoAccessory.ID, '
      #9#9#9'ToDoAccessory.ToDoID, '
      #9#9#9'ToDoAccessory.TypeDataID, '
      #9#9#9'ToDoAccessory.ObjId'
      #9#9'FROM          '
      #9#9#9'ToDoAccessory'
      #9#9'WHERE      '
      #9#9#9'ToDoAccessory.TypeDataID = 2'
      #9#9') ListTypeOjects ON '
      #9#9#9'ToDo.ID = ListTypeOjects.ToDoID '
      #9'LEFT OUTER JOIN '
      #9#9'(SELECT     '
      #9#9#9'ToDoAccessory.ID, '
      #9#9#9'ToDoAccessory.ToDoID, '
      #9#9#9'ToDoAccessory.TypeDataID, '
      #9#9#9'ToDoAccessory.ObjId'
      #9#9'FROM          '
      #9#9#9'ToDoAccessory'
      #9#9'WHERE      '
      #9#9#9'ToDoAccessory.TypeDataID = 3'
      #9#9') ListMDObjects ON '
      #9#9#9'ToDo.ID = ListMDObjects.ToDoID'
      #9)
    TabOrder = 5
  end
  object QDB: TADOQuery
    Connection = SubSystemConnection
    Parameters = <>
    Left = 160
    Top = 160
  end
  object SubSystemConnection: TADOConnection
    LoginPrompt = False
    Left = 128
    Top = 160
  end
end
