onClipEvent(enterFrame){
   if(_parent.pyeFlg)
   {
      sx = (_parent.pyeX - this._x) / 5;
      sy = (_parent.pyeY - this._y) / 5;
      this._x = this._x + sx;
      this._y = this._y + sy;
      if(2 > sx && -2 < sx && 2 > sy && -2 < sy)
      {
         this.gotoAndStop(2);
      }
   }
}
