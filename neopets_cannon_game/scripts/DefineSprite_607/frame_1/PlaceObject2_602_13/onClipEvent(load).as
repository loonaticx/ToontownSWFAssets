onClipEvent(load){
   this.videoMC = this._parent._parent;
   this.myMovie = this.videoMC.mold;
   this.beginDrag = this._x;
   this.endDrag = this._parent.sliderBG._x + this._parent.sliderBG._width;
   this.scrubbing = 0;
   this.useHandCursor = false;
   this.onPress = function()
   {
      var _loc1_ = this;
      _loc1_.myMovie.stop();
      _loc1_.videoMC.controller.pl.gotoAndStop("pauseButton");
      _loc1_.scrubbing = 1;
   };
   this.onRelease = this.onReleaseOutside = function()
   {
      var _loc1_ = this;
      var _loc2_ = Math.round(_loc1_._parent.sliderBG._xmouse / (_loc1_.endDrag - _loc1_.beginDrag) * _loc1_.myMovie._totalframes);
      _loc1_.myMovie.gotoAndPlay(_loc2_);
      _loc1_.videoMC.controller.pl.gotoAndStop("playButton");
      _loc1_.scrubbing = 0;
      stopDrag();
   };
}
