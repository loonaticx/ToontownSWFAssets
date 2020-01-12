stageInit();
setQuestion();
levelMC.gotoAndPlay("level" + (gameLevel + 1));
seMC.sePlay("LEVEL",60);
obj = eval("floorSignMC.sign" + (floorMove[0] + 1));
obj.gotoAndStop(2);
modeMC.gotoAndPlay("mode" + moveMode);
defDoorL = doorL._x;
defDoorR = doorR._x;
