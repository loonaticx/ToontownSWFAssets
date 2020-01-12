on(release){
   gPlayList.playSound("buttonSound");
   this._parent.setMode(1);
   if(this._currentframe == 2)
   {
      var pString = "<P ALIGN=\'CENTER\'>Click The Item That You Want To Buy.</P>";
      _root.shop.updateGagInfo(pString,"empty");
   }
}
