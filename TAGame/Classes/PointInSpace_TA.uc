/*******************************************************************************
 * PointInSpace_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PointInSpace_TA extends Actor
    placeable;

var() editinline SpriteComponent Sprite;
var() editinline ArrowComponent Arrow;

defaultproperties
{
  Begin Object Class=SpriteComponent Name=Sprite
    Sprite=Texture2D'EditorResources.S_Actor'
   HiddenGame=True
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
  End Object
  Components.Add(Sprite)
  
  Begin Object Class=ArrowComponent Name=Arrow
  End Object
  Components.Add(Arrow)
	
}