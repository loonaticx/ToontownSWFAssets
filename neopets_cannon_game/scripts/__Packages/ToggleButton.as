if(!_global.ToggleButton)
{
   _global.ToggleButton.prototype = new Status().init = function(data)
   {
      var _loc1_ = this;
      var _loc2_ = data;
      _loc1_.setImage(_loc2_.linkID);
      _loc1_.setPos(_loc2_.x,_loc2_.y);
      _loc1_.setAlignment(_loc2_.alignmentX,_loc2_.alignmentY);
      var tMy_mc = _loc1_;
      if(_loc2_.textData != null)
      {
         if(_loc1_.image_mc._width)
         {
            var _loc3_ = _loc1_.image_mc._width;
         }
         else
         {
            _loc3_ = 300;
         }
         _loc1_.createTextField("my_txt",99999,- _loc3_ / 2,-11,_loc3_,40);
         _loc1_.my_txt = tMy_mc.my_txt;
         _loc1_.setText(_loc2_.textData);
      }
      _loc1_.setScript(_loc2_.scriptID,_loc2_.scriptData);
      _loc1_.info_str = _loc2_.info_str;
      if(_loc2_.activated)
      {
         _loc1_.onActivate();
      }
      else
      {
         _loc1_.onDeactivate();
      }
   };
   _global.ToggleButton.prototype = new Status().setText = function(data)
   {
      var _loc2_ = data;
      var _loc3_ = this;
      var _loc1_ = new TextFormat();
      _loc1_.size = _loc2_.txt_size;
      _loc1_.font = "Arial";
      _loc1_.align = "center";
      _loc1_.bold = true;
      _loc1_.color = _loc2_.txt_color;
      _loc3_.my_txt.html = true;
      _loc3_.my_txt.htmlText = _loc2_.txt_str;
      _loc3_.my_txt.setTextFormat(_loc1_);
   };
   _global.ToggleButton.prototype = new Status().brighten = function(brightness)
   {
      var _loc3_ = brightness;
      var _loc2_ = new Color(this.image_mc);
      var _loc1_ = new Object();
      _loc1_.rb = _loc3_;
      _loc1_.gb = _loc3_;
      _loc1_.bb = _loc3_;
      _loc2_.setTransform(_loc1_);
   };
   _global.ToggleButton.prototype = new Status().setPosBy = function(offsetX, offsetY)
   {
      this._x = this._x + offsetX;
      this._y = this._y + offsetY;
   };
   _global.ToggleButton.prototype = new Status().buttonPress = function()
   {
      var _loc1_ = this;
      if(_loc1_.paused_boolean == false)
      {
         if(_loc1_.toggle_boolean)
         {
            _loc1_.broadcastMessage(_loc1_.scriptID,_loc1_.scriptData);
            _loc1_.brighten(0);
         }
         else
         {
            _loc1_.broadcastMessage(_loc1_.scriptID,_loc1_.scriptData);
            _loc1_.brighten(100);
         }
         _loc1_.toggle_boolean = !_loc1_.toggle_boolean;
      }
   };
   _global.ToggleButton.prototype = new Status().buttonRelease = function()
   {
   };
   _global.ToggleButton.prototype = new Status().buttonReleaseOutside = function()
   {
   };
   _global.ToggleButton.prototype = new Status().buttonRollOver = function()
   {
      var _loc1_ = this;
      if(_loc1_.paused_boolean == false)
      {
         _loc1_.broadcastMessage("onShowInfo",_loc1_.info_str);
      }
   };
   _global.ToggleButton.prototype = new Status().buttonRollOut = function()
   {
      var _loc1_ = this;
      if(_loc1_.paused_boolean == false)
      {
         _loc1_.broadcastMessage("onHideInfo",_loc1_.info_str);
      }
   };
   _global.ToggleButton.prototype = new Status().onRemoveButton = function()
   {
      this.removeMovieClip(this);
   };
   _global.ToggleButton.prototype = new Status().onActivate = function()
   {
      var _loc1_ = this;
      _loc1_.onPress = _loc1_.buttonPress;
      _loc1_.onRelease = _loc1_.buttonRelease;
      _loc1_.onReleaseOutside = _loc1_.buttonReleaseOutside;
      _loc1_.onRollOver = _loc1_.buttonRollOver;
      _loc1_.onRollOut = _loc1_.buttonRollOut;
      _loc1_.useHandCursor = true;
      _loc1_.toggle_boolean = false;
      _loc1_.useHandCursor = true;
      _loc1_.brighten(0);
   };
   _global.ToggleButton.prototype = new Status().onDeactivate = function()
   {
      var _loc1_ = this;
      _loc1_.onPress = null;
      _loc1_.onRelease = null;
      _loc1_.onReleaseOutside = null;
      _loc1_.onRollOver = null;
      _loc1_.onRollOut = null;
      _loc1_.useHandCursor = false;
      _loc1_.toggle_boolean = false;
      _loc1_.useHandCursor = false;
      _loc1_.brighten(-1000);
   };
   _global.ToggleButton.prototype = new Status().onPause = function()
   {
      this.paused_boolean = true;
      this.useHandCursor = false;
   };
   _global.ToggleButton.prototype = new Status().onUnPause = function()
   {
      var _loc1_ = this;
      _loc1_.paused_boolean = false;
      if(_loc1_.onPress != null)
      {
         _loc1_.useHandCursor = true;
      }
   };
   _global.ToggleButton.prototype = new Status().pressPosOffset = 2;
   _global.ToggleButton.prototype = new Status().toggle_boolean = false;
   _global.ToggleButton.prototype = new Status().paused_boolean = false;
   _global.ToggleButton.prototype = new Status().info_str = "";
   §§push(ASSetPropFlags(_global.ToggleButton.prototype,null,1));
}
§§pop();
