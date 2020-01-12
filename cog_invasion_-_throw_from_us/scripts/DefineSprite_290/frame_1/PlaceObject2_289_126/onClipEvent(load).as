onClipEvent(load){
   function slideUp()
   {
      init = true;
      this._y = this._y - inc;
      if(destY >= this._y)
      {
         clearInterval(this.pInt);
         this.pInt = setInterval(this,"pauseMe",2000);
      }
   }
   function slideDown()
   {
      this._y = this._y + inc;
      if(this._y >= origY)
      {
         clearInterval(this.pInt);
      }
   }
   function pauseMe()
   {
      clearInterval(this.pInt);
      this.pInt = setInterval(this,"slideDown",50);
   }
   destY = 117.1;
   origY = 177.1;
   inc = 10;
   init = false;
}
