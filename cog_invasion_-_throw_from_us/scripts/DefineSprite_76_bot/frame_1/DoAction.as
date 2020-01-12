function moveMe()
{
   if(!init)
   {
      accel = _root.accel;
      d = 28;
      a1 = 0.0174532925199433 * (Math.random() * 150 + 10);
      a2 = _parent.ship._rotation;
      _visible = 1;
      _root.bg.attachSub(n,d,a1,a2);
      init = true;
   }
   if(10 < d)
   {
      s = accel / d;
      d = d - s;
      _X = (- d) * Math.cos(a1);
      _Y = (- d) * Math.sin(a1);
      if(d < 15)
      {
         gotoAndStop("alert");
      }
   }
   else
   {
      _parent.factory.count = _parent.factory.count - 1;
      this.onEnterFrame = null;
      this.removeMovieClip();
   }
}
this.alarm = 0;
this.onEnterFrame = this.moveMe;
MovieClip.addFLEMListener(this);
stop();
