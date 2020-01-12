function setColor(r, g, b)
{
   var _loc1_ = new Object();
   _loc1_.rb = r;
   _loc1_.gb = g;
   _loc1_.bb = b;
   colObj = new Color(this);
   colObj.setTransform(_loc1_);
}
num = parseInt(_name.substr(5,1));
this.onRollOver = function()
{
   if(!_parent.pyeFlg && !_parent.clickLock[num])
   {
      setColor(50,50,0);
   }
};
this.onRollOut = function()
{
   if(!_parent.pyeFlg && !_parent.clickLock[num])
   {
      setColor(0,0,0);
   }
};
this.onRelease = function()
{
   var _loc1_ = _parent;
   var _loc2_ = this;
   if(!_loc1_.pyeFlg && !_loc1_.clickLock[num])
   {
      setColor(0,0,0);
      _loc1_.pyeFlg = true;
      _loc1_.pyeX = _loc1_._xmouse;
      _loc1_.pyeY = _loc1_._ymouse;
      _loc1_._parent.seMC.sePlay("pyeTh",30);
      _loc1_._parent.clickCogNum = _loc1_._parent.answerCog[num];
      if(_loc1_._parent.questionPat <= 2)
      {
         _loc1_._parent.questionPlate.countDown.stop();
         if(num == _loc1_._parent.answer[0])
         {
            _loc1_.goodFlg = "good";
            _loc1_.clickLock[num] = true;
            _loc1_.clickNum = num;
            _loc2_.useHandCursor = false;
         }
         else
         {
            _loc1_.goodFlg = "bad";
         }
      }
      if(_loc1_._parent.questionPat == 3)
      {
         k = [];
         i = 0;
         while(i < 4)
         {
            k.push(_loc1_._parent.answer[i]);
            i++;
         }
         k.sort();
         if(_loc1_._parent.answer[num] == k[_loc1_.loops])
         {
            _loc1_.loops = _loc1_.loops + 1;
            _loc1_.clickLock[num] = true;
            _loc1_.clickNum = num;
            _loc2_.useHandCursor = false;
            _loc1_.goodFlg = "step";
            if(_loc1_.loops == _loc1_.loopMax)
            {
               _loc1_.goodFlg = "good";
               _loc1_._parent.questionPlate.countDown.stop();
            }
         }
         else
         {
            _loc1_.goodFlg = "bad";
         }
      }
      if(_loc1_._parent.questionPat == 4)
      {
         k = [];
         i = 0;
         while(i < 4)
         {
            k.push(_loc1_._parent.answer[i]);
            i++;
         }
         k.sort();
         k.reverse();
         if(_loc1_._parent.answer[num] == k[_loc1_.loops])
         {
            _loc1_.loops = _loc1_.loops + 1;
            _loc1_.clickLock[num] = true;
            _loc1_.clickNum = num;
            _loc2_.useHandCursor = false;
            _loc1_.goodFlg = "step";
            if(_loc1_.loops == _loc1_.loopMax)
            {
               _loc1_.goodFlg = "good";
               _loc1_._parent.questionPlate.countDown.stop();
            }
         }
         else
         {
            _loc1_.goodFlg = "bad";
         }
      }
   }
};
this.stop();
