_global.GagObject = function(pType, name, available, cost, quantity, damage, easy_index, animationFrame, damageFrame)
{
   this.init(pType,name,available,cost,quantity,damage,easy_index,animationFrame,damageFrame);
};
GagObject.prototype = new ItemObject();
var obj = GagObject.prototype;
obj.init = function(pType, name, available, cost, quantity, damage, easy_index, animationFrame, damageFrame)
{
   var _loc1_ = this;
   super.init(pType,name,available,cost,quantity);
   _loc1_.pDamage = damage;
   _loc1_.pEasyIndex = easy_index;
   _loc1_.pAnimationFrame = animationFrame;
   _loc1_.pDamageFrame = damageFrame;
};
obj.addAProp = function(prop, value)
{
   this[prop] = value;
};
obj.getDescription = function()
{
   var _loc2_ = this;
   var _loc1_ = "<P ALIGN=\'CENTER\'>" + _loc2_.pName + "</P><BR><BR><BR><P ALIGN=\'LEFT\'>Damage: " + _loc2_.pDamage + "<BR>Cost: " + _loc2_.pCost + "</P>";
   return _loc1_;
};
obj.getAnimationFrame = function()
{
   return this.pAnimationFrame;
};
obj.getDamageFrame = function()
{
   return this.pDamageFrame;
};
obj.getEasyIndex = function()
{
   return this.pEasyIndex;
};
obj.getDamage = function()
{
   return this.pDamage;
};
