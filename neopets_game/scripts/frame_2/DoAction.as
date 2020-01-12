_global.gMyScoringSystem = new _level100.include.ScoringSystem(0);
Object.prototype.toString = gMyScoringSystem.codeBase.object.toString;
ASSetPropFlags(Object.prototype,["toString"],1);
Object.prototype.getDuplicate = gMyScoringSystem.codeBase.object.getDuplicate;
ASSetPropFlags(Object.prototype,["getDuplicate"],1);
Function.prototype.extend = function(superClass)
{
   var _loc1_ = this;
   _loc1_.prototype.__proto__ = superClass.prototype;
   _loc1_.prototype.__constructor__ = superClass;
   ASSetPropFlags(_loc1_.prototype,["__constructor__"],1);
};
ASSetPropFlags(Function.prototype,["extend"],1);
MovieClip.prototype.mcExtends = function(superClass)
{
   var _loc3_ = superClass;
   if(typeof _loc3_ == "function")
   {
      this.__proto__ = _loc3_.prototype;
      if(typeof this.attachMovie == "undefined")
      {
         var _loc2_ = this.__proto__;
         var _loc1_ = _loc2_.__proto__.__proto__;
         while(_loc1_ != null)
         {
            _loc1_ = _loc1_.__proto__;
            _loc2_ = _loc2_.__proto__;
         }
         _loc2_.__proto__ = MovieClip.prototype;
      }
      arguments.splice(0,1);
      _loc3_.apply(this,arguments);
   }
};
ASSetPropFlags(MovieClip.prototype,["mcExtends"],1);
_global.EventBroadcaster = new Object();
EventBroadcaster.initialize = function(obj)
{
   var _loc1_ = obj;
   var _loc2_ = this;
   _loc1_._listeners = new Array();
   _loc1_.broadcastMessage = _loc2_._broadcastMessage;
   _loc1_.addListener = _loc2_._addListener;
   _loc1_.removeListener = _loc2_._removeListener;
};
EventBroadcaster._broadcastMessage = function()
{
   var _loc3_ = arguments;
   var _loc2_ = _loc3_.shift();
   var _loc1_ = this._listeners;
   for(var i in _loc1_)
   {
      _loc1_[i][_loc2_].apply(_loc1_[i],_loc3_);
   }
};
EventBroadcaster._addListener = function(obj)
{
   this.removeListener(obj);
   this._listeners.push(obj);
   return true;
};
EventBroadcaster._removeListener = function(obj)
{
   var _loc2_ = obj;
   var _loc1_ = this._listeners;
   var _loc3_ = _loc1_.length;
   for(var _loc3_ in _loc1_)
   {
      if(_loc1_[_loc3_] == _loc2_)
      {
         _loc1_.splice(_loc3_,1);
         return true;
      }
   }
   return false;
};
_global.gMyNeoStatus = new gMyScoringSystem.NeoStatus(0);
_global.gVisitedSponsor = 0;
