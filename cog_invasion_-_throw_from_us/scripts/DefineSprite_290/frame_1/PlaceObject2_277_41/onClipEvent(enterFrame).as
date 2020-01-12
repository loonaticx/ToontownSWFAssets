onClipEvent(enterFrame){
   if(_root.score < 15)
   {
      this.gotoAndStop(1);
   }
   else if(_root.score < 45)
   {
      this.gotoAndStop(2);
   }
   else if(_root.score < 90)
   {
      this.gotoAndStop(3);
   }
   else if(_root.score < 150)
   {
      this.gotoAndStop(4);
   }
   else
   {
      this.gotoAndStop(5);
   }
}
