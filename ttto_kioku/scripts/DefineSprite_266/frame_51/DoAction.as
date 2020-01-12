if(getTimer() <= movieTimer + doorOpenTime)
{
   restTimeText = -1 * ((getTimer() - (movieTimer + doorOpenTime)) / 1000);
   if(restTimeText < 0)
   {
      restTimeText = 0;
   }
   restTimeText = String(restTimeText).substr(0,3);
   this.gotoAndPlay(_currentframe - 1);
}
