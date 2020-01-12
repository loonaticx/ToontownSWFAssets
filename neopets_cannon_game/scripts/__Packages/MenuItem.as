if(!_global.MenuItem)
{
   _global.MenuItem.prototype = new MovieClip().onRemoveMenuItem = function(ID)
   {
      var _loc1_ = this;
      if(_loc1_.myMenu == ID)
      {
         _loc1_.removeMovieClip(_loc1_);
      }
   };
   §§push(ASSetPropFlags(_global.MenuItem.prototype,null,1));
}
§§pop();
