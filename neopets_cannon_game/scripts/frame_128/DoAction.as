stop();
_global.gMyNeoStatus.sendTag("Game Finished");
var s = _root.GAMESCORE.show();
var str = "";
if(s < 100)
{
   str = "Keep Playing! You can do better.";
}
else if(s >= 100 && s < 200)
{
   str = "Pretty Good. With practice you can do better.";
}
else if(s >= 300 && s < 400)
{
   str = "Nice Job!";
}
else if(s >= 400)
{
   str = "Great Job!";
}
_root.text_txt.htmlText = "<P ALIGN=\'CENTER\'>Your Score: " + _root.GAMESCORE.show() + "</P><P ALIGN=\'CENTER\'>" + str + "</P>";
