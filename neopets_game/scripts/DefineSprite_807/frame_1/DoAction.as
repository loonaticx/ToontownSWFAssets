stop();
_root.trackWebButton();
this.toggled = 1;
this.buttonList = [this.startButton,this.instrButton,this.aboutButton,this.webButton];
this.onSubPageDone = function()
{
   this.toggle();
};
this.toggle = function()
{
   var _loc1_ = this;
   _loc1_.toggled = !_loc1_.toggled;
   var _loc2_ = _loc1_.buttonList.length;
   while(true)
   {
      _loc2_;
      if(_loc2_--)
      {
         _loc1_.buttonList[_loc2_].enabled = _loc1_.toggled;
         continue;
      }
      break;
   }
};
