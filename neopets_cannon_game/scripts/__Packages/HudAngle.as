if(!_global.HudAngle)
{
   _global.HudAngle.prototype = new MovieClip().onHUDangleUpdate = function(rot)
   {
      this.my_mc.angleArm_mc._rotation = rot;
   };
   _global.HudAngle.prototype = new MovieClip().onDefaultAngle = function()
   {
      this.my_mc.angleArm_mc._rotation = 80;
   };
   §§push(ASSetPropFlags(_global.HudAngle.prototype,null,1));
}
§§pop();
