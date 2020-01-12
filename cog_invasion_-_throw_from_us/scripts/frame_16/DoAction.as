stageW = 540;
stageH = 345;
kills = 0;
cog_array = [];
bg.initBg = function()
{
   myX = _X;
   var _loc1_ = 0;
   minX = -1072;
   maxX = 1072;
};
bg.attachSub = function(n, d, a1, a2)
{
   var k = _root.k;
   var r = _root.r;
   var s = _width;
   var w = _root.stageW;
   var xpos = (maxX - minX) * (a1 / 3) + minX;
   this.attachMovie("sub","s" + n,n * -1);
   with(this["s" + n])
   {
      _alpha = 100
      _x = xpos
      _y = 100
      _xscale = 100 - d / 38 * 100
      _yscale = 100 - d / 38 * 100
      this["s" + n].n = n
      this["s" + n].depth = n * -1
      
   };
};
bg.destroyMe = function(n)
{
   var _loc2_ = this["s" + n]._name;
   trace("bg destroyMe: " + _loc2_);
   removeMovieClip(_loc2_);
};
FLEM = function()
{
   this._listener_array = [];
};
addFLEMListener = function(obj)
{
   var _loc3_ = this._listener_array;
   var _loc4_ = false;
   var _loc2_ = _loc3_.length;
   while(true)
   {
      _loc2_;
      if(_loc2_--)
      {
         if(_loc3_[_loc2_] == obj)
         {
            _loc4_ = true;
            break;
         }
         continue;
      }
      break;
   }
   if(_loc4_)
   {
      return false;
   }
   _loc3_.unshift(obj);
   if(this.sendFLEMEvent == undefined)
   {
      this.sendFLEMEvent = this._sendFLEMEvent;
   }
   return true;
};
removeFLEMListener = function(obj)
{
   var _loc3_ = this._listener_array;
   var _loc2_ = _loc3_.length;
   while(true)
   {
      _loc2_;
      if(_loc2_--)
      {
         if(_loc3_[_loc2_] == obj)
         {
            _loc3_.splice(_loc2_,1);
            break;
         }
         continue;
      }
      break;
   }
   if(_loc3_.length == 0)
   {
      this.sendFLEMEvent = undefined;
   }
};
_sendFLEMEvent = function(func_str, argObj)
{
   var _loc3_ = this._listener_array;
   var _loc2_ = _loc3_.length;
   while(true)
   {
      _loc2_;
      if(_loc2_--)
      {
         if(_loc3_[_loc2_] != undefined)
         {
            _loc3_[_loc2_].func_str(argObj);
         }
         else
         {
            _loc3_.splice(_loc2_,1);
         }
         continue;
      }
      break;
   }
};
addStaticFLEM = function(obj)
{
   if(obj._listener_array == undefined)
   {
      obj._listener_array = [];
   }
};
removeStaticFLEM = function(obj)
{
   delete obj._listener_array;
   delete obj._sendFLEMEvent;
   delete obj.addFLEMListener;
   delete obj.removeFLEMListener;
};
registerFLEM = function(objects, reg)
{
   var _loc4_ = objects.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      if(reg == false)
      {
         objects[_loc2_].removeFLEMListener(this);
      }
      else
      {
         objects[_loc2_].addFLEMListener(this);
      }
      _loc2_ = _loc2_ + 1;
   }
};
addStaticFLEM(MovieClip);
addStaticFLEM(Mouse);
addStaticFLEM(Key);
Object.FLEM = function()
{
   this._listener_array = [];
};
Object.FLEM.prototype.addFLEMListener = function(obj)
{
   var _loc3_ = this._listener_array;
   var _loc4_ = false;
   var _loc2_ = _loc3_.length;
   while(true)
   {
      _loc2_;
      if(_loc2_--)
      {
         if(_loc3_[_loc2_] == obj)
         {
            _loc4_ = true;
            break;
         }
         continue;
      }
      break;
   }
   if(_loc4_)
   {
      return false;
   }
   _loc3_.unshift(obj);
   if(this.sendFLEMEvent == undefined)
   {
      this.sendFLEMEvent = this._sendFLEMEvent;
   }
   return true;
};
Object.FLEM.prototype.removeFLEMListener = function(obj)
{
   var _loc3_ = this._listener_array;
   var _loc2_ = _loc3_.length;
   while(true)
   {
      _loc2_;
      if(_loc2_--)
      {
         if(_loc3_[_loc2_] == obj)
         {
            _loc3_.splice(_loc2_,1);
            break;
         }
         continue;
      }
      break;
   }
   if(_loc3_.length == 0)
   {
      this.sendFLEMEvent = undefined;
   }
};
Object.FLEM.prototype._sendFLEMEvent = function(func_str, argObj)
{
   var _loc3_ = this._listener_array;
   var _loc2_ = _loc3_.length;
   while(true)
   {
      _loc2_;
      if(_loc2_--)
      {
         if(_loc3_[_loc2_] != undefined)
         {
            _loc3_[_loc2_].func_str(argObj);
         }
         else
         {
            _loc3_.splice(_loc2_,1);
         }
         continue;
      }
      break;
   }
};
Object.addStaticFLEM = function(obj)
{
   if(obj._listener_array == undefined)
   {
      obj._listener_array = [];
      obj._sendFLEMEvent = Object.FLEM.prototype._sendFLEMEvent;
      obj.addFLEMListener = Object.FLEM.prototype.addFLEMListener;
      obj.removeFLEMListener = Object.FLEM.prototype.removeFLEMListener;
   }
};
Object.removeStaticFLEM = function(obj)
{
   delete obj._listener_array;
   delete obj._sendFLEMEvent;
   delete obj.addFLEMListener;
   delete obj.removeFLEMListener;
};
Object.prototype.registerFLEM = function(objects, reg)
{
   if(objects.__proto__ == Array.prototype)
   {
      var _loc4_ = objects.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if(reg == false)
         {
            objects[_loc2_].removeFLEMListener(this);
         }
         else
         {
            objects[_loc2_].addFLEMListener(this);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
};
assetPropFlags(Object.prototype,["registerFLEM"],1);
Object.addStaticFLEM(MovieClip);
Object.addStaticFLEM(Mouse);
Object.addStaticFLEM(Key);
function endGame()
{
   _root.GC.endGame(_root.myLevel,_root.score);
   _root.myInterface.removeMovieClip();
   _root.alert.removeMovieClip();
   _root.showmouse = true;
   removeFLEMListener.Mouse(myTarget);
   Mouse.show();
}
function resetGame()
{
   _root.myInterface.removeMovieClip();
   _root.alert.removeMovieClip();
   _root.showmouse = true;
   removeFLEMListener.Mouse(myTarget);
   Mouse.show();
   _root.gotoAndStop(1);
}
function pauseGame()
{
   _root.myInterface.removeMovieClip();
   _root.alert.removeMovieClip();
   _root.showmouse = true;
   removeFLEMListener.Mouse(myTarget);
   Mouse.show();
}
function nextLevel()
{
   _root.GC.startLevel(_root.myLevel,_root.score);
   clearInterval(this.pInt);
   _root.gotoAndStop("main");
}
function initTarget()
{
   myTarget.myY = myTarget._y;
   myTarget.myX = myTarget._x;
   myTarget.n = 5000;
   myTarget.swapDepths(10000);
}
if(_root.flemEngine == undefined)
{
   _root.attachMovie("flemEngine","flemEngine",-888);
   if(_root.flemEngine == undefined)
   {
      trace("Cannot attach flemEngine! Make sure it is in the library.");
   }
}
initTarget();
Mouse.hide();
stop();
_root.music_loop.stop();
_root.music_loop.attachSound("game_loop");
_root.music_loop.start(0,9999);
