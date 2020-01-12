_global.ItemObject = function(pType, name, available, cost, quantity)
{
   this.init(pType,name,available,cost,quantity);
};
var obj = ItemObject.prototype;
obj.init = function(pType, name, available, cost, quantity)
{
   var _loc1_ = this;
   _loc1_.pType = pType;
   _loc1_.pName = name;
   _loc1_.pAvailable = available;
   _loc1_.pCost = cost;
   _loc1_.pQuantity = quantity;
};
obj.addQuantity = function(num)
{
   this.pQuantity = this.pQuantity + num;
};
obj.getDescription = function()
{
   var _loc1_ = "<P ALIGN=\'CENTER\'>" + this.pName + "<BR><BR><BR><BR>Cost: " + this.pCost + "</P>";
   return _loc1_;
};
obj.getName = function()
{
   return this.pName;
};
obj.getQuantity = function()
{
   if(this.pQuantity == 9999)
   {
      return "**";
   }
   return this.pQuantity;
};
obj.getType = function()
{
   return this.pType;
};
obj.removeQuantity = function(num)
{
   var _loc1_ = this;
   if(_loc1_.pQuantity != 9999)
   {
      if(_loc1_.pQuantity > 0)
      {
         _loc1_.pQuantity = _loc1_.pQuantity - num;
      }
   }
};
ASSetPropFlags(ItemObject.prototype,["addQuantity","getDescription","getName","getQuantity","removeQuantity"],1);
