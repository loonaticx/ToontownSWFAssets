moveLoop++;
if(moveWait - moveLoop == 5)
{
   obj = eval("floorSignMC.sign" + (floorMove[elvPos] + 1));
   obj.gotoAndStop(1);
   elvPos++;
   obj = eval("floorSignMC.sign" + (floorMove[elvPos] + 1));
   obj.gotoAndStop(2);
}
if(moveLoop < moveWait)
{
   this.gotoAndPlay(_currentframe - 1);
}
else
{
   seMC.sePlay("elvMove",0);
   seMC.sePlay("elvOK",50);
   wallL._x = defaultPos[0];
   wallL._y = defaultPos[1];
   wallR._x = defaultPos[2];
   wallR._y = defaultPos[3];
   doorL._x = defaultPos[4];
   doorL._y = defaultPos[5];
   doorR._x = defaultPos[6];
   doorR._y = defaultPos[7];
   floorSignMC._x = defaultPos[8];
   floorSignMC._y = defaultPos[9];
   BG._x = defaultPos[10];
   BG._y = defaultPos[11];
}
