on(release){
   gPlayList.playSound("buttonSound");
   _root.difficulty = 1;
   gMyNeoStatus.sendTag("Game Started");
   _root.gotoAndPlay("shopFrame");
}
