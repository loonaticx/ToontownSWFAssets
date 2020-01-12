if(!_global.Status)
{
   _global.Status.prototype = new MovieClip().setImage = function(tImageLinkID)
   {
      var _loc1_ = this;
      _loc1_.linkID = tImageLinkID;
      _loc1_.image_mc.removeMovieClip();
      _loc1_.image_mc = _loc1_.attachMovie(_loc1_.linkID,"image_mc",1);
   };
   _global.Status.prototype = new MovieClip().setAlignment = function(tAlignmentX_string, tAlignmentY_string)
   {
      var _loc2_ = this;
      var _loc3_ = tAlignmentX_string;
      var _loc1_ = _loc2_.image_mc.getBounds(_loc2_);
      var offsetX_num = 0;
      var offsetY_num = 0;
      if(_loc3_ == "center")
      {
         var offsetX_num = _loc2_._x - (_loc1_.xMax - (_loc1_.xMax - _loc1_.xMin) / 2);
      }
      else if(_loc3_ == "left")
      {
         var offsetX_num = _loc2_._x - _loc1_.xMin;
      }
      else if(_loc3_ == "right")
      {
         var offsetX_num = _loc2_._x - _loc1_.xMax;
      }
      if(tAlignmentY_string == "center")
      {
         var offsetY_num = _loc2_._y - (_loc1_.yMax - (_loc1_.yMax - _loc1_.yMin) / 2);
      }
      else if(tAlignmentY_string == "top")
      {
         var offsetY_num = _loc2_._y - _loc1_.yMin;
      }
      else if(tAlignmentY_string == "bottom")
      {
         var offsetY_num = _loc2_._y - _loc1_.yMax;
      }
      _loc2_.setPos(_loc2_.image_mc._x + offsetX_num,_loc2_.image_mc._y + offsetY_num);
   };
   _global.Status.prototype = new MovieClip().setScript = function(tScriptID, tScriptData)
   {
      this.scriptID = tScriptID;
      this.scriptData = tScriptData;
   };
   _global.Status.prototype = new MovieClip().setPos = function(tx, ty)
   {
      var _loc1_ = this;
      _loc1_._x = _loc1_.pos.x = tx;
      _loc1_._y = _loc1_.pos.y = ty;
   };
   _global.Status.prototype = new MovieClip().setAngle = function(tAngle)
   {
      this._rotation = this.angle = tAngle;
   };
   §§push(ASSetPropFlags(_global.Status.prototype,null,1));
}
§§pop();
