_global.AutoSlideShow = function(pX, pY, fps, pFadeMs, pShowMs)
{
   this.init(pX,pY,fps,pFadeMs,pShowMs);
};
AutoSlideShow.extend(SpriteClass);
var obj = AutoSlideShow.prototype;
obj.init = function(pX, pY, fps, pFadeMs, pShowMs)
{
   var _loc1_ = this;
   super.init(pX,pY);
   _loc1_._alpha = 0;
   _loc1_.pFadeTime = pFadeMs;
   var _loc3_ = fps / (1000 / _loc1_.pFadeTime);
   var _loc2_ = 100 / _loc3_;
   _loc1_.pFadeAmount = _loc2_;
   _loc1_.pShowPicTime = pShowMs;
   _loc1_.pNumFrames = _loc1_._totalframes;
   _loc1_.pIndex = 1;
};
obj.fadeIn = function()
{
   var _loc1_ = this;
   _loc1_._alpha = 0;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      _loc1_._alpha < 100?_loc1_._alpha = _loc1_._alpha + _loc1_.pFadeAmount:_loc1_.showPic();
   };
};
obj.fadeOut = function()
{
   var _loc1_ = this;
   _loc1_._alpha = 100;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      _loc1_._alpha > 0?_loc1_._alpha = _loc1_._alpha - _loc1_.pFadeAmount:_loc1_.nextPic();
   };
};
obj.showPic = function()
{
   var _loc1_ = this;
   _loc1_._alpha = 100;
   _loc1_.startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      var _loc2_ = this;
      var _loc1_ = getTimer() - _loc2_.startTime;
      if(_loc1_ >= _loc2_.pShowPicTime)
      {
         _loc2_.fadeOut();
      }
   };
};
obj.nextPic = function()
{
   var _loc1_ = this;
   _loc1_.pIndex = _loc1_.pIndex + 1;
   if(_loc1_.pIndex > _loc1_.pNumFrames)
   {
      _loc1_.pIndex = 1;
   }
   _loc1_.gotoAndStop(_loc1_.pIndex);
   _loc1_.fadeIn();
};
obj.onEnterFrame = obj.fadeIn;
