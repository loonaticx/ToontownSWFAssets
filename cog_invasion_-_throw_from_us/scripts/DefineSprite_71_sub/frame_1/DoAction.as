function moveMe()
{
   d = _root.myInterface.sonar["b" + n].d;
   _Y = (100 - d) * -1;
   _xscale = 100 - d / 38 * 100;
   _yscale = 100 - d / 38 * 100;
   if(d == undefined)
   {
      this.onEnterFrame = null;
      this.swapDepths(3000);
      _root.gotoAndStop("lose");
      this.removeMovieClip();
   }
   this.xtrackTorp();
}
function hitCheck()
{
}
function trackTorp()
{
   if(this._xscale >= _parent["t" + j]._xscale)
   {
      this.xtrackTorp = null;
      _parent["t" + j].removeMovieClip();
      _root.alert.removeMovieClip();
      this.gotoAndPlay("end" + this.r);
   }
}
d = _root.myInterface.sonar["b" + n].d;
this._xscale = 100 - d / 38 * 100;
this._yscale = 100 - d / 38 * 100;
this.onEnterFrame = this.moveMe;
play();
