if(!_global.Prompt)
{
   _global.Prompt.prototype = new Status().init = function(data)
   {
      var _loc1_ = this;
      var _loc2_ = data;
      _loc1_.setImage(_loc2_.linkID);
      _loc1_.setPos(_loc2_.x,_loc2_.y);
      _loc1_.image_mc._visible = false;
      _loc1_.image_mc._y = _loc1_.image_mc._y - 70;
      _loc1_.cue_array = new Array();
      var _loc3_ = _loc1_;
      _loc1_.createTextField("my_txt",99999,-200,-100,400,400);
      _loc1_.my_txt = _loc3_.my_txt;
      _loc1_.my_txt.selectable = false;
   };
   _global.Prompt.prototype = new Status().updateCue = function()
   {
      var _loc1_ = this;
      var _loc2_ = _loc1_.cue_array[0];
      _loc2_.displayTime = _loc2_.displayTime - 1;
      if(_loc2_.displayTime <= 0)
      {
         if(_loc2_.waitForClick)
         {
            _loc1_.onEnterFrame = null;
         }
         else
         {
            if(_loc1_.cue_array[0].remove == true)
            {
               var _loc3_ = true;
            }
            else
            {
               _loc3_ = false;
            }
            _loc1_.cue_array.splice(0,1);
            if(_loc1_.cue_array.length)
            {
               _loc1_.setText(_loc1_.cue_array[0]);
               if(_loc1_.cue_array[0].scriptID != null)
               {
                  _loc1_.broadcastMessage(_loc1_.cue_array[0].scriptID);
               }
            }
            else
            {
               if(_loc3_ == true)
               {
                  _loc1_._visible = false;
               }
               _loc1_.onEnterFrame = null;
            }
         }
      }
   };
   _global.Prompt.prototype = new Status().onMouseUp = function()
   {
      var _loc1_ = this;
      var _loc2_ = _loc1_.cue_array[0];
      if(_loc2_.waitForClick)
      {
         _loc1_.cue_array.splice(0,1);
         _loc1_.broadcastMessage(_loc2_.scriptID,_loc2_.scriptData);
         if(_loc1_.cue_array.length)
         {
            _loc1_.setText(_loc1_.cue_array[0]);
            _loc1_.onEnterFrame = _loc1_.updateCue;
         }
         else
         {
            _loc1_._visible = false;
            _loc1_.onEnterFrame = null;
         }
      }
   };
   _global.Prompt.prototype = new Status().addToTextDisplayCue = function(data)
   {
      var _loc1_ = this;
      _loc1_.cue_array.push(data);
      if(_loc1_.cue_array.length == 1)
      {
         _loc1_.setText(_loc1_.cue_array[0]);
      }
      _loc1_.onEnterFrame = _loc1_.updateCue;
      _loc1_._visible = true;
   };
   _global.Prompt.prototype = new Status().setText = function(data)
   {
      var _loc2_ = this;
      var _loc3_ = data;
      var _loc1_ = new TextFormat();
      _loc1_.size = _loc3_.txt_size;
      _loc1_.font = "Arial";
      _loc1_.align = "center";
      _loc1_.bold = true;
      _loc1_.color = _loc3_.txt_color;
      _loc2_.my_txt.html = true;
      _loc2_.my_txt.htmlText = _loc3_.txt_str;
      _loc2_.my_txt.setTextFormat(_loc1_);
      _loc2_.my_txt.selectable = false;
      if(_loc3_.imageAlpha != null)
      {
         _loc2_.image_mc._visible = true;
         _loc2_.image_mc._alpha = _loc3_.imageAlpha;
      }
      else
      {
         _loc2_.image_mc._alpha = 100;
         _loc2_.image_mc._visible = false;
      }
   };
   §§push(ASSetPropFlags(_global.Prompt.prototype,null,1));
}
§§pop();
