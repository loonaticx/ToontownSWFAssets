if(!_global.BasicButton)
{
   _global.BasicButton.prototype = new Status().init = function(data)
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
      _loc1_.my_txt.selectable = false;
      if(_loc2_.scriptID != null)
      {
         if(_loc2_.scriptID != "noButton")
         {
            _loc1_.setScript(_loc2_.scriptID,_loc2_.scriptData);
            _loc1_.onPress = _loc1_.buttonPress;
            _loc1_.onRelease = _loc1_.buttonRelease;
            _loc1_.onReleaseOutside = _loc1_.buttonReleaseOutside;
            _loc1_.onRollOver = _loc1_.buttonRollOver;
            _loc1_.onRollOut = _loc1_.buttonRollOut;
         }
      }
      else
      {
         _loc1_.onPress = null;
         _loc1_.onRelease = null;
         _loc1_.onReleaseOutside = null;
         _loc1_.onRollOver = null;
         _loc1_.onRollOut = null;
         _loc1_.useHandCursor = false;
      }
   };
   _global.BasicButton.prototype = new Status().setText = function(data)
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
   _global.BasicButton.prototype = new Status().brighten = function(brightness)
   {
      var _loc3_ = brightness;
      var _loc2_ = new Color(this.image_mc);
      var _loc1_ = new Object();
      _loc1_.rb = _loc3_;
      _loc1_.gb = _loc3_;
      _loc1_.bb = _loc3_;
      _loc2_.setTransform(_loc1_);
   };
   _global.BasicButton.prototype = new Status().setPosBy = function(posOffest)
   {
      var _loc1_ = this;
      _loc1_.setPos(_loc1_.pos.x + posOffest.x,_loc1_.pos.y + posOffest.y);
   };
   _global.BasicButton.prototype = new Status().buttonPress = function()
   {
      var _loc1_ = this;
      _loc1_.setPosBy(_loc1_.pressPosOffset,_loc1_.pressPosOffset);
   };
   _global.BasicButton.prototype = new Status().buttonRelease = function()
   {
      var _loc1_ = this;
      _loc1_.setPosBy(- _loc1_.pressPosOffset,- _loc1_.pressPosOffset);
      _loc1_.broadcastMessage(_loc1_.scriptID,_loc1_.scriptData);
   };
   _global.BasicButton.prototype = new Status().buttonReleaseOutside = function()
   {
      var _loc1_ = this;
      _loc1_.setPosBy(- _loc1_.pressPosOffset,- _loc1_.pressPosOffset);
      _loc1_.brighten(0);
      _loc1_.broadcastMessage(_loc1_.scriptID,_loc1_.scriptData);
   };
   _global.BasicButton.prototype = new Status().buttonRollOver = function()
   {
      this.brighten(40);
   };
   _global.BasicButton.prototype = new Status().buttonRollOut = function()
   {
      this.brighten(0);
   };
   _global.BasicButton.prototype = new Status().onRemoveButton = function()
   {
      this.removeMovieClip(this);
   };
   _global.BasicButton.prototype = new Status().pressPosOffset = 2;
   §§push(ASSetPropFlags(_global.BasicButton.prototype,null,1));
}
§§pop();
