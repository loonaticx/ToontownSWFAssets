onClipEvent(enterFrame){
   if(_root.showmouse)
   {
      Mouse.show();
      myTarget._visible = 0;
   }
   else
   {
      Mouse.hide();
      myTarget._visible = 1;
   }
}
