function audioToggle()
{
   if(Key.isDown(83))
   {
      stat != 0?this.gotoAndStop("off"):this.gotoAndStop("on");
   }
}
stat = 1;
_root.music_loop.setVolume(100);
this.onKeyDown = this.audioToggle;
addFLEMListener.Key(this);
stop();
