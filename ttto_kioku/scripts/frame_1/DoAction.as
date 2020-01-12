function loadChk()
{
   var _loc1_ = this;
   var _loc2_ = _loc1_.getBytesLoaded();
   gLoadPer = Math.floor(_loc2_ / gMaeYomi * 100);
   if(gLoadPer >= 100)
   {
      _loc1_.LoadB._xscale = 100;
      gotoAndStop("ready");
      play();
   }
   else
   {
      _loc1_.LoadB._xscale = gLoadPer;
   }
}
gMaeYomi = 360000;
