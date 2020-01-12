if(pTime <= getTimer())
{
   stop();
   _parent.play();
}
else
{
   gotoAndPlay(2);
}
