function moveTarget()
{
   point = {myX:_root._xmouse,myY:_root._ymouse};
   this._x = point.myX;
   if(this.myY < point.myY)
   {
      this._y = point.myY;
   }
}
this.onMouseMove = this.moveTarget;
addFLEMListener.MovieClip(this);
addFLEMListener.Mouse(this);
stop();
