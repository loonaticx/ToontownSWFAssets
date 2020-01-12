_global.ShopMC = function()
{
};
ShopMC.extend(SpriteClass);
var obj = ShopMC.prototype;
obj.init = function(pX, pY, pList, numJellyBeans)
{
   var _loc1_ = this;
   super.init(pX,pY);
   Eventbroadcaster.initialize(_loc1_);
   _loc1_.icons_mc.gotoAndStop("empty");
   _loc1_.pInventory = pList;
   _loc1_.clicked = false;
   _loc1_.pNumJellyBeans = numJellyBeans;
   _loc1_.displayGags();
   _loc1_.pMode = 1;
   _loc1_.addButton.gotoAndStop("clicked");
};
obj.onClickThru = function()
{
   var _loc1_ = this;
   if(_loc1_.clicked == false)
   {
      _loc1_.clicked = true;
      _loc1_.pNumJellyBeans = _loc1_.pNumJellyBeans + 25;
      _loc1_.updateJellyBeans();
      _loc1_.broadCastMessage("onClickThru");
   }
};
obj.addQuantity = function(pObj, pQuantity)
{
   var _loc1_ = this;
   var _loc2_ = pObj;
   var _loc3_ = pQuantity;
   if(_loc1_.pMode == 1)
   {
      if(_loc1_.pNumJellyBeans - _loc3_ >= 0)
      {
         _loc2_.addQuantity(_loc1_.pMode);
         _loc1_.pNumJellyBeans = _loc1_.pNumJellyBeans - _loc3_ * _loc1_.pMode;
         _loc1_.updateJellyBeans();
      }
   }
   else if(_loc2_.getQuantity() > 0)
   {
      _loc2_.addQuantity(_loc1_.pMode);
      _loc1_.pNumJellyBeans = _loc1_.pNumJellyBeans - _loc3_ * _loc1_.pMode;
      _loc1_.updateJellyBeans();
   }
};
obj.displayGags = function()
{
   var colors = [{rb:41,gb:-28,bb:78},{rb:180,gb:115,bb:-28},{rb:-144,gb:37,bb:-47},{rb:-51,gb:-75,bb:51},{rb:180,gb:0,bb:-75},{rb:69,gb:-89,bb:32},{rb:-51,gb:64,bb:166}];
   var _loc3_ = 0;
   var catList = this.pInventory.getCategoryList();
   var max = catList.length;
   var pY = 130;
   var x = 0;
   while(x < max)
   {
      var catObj = catList[x];
      var _loc2_ = this.attachMovie("shopCatMC","category" + x,500 + x);
      var pColorObj = colors[_loc3_];
      _loc3_ = _loc3_ + 1;
      var pLabel = catObj.getName();
      _loc2_.mcExtends(CategoryStripHeader,190,pY,pLabel,pColorObj);
      var sub = catObj.getCategoryList();
      var numSubCategories = sub.length;
      if(sub != -1)
      {
         var _loc1_ = 0;
         while(_loc1_ < numSubCategories)
         {
            var subObj = _loc2_.attachMovie("shopCatMC","sub" + _loc1_,_loc1_);
            var pLabel = "  " + sub[_loc1_].getName();
            var pColorObj = colors[_loc3_];
            _loc3_ = _loc3_ + 1;
            subObj.mcExtends(CategoryStripMC,0,_loc2_._height,pLabel,pColorObj,sub[_loc1_].getList());
            _loc1_ = _loc1_ + 1;
         }
      }
      var regularObjList = catObj.getList();
      if(regularObjList != undefined)
      {
         var subObj = _loc2_.attachMovie("shopCatMC","reg",600);
         var pLabel = "";
         var pColorObj = colors[_loc3_];
         _loc3_ = _loc3_ + 1;
         subObj.mcExtends(CategoryStripMC,0,_loc2_._height,pLabel,pColorObj,regularObjList);
      }
      pY = pY + _loc2_._height;
      x++;
   }
};
obj.getInventoryList = function()
{
   return this.pInventory;
};
obj.setMode = function(mode)
{
   var _loc1_ = this;
   var _loc2_ = mode;
   if(_loc2_ == undefined)
   {
      _loc2_ = _loc1_.pMode != 1?1:-1;
   }
   if(_loc2_ == 1)
   {
      _loc1_.addButton.gotoAndStop("clicked");
      _loc1_.removeButton.gotoAndStop(1);
   }
   else
   {
      _loc1_.addButton.gotoAndStop(1);
      _loc1_.removeButton.gotoAndStop("clicked");
   }
   _loc1_.pMode = _loc2_;
};
obj.updateGagInfo = function(pString, pFrame, pAvailable)
{
   var _loc1_ = pFrame;
   var _loc2_ = this;
   _loc2_.gagInfo_txt.htmlText = pString;
   if(pAvailable)
   {
      _loc2_.icons_mc._visible = 1;
   }
   else
   {
      _loc2_.icons_mc._visible = 0;
   }
   if(typeof _loc1_ == "string")
   {
      _loc1_ = _loc1_.toLowerCase();
   }
   _loc2_.icons_mc.gotoAndStop(_loc1_);
};
obj.updateJellyBeans = function()
{
   var _loc1_ = this;
   if(_loc1_.pNumJellyBeans == 1)
   {
      var _loc2_ = "You have 1 Jellybean to spend.";
   }
   else if(_loc1_.pNumJellyBeans == 0)
   {
      _loc2_ = "Sorry, you are all out of Jellybeans!";
   }
   else
   {
      _loc2_ = "You have " + _loc1_.pNumJellyBeans + " Jellybeans to spend.";
   }
   _loc1_.beansLeft_txt.htmlText = _loc1_.beansLeft_shadow_txt.htmlText = "<P ALIGN=\'CENTER\'>" + _loc1_.pNumJellyBeans + "</P>";
   _loc1_.header_txt.htmlText = "<P ALIGN=\'CENTER\'>" + _loc2_ + "</P>";
};
ASSetPropFlags(ShopMC.prototype,["addQuantity","displayGags","getInventoryList","init","updateJellyBeans"],1);
