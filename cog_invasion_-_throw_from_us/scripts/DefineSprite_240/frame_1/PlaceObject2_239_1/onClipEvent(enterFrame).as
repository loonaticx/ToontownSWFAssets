onClipEvent(enterFrame){
   if(Key.isDown(90) || Key.isDown(37))
   {
      _root.myTarget._visible = 0;
      if(-60 < this._rotation)
      {
         this._rotation = this._rotation - v;
         _root.bg._x = Sa / 2 - Sa * (this._rotation + 90) / 180 + 265;
      }
   }
   else if(Key.isDown(88) || Key.isDown(39))
   {
      _root.myTarget._visible = 0;
      if(this._rotation < 60)
      {
         this._rotation = this._rotation + v;
         _root.bg._x = Sa / 2 - Sa * (this._rotation + 90) / 180 + 265;
      }
   }
   else
   {
      _root.myTarget._visible = 1;
   }
}
