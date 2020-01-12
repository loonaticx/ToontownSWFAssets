on(rollOver){
   if(this._currentframe != 3)
   {
      var pString = "<P ALIGN=\'CENTER\'>Click Here To Remove Items.</P>";
      this.gotoAndStop("over");
   }
   else
   {
      var pString = "<P ALIGN=\'CENTER\'>Click the Item To Subtract From.</P>";
      _root.shop.updateGagInfo(pString,"empty");
   }
   _root.shop.updateGagInfo(pString,"empty");
}
