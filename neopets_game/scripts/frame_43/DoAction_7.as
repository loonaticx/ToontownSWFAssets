_global.Meter_Horiz = function(pX, pY, pSpeed, playerMC)
{
   this.init(pX,pY,pSpeed,playerMC);
};
Meter_Horiz.extend(SpriteClass);
var obj = Meter_Horiz.prototype;
obj.init = function(pX, pY, pSpeed, playerMC)
{
   var _loc1_ = this;
   super.init(pX,pY);
   _loc1_.pSpeed = pSpeed;
   _loc1_.pPlayer = playerMC;
   _loc1_.pLeftLimit = 0;
   _loc1_.pRightLimit = _loc1_.bg._width;
   _loc1_.pBoxDir = 1;
   _loc1_.box._x = _loc1_.pLeftLimit + _loc1_.box._width / 2;
   _loc1_.targetBox._alpha = 0;
   _loc1_.targetBox._x = _loc1_.pRightLimit / 2;
   _loc1_.pEnabled = 0;
   _loc1_.goButton._visible = _loc1_.goButton.enabled = _loc1_.pEnabled;
   _loc1_.goButton.onRelease = function()
   {
      this._parent.stopMeter();
   };
};
obj.checkRightLimit = function()
{
   var _loc1_ = this;
   if(_loc1_.box._x + _loc1_.box._width / 2 + _loc1_.pSpeed > _loc1_.pRightLimit)
   {
      _loc1_.box._x = _loc1_.pRightLimit - _loc1_.box._width / 2;
      _loc1_.pBoxDir = -1;
   }
};
obj.checkLeftLimit = function()
{
   var _loc1_ = this;
   if(_loc1_.box._x - _loc1_.box._width / 2 - _loc1_.pSpeed < _loc1_.pLeftLimit)
   {
      _loc1_.box._x = _loc1_.pLeftLimit + _loc1_.box._width / 2;
      _loc1_.pBoxDir = 1;
   }
};
obj.setMoveProps = function(num)
{
   this.targetBox._alpha = 100;
   this.targetBox._xscale = num * 10;
};
obj.toggle = function()
{
   var _loc1_ = this;
   _loc1_.pEnabled = !_loc1_.pEnabled;
   _loc1_.goButton._visible = _loc1_.goButton.enabled = _loc1_.pEnabled;
};
obj.setToMove = function()
{
   var _loc1_ = this;
   _loc1_.toggle();
   _loc1_.onEnterFrame = _loc1_.moveTarget;
};
obj.moveTarget = function()
{
   var _loc1_ = this;
   _loc1_.pBoxDir <= 0?_loc1_.checkLeftLimit():_loc1_.checkRightLimit();
   var _loc2_ = _loc1_.pSpeed * _loc1_.pBoxDir;
   _loc1_.box._x = _loc1_.box._x + _loc2_;
};
obj.stopMeter = function()
{
   var _loc1_ = this;
   var _loc2_ = _loc1_.box.hitTest(_loc1_.targetBox);
   _loc1_.pPlayer.returnHit(_loc2_);
   _loc1_.toggle();
   _loc1_.box._x = _loc1_.pLeftLimit + _loc1_.box._width / 2;
   _loc1_.targetBox._alpha = 0;
   _loc1_.onEnterFrame = undefined;
};
