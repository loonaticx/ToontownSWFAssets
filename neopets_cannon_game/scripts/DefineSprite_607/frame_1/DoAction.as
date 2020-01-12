this.loadingBar.myMovie = this._parent.mold;
this.loadingBar.onLoad = function()
{
   this._xscale = 0;
};
this.loadingBar.onEnterFrame = function()
{
   var _loc1_ = this;
   if((_loc1_.waitCount = _loc1_.waitCount + 1) > 10)
   {
      var loadedBytes = _loc1_.myMovie.getBytesLoaded();
      var _loc3_ = _loc1_.myMovie.getBytesTotal();
      var _loc2_ = loadedBytes / _loc3_ * 100;
      _loc1_._xscale = _loc2_;
      if(_loc2_ == 100)
      {
         _loc1_.onEnterFrame = undefined;
      }
   }
};
