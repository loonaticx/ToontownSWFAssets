if(0.5 > sxL && 0.5 > sxR)
{
   doorL._x = defDoorL;
   doorR._x = defDoorR;
   seMC.sePlay("elvClose",30);
   if(elvPos == 4)
   {
      this.gotoAndPlay("answer");
   }
}
else
{
   this.gotoAndPlay(_currentframe - 1);
}
