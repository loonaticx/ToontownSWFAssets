function callBot()
{
   if(count < 4)
   {
      var _loc4_ = Math.random();
      if(0.95 < _loc4_)
      {
         _parent.attachMovie("bot","b" + ++n,n);
         _parent["b" + n].n = this.n;
         _parent["b" + n]._visible = 0;
         _root.cog_array.push("s" + n);
         count++;
      }
   }
}
this.onEnterFrame = this.callBot;
MovieClip.addFLEMListener(this);
stop();
