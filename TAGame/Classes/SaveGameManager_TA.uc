/*******************************************************************************
 * SaveGameManager_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SaveGameManager_TA extends Object
    native;

enum ESaveGameResult
{
    SaveGameResult_Pending,
    SaveGameResult_Success,
    SaveGameResult_Error,
    SaveGameResult_NoSpace,
    SaveGameResult_MAX
};

struct native SaveDataExportTask
{
    var int ControllerIndex;
    var init array<init byte> Data;
    var init string Path;
    var SaveGameManager_TA.ESaveGameResult Result;

};

var private native transient array<Pointer> ExportTasks;
var privatewrite string SaveDataID;
var privatewrite transient LocalPlayer_TA Player;
var privatewrite export editinline SaveData_TA SaveData;
var const int HardVersion;
var private export editinline TickComponent_X TickComponent;
//var config float MinTimeBetweenSaves;
var transient float LastSaveTime;
var privatewrite transient Error_X DataLoadError;
var privatewrite transient Error_X DataSaveError;
var privatewrite transient bool bDataLoaded;
var privatewrite transient bool bUserIgnoredLoadFailure;
var privatewrite transient bool bEnableSaving;
var privatewrite transient bool bDisableSaveOSS;
/**
var delegate<EventDataLoaded> __EventDataLoaded__Delegate;
var delegate<EventDataSaved> __EventDataSaved__Delegate;

delegate EventDataLoaded(SaveGameManager_TA Manager, SaveData_TA MySaveData, Error_X Error)
{
    //return;    
}

delegate EventDataSaved(SaveGameManager_TA Manager, SaveData_TA MySaveData, Error_X Error)
{
    //return;    
}
**/
/**

// Export USaveGameManager_TA::execSaveGameData(FFrame&, void* const)
native final function SaveGameManager_TA.ESaveGameResult SaveGameData(int ControllerIndex, Object RootObj, string PathName, int Version)
{
    //native.ControllerIndex;
    //native.RootObj;
    //native.PathName;
    //native.Version;        
}

// Export USaveGameManager_TA::execUpdateSaveResult(FFrame&, void* const)
native final function SaveGameManager_TA.ESaveGameResult UpdateSaveResult(int ControllerIndex)
{
    //native.ControllerIndex;        
}

// Export USaveGameManager_TA::execIsSaving(FFrame&, void* const)
native final function bool IsSaving();

// Export USaveGameManager_TA::execLoadGameData(FFrame&, void* const)
native final function Engine.Engine.EBasicLoadResult LoadGameData(int ControllerIndex, Object RootObj, string PathName, int Version)
{
    //native.ControllerIndex;
    //native.RootObj;
    //native.PathName;
    //native.Version;        
}

// Export USaveGameManager_TA::execDeleteGameData(FFrame&, void* const)
native final function bool DeleteGameData(int ControllerIndex, string PathName)
{
    //native.ControllerIndex;
    //native.PathName;        
}

// Export USaveGameManager_TA::execGetSaveDataSpace(FFrame&, void* const)
native static final function int GetSaveDataSpace(int ControllerIndex)
{
    //native.ControllerIndex;        
}
final function string GetSaveFilename()
{
    local string DBFolder;

    switch(class'PsyWebServer_X'.static.GetDBEnvironment())
    {
        // End:0x45
        case 0:
            DBFolder = "DBE_Test";
            // End:0xBE
            break;
        // End:0x60
        case 1:
            DBFolder = "DBE_Dev";
            // End:0xBE
            break;
        // End:0x7F
        case 2:
            DBFolder = "DBE_Staging";
            // End:0xBE
            break;
        // End:0xA1
        case 3:
            DBFolder = "DBE_Production";
            // End:0xBE
            break;
        // End:0xFFFF
        default:
            DBFolder = "DBE_Production";
            return ((("..\\..\\TAGame\\SaveData\\" $ DBFolder) $ "\\") $ SaveDataID) $ ".save";
    }
    //return ReturnValue;    
}

function Init(LocalPlayer_TA InPlayer)
{
    Player = InPlayer;
    // End:0x93
    if(NotEqual_QWordQWord(Player.GetUniqueNetId().Uid, @UnknownCastToken(0x62), 0))
    {
        SaveDataID = @UnknownCastToken(0x63);
        Player.GetUniqueNetId().Uid;
    }
    UnknownLocal_-1107224295
    // End:0xFFF9
    foreach @NULL
    {
        // Failed to decompile this line:
           
        // Index was out of range. Must be non-negative and less than the size of the collection.
        Parameter name: index
        // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in E:\Development\Unreal-Library\src\ByteCodeDecompiler.cs:line 1575
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in E:\Development\Unreal-Library\src\ByteCodeDecompiler.cs:line 1503
        // 1 & Type:ForEach Position:65529
}

final function HandlePlayerLoginStatusChange(OnlinePlayer_X OnlinePlayer)
{
    bDisableSaveOSS = OnlinePlayer.LoginStatus == 0;
    //return;    
}

function NotifyWhenLoaded(delegate<EventDataLoaded> Callback)
{
    // End:0x47
    if(bDataLoaded || DataLoadError != none)
    {
        EventDataLoaded(self, SaveData, DataLoadError);
    }
    // End:0x5A
    else
    {
        UnknownLocal_3125761
        @NULL
        @NULL
    }
}

function Load()
{
    local Engine.Engine.EBasicLoadResult LoadResult;

    LogInternal((("Savedata Load ControllerId=" $ string(Player.ControllerId)) @ "File=") $ GetSaveFilename(), 'SaveGame', true);
    LoadResult = Load_Internal();
    switch(LoadResult)
    {
        // End:0x8C
        case 0:
        // End:0x91
        case 1:
        // End:0xB0
        case 2:
            bDataLoaded = true;
            DataLoadError = none;
            // End:0x1E0
            break;
        // End:0xF8
        case 3:
            DataLoadError = class'Errors_X'.default.FileLoadCorrupt.CreateError();
            // End:0x1E0
            break;
        // End:0x140
        case 4:
            DataLoadError = class'Errors_X'.default.FileMountCorrupt.CreateError();
            // End:0x1E0
            break;
        // End:0x1DD
        case 5:
            DataLoadError = class'Errors_X'.default.FileLoadFail.CreateError(GetSaveFilename());
            class'Engine'.static.GetEngine().DeferredCommands.AddItem("bugreport LoadFail");
            // End:0x1E0
            break;
        // End:0xFFFF
        default:
            bEnableSaving = DataLoadError == none;
            OnDataLoaded();
            //return;
    }    
}

private final function Engine.Engine.EBasicLoadResult Load_Internal()
{
    local Engine.Engine.EBasicLoadResult Result;
    local string SaveFileName;

    // End:0x6C
    if(SaveData == none)
    {
        WarnInternal(("Unable to load: " $ "SaveData:") $ ((SaveData != none) ? string(SaveData.Name) : "None"));
        return 5;
    }
    SaveFileName = GetSaveFilename();
    // End:0xD0
    if(Len(SaveFileName) <= 0)
    {
        WarnInternal(("Unable to load " $ string(SaveData)) $ ": no filename specified!");
        return 5;
    }
    Result = LoadGameData(Player.ControllerId, SaveData, SaveFileName, HardVersion);
    LogInternal((("LoadGameData():" @ "Result:'") $ string(Result)) $ "'", 'SaveGame', true);
    return Result;
    //return ReturnValue;    
}

private final function OnDataLoaded()
{
    SaveData.HandleDataLoaded(self, DataLoadError);
    EventDataLoaded(self, SaveData, DataLoadError);
    //return;    
}

function EnableSaving()
{
    bEnableSaving = true;
    //return;    
}

function DisableSaving()
{
    bEnableSaving = false;
    //return;    
}

function HandleProceedWithDefaultSaveData()
{
    Save();
    DataLoadError = none;
    bDataLoaded = true;
    OnDataLoaded();
    //return;    
}

function UserIgnoredLoadFailure(bool bValue)
{
    bUserIgnoredLoadFailure = bValue;
    //return;    
}

function Save()
{
    local float NextSaveTime, TimeSinceLastSave;

    // End:0x45
    if(SaveData == none)
    {
        WarnInternal((("Unable to save: " $ "SaveData:'") $ string(SaveData)) $ "'");
        return;
    }
    TimeSinceLastSave = class'GameEngine_TA'.static.GetAbsoluteTime() - LastSaveTime;
    NextSaveTime = FMax(MinTimeBetweenSaves - TimeSinceLastSave, 0.0010);
    SetSaveTimer(NextSaveTime);
    //return;    
}

private final function SetSaveTimer(float Delay)
{
    // End:0x1E
    if(Delay <= float(0))
    {
        Save_Internal();
    }
    // End:0xC9
    else
    {
        // End:0x96
        if(TickComponent == none)
        {
            TickComponent = new (self) class'TickComponent_X';
            TickComponent.bTickWhenGamePaused = true;
            TickComponent.__TickDelegate__Delegate = Tick;
        }
        TickComponent.SetTimer(Delay, false, 'Save_Internal');
    }
    //return;    
}

private final function ClearSaveTimer()
{
    // End:0x2F
    if(TickComponent != none)
    {
        TickComponent.ClearAllTimers();
    }
    //return;    
}

private final function Save_Internal()
{
    local string SaveFileName;
    local SaveGameManager_TA.ESaveGameResult Result;

    // End:0x28
    if(IsSaving() || bDisableSaveOSS)
    {
        Save();
        return;
    }
    ClearSaveTimer();
    LastSaveTime = class'GameEngine_TA'.static.GetAbsoluteTime();
    DataSaveError = none;
    // End:0x77
    if(!bEnableSaving)
    {
        return;
    }
    SaveFileName = GetSaveFilename();
    // End:0xD9
    if(Len(SaveFileName) <= 0)
    {
        WarnInternal(("Unable to save" @ string(SaveData)) @ ": no filename specified!");
        return;
    }
    class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.AddSaveDataNoSpaceDialogCompleteDelegate(HandleNoSpaceSystemDialogComplete);
    Result = SaveGameData(Player.ControllerId, SaveData, SaveFileName, HardVersion);
    HandleSaveResult(Result);
    //return;    
}

private final function Tick(float DeltaTime)
{
    local SaveGameManager_TA.ESaveGameResult Result;

    Result = UpdateSaveResult(Player.ControllerId);
    HandleSaveResult(Result);
    //return;    
}

private final function HandleSaveResult(SaveGameManager_TA.ESaveGameResult Result)
{
    // End:0x37
    if(Result == 0)
    {
        TickComponent.SetTickable(true);
    }
    // End:0x20D
    else
    {
        TickComponent.SetTickable(false);
        switch(Result)
        {
            // End:0xA9
            case 1:
                LogInternal((("Saved" @ string(SaveData)) @ "to file") @ GetSaveFilename(), 'SaveGame', true);
                // End:0x1D0
                break;
            // End:0xFA
            case 3:
                DataSaveError = class'Errors_X'.default.FileSaveNoSpace.CreateError(GetSaveFilename());
                // End:0x1D0
                break;
            // End:0xFF
            case 2:
            // End:0xFFFF
            default:
                class'Engine'.static.GetEngine().DeferredCommands.AddItem("bugreport SaveFail");
                DataSaveError = class'Errors_X'.default.FileSaveFail.CreateError(GetSaveFilename());
                WarnInternal((("Failed to save" @ string(SaveData)) @ "to file") @ GetSaveFilename());
                // End:0x1D0
                break;
        }
        bEnableSaving = DataSaveError == none;
        EventDataSaved(self, SaveData, DataSaveError);
    }
    //return;    
}

private final function HandleNoSpaceSystemDialogComplete(bool bContinueWithouSaving)
{
    // End:0x26
    if(bContinueWithouSaving)
    {
        bEnableSaving = false;
        HandleProceedWithDefaultSaveData();
    }
    // End:0x30
    else
    {
        Save();
    }
    //return;    
}

function bool Delete()
{
    local string SaveFileName;

    SaveFileName = GetSaveFilename();
    // End:0x65
    if(Len(SaveFileName) <= 0)
    {
        WarnInternal(("Unable to delete " $ string(SaveData)) $ ": no filename specified!");
        return false;
    }
    return DeleteGameData(Player.ControllerId, SaveFileName);
    //return ReturnValue;    
}
**/