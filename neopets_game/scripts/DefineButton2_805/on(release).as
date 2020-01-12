on(release){
   gPlayList.playSound("buttonSound");
   _root.difficulty = 3;
   gMyNeoStatus.sendTag("Game Started");
   _root.gotoAndPlay("shopFrame");
}
