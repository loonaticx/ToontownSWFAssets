if(!_global.np)
{
   _global.np = new Object();
}
§§pop();
if(!_global.np.users)
{
   _global.np.users = new Object();
}
§§pop();
if(!_global.np.users.chrisa)
{
   _global.np.users.chrisa = new Object();
}
§§pop();
if(!_global.np.users.chrisa.SlideShowClass)
{
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().init = function init(fps, pFadeMs, pShowMs, click_to_advance)
   {
      var _loc1_ = this;
      _loc1_.pNextPic_mc._visible = false;
      _loc1_.pImages_mc._alpha = 0;
      _loc1_.pFadeTime = pFadeMs;
      _loc1_.useHandCursor = _loc1_.pClickToAdvance = click_to_advance;
      var _loc3_ = Number(fps / (1000 / _loc1_.pFadeTime));
      var _loc2_ = 100 / _loc3_;
      _loc1_.pFadeAmount = _loc2_;
      _loc1_.pShowPicTime = pShowMs;
      _loc1_.pNumFrames = _loc1_.pImages_mc._totalframes;
      _loc1_.pIndex = 1;
      _loc1_.pImages_mc.gotoAndStop(1);
      _loc1_.fadeIn();
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().fadeIn = function fadeIn()
   {
      var _loc1_ = this;
      _loc1_.pImages_mc._alpha = 0;
      _loc1_.onEnterFrame = function()
      {
         var _loc1_ = this;
         _loc1_.pImages_mc._alpha < 100?_loc1_.pImages_mc._alpha = _loc1_.pImages_mc._alpha + _loc1_.pFadeAmount:_loc1_.showPic();
      };
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().fadeOut = function fadeOut()
   {
      var _loc1_ = this;
      clearInterval(_loc1_.pShowPicIntervalID);
      _loc1_.onEnterFrame = function()
      {
         var _loc1_ = this;
         _loc1_.pImages_mc._alpha > 0?_loc1_.pImages_mc._alpha = _loc1_.pImages_mc._alpha - _loc1_.pFadeAmount:_loc1_.nextPic();
      };
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().showPic = function showPic()
   {
      var _loc1_ = this;
      _loc1_.onEnterFrame = undefined;
      _loc1_.pImages_mc._alpha = 100;
      _loc1_.pShowPicIntervalID = setInterval(_loc1_,"fadeOut",_loc1_.pShowPicTime);
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().nextPic = function nextPic()
   {
      var _loc1_ = this;
      _loc1_.onEnterFrame = undefined;
      clearInterval(_loc1_.pShowPicIntervalID);
      _loc1_.pIndex = _loc1_.pIndex + 1;
      if(_loc1_.pIndex > _loc1_.pNumFrames)
      {
         _loc1_.pIndex = 1;
      }
      _loc1_.pImages_mc.gotoAndStop(_loc1_.pIndex);
      _loc1_.fadeIn();
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().onRelease = function onRelease()
   {
      var _loc1_ = this;
      if(_loc1_.pClickToAdvance != false)
      {
         _loc1_.nextPic();
         _loc1_.pNextPic_mc._visible = false;
      }
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().onReleaseOutside = function onReleaseOutside()
   {
      var _loc1_ = this;
      if(_loc1_.pClickToAdvance != false)
      {
         _loc1_.nextPic();
         _loc1_.pNextPic_mc._visible = false;
      }
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().onRollOver = function onRollOver()
   {
      this.pNextPic_mc._visible = true;
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().onRollOut = function onRollOut()
   {
      this.pNextPic_mc._visible = false;
   };
   np.users.chrisa.SlideShowClass.prototype = new MovieClip().stopSlideShow = function stopSlideShow()
   {
      this.onEnterFrame = undefined;
      clearInterval(this.pShowPicIntervalID);
   };
   §§push(ASSetPropFlags(np.users.chrisa.SlideShowClass.prototype,null,1));
}
§§pop();
