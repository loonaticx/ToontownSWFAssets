if(getTimer() > movieTimer + levelWait)
{
   this.gotoAndPlay("return");
}
else
{
   this.gotoAndPlay(_currentframe - 1);
}
