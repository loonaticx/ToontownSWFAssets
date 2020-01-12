VideoPlayerClass = function()
{
   System.security.allowDomain("swf.neopets.com","images.neopets.com","images50.neopets.com","64.191.225.20","www.millsberry.com");
   this.init();
};
var obj = VideoPlayerClass.prototype;
obj.setMovieURL = function(url_str)
{
   this.pMovieURL = url_str;
};
obj.init = function()
{
   this.load_txt.text = "";
   this.countDown_mc.attachMovie(this.pCountDown_mc,"countGR",1);
   this.countDown_mc._alpha = 0;
   this.controller._visible = false;
   this.mold._visible = false;
   if(this.pMovieWidth == "_root.movieWidth")
   {
      this.pMovieWidth = _root.movieWidth;
   }
   if(this.pMovieHeight == "_root.movieHeight")
   {
      this.pMovieHeight = _root.movieHeight;
   }
   var e = eval(this.pMovieURL);
   if(e != undefined)
   {
      this.pMovieURL = e;
   }
   this.paused = 1;
   loadMovie(this.pMovieURL,this.mold);
   this.mold.stop();
   this.controller.pl.gotoAndStop("pauseButton");
   this.bg._visible = false;
   var obj = this.controller.sliderButton;
   obj.videoMC = this;
   obj.myMovie = this.mold;
   obj.beginDrag = obj._x;
   obj.endDrag = this.controller.sliderBG._x + this.controller.sliderBG._width;
   obj.scrubbing = false;
   obj.useHandCursor = false;
   obj.onPress = function()
   {
      var _loc1_ = this;
      _loc1_.myMovie.stop();
      _loc1_.videoMC.paused = 1;
      _loc1_._parent.pl.gotoAndStop("pauseButton");
      _loc1_.scrubbing = true;
   };
   obj.onRelease = obj.onReleaseOutside = function()
   {
      var _loc1_ = this;
      var _loc2_ = Math.max(1,Math.round(_loc1_._parent.sliderBG._xmouse / (_loc1_.endDrag - _loc1_.beginDrag) * _loc1_.myMovie._totalframes));
      var _loc3_ = _loc1_.myMovie._framesloaded;
      if(_loc2_ > _loc3_)
      {
         _loc2_ = _loc3_ - 12;
      }
      else if(_loc2_ < 1)
      {
         _loc2_ = 1;
      }
      _loc1_.videoMC.countDown_mc._visible = false;
      if(_root.countDown_mc)
      {
         _root.countDown_mc._visible = false;
      }
      _loc1_.videoMC.controller.pl.gotoAndStop("playButton");
      stopDrag();
      _loc1_.scrubbing = false;
      _loc1_.videoMC.paused = 0;
      _loc1_.myMovie.gotoAndPlay(_loc2_);
   };
   obj.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(!_loc1_.scrubbing)
      {
         var _loc2_ = _loc1_.myMovie;
         _loc1_._x = _loc1_.beginDrag + _loc2_._currentframe / _loc2_._totalframes * (_loc1_.endDrag - _loc1_.beginDrag);
      }
      else
      {
         _loc1_.startDrag(false,_loc1_.beginDrag,0,_loc1_.endDrag,0);
      }
      if(_loc1_._x >= _loc1_.endDrag)
      {
         _loc1_.videoMC.paused = 1;
         _loc1_.myMovie.gotoAndStop(1);
         _loc1_.videoMC.controller.pl.gotoAndStop("pauseButton");
         _loc1_._parent._parent.pOnDone();
      }
   };
   var obj = this.controller.loadingBar;
   obj._xscale = 0;
   obj.video_mc = this.mold;
   obj.onEnterFrame = function()
   {
      var _loc1_ = this;
      var _loc2_ = _loc1_.video_mc.getBytesLoaded();
      var totalBytes = _loc1_.video_mc.getBytesTotal();
      var _loc3_ = _loc2_ / totalBytes * 100;
      _loc1_._xscale = _loc3_;
      if(_loc2_ > 100 && _loc3_ >= 100)
      {
         _loc1_.onEnterFrame = undefined;
      }
   };
   var obj = this.process;
   obj.countDown = this.countDown_mc;
   obj.fps = this.pMovieFPS;
   obj.bufferFactor = 1.2;
   obj.startTime = getTimer();
   obj.sizeObjects = function()
   {
      this._parent.resizeClips();
   };
   obj.onEnterFrame = function()
   {
      var _loc1_ = this;
      var _loc2_ = _loc1_._parent.mold.getBytesLoaded();
      var _loc3_ = _loc1_._parent.mold.getBytesTotal();
      var leftBytes = _loc3_ - _loc2_;
      var totalFrames = _loc1_._parent.mold._totalframes;
      var loadedFrames = _loc1_._parent.mold._framesloaded;
      var loadTime = getTimer() - _loc1_.startTime;
      var speed = _loc2_ / loadTime;
      var totalTime = totalFrames / _loc1_.fps;
      var playTime = loadedFrames / _loc1_.fps;
      var leftLoadTime = leftBytes / 1024 / speed;
      var pcntLoaded = _loc2_ / _loc3_ * 100;
      if(_loc2_ > 100)
      {
         if(!isNaN(pcntLoaded))
         {
            _loc1_.countDown._alpha = 100;
            _loc1_._parent.controller._visible = true;
            _loc1_._parent.mold._visible = true;
            var bufferTime = leftLoadTime * _loc1_.bufferFactor;
            if(playTime < bufferTime)
            {
               _loc1_.sizeObjects();
               if(_loc1_._parent.paused)
               {
                  _loc1_._parent.load_txt.text = "Loading " + Math.round(pcntLoaded) + " %";
                  _loc1_._parent.mold.stop();
               }
               else
               {
                  _loc1_.countDown._alpha = 0;
                  _loc1_._parent.load_txt._visible = false;
                  _loc1_.countDown.unloadMovie();
                  _loc1_._parent.load_txt.unloadMovie();
               }
            }
            else
            {
               if(_root.countBG)
               {
                  _root.countBG._visible = false;
               }
               if(_root.countDown)
               {
                  _root.countDown._visible = false;
               }
               _loc1_._parent.load_txt._visible = false;
               _loc1_._parent.paused = 0;
               _loc1_.countDown._alpha = 0;
               _loc1_._parent.mold.play();
               _loc1_._parent.controller.pl.gotoAndStop("playButton");
               _loc1_.sizeObjects();
               _loc1_.onEnterFrame = undefined;
            }
         }
      }
   };
   var obj = this.controller.volumeControl.volumeSlider;
   obj.videoMC = this;
   obj.globalsound = new Sound(this.mold);
   obj.pVolume = 100;
   obj.globalsound.setVolume(obj.pVolume);
   obj.leftLimit = this.controller.volumeControl.sliderBG._x + obj._width / 2;
   obj.rightLimit = this.controller.volumeControl.sliderBG._x + obj._parent.sliderBG._width - obj._width / 2;
   obj.limitAmount = obj.rightLimit - obj.leftLimit;
   obj.pcnt = 100 / obj.limitAmount;
   obj._x = obj.rightLimit;
   obj.scrubbing = 0;
   obj.useHandCursor = false;
   obj.onPress = function()
   {
      this.scrubbing = 1;
   };
   obj.onRelease = obj.onReleaseOutside = function()
   {
      this.scrubbing = 0;
      stopDrag();
   };
   obj.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(_loc1_.scrubbing)
      {
         _loc1_.startDrag(false,_loc1_.leftLimit,0,_loc1_.rightLimit,0);
         var _loc2_ = _loc1_._x - _loc1_.leftLimit;
         var d = d / _loc1_.limitAmount;
         _loc1_.pVolume = _loc2_ * _loc1_.pcnt;
         _loc1_.globalsound.setVolume(_loc1_.pVolume);
      }
   };
};
obj.stopMovie = function()
{
   this.mold.gotoAndStop(1);
};
obj.resizeClips = function()
{
   var _loc1_ = this;
   var _loc3_ = _loc1_.mold;
   var _loc2_ = _loc1_.controller;
   var countDown = _loc1_.countDown_mc;
   _loc1_.bg._width = _loc1_.pMovieWidth;
   _loc1_.bg._height = _loc1_.pMovieHeight;
   var xDiff = 160 - _loc1_.pMovieWidth / 2;
   var yDiff = 120 - _loc1_.pMovieHeight / 2 - _loc2_._height / 2;
   _loc3_._x = _loc1_.bg._x = xDiff;
   _loc3_._y = _loc1_.bg._y = yDiff;
   _loc1_.bg._visible = true;
   countDown._width = _loc1_.bg._width;
   countDown._height = _loc1_.bg._height;
   countDown._x = _loc3_._x;
   countDown._y = _loc3_._y;
   _loc2_._y = _loc1_.bg._y + _loc1_.bg._height + _loc2_._height / 2;
   _loc2_._width = _loc1_.bg._width;
   _loc1_.load_txt._x = _loc2_._x + _loc2_._width / 2 - _loc1_.load_txt._width;
   _loc1_.load_txt._y = _loc2_._y - _loc2_._height / 2 - _loc1_.load_txt._height;
   _loc1_.mask_mc._width = _loc1_.pMovieWidth;
   _loc1_.mask_mc._height = _loc1_.pMovieHeight;
   _loc1_.mask_mc._x = _loc3_._x;
   _loc1_.mask_mc._y = _loc3_._y;
};
obj.pOnDone = function()
{
   _root[this.pDoneMethod]();
};
Object.registerClass("VideoPlayerSymbol",VideoPlayerClass);
