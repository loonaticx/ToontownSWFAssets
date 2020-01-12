onClipEvent(load){
   function seStop()
   {
      seSound.stop();
   }
   function sePlay(dat, vol)
   {
      seSound.attachSound(dat);
      seSound.setVolume(vol);
      if(vol == 0)
      {
         seSound.stop();
      }
      else
      {
         seSound.start();
      }
   }
   seSound = new Sound(this);
}
