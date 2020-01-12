sw = true;
stop();
this.onRelease = function()
{
   if(sw == true)
   {
      sw = false;
      this.gotoAndStop(3);
      seSound.stop();
   }
   else
   {
      sw = true;
      this.gotoAndStop(2);
      seSound.attachSound("bgm.wav");
      seSound.setVolume(65);
      seSound.start();
   }
};
