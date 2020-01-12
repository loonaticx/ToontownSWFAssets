onClipEvent(enterFrame){
   if(_root.getBytesLoaded() >= _root.getBytesTotal())
   {
      _root.play();
   }
   else
   {
      this.bar._width = _root.getBytesLoaded() / _root.getBytesTotal() * 157;
   }
}
