_global.gMyScoringSystem = new _level100.include.ScoringSystem(0);
Object.prototype.toString = _global.gMyScoringSystem.codeBase.object.toString;
ASSetPropFlags(Object.prototype,["toString"],1);
Object.prototype.getDuplicate = _global.gMyScoringSystem.codeBase.object.getDuplicate;
ASSetPropFlags(Object.prototype,["getDuplicate"],1);
_global.gMyNeoStatus = new _global.gMyScoringSystem.NeoStatus(0);
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
