onClipEvent(load){
   myY = this._y;
   myX = this._x;
   hits = 0;
   this.swapDepths(10001);
   mySound = new Sound(this);
   mySound.setVolume(0);
   mySound.start(0,9999);
}
