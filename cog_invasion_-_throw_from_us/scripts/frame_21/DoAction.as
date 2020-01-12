if(_root.myInterface.audio.stat == 1)
{
   mySound = new Sound();
   mySound.attachSound("underex");
   mySound.start();
}
_root.pauseGame();
_root.myLevel = _root.myLevel + 1;
_root.accel = _root.accel++;
this.gag.gotoAndStop(_root.myLevel);
