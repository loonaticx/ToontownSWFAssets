this.stop();
_parent._parent.pyeFlg = false;
_parent._x = _parent.defX;
_parent._y = _parent.defY;
if(_parent._parent.goodFlg == "step")
{
   obj = eval("_parent._parent.chara" + _parent._parent.clickNum);
   obj.setColor(-100,-100,-100);
}
else if(_parent._parent.goodFlg == "good")
{
   obj = eval("_parent._parent.chara" + _parent._parent.clickNum);
   obj.setColor(-100,-100,-100);
   _parent._parent._parent.gotoAndPlay("good");
}
else if(_parent._parent.goodFlg == "bad")
{
   _parent._parent._parent.gotoAndPlay("bad");
}
_parent.gotoAndStop(1);
