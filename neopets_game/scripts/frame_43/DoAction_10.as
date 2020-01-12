_global.Game = function(pDifficulty)
{
   this.init(pDifficulty);
};
var obj = Game.prototype;
obj.init = function(pDifficulty)
{
   var _loc1_ = this;
   _loc1_.pDifficulty = pDifficulty;
   _loc1_.pDepths = {world:10,sb:100};
   _loc1_.eScore = new gMyScoringSystem.Evar(0);
   _loc1_.eLevel = new gMyScoringSystem.Evar(0);
   _loc1_.pGameOverReason;
};
obj.getDifficulty = function()
{
   return this.pDifficulty;
};
obj.startGame = function()
{
   var _loc1_ = this;
   _loc1_.addDefaultInventory();
   _loc1_.pWorld = _root.attachMovie("gameWorld","world",_loc1_.pDepths.world);
   var tileWidth = 64;
   _loc1_.pWorld.mcExtends(WorldClass,0,0,"Flippy","Mr Hollywood");
   _loc1_.makeScoreboard();
};
obj.toggleMenus = function()
{
   this.scoreboard.toggleMenus();
};
obj.makeScoreboard = function()
{
   var _loc1_ = this;
   _loc1_.scoreboard = _root.attachMovie("sb","scoreboard",_loc1_.pDepths.sb);
   var _loc2_ = 540 - _loc1_.scoreboard._height - 4;
   _loc1_.scoreboard.mcExtends(ScoreboardClass,0,_loc2_,_root.inventoryObj);
   _loc1_.scoreboard.updateAll();
   _loc1_.scoreboard.addListBoxes();
};
obj.getScore = function()
{
   return this.eScore.show();
};
obj.getLevel = function()
{
   return this.eLevel.show();
};
obj.updateScoreboard = function()
{
   this.scoreboard.updateAll();
};
obj.nextLevel = function()
{
   this.eLevel.changeby(1);
   this.scoreboard.updateAll();
};
obj.getGameOverReason = function()
{
   return this.pGameOverReason;
};
obj.quitGame = function()
{
   var _loc1_ = this;
   _loc1_.pQuitGame = 1;
   _loc1_.scoreboard.action_txt.htmlText = "";
   _loc1_.pWorld.message_mc.message_txt.text = "";
   _loc1_.pWorld.message_mc.messageShadow_txt.text = "";
   var _loc3_ = _loc1_.pWorld.player;
   var _loc2_ = _loc1_.pWorld.enemy;
   _loc3_.quitGame();
   _loc2_.quitGame();
   var player_health = _loc3_.getHealth();
   var cog_health = _loc2_.getHealth();
   if(player_health > cog_health)
   {
      var winner = _loc3_;
   }
   else
   {
      var winner = _loc2_;
   }
   _loc1_.endGame(winner,0);
};
obj.endGame = function(winner, playToEnd)
{
   var _loc1_ = this;
   _loc1_.scoreboard.endgamebutton.enabled = 0;
   gMyNeoStatus.sendTag("Game Finished");
   var _loc2_ = _loc1_.pWorld.player.pMaxHealth;
   var player = _loc1_.pWorld.player;
   var enemy = player.pOpponent;
   var _loc3_ = _loc2_ - enemy.pHealth;
   if(playToEnd)
   {
      var points = player.pHealth + _loc3_;
   }
   else
   {
      var points = _loc3_;
   }
   var pcnt = points / (_loc2_ * 2);
   var np = Math.round(100 * _loc1_.pDifficulty * pcnt);
   _loc1_.eScore.changeTo(np);
   var endText = winner.getName() + " Wins!<BR><BR>Your Final Score: " + gMyGame.eScore.show();
   _loc1_.pWorld.makePrompt(winner);
   if(_loc1_.scoreboard.pEnabled)
   {
      _loc1_.scoreboard.toggleMenus();
   }
};
obj.doCleanUp = function()
{
   this.pWorld.removeMovieClip();
   this.scoreboard.removeMovieClip();
};
obj.restartGame = function()
{
   this.doCleanUp();
   _root.gotoAndPlay("resetallframe");
};
obj.sendScore = function()
{
   this.doCleanUp();
   _root.gotoAndPlay("sendscoreframe");
};
obj.addDefaultInventory = function()
{
   var _loc2_ = _root.inventoryObj;
   var catList = _loc2_.getCategoryList();
   var _loc1_ = _loc2_.getCategory("Stance");
   _global.doNothingStanceObj = _loc1_.addObject(new ItemObject("Stance","Stand Still",1,0,9999));
   _loc1_.sortListBy("pQuantity",-1);
   _loc1_.setDefault(doNothingStanceObj);
   var pLabel = _loc1_.getName();
   _loc1_ = _loc2_.getCategory("Tactic");
   _global.doNothingTacticObj = _loc1_.addObject(new ItemObject("Tactic","Nothing",1,0,9999));
   _loc1_.sortListBy("pQuantity",-1);
   _loc1_.setDefault(doNothingTacticObj);
   var pLabel = _loc1_.getName();
   _loc1_ = _loc2_.getCategory("Gags");
   var _loc3_ = _loc1_.addSubCategory("**Say");
   _loc1_.setDefaultCategory(_loc3_);
   var defaultObject = _loc3_.addObject(new ItemObject("Say","Nothing",1,0,9999));
   _loc3_.addObject(new ItemObject("Say","You Stink!",1,0,9999));
   _loc3_.addObject(new ItemObject("Say","Leave Me Alone!",1,0,9999));
   _loc1_.sortListBy("pName",1);
   _loc3_.sortListBy("pQuantity");
   _loc3_ = _loc1_.getCategory("Drop");
   _loc3_.sortListBy("pQuantity",-1);
   _loc3_ = _loc1_.getCategory("Squirt");
   _loc3_.sortListBy("pQuantity",-1);
   _loc3_ = _loc1_.getCategory("Throw");
   _loc3_.sortListBy("pQuantity",-1);
};
