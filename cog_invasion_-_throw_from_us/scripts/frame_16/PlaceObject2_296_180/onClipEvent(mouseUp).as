onClipEvent(mouseUp){
   point = {myX:_root._xmouse,myY:_root._ymouse};
   var j = _root.cog_array.length;
   m = 0;
   while(m < j)
   {
      var i = _root.cog_array[m];
      if(_root.myTarget.area.hitTest(_root.bg[i]))
      {
         _root.bg[i].j = _root.bg[i].n;
         _root.bg[i].xtrackTorp = _root.bg[i].trackTorp;
         _root.cog_array.splice(m,1);
         if(_root.myLevel == 1)
         {
            _root.score = _root.score + (1 + Math.floor(_root.kills / 15));
         }
         else if(_root.myLevel == 2)
         {
            _root.score = _root.score + (3 + Math.floor(_root.kills / 15));
         }
         else if(_root.myLevel == 3)
         {
            _root.score = _root.score + 5;
         }
         if(_root.score == 15)
         {
            var announce = _root.myInterface.announce;
            announce.gotoAndStop(_root.myLevel);
            if(!announce.init)
            {
               announce.pInt = setInterval(announce,"slideUp",50);
            }
         }
         else if(_root.score == 45)
         {
            _root.gotoAndStop("round");
         }
         else if(_root.score == 90)
         {
            var announce = _root.myInterface.announce;
            announce.gotoAndStop(_root.myLevel);
            if(!announce.init)
            {
               announce.pInt = setInterval(announce,"slideUp",50);
            }
         }
         else if(_root.score == 15)
         {
            _root.gotoAndStop("round");
         }
         else if(_root.score == 300)
         {
            _root.gotoAndStop("win");
         }
         break;
      }
      m++;
   }
}
