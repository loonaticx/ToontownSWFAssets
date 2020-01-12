on(release){
   gPlayList.playSound("buttonSound");
   _root.difficulty = 2;
   gMyNeoStatus.sendTag("Game Started");
   _root.gotoAndPlay("shopFrame");
}
