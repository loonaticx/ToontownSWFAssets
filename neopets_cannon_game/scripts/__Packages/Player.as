if(!_global.Player)
{
   _global.Player.prototype = new Status().init = function(data)
   {
      var _loc1_ = this;
      var _loc2_ = data;
      _loc1_.setImage(_loc2_.linkID);
      _loc1_.pCannon_mc = _loc1_.image_mc.pCannon_mc;
      _loc1_.pCannon_mc._rotation = 90;
      _loc1_.setPos(_loc2_.x,_loc2_.y);
      _loc1_.bombLinkID = _loc2_.bombLinkID;
      _loc1_.vel.x = 0;
      _loc1_.vel.y = 0;
      _loc1_.vel.rot = 3;
      _loc1_.velIncr.y = 0;
      _loc1_.velIncr.rot = 0;
      if(_global.gShot == "flippy")
      {
         _loc1_.velIncr.x = 0.75;
         _loc1_.velMax.x = 35;
         _loc1_.throwStrength = 60;
      }
      else
      {
         _loc1_.velIncr.x = 0.5;
         _loc1_.velMax.x = 20;
         _loc1_.throwStrength = 80;
      }
      _loc1_.velMax.y = 0;
      _loc1_.velMax.rot = -90;
      _loc1_.throwOffset.x = 0;
      _loc1_.throwOffset.y = - _loc1_._height;
   };
   _global.Player.prototype = new Status().running = function()
   {
      var _loc1_ = this;
      _loc1_.applyForces();
      _loc1_.checkMaxForce();
      _loc1_.transform();
      _loc1_.broadcastMessage("onPlayerMoved");
      _loc1_.putScreen();
   };
   _global.Player.prototype = new Status().angling = function()
   {
      var _loc1_ = this;
      _loc1_.applyForces();
      _loc1_.checkMaxForce();
      _loc1_.transform();
      _loc1_.broadcastMessage("onPlayerMoved");
      _loc1_.putScreen();
      _loc1_.rotateAngle();
      _loc1_.checkMaxAngle();
      _loc1_.broadcastMessage("onPlayerAngled",_loc1_.rot);
      _loc1_.pCannon_mc._rotation = _loc1_.rot;
   };
   _global.Player.prototype = new Status().slide = function()
   {
      var _loc1_ = this;
      _loc1_.applyForces();
      _loc1_.transform();
      _loc1_.putScreen();
      if(_loc1_.vel.x < 0)
      {
         _loc1_.onEnterFrame = null;
      }
   };
   _global.Player.prototype = new Status().applyForces = function()
   {
      var _loc1_ = this;
      _loc1_.vel.x = _loc1_.vel.x + _loc1_.velIncr.x;
      _loc1_.vel.y = _loc1_.vel.y + _loc1_.velIncr.y;
   };
   _global.Player.prototype = new Status().checkMaxForce = function()
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
   _global.Player.prototype = new Status().transform = function()
   {
      var _loc1_ = this;
      _loc1_.pos.x = _loc1_.pos.x + _loc1_.vel.x;
      _loc1_.pos.y = _loc1_.pos.y + _loc1_.vel.y;
   };
   _global.Player.prototype = new Status().putScreen = function()
   {
      var _loc1_ = this;
      _loc1_._x = _loc1_.pos.x;
      _loc1_._y = _loc1_.pos.y;
   };
   _global.Player.prototype = new Status().rotateAngle = function()
   {
      this.rot = this.rot - this.vel.rot;
   };
   _global.Player.prototype = new Status().checkMaxAngle = function()
   {
      var _loc1_ = this;
      if(_loc1_.rot < _loc1_.maxAngle)
      {
         _loc1_.rot = _loc1_.maxAngle;
      }
   };
   _global.Player.prototype = new Status().getThrowData = function()
   {
      var _loc1_ = this;
      var _loc3_ = _loc1_.rot / 360 * 2 * 3.141592653589793;
      var vectorX = Math.sin(_loc3_);
      var vectorY = Math.cos(_loc3_);
      var startX = _loc1_.armLength * vectorX;
      var startY = (- _loc1_.armLength) * vectorY;
      var velX = _loc1_.throwStrength * vectorX;
      var velY = (- _loc1_.throwStrength) * vectorY;
      var _loc2_ = new Object();
      _loc2_.linkID = _loc1_.bombLinkID;
      _loc2_.pos = new Object();
      _loc2_.pos.x = _loc1_.pos.x + _loc1_.throwOffset.x + startX;
      _loc2_.pos.y = _loc1_.pos.y + _loc1_.throwOffset.y + startY;
      _loc2_.vel = new Object();
      _loc2_.vel.x = velX + _loc1_.vel.x;
      _loc2_.vel.y = velY;
      return _loc2_;
   };
   _global.Player.prototype = new Status().panning = function()
   {
      this.broadcastMessage("onPanning");
   };
   _global.Player.prototype = new Status().onStartRunning = function()
   {
      var _loc1_ = this;
      _loc1_.image_mc.gotoAndPlay("run");
      _loc1_.pos.x = _loc1_._x;
      _loc1_.pos.y = _loc1_._y;
      _loc1_.vel.x = 0;
      _loc1_.vel.y = 0;
      _loc1_.onEnterFrame = _loc1_.running;
   };
   _global.Player.prototype = new Status().onStopRunning = function()
   {
      var _loc1_ = this;
      _loc1_.image_mc.gotoAndStop(1);
      if(_global.gShot == "flippy")
      {
         _loc1_.velIncr.x = -2;
      }
      else
      {
         _loc1_.velIncr.x = -6;
      }
      _loc1_.onEnterFrame = _loc1_.slide;
   };
   _global.Player.prototype = new Status().onStartAngle = function()
   {
      this.onEnterFrame = this.angling;
   };
   _global.Player.prototype = new Status().onStartThrowing = function()
   {
      var _loc1_ = this;
      _loc1_.image_mc.gotoAndPlay("throw");
      _loc1_.pCannon_mc.gotoAndPlay(2);
      var _loc2_ = _loc1_.getThrowData();
      _loc1_.broadcastMessage("onMakeBomb",_loc2_);
   };
   _global.Player.prototype = new Status().onStartPanning = function()
   {
      this.onEnterFrame = this.panning;
   };
   _global.Player.prototype = new Status().onStopPanning = function()
   {
      this.onEnterFrame = null;
   };
   _global.Player.prototype = new Status().rot = 90;
   _global.Player.prototype = new Status().vel = new Object();
   _global.Player.prototype = new Status().velIncr = new Object();
   _global.Player.prototype = new Status().velMax = new Object();
   _global.Player.prototype = new Status().maxAngle = 0;
   _global.Player.prototype = new Status().throwOffset = new Object();
   _global.Player.prototype = new Status().armLength = 60;
   §§push(ASSetPropFlags(_global.Player.prototype,null,1));
}
§§pop();
