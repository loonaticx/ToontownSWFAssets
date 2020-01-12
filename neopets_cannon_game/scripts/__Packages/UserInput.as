if(!_global.UserInput)
{
   _global.UserInput.prototype = new MovieClip().onMouseUp = function()
   {
      if(_root._ymouse < 435)
      {
         this.broadcastMessage("onInputGo");
      }
   };
   _global.UserInput.prototype = new MovieClip().initKeyLis = function()
   {
      var _loc1_ = this;
      _loc1_.tKey_lis = new Object();
      _loc1_.tKey_lis.my = _loc1_;
      _loc1_.tKey_lis.onKeyUp = function()
      {
         if(Key.getCode() == this.my.keyGo)
         {
            this.my.keyGoHold = false;
         }
      };
      _loc1_.tKey_lis.remove = function()
      {
         Key.removeListener(this);
      };
      Key.addListener(_loc1_.tKey_lis);
   };
   _global.UserInput.prototype = new MovieClip().onKeyReset = function()
   {
      this.tKey_lis.remove();
   };
   _global.UserInput.prototype = new MovieClip().keyGo = 32;
   _global.UserInput.prototype = new MovieClip().keyGoHold = false;
   §§push(ASSetPropFlags(_global.UserInput.prototype,null,1));
}
§§pop();
