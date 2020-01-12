onClipEvent(load){
   this.seSound = new Sound(this);
   seSound.attachSound("bgm.wav");
   seSound.setVolume(50);
   seSound.start();
   this.seSound.onSoundComplete = function()
   {
      seSound.attachSound("bgm.wav");
      seSound.setVolume(50);
      seSound.start();
   };
}
