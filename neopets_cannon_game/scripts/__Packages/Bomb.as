if(!_global.Bomb)
{
   _global.Bomb.prototype = new Status().init = function(data, shadow_gr)
   {
      var _loc1_ = this;
      var _loc2_ = data;
      _loc1_.rot = 0;
      _loc1_.vel = new Object();
      _loc1_.velIncr = new Object();
      _loc1_.velMax = new Object();
      _loc1_.gravity = 2;
      _loc1_.setImage(_global.gShot + "_bomb");
      _loc1_.scalePerc_num = _loc2_.scale;
      _loc1_.boomScalePerc_num = _loc2_.boomScalePerc_num;
      _loc1_.image_mc._width = _loc1_.image_mc._width * _loc1_.scalePerc_num;
      _loc1_.image_mc._height = _loc1_.image_mc._height * _loc1_.scalePerc_num;
      _loc1_.pos.x = _loc2_.pos.x;
      _loc1_.pos.y = _loc2_.pos.y;
      _loc1_.vel.x = _loc2_.vel.x;
      _loc1_.vel.y = _loc2_.vel.y;
      _loc1_.powerupID_num = _loc2_.powerupID_num;
      _loc1_.boundMaxY_num = _loc2_.boundMaxY_num;
      _loc1_.moveMessage_str = _loc2_.moveMessage_str;
      _loc1_.putScreen();
      _loc1_.velIncr.x = 0;
      _loc1_.velIncr.y = _loc1_.gravity;
      _loc1_.velMax.x = 20;
      _loc1_.velMax.y = 40;
      _loc1_.shadow_mc = shadow_gr;
      _loc1_.shadow_mc._y = _loc1_.boundMaxY_num + 64;
      _loc1_.updateShadow();
   };
   _global.Bomb.prototype = new Status().falling = function()
   {
      var _loc1_ = this;
      _loc1_.applyForces();
      _loc1_.checkMaxForce();
      _loc1_.transform();
      if(_loc1_.powerupID_num == 3)
      {
         _loc1_.broadcastMessage("onHeatSeek",_loc1_);
      }
      _loc1_.putScreen();
      _loc1_.updateShadow();
      _loc1_.checkBounds();
   };
   _global.Bomb.prototype = new Status().applyForces = function()
   {
      var _loc1_ = this;
      _loc1_.vel.x = _loc1_.vel.x + _loc1_.velIncr.x;
      _loc1_.vel.y = _loc1_.vel.y + _loc1_.velIncr.y;
   };
   _global.Bomb.prototype = new Status().checkMaxForce = function()
   {
      var _loc1_ = this;
      if(_loc1_.vel.x > _loc1_.velMax.x)
      {
         _loc1_.vel.x = _loc1_.velMax.x;
      }
      if(_loc1_.vel.y > _loc1_.velMax.y)
      {
         _loc1_.vel.y = _loc1_.velMax.y;
      }
   };
   _global.Bomb.prototype = new Status().transform = function()
   {
      var _loc1_ = this;
      _loc1_.pos.x = _loc1_.pos.x + _loc1_.vel.x;
      _loc1_.pos.y = _loc1_.pos.y + _loc1_.vel.y;
      _loc1_.setAngle();
   };
   _global.Bomb.prototype = new Status().checkBounds = function()
   {
      var _loc1_ = this;
      if(_loc1_.pos.y > _loc1_.boundMaxY_num)
      {
         _loc1_.pos.y = _loc1_.boundMaxY_num;
         _loc1_.onStopFalling();
      }
   };
   _global.Bomb.prototype = new Status().updateShadow = function()
   {
      var _loc1_ = this;
      _loc1_.shadow_mc._x = _loc1_.pos.x;
      var _loc2_ = (1 - (_loc1_.boundMaxY_num - _loc1_.image_mc._y) / 2000) * _loc1_.scalePerc_num;
      _loc1_.shadow_mc._alpha = _loc2_ * 100 - 10;
      _loc1_.shadow_mc._xscale = _loc1_.shadow_mc._yscale = _loc2_ * 100;
   };
   _global.Bomb.prototype = new Status().setAngle = function()
   {
      var _loc1_ = this;
      var xDist = _loc1_.pos.x - _loc1_.image_mc._x;
      var yDist = _loc1_.pos.y - _loc1_.image_mc._y;
      var _loc3_ = Math.atan(yDist / xDist) * 180 / 3.141592653589793;
      var _loc2_ = 0;
      if(_loc1_.pos.x > _loc1_.image_mc._x and _loc1_.image_mc._y <= _loc1_.image_mc._y)
      {
         _loc2_ = _loc3_ + 90;
      }
      else if(_loc1_.pos.x < _loc1_.image_mc._x and _loc1_.pos.y <= _loc1_.image_mc._y)
      {
         _loc2_ = _loc3_ - 90;
      }
      else if(_loc1_.pos.x <= _loc1_.image_mc._x and _loc1_.pos.y > _loc1_.image_mc._y)
      {
         _loc2_ = _loc3_ - 90;
      }
      else if(_loc1_.pos.x >= _loc1_.image_mc._x and _loc1_.pos.y > _loc1_.image_mc._y)
      {
         _loc2_ = _loc3_ + 90;
      }
      _loc1_.rot = _loc2_;
   };
   _global.Bomb.prototype = new Status().putScreen = function()
   {
      var _loc1_ = this;
      _loc1_.image_mc._x = _loc1_.pos.x;
      _loc1_.image_mc._y = _loc1_.pos.y;
      _loc1_.image_mc._rotation = _loc1_.rot;
      _loc1_.broadcastMessage(_loc1_.moveMessage_str,_loc1_);
   };
   _global.Bomb.prototype = new Status().setPowerup = function(tPowerupID_num)
   {
      this.powerupID_num = tPowerupID_num;
   };
   _global.Bomb.prototype = new Status().onStartFalling = function()
   {
      this.onEnterFrame = this.falling;
   };
   _global.Bomb.prototype = new Status().onStopFalling = function()
   {
      var _loc1_ = this;
      _loc1_.onEnterFrame = null;
      var _loc2_ = new Object();
      _loc2_.x = _loc1_.pos.x;
      _loc2_.y = _loc1_.pos.y;
      _loc2_.scale = _loc1_.image_mc._xscale * _loc1_.boomScalePerc_num;
      _loc1_.broadcastMessage("onBombExploded",_loc1_,_loc2_);
      _loc1_.removeMovieClip(_loc1_);
   };
   §§push(ASSetPropFlags(_global.Bomb.prototype,null,1));
}
§§pop();
