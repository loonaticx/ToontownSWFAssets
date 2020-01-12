_global.gPlayListObject = function()
{
};
var obj = gPlayListObject.prototype;
obj.addSounds = function(pList)
{
   var _loc3_ = this;
   if(typeof pList == "object")
   {
      var max = pList.length;
      var _loc2_ = 0;
      while(_loc2_ < max)
      {
         var _loc1_ = pList[_loc2_];
         _loc3_[_loc1_] = new Sound(_root);
         _loc3_[_loc1_].attachSound(_loc1_);
         _loc2_ = _loc2_ + 1;
      }
   }
};
obj.playSound = function(pName)
{
   this[pName].start();
};
obj.stopSound = function(pName)
{
   this[pName].stop(pName);
};
