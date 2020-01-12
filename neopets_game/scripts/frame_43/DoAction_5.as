_global.PlayerUtilityClip = function(clip)
{
   this.init(clip);
};
var obj = PlayerUtilityClip.prototype;
obj.init = function(clip)
{
   this.pClip = clip;
};
obj.checkBodyFrame = function(onDone, args)
{
   var _loc1_ = this;
   _loc1_.onEnterFrame = undefined;
   _loc1_.onDone = onDone;
   _loc1_.pArgs = args;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(_loc1_.pClip.body._currentframe == _loc1_.pClip.body._totalframes)
      {
         _loc1_.pClip[_loc1_.onDone](_loc1_.pArgs);
         _loc1_.onEnterFrame = undefined;
      }
   };
};
obj.quitGame = function()
{
   this.onEnterFrame = eval(undefined)();
   this.removeMovieClip();
};
