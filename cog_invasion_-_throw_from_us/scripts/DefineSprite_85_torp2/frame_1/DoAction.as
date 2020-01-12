function moveMe()
{
   if(!init)
   {
      d = 2;
      init = true;
   }
   if(0 < _xscale)
   {
      s = 0.005 / d;
      d = d + s;
      trace("sprite 11: " + d);
      _xscale = _xscale - d;
      _yscale = _yscale - d;
   }
   else
   {
      this.removeMovieClip();
   }
}
this.onEnterFrame = this.moveMe;
MovieClip.addFLEMListener(this);
stop();
