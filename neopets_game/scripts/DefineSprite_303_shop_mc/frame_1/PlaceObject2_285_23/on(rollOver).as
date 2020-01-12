on(rollOver){
   if(this._currentframe != 3)
   {
      var pString = "<P ALIGN=\'CENTER\'>Click Here To Add Items.</P>";
      this.gotoAndStop("over");
   }
   else
   {
      var pString = "<P ALIGN=\'CENTER\'>Click The Item That You Want To Buy.</P>";
      _root.shop.updateGagInfo(pString,"empty");
   }
   _root.shop.updateGagInfo(pString,"empty");
}
