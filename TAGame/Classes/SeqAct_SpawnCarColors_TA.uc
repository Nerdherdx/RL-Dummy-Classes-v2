/*******************************************************************************
 * SeqAct_ExplodeGameBall_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqAct_SpawnCarColors_TA extends SequenceAction;

struct SpawnCarColorSet
{
    var() CarColorSet_TA ColorSet;
    var() bool bRender;

    structdefaultproperties
    {
        ColorSet=none
        bRender=true
    }
};

var(Accent) SpawnCarColorSet AccentColors;
var(Accent) LinearColor AccentTeamColor;
var(Team) SpawnCarColorSet BlueTeamColors;
var(Team) SpawnCarColorSet OrangeTeamColors;
var(Team) LinearColor TeamAccentColor;
var() ProductAsset_Body_TA Body;
var() ProductAsset_Skin_TA Skin;
var() int CarYaw;
var() float CarOffsetX;
var() float CarOffsetY;
var() float SetOffsetY;
var transient float BaseOffsetY;

defaultproperties
{
    ObjCategory="TAGame"
	
	AccentColors=(ColorSet=none,bRender=true)
    AccentTeamColor=(R=0.0,G=0.0,B=0.0,A=1.0)
    BlueTeamColors=(ColorSet=none,bRender=true)
    OrangeTeamColors=(ColorSet=none,bRender=true)
    TeamAccentColor=(R=0.0,G=0.0,B=0.0,A=1.0)
    CarYaw=-90
    CarOffsetX=100.0
    CarOffsetY=200.0
    SetOffsetY=300.0
    bCallHandler=false
    VariableLinks.Empty
    ObjName="Spawn Car Colors"
}

event Activated()
{
    //return;    
}

protected function SpawnAccentCars(CarColorSet_TA AccentColorSet, LinearColor TeamColor)
{
    local int X, Y, ColorID;
    local float OffsetX, OffsetY;
	//Return
}

protected function SpawnTeamCars(CarColorSet_TA TeamColorSet, LinearColor AccentColor)
{
    local int X, Y, ColorID;
    local float OffsetX, OffsetY;
    local CarPreviewActor_TA SpawnedCar;
	//Return
}

protected final function LinearColor GetRGBFromColorSet(LinearColor Hue, LinearColor SV)
{
    local LinearColor HSV;
	//Return
}

protected function CarPreviewActor_TA SpawnCar(LinearColor TeamColor, LinearColor AccentColor, float OffsetX, float OffsetY)
{
    local Vector Location;
    local Rotator Rotation;
    local CarPreviewActor_TA PreviewActor;
    local LoadoutData Loadout;
	//Return
}