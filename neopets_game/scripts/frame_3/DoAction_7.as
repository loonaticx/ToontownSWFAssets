_root.aboutCode = function()
{
   var _loc1_ = this.attachMovie("about_mc","about_mc",100);
   var _loc3_ = 360;
   var _loc2_ = 270;
   _loc1_.mcExtends(Zoom_MC,_loc3_,_loc2_);
   EventBroadCaster.initialize(_loc1_);
   _loc1_.addListener(this.mainMenu_mc);
   _loc1_.easeToFullScale();
};
_root.webCode = function()
{
   getURL(_root.sponsorURL,"_blank");
   gVisitedSponsor = 1;
   var _loc1_ = _root.myInventory.getCategory("Gags");
   var _loc2_ = _loc1_.getCategory("Throw");
   var _loc3_ = _loc2_.getItem("Birthday Cake");
   _loc3_.pAvailable = 1;
   if(this.shop)
   {
      this.shop.onClickThru();
   }
};
_root.webVoucherCode = function()
{
   getUrl("http://www.neopets.com/process_click.phtml?item_id=5002", "_blank");
};
_root.instructionsCode = function()
{
   var _loc1_ = this.attachMovie("instructions_mc","instructions_mc",100);
   var _loc3_ = 360;
   var _loc2_ = 270;
   _loc1_.mcExtends(Zoom_MC,_loc3_,_loc2_);
   EventBroadCaster.initialize(_loc1_);
   _loc1_.addListener(this.mainMenu_mc);
   _loc1_.easeToFullScale();
};
_root.trackWebButton = function()
{
   var tTarget = this;
};
