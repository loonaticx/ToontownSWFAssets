if(!_global.SoundTog)
{
   _global.SoundTog.prototype = new Status().init = function(data)
   {
      var _loc1_ = data;
      this.setImage(_loc1_.linkID);
      this.setPos(_loc1_.x,_loc1_.y);
   };
   _global.SoundTog.prototype = new Status().onRelease = function()
   {
      var _loc1_ = _root;
      _loc1_.soundTog = !_loc1_.soundTog;
      if(_loc1_.soundTog)
      {
         _loc1_.playSound(_loc1_.music_sound,99);
         this.image_mc.gotoAndStop(1);
      }
      else
      {
         this.image_mc.gotoAndStop(2);
         stopAllSounds();
      }
   };
   §§push(ASSetPropFlags(_global.SoundTog.prototype,null,1));
}
§§pop();
