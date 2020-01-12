Array.prototype.copy = function()
{
   return this.slice();
};
Array.prototype.append = function(obj)
{
   var _loc1_ = this.length;
   this[_loc1_] = obj;
};
Array.prototype.deleteOne = function(mc)
{
   var _loc2_ = this;
   var _loc3_ = mc;
   for(var x in _loc2_)
   {
      var _loc1_ = _loc2_[x];
      if(_loc1_ == _loc3_)
      {
         _loc2_.splice(x,1);
      }
   }
};
Array.prototype.reverseSortOn = function(fieldName)
{
   this.sortOn(fieldName);
   this.reverse();
};
Array.prototype.getOne = function(value)
{
   var _loc3_ = this.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = this[_loc1_];
      if(_loc2_ == value)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return -1;
};
Array.prototype.exchange = function(i, j)
{
   if(i != j)
   {
      with(this)
      {
         splice(i,0,splice(j,1)[0])
         splice(j,0,splice(i + (i >= j?-1:1),1)[0])
         
      };
   }
};
Array.prototype.shuffle = function()
{
   var _loc2_ = this;
   var _loc1_ = _loc2_.length - 1;
   if(_loc1_)
   {
      do
      {
         _loc2_.exchange(_loc1_,Math.floor(Math.random() * (_loc1_ + 1)));
      }
      while(_loc1_ = _loc1_ - 1);
      
   }
};
ASSetPropFlags(Array.prototype,["append","exchange","shuffle","deleteAt"],1);
Math.toDegrees = function(theta)
{
   return theta * 180 / 3.141592653589793;
};
Math.toRadians = function(theta)
{
   return theta * 3.141592653589793 / 180;
};
Math.fixRadians = function(num)
{
   var _loc1_ = num;
   var _loc2_ = 6.283185307179586;
   if(_loc1_ >= _loc2_)
   {
      _loc1_ = _loc1_ - _loc2_;
   }
   else if(_loc1_ < 0)
   {
      _loc1_ = _loc1_ + _loc2_;
   }
   return _loc1_;
};
MovieClip.prototype.getDistance = function(tgt)
{
   var _loc2_ = this._x - tgt._x;
   var _loc1_ = this._y - tgt._y;
   var _loc3_ = Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_);
   return _loc3_;
};
MovieClip.prototype.getAngle = function(clip)
{
   var _loc1_ = clip._y - this._y;
   var _loc2_ = clip._x - this._x;
   var _loc3_ = Math.atan2(_loc1_,_loc2_);
   return _loc3_;
};
String.prototype.startsWithVowel = function()
{
   var _loc2_ = ["a","e","i","o","u"];
   var temp = this.split("");
   var first_letter = temp[0].toLowerCase();
   var _loc3_ = _loc2_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(first_letter.indexOf(_loc2_[_loc1_]) != -1)
      {
         return true;
      }
      _loc1_ = _loc1_ + 1;
   }
   return false;
};
