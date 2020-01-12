_global.SpriteClass = function(pX, pY)
{
   this.init(pX,pY);
};
var obj = SpriteClass.prototype;
obj.init = function(pX, pY)
{
   this._x = pX;
   this._y = pY;
};
