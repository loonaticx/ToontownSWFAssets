_global.CategoryStripHeader = function(pX, pY, pLabel, pColorObj)
{
   this.init(pX,pY,pLabel,pColorObj);
};
CategoryStripHeader.extend(SpriteClass);
var obj = CategoryStripHeader.prototype;
obj.init = function(pX, pY, pLabel, pColorObj)
{
   super.init(pX,pY);
   var _loc2_ = new Color(this.bg);
   _loc2_.setTransform(pColorObj);
   if(pLabel == "Gags")
   {
      var _loc1_ = "SELECT YOUR GAGS";
   }
   else
   {
      _loc1_ = pLabel.toUpperCase();
   }
   this.header_txt.htmlText = "<P ALIGN=\'CENTER\'>" + _loc1_ + "</P>";
};
_global.CategoryStripMC = function(pX, pY, pLabel, pColorObj, pObjList)
{
   this.init(pX,pY,pLabel,pColorObj,pObjList);
};
CategoryStripMC.extend(CategoryStripHeader);
var obj = CategoryStripMC.prototype;
obj.init = function(pX, pY, pLabel, pColorObj, pObjList)
{
   var _loc3_ = this;
   super.init(pX,pY,pLabel,pColorObj);
   _loc3_.header_txt.htmlText = "<P ALIGN=\'LEFT\'>" + pLabel + "</P>";
   _loc3_.pObjectList = pObjList;
   var max = _loc3_.pObjectList.length;
   var pX = 60;
   var _loc1_ = 0;
   while(_loc1_ < max)
   {
      var _loc2_ = _loc3_.attachMovie("shop_item_icon","shop_item_icon" + _loc1_,100 + _loc1_);
      _loc2_.mcExtends(ItemIconMC,pX,6,_loc3_.pObjectList[_loc1_]);
      pX = pX + (_loc2_._width + 3);
      _loc1_ = _loc1_ + 1;
   }
};
