if(getTimer() > movieTimer + returnWait)
{
   this.gotoAndPlay("return");
}
else
{
   this.gotoAndPlay(_currentframe - 1);
}
