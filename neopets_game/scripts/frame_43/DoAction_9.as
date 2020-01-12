_global.WorldClass = function(pX, pY, player_mc, enemy_mc)
{
   this.init(pX,pY,player_mc,enemy_mc);
};
WorldClass.extend(SpriteClass);
var obj = WorldClass.prototype;
obj.init = function(pX, pY, player_mc, enemy_mc)
{
   var _loc1_ = this;
   super.init(pX,pY);
   var pDepths = {player:10,enemy:11,prompt:100,timer:1000};
   _loc1_.pTileWidth = _loc1_.tile_2._x - _loc1_.tile_1._x;
   _loc1_.pBounds = _loc1_.bg.getBounds(_loc1_);
   _loc1_.pBounds.xCenter = _loc1_.pBounds.xMax / 2;
   _loc1_.pBounds.yCenter = _loc1_.pBounds.yMax / 2;
   var _loc2_ = _loc1_.attachMovie(player_mc,"player",pDepths.player);
   var newCategory = _root.inventoryObj.addCategory("Stance");
   newCategory.addObject(new ItemObject("Stance","Move Back",1,2,9999));
   newCategory.addObject(new ItemObject("Stance","Move Forward",1,2,9999));
   newCategory.addObject(new ItemObject("Stance","Stand Still",1,2,9999));
   var newCategory = _root.inventoryObj.addCategory("Tactic");
   newCategory.addObject(new ItemObject("Tactic","Lure",1,1,9999));
   newCategory.addObject(new ItemObject("Tactic","Scare",1,1,9999));
   newCategory.addObject(new ItemObject("Tactic","Nothing",1,0,9999));
   var newCategory = cogInventory.addCategory("Gags");
   _loc2_.pBounds = {xMin:_loc1_.tile_1._x,xMax:_loc1_.tile_4._x};
   var leftTile = _loc1_.tile_1;
   _loc2_.pOrigX = leftTile._x;
   _loc2_.mcExtends(HumanPlayer,player_mc,1,10,_root.inventoryObj);
   _loc2_.setLoc(leftTile._x,leftTile._y);
   _loc2_ = _loc1_.attachMovie(enemy_mc,"enemy",pDepths.enemy);
   _loc2_.pBounds = {xMin:_loc1_.tile_5._x,xMax:_loc1_.tile_8._x};
   var cogInventory = new Inventory();
   var newCategory = cogInventory.addCategory("Stance");
   newCategory.addObject(new ItemObject("Stance","Move Back",1,2,9999));
   newCategory.addObject(new ItemObject("Stance","Move Forward",1,2,9999));
   newCategory.addObject(new ItemObject("Stance","Stand Still",1,2,9999));
   var newCategory = cogInventory.addCategory("Tactic");
   newCategory.addObject(new ItemObject("Tactic","Lure",1,1,9999));
   newCategory.addObject(new ItemObject("Tactic","Scare",1,1,9999));
   newCategory.addObject(new ItemObject("Tactic","Nothing",1,0,9999));
   var newCategory = cogInventory.addCategory("Gags");
   newCategory.addObject(new GagObject("PowerTrip","PowerTrip",1,0,9999,10,6,"powertrip","hit_powertrip"));
   newCategory.addObject(new GagObject("RazzleDazzle","RazzleDazzle",1,0,9999,8,5,"razzledazzle","hit_razzledazzle"));
   _loc2_.mcExtends(CogPlayer,enemy_mc,-1,10,cogInventory,gMyGame.getDifficulty());
   var _loc3_ = _loc1_.tile_8;
   _loc2_.setLoc(_loc3_._x,_loc3_._y);
   _loc2_.pOrigX = _loc3_._x;
   _loc1_.player.setOpponent(_loc1_.enemy);
   _loc1_.enemy.setOpponent(_loc1_.player);
   _loc1_.player._xscale = _loc1_.player._yscale = 75;
   _loc1_.enemy._xscale = _loc1_.enemy._yscale = 75;
};
obj.makeprompt = function(winner)
{
   var _loc1_ = this.attachMovie("prompt","prompt",pDepths.prompt);
   var pX = this.pBounds.xCenter;
   var pY = this.pBounds.yCenter;
   _loc1_.mcExtends(Zoom_MC,pX,pY);
   _loc1_.easeToFullScale();
   var _loc3_ = winner.getName();
   var _loc2_ = _loc3_.toUpperCase() + " WINS!<BR><BR>YOUR FINAL SCORE: " + gMyGame.eScore.show();
   _loc1_.prompt_txt.htmlText = "<P ALIGN=\'CENTER\'>" + _loc2_ + "</P>";
   _loc1_.promptShadow_txt.htmlText = "<P ALIGN=\'CENTER\'>" + _loc2_ + "</P>";
};
