_global.DropMCClass = function(pX, pY, pTarget, squashHeight, damageAmt)
{
   this.init(pX,pY,pTarget,squashHeight,damageAmt);
};
DropMCClass.extend(SpriteClass);
var obj = DropMCClass.prototype;
obj.init = function(pX, pY, pTarget, squashHeight, damageAmt)
{
   var _loc1_ = this;
   super.init(pX,pY);
   _loc1_.pTarget = pTarget;
   _loc1_.pSquashHeight = squashHeight;
   _loc1_.pDamageAmt = damageAmt;
   _loc1_.yTarget = _loc1_.pTarget._y - _loc1_.pTarget._height * _loc1_.pSquashHeight;
   _loc1_.dY = 0;
   _loc1_.gY = 0.5;
   _loc1_.soundPlaying = 0;
   gPlayList.playSound("whooshSound");
};
obj.spiralOff = function()
{
   var _loc1_ = this;
   _loc1_._x = _loc1_._x + 6;
   _loc1_._y = _loc1_._y + _loc1_.dY;
   _loc1_.dy = _loc1_.dy + 4;
   _loc1_._rotation = _loc1_._rotation + 4;
   if(_loc1_._y >= _loc1_.pTarget._y + 100)
   {
      _loc1_.pTarget._parent.stretch(_loc1_.pDamageAmt);
      _loc1_.removeMovieClip();
   }
};
obj.onEnterFrame = function()
{
   var _loc1_ = this;
   if(_loc1_._y > _loc1_.pTarget._y - _loc1_.pTarget._height and _loc1_._y < _loc1_.yTarget and _loc1_.pDamageAmt > 0)
   {
      if(!_loc1_.soundPlaying)
      {
         _loc1_.soundPlaying = 1;
         gPlayList.playSound("dropSound");
      }
      _loc1_.pTarget._height = _loc1_.pTarget._y - _loc1_._y;
   }
   var _loc2_ = _loc1_.pDamageAmt != 0?_loc1_._y >= _loc1_.yTarget:_loc1_._y >= _loc1_.pTarget._y;
   if(_loc2_)
   {
      _loc1_.dY = -4;
      _loc1_._y = _loc1_.pDamageAmt != 0?_loc1_.yTarget:_loc1_.pTarget._y;
      _loc1_.onEnterFrame = _loc1_.spiralOff;
   }
   else
   {
      _loc1_.dY = _loc1_.dY + 4;
      _loc1_._y = _loc1_._y + _loc1_.dY;
   }
};
