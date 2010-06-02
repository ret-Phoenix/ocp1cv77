library SubSystems;
{$R 'string.res' 'string.rc'}
{%ToDo 'SubSystems.todo'}
                          
uses
  ComServ,
  FormSubSystemsMain in 'FormSubSystemsMain.pas' {frmSubSystems: TActiveForm},
  FormToDoAccessoryTuning in 'FormToDoAccessoryTuning.pas' {frmToDoAccessoryTuning},
  FormEditExtPath in 'FormEditExtPath.pas' {frmEditExtPath},
  FormEditCardToDo in 'FormEditCardToDo.pas' {frmEditCardToDo},
  FormEditCardTemplate in 'FormEditCardTemplate.pas' {frmEditCardTemplate},
  FormOptions in 'FormOptions.pas' {frmOptions},
  ExtTreeFiles in 'ExtTreeFiles.pas',
  SubSystems_TLB in 'SubSystems_TLB.pas',
  MDTree in 'MDTree.pas' {MDTree: CoClass},
  AvailableSubSystems in 'AvailableSubSystems.pas' {AvailableSubSystems: CoClass},
  ObjectClasses in 'ObjectClasses.pas' {ObjectClasses: CoClass},
  CfgList in 'CfgList.pas' {CfgList: CoClass},
  TuningMDObj in 'TuningMDObj.pas' {TuningMDObj: CoClass},
  TuningSubSystemsList in 'TuningSubSystemsList.pas' {TuningSubSystemsList: CoClass},
  ExtFrmsList in 'ExtFrmsList.pas' {ExtFrmsList: CoClass},
  Links in 'Links.pas' {Links: CoClass},
  Templates in 'Templates.pas' {Templates: CoClass},
  ToDoList in 'ToDoList.pas' {ToDoList: CoClass},
  Options in 'Options.pas' {Options: CoClass},
  Bookmarks in 'Bookmarks.pas' {Bookmarks: CoClass},
  OpenConf_TLB in 'OpenConf_TLB.pas',
  ObjectNote in 'ObjectNote.pas',
  FormEditCardNote in 'FormEditCardNote.pas' {frmEditCardNote},
  ObjectNoteList in 'ObjectNoteList.pas',
  Relises in 'Relises.pas',
  FormEditCardRelise in 'FormEditCardRelise.pas' {frmEditCardRelise},
  StatusList in 'StatusList.pas' {StatusList: CoClass},
  FormEditCardStatus in 'FormEditCardStatus.pas' {frmEditCardStatus},
  FormEditCardSubsystem in 'FormEditCardSubsystem.pas' {frmEditCardSubsystem},
  FormEditCardConfig in 'FormEditCardConfig.pas' {frmEditCardConfig},
  FormEditCardSubconfig in 'FormEditCardSubconfig.pas' {frmEditCardSubconfig},
  Subconfigs in 'Subconfigs.pas' {Subconfigs: CoClass},
  ListUsers in 'ListUsers.pas' {ListUsers: CoClass},
  FormEditCardUser in 'FormEditCardUser.pas' {frmEditCardUser},
  ListCategoryes in 'ListCategoryes.pas' {ListCategoryes: CoClass},
  ListSeriousness in 'ListSeriousness.pas' {ListSeriousness: CoClass},
  FormEditCardCategory in 'FormEditCardCategory.pas' {frmEditCardCategory},
  FormEditCardSeriousness in 'FormEditCardSeriousness.pas' {frmEditCardSeriousness},
  ToDoViewColumns in 'ToDoViewColumns.pas' {ToDoViewColumns: CoClass},
  FormEditCardToDoColView in 'FormEditCardToDoColView.pas' {frmEditCardToDoColView},
  FormChoiceParentToDo in 'FormChoiceParentToDo.pas' {frmChoiceParentToDo},
  MDObjBlocks in 'MDObjBlocks.pas' {MDObjBlocks: CoClass},
  FormEditCardMDObjBlock in 'FormEditCardMDObjBlock.pas' {frmEditCardMDObjBlock},
  DBChangesLog in 'DBChangesLog.pas' {DBChangesLog: CoClass},
  FormEditCardDBChangeRecord in 'FormEditCardDBChangeRecord.pas' {frmEditCardDBChangeRecord};

{$E dll}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

