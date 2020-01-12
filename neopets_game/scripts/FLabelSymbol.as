_global.FLabelClass = function()
{
   var _loc1_ = this;
   if(_loc1_.hostComponent == undefined)
   {
      _loc1_.hostComponent = _loc1_._parent.controller != undefined?_loc1_._parent.controller:_loc1_._parent;
   }
   if(_loc1_.customTextStyle == undefined)
   {
      if(_loc1_.hostComponent.textStyle == undefined)
      {
         _loc1_.hostComponent.textStyle = new TextFormat();
      }
      _loc1_.textStyle = _loc1_.hostComponent.textStyle;
      _loc1_.enable = true;
   }
};
FLabelClass.prototype = new MovieClip();
Object.registerClass("FLabelSymbol",FLabelClass);
FLabelClass.prototype.setLabel = function(label)
{
   var _loc1_ = this;
   var _loc2_ = _loc1_.hostComponent.styleTable.embedFonts.value;
   if(_loc2_ != undefined)
   {
      _loc1_.labelField.embedFonts = _loc2_;
   }
   _loc1_.labelField.setNewTextFormat(_loc1_.textStyle);
   _loc1_.labelField.text = label;
   _loc1_.labelField._height = _loc1_.labelField.textHeight + 2;
};
FLabelClass.prototype.setSize = function(width)
{
   this.labelField._width = width;
};
FLabelClass.prototype.setEnabled = function(enable)
{
   var _loc2_ = this;
   var _loc3_ = enable;
   _loc2_.enable = _loc3_;
   var _loc1_ = _loc2_.hostComponent.styleTable[!_loc3_?"textDisabled":"textColor"].value;
   if(_loc1_ == undefined)
   {
      _loc1_ = !_loc3_?8947848:0;
   }
   _loc2_.setColor(_loc1_);
};
FLabelClass.prototype.getLabel = function()
{
   return this.labelField.text;
};
FLabelClass.prototype.setColor = function(col)
{
   this.labelField.textColor = col;
};
