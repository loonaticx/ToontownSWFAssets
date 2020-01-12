_global.CategoryObject = function(pName)
{
   this.init(pName);
};
CategoryObject.prototype = new Inventory();
var obj = CategoryObject.prototype;
obj.init = function(pName)
{
   var _loc1_ = this;
   super.init();
   _loc1_.pCategoryList = [];
   _loc1_.pName = pName;
   _loc1_.pDefaultOption;
};
obj.addObject = function(obj)
{
   var _loc1_ = this;
   if(_loc1_.pItemList == undefined)
   {
      _loc1_.pItemList = [];
   }
   _loc1_.pItemList.append(obj);
   return obj;
};
obj.addSubCategory = function(pName)
{
   var _loc1_ = pName;
   var _loc2_ = this;
   _loc2_[_loc1_] = new CategoryObject(_loc1_);
   _loc2_.pCategoryList.append(_loc2_[_loc1_]);
   return _loc2_[_loc1_];
};
obj.getDefault = function()
{
   return this.pDefaultOption;
};
obj.getDefaultIndex = function(obj)
{
   var _loc1_ = this.pItemList.getOne(this.pDefaultOption);
   return _loc1_;
};
obj.getItemCount = function()
{
   var count = 0;
   var max = this.pItemList.length;
   var _loc1_ = 0;
   while(_loc1_ < max)
   {
      var _loc3_ = this.pItemList[_loc1_];
      var _loc2_ = _loc3_.getQuantity();
      if(typeof _loc2_ == "number")
      {
         count = count + _loc2_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return count;
};
obj.getItem = function(pName)
{
   var max = this.pItemList.length;
   var _loc1_ = 0;
   while(_loc1_ < max)
   {
      var _loc2_ = this.pItemList[_loc1_];
      var _loc3_ = _loc2_.getName();
      if(_loc3_ == pName)
      {
         return _loc2_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return -1;
};
obj.getList = function()
{
   return this.pItemList;
};
obj.getName = function()
{
   return this.pName;
};
obj.getSubCategories = function()
{
   return this.pCategoryList;
};
obj.getNumSubCategories = function()
{
   return this.getCategoryList().length;
};
obj.setDefault = function(obj)
{
   this.pDefaultOption = obj;
};
obj.sortListBy = function(fieldName, dir)
{
   var _loc1_ = this;
   var _loc2_ = fieldName;
   if(dir == 1)
   {
      _loc1_.pCategoryList.sortOn(_loc2_);
      _loc1_.pItemList.sortOn(_loc2_);
   }
   else
   {
      _loc1_.pCategoryList.reverseSortOn(_loc2_);
      _loc1_.pItemList.reverseSortOn(_loc2_);
   }
};
ASSetPropFlags(CategoryObject.prototype,["addSubCategory","addObject","getCategory","getDefault","getNumSubCategories","getList","getName","setDefault","sortListBy"],1);
