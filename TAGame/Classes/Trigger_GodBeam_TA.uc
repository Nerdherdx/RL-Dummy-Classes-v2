/*******************************************************************************
 * Trigger_GodBeam_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Trigger_GodBeam_TA extends Trigger_Dynamic;

var export editinline byte PSC;
var float OffParticle;
var repnotify bool bFinished;

delegate OnTouched(float Toucher)
{
    //return;    
}


simulated function OnFinished()
{   
}
/**
simulated event Touch(AITraits Other, name OtherComp, @NULL HitLocation, @NULL HitNormal)
{

}
**/