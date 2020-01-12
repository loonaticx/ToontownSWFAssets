function init(pOwner, pConfig)
{
   gameOwner = pOwner;
   gameOwner.gameLog("Game:init: " + gameOwner + " class: " + com.disney.gem.games.BaseGameController);
   assetPath = pConfig.game.assetPath;
   gameOwner.gameLog("Game:init: assetPath: " + pConfig.game.assetPath);
   GC = new com.disney.gem.games.BaseGameController(this,pOwner);
   trace(GC);
   return GC;
}
this._lockroot = true;
var GC = null;
var gameOwner = null;
var assetPath = "";
stop();
