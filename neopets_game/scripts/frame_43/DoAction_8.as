_global.ScoreboardClass = function(pX, pY, pGameObj)
{
   this.init(pX,pY,pGameObj);
};
ScoreboardClass.extend(SpriteClass);
var obj = ScoreboardClass.prototype;
obj.init = function(pX, pY, pGameObj)
{
   var _loc1_ = this;
   super.init(pX,pY);
   _loc1_.pGameObj = pGameObj;
   _loc1_.pPlayer = _root.world.player;
   _loc1_.pPlayer.updateDamageMeter();
   _loc1_.pEnabled = 1;
   var _loc2_ = _loc1_.attachMovie("player_meter","meter",100);
   var _loc3_ = 4 * gMyGame.getDifficulty();
   _loc2_.mcExtends(Meter_Horiz,168,156,_loc3_,_loc1_.pPlayer);
   _loc1_.action_txt.htmlText = "";
};
obj.toggleMenus = function()
{
   var _loc1_ = this;
   _loc1_.pEnabled = !_loc1_.pEnabled;
   _loc1_.lb_UI._visible = _loc1_.pEnabled;
   _loc1_.lb2_UI._visible = _loc1_.pEnabled;
   _loc1_.goButton._visible = _loc1_.pEnabled;
   if(!_loc1_.pEnabled)
   {
      _loc1_.lb_UI.removeAll();
      var _loc2_ = _loc1_.pGameObj;
      var _loc3_ = _loc2_.getCategory("Gags");
      _loc1_.lb_UI.addItem("Click Here To Choose Gag",_loc3_);
      _loc1_.lb2_UI.removeAll();
      _loc1_.icons_mc.gotoAndStop("empty");
   }
};
obj.showIcon = function(gagName)
{
   this.icons_mc.gotoAndStop(gagName);
};
obj.setListBoxContents = function(listbox_mc, itemList, defaultIndex)
{
   listbox_mc.removeAll();
   var max = itemList.length;
   var _loc3_ = 0;
   while(_loc3_ < max)
   {
      var _loc1_ = itemList[_loc3_];
      var quantity = _loc1_.getQuantity();
      var _loc2_ = _loc1_.getName();
      if(typeof quantity == "number")
      {
         var pLabel = quantity + "x " + _loc2_;
      }
      else if(_loc2_ == "**Say")
      {
         var pLabel = _loc2_;
      }
      else
      {
         var quantity = _loc1_.getItemCount();
         var pLabel = quantity + "x " + _loc2_;
      }
      var pData = _loc1_;
      listbox_mc.addItem(pLabel,_loc1_);
      _loc3_ = _loc3_ + 1;
   }
   var sub = _loc1_.getCategoryList();
   if(sub != -1)
   {
      listbox_mc.setSelectedIndex(0);
   }
};
obj.addListBoxes = function()
{
   var _loc1_ = this;
   var pY = 20;
   var pX = 164;
   _loc1_.attachMovie("FListBoxSymbol","lb_UI",1);
   var _loc2_ = _loc1_.lb_UI;
   _loc2_.setAutoHideScrollBar(true);
   _loc2_._x = pX;
   _loc2_._y = pY;
   _loc2_.setSize(160,10);
   _loc1_.attachMovie("FListBoxSymbol","lb2_UI",2);
   _loc2_ = _loc1_.lb2_UI;
   _loc2_.setAutoHideScrollBar(true);
   _loc2_._x = pX;
   _loc2_._y = pY + _loc1_.lb_UI._height - 14;
   _loc2_.setSize(160,90);
   var inv = _loc1_.pGameObj;
   var category = inv.getCategory("Gags");
   _loc1_.lb_UI.addItem("Click Here To Choose Gag",category);
   _loc1_.lb_UI.setChangeHandler("onChange",_loc1_.lb_UI);
   _loc1_.lb_UI.onChange = function()
   {
      var _loc1_ = this;
      gPlayList.playSound("buttonSound");
      var label = _loc1_.getSelectedItem().label;
      if(label.indexOf("Use Gag") != -1)
      {
         _loc1_._parent.pPlayer.onGo();
      }
      else
      {
         var _loc2_ = _loc1_.getSelectedItem().data;
         var _loc3_ = _loc2_.getCategoryList();
         if(_loc3_ != -1)
         {
            var d = _loc3_;
         }
         else
         {
            var d = _loc2_.getList();
         }
         _loc1_._parent.pPlayer.setCategory(_loc2_.getName());
         _loc1_._parent.setListBoxContents(_loc1_._parent.lb2_UI,d,_loc2_.getDefaultIndex());
      }
   };
   _loc1_.goButton.onRelease = function()
   {
      this._parent.pPlayer.onGo();
   };
   _loc1_.lb2_UI.setChangeHandler("onChange",_loc1_.lb2_UI);
   _loc1_.lb2_UI.onChange = function()
   {
      var _loc1_ = this;
      var _loc3_ = _loc1_.getSelectedItem().data;
      var _loc2_ = _loc3_.getList();
      var name = _loc3_.getName();
      _loc1_._parent.pPlayer.setSelectedItem(_loc3_);
      if(_loc2_ != undefined)
      {
         gPlayList.playSound("buttonSound");
         _loc1_._parent.setListBoxContents(_loc1_,_loc2_,_loc3_.getDefaultIndex());
      }
      else
      {
         var quantity = _loc3_.getQuantity();
         if(quantity == 0)
         {
            gPlayList.playSound("buzzerSound");
         }
         else
         {
            _loc3_ = _loc1_.getSelectedItem().data;
            _loc1_._parent.pPlayer.setSelectedItem(_loc3_);
         }
      }
   };
};
