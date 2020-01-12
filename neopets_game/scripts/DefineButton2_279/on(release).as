on(release){
   gPlayList.playSound("buttonSound");
   _root.inventoryObj = this.pInventory;
   _root.gotoAndPlay("gameframe");
   this.removeMovieClip();
}
