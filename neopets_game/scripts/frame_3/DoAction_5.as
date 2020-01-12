_global.Zoom_MC = function(pX, pY)
{
   this.init(pX,pY);
};
Zoom_MC.extend(SpriteClass);
var obj = Zoom_MC.prototype;
obj.init = function(pX, pY)
{
   super.init(pX,pY);
   this.scaleAmt = 0.5;
};
obj.easeToFullScale = function()
{
   var _loc1_ = this;
   _loc1_._xscale = _loc1_._yscale = 0;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(_loc1_._xscale > 99.5)
      {
         _loc1_._xscale = _loc1_._yscale = 100;
         _loc1_.onEnterFrame = undefined;
      }
      else
      {
         var _loc2_ = (100 - _loc1_._xscale) * 0.75;
         _loc1_._xscale = _loc1_._yscale = _loc1_._yscale + _loc2_;
         _loc1_.scaleAmt = _loc1_.scaleAmt + 1.5;
      }
   };
};
obj.easeToZero = function()
{
   var _loc1_ = this;
   _loc1_._xscale = _loc1_._yscale = 100;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(_loc1_._xscale < 1)
      {
         _loc1_.broadcastMessage("onSubPageDone");
         _loc1_.removeMovieClip();
      }
      else
      {
         var _loc2_ = _loc1_._xscale * 0.75;
         _loc1_._xscale = _loc1_._yscale = _loc1_._yscale - _loc2_;
      }
   };
};
