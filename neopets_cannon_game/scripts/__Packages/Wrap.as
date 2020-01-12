if(!_global.Wrap)
{
   _global.Wrap.prototype = new MovieClip().wrapping = function()
   {
      var _loc1_ = this;
      if(_loc1_._x + _loc1_._width / 4 + _loc1_.world_mc._x < 0)
      {
         _loc1_._x = _loc1_._x + _loc1_._width / 2;
      }
      else if(_loc1_._x + _loc1_._width / 4 + _loc1_.world_mc._x > 650)
      {
         _loc1_._x = _loc1_._x - _loc1_._width / 2;
      }
   };
   _global.Wrap.prototype = new MovieClip().onStartWrapping = function()
   {
      this.onEnterFrame = this.wrapping;
   };
   _global.Wrap.prototype = new MovieClip().onStopWrapping = function()
   {
      this.onEnterFrame = null;
   };
   §§push(ASSetPropFlags(_global.Wrap.prototype,null,1));
}
§§pop();
