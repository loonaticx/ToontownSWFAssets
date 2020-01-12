_global.ItemIconMC = function(pX, pY, pObject)
{
   this.init(pX,pY,pObject);
};
ItemIconMC.extend(SpriteClass);
var obj = ItemIconMC.prototype;
obj.init = function(pX, pY, pObject)
{
   var _loc1_ = this;
   super.init(pX,pY);
   _root.shop.addListener(_loc1_);
   _loc1_.pObject = pObject;
   _loc1_.pName = _loc1_.pObject.getName();
   _loc1_.icon_mc.gotoAndStop(_loc1_.pName.toLowerCase());
   if(_loc1_.pObject.pAvailable == 0)
   {
      _loc1_.icon_mc.grayBox._alpha = 100;
   }
   else
   {
      _loc1_.icon_mc.grayBox._alpha = 0;
   }
};
obj.onClickThru = function()
{
   var _loc1_ = this;
   if(_loc1_.pObject.pAvailable == 0)
   {
      _loc1_.icon_mc.grayBox._alpha = 100;
   }
   else
   {
      _loc1_.icon_mc.grayBox._alpha = 0;
   }
};
obj.onRollOver = function()
{
   var _loc1_ = this;
   if(_loc1_.pObject.pAvailable)
   {
      var _loc2_ = _loc1_.pObject.getDescription();
   }
   else
   {
      _loc2_ = "Activate This Gag By Visiting Toontown.com";
   }
   _root.shop.updateGagInfo(_loc2_,_loc1_.pName,_loc1_.pObject.pAvailable);
};
obj.onRelease = function()
{
   var _loc1_ = this;
   if(_loc1_.pObject.pAvailable == 1)
   {
      gPlayList.playSound("buttonSound");
      var _loc2_ = _loc1_.pObject.pCost;
      _root.shop.addQuantity(_loc1_.pObject,_loc2_);
      _loc1_.quantity_txt.htmlText = _loc1_.pObject.getQuantity();
   }
};
