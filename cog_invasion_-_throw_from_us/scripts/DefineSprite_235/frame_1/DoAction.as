function arrowToggle()
{
   if(Key.isDown(myKey))
   {
      this.gotoAndStop("on");
      if(_root.myInterface.audio.stat == 1)
      {
         mySound.setVolume(30);
      }
   }
   else
   {
      this.gotoAndStop("off");
      mySound.setVolume(0);
   }
}
this.onEnterFrame = function()
{
   this.arrowToggle();
};
MovieClip.addFLEMlistener(this);
stop();
