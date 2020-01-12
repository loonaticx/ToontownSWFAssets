_global.Inventory = function()
{
   this.init();
};
var obj = Inventory.prototype;
obj.init = function()
{
   this.pCategoryList = [];
   this.pName = "inventory obj";
};
obj.addCategory = function(pName)
{
   var _loc1_ = pName;
   var _loc2_ = this;
   _loc2_[_loc1_] = new CategoryObject(_loc1_);
   var obj = _loc2_[_loc1_];
   _loc2_.pCategoryList.append(_loc2_[_loc1_]);
   return _loc2_[_loc1_];
};
obj.addObject = function(pCategory, pObj)
{
   var _loc1_ = this;
   var _loc2_ = pCategory;
   if(!_loc1_[_loc2_])
   {
      _loc1_.addCategory(_loc2_);
   }
   _loc1_[_loc2_].addObject(pObj);
};
obj.getCategoryList = function()
{
   var _loc1_ = this.pCategoryList.length == 0?-1:this.pCategoryList;
   return _loc1_;
};
obj.setDefaultCategory = function(obj)
{
   this.pDefaultCategory = obj;
};
obj.getDefaultCategory = function()
{
   return this.pDefaultCategory;
};
obj.getDefaultCategoryIndex = function()
{
   var _loc1_ = this.pCategoryList.getOne(this.pDefaultOption);
   return _loc1_;
};
obj.getCategory = function(pCategory)
{
   return this[pCategory];
};
ASSetPropFlags(Inventory.prototype,["addCategory","addObject","getCategory","getCategoryList"],1);
