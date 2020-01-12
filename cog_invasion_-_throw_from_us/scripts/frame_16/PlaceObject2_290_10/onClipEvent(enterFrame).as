onClipEvent(enterFrame){
   if(_root.myInterface.audio.stat == 1)
   {
      mySound.setVolume(100);
   }
   else
   {
      mySound.setVolume(0);
   }
   if(_root.kills >= _root.goal)
   {
      _root.GC.endLevel(_root.myLevel,_root.score);
      if(_root.myLevel < 3)
      {
         _root.gotoAndStop("round");
      }
      else
      {
         _root.gotoAndStop("win");
      }
   }
}
