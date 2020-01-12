if(gameLevel < 19)
{
   gameLevel++;
}
if(gameOverFlg)
{
   this.gotoAndPlay("gameover");
}
else
{
   this.gotoAndPlay("start");
}
