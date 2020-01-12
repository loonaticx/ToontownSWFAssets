_global.PlayerClass = function(pName, pDir, pHealth, pInventory)
{
   this.init(pName,pDir,pHealth,pInventory);
};
var obj = PlayerClass.prototype;
obj.init = function(pName, pDir, pHealth, pInventory)
{
   var _loc1_ = this;
   Eventbroadcaster.initialize(_loc1_);
   _loc1_.createEmptyMovieClip("pUtilityMC",1000).mcExtends(PlayerUtilityClip,_loc1_);
   _loc1_.pName = pName;
   _loc1_.pDir = pDir;
   _loc1_.pHealth = _loc1_.pMaxHealth = pHealth;
   _loc1_.updateDamageMeter();
   _loc1_.pInventory = pInventory;
   _loc1_.pTileWidth = _loc1_._parent.pTileWidth;
   _loc1_.stars._visible = 0;
   _loc1_.stars.stop();
   _loc1_.pTurnList = {pStance:undefined,pTactic:undefined,pGag:undefined};
   _loc1_.pOpponent;
   _loc1_.pHitOpponent;
};
obj.getName = function()
{
   return this.pName;
};
obj.getHealth = function()
{
   return this.pHealth;
};
obj.quitGame = function()
{
   var _loc1_ = this;
   if(_loc1_.dropGag_mc)
   {
      _loc1_.dropGag_mc.removeMovieClip();
   }
   _loc1_.pUtilityMC.quitGame();
   _loc1_.gotoAndStop("Stance");
   _loc1_.onEnterFrame = undefined;
   _loc1_.moveToTile(_loc1_.pOrigX,"stopEnterFrame");
};
obj.stopEnterFrame = function()
{
   this.onEnterFrame = eval(undefined)();
};
obj.stretch = function(damage)
{
   var _loc1_ = this;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      var _loc2_ = 100 - _loc1_.body._yscale;
      _loc1_.body._yscale = _loc1_.body._yscale + _loc2_ * 0.2;
      if(_loc1_.body._yscale >= 99)
      {
         _loc1_.body._yscale = 100;
         _loc1_.showDamagePts(damage);
         _loc1_.onEnterFrame = undefined;
      }
   };
};
obj.showDamageFrame = function(damage, gagObj)
{
   var _loc1_ = this;
   var damageType = gagObj.getType();
   var gagName = gagObj.getName();
   var frame = gagObj.getDamageFrame();
   _loc1_.gotoAndStop(frame);
   if(damageType == "Drop")
   {
      var squashHeight = gagObj.squashValue;
      var _loc2_ = _loc1_.attachMovie("drop_gagItems","dropGag_mc",10);
      _loc2_.gotoAndStop(gagName);
      if(damage == 0)
      {
         var _loc3_ = _loc1_.body._width / 2 + _loc2_._width / 2 + 32;
         if(Math.abs(_loc1_._x - _loc1_.pBounds.xMax) > _loc3_)
         {
            var pX = _loc3_;
         }
         else
         {
            var pX = - _loc3_;
         }
      }
      else
      {
         var pX = 0;
      }
      var pY = -500;
      _loc2_.mcExtendS(DropMCClass,pX,pY,_loc1_.body,squashHeight,damage);
   }
   else
   {
      _loc1_.pUtilityMC.checkBodyFrame("showDamagePts",damage);
   }
};
obj.showDamagePts = function(damage)
{
   var _loc1_ = this;
   if(damage == 0)
   {
      var _loc2_ = "MISSED!";
      var _loc3_ = 30;
      gPlayList.playSound("missSound");
   }
   else
   {
      _loc1_.stars._visible = 1;
      _loc1_.stars.play();
      _loc2_ = "-" + damage;
      _loc3_ = 32;
   }
   _loc1_.damageText_mc.textClip.hit_txt.htmlText = "<P ALIGN=\'CENTER\'><FONT SIZE=\'" + _loc3_ + "\'>" + _loc2_ + "</FONT></P>";
   _loc1_.damageText_mc.textClip.hitShadow_txt.htmlText = "<P ALIGN=\'CENTER\'><FONT SIZE=\'" + _loc3_ + "\'>" + _loc2_ + "</FONT></P>";
   _loc1_.damageText_mc.play();
   _loc1_.changeHealth(damage);
};
obj.changeHealth = function(damage)
{
   var _loc1_ = this;
   _loc1_.pHealth = _loc1_.pHealth - damage;
   _loc1_.pHealth = Math.max(0,_loc1_.pHealth);
};
obj.moveToTile = function(pDest, onDone)
{
   var _loc1_ = this;
   var forward_dir = _loc1_.pDir != 1?pDest < _loc1_._x:pDest > _loc1_._x;
   if(forward_dir)
   {
      var dir = "forward";
   }
   else
   {
      var dir = "back";
   }
   var _loc3_ = _loc1_.checkBounds(dir);
   if(_loc3_ == 0)
   {
      _loc1_[onDone]();
   }
   else
   {
      _loc1_.onEnterFrame = function()
      {
         var _loc1_ = this;
         var _loc2_ = pDest - _loc1_._x;
         _loc1_._x = _loc1_._x + _loc2_ * 0.4;
         if(_loc2_ < 0)
         {
            if(_loc2_ > -1)
            {
               _loc1_._x = pDest;
               _loc1_[onDone]();
               _loc1_.onEnterFrame = undefined;
            }
         }
         else if(_loc2_ > 0)
         {
            if(_loc2_ < 1)
            {
               _loc1_._x = pDest;
               _loc1_[onDone]();
               _loc1_.onEnterFrame = undefined;
            }
         }
         else
         {
            _loc1_._x = pDest;
            _loc1_[onDone]();
            _loc1_.onEnterFrame = undefined;
         }
      };
   }
};
obj.doneBeingLured = function()
{
   this.pOpponent.doGag();
};
obj.doStance = function()
{
   var _loc1_ = this;
   _loc1_.gotoAndStop("Stance");
   var _loc2_ = _loc1_.pTurnList.pStance.getName();
   switch(_loc2_)
   {
      case "Stand Still":
         _loc1_.doTactic();
         break;
      case "Move Forward":
         if(_loc1_.checkBounds("forward"))
         {
            _loc1_.moveToTile(_loc1_._x + _loc1_.pTileWidth * _loc1_.pDir,"doTactic");
         }
         else
         {
            _loc1_.doGag();
         }
         break;
      case "Move Back":
         if(_loc1_.checkBounds("back"))
         {
            _loc1_.moveToTile(_loc1_._x - _loc1_.pTileWidth * _loc1_.pDir,"doTactic");
         }
         else
         {
            _loc1_.doGag();
         }
   }
};
obj.doTactic = function()
{
   var _loc1_ = this;
   var _loc2_ = _loc1_.pTurnList.pTactic.getName();
   switch(_loc2_)
   {
      case "Lure":
         if(_loc1_.pOpponent.checkBounds("forward"))
         {
            _loc1_.pOpponent.moveToTile(_loc1_.pOpponent._x + _loc1_.pTileWidth * _loc1_.pOpponent.pDir,"doneBeingLured");
         }
         else
         {
            _loc1_.doGag();
         }
         break;
      case "Scare":
         if(_loc1_.pOpponent.checkBounds("back"))
         {
            _loc1_.pOpponent.moveToTile(_loc1_.pOpponent._x - _loc1_.pTileWidth * _loc1_.pOpponent.pDir,"doneBeingLured");
         }
         else
         {
            _loc1_.doGag();
         }
      case "Nothing":
         _loc1_.doGag();
   }
};
obj.doGag = function()
{
   var _loc1_ = this;
   var gagObj = _loc1_.pTurnList.pGags;
   var _loc3_ = gagObj.getType();
   var _loc2_ = gagObj.getName();
   var frame = _loc3_ == "Say"?"Say":gagObj.getAnimationFrame();
   _loc1_.gotoAndStop(frame);
   if(_loc3_ == "Say")
   {
      if(_loc2_ == "Nothing")
      {
         var gagText = " ......... ";
      }
      else
      {
         var gagText = _loc2_;
      }
      _loc1_.body.say_txt.htmlText = "<P ALIGN=\'CENTER\'>" + gagText + "</P>";
   }
   else if(_loc3_ == "Skip")
   {
      _loc1_.gagDone();
   }
   else if(_loc3_ == "Squirt")
   {
      _loc1_.body.gag_mc.gotoAndStop(_loc2_);
   }
   else
   {
      var obj = _loc1_.body.gag_mc.attachMovie("all_gags","gag",1);
      obj.gotoAndStop(_loc2_);
   }
   _loc1_.pUtilityMC.checkBodyFrame("gagDone");
};
obj.getNumTilesBetween = function(mc)
{
   var _loc1_ = Math.abs(mc._x - this._x);
   var _loc2_ = Math.floor(_loc1_ / this.pTileWidth);
   return _loc2_;
};
obj.gagDone = function()
{
   var _loc1_ = this;
   gMyGame.scoreboard.action_txt.htmlText = "";
   var _loc2_ = _loc1_.pTurnList.pGags;
   var _loc3_ = _loc2_.getType();
   var gagName = _loc2_.getName();
   if(_loc3_ == "Say" or _loc3_ == "Skip")
   {
      _loc1_.pOpponent.startTurn();
   }
   else
   {
      if(_loc1_.pHitOpponent)
      {
         var dist = _loc1_.getNumTilesBetween(_loc1_.pOpponent);
         var final_damage = Math.floor(_loc1_.pTurnList.pGags.getDamage() / dist);
         var damage = Math.max(1,final_damage);
         _loc1_.pOpponent.showDamageFrame(damage,_loc2_);
      }
      else if(_loc3_ == "Drop")
      {
         var damage = 0;
         _loc1_.pOpponent.showDamageFrame(damage,_loc2_);
      }
      else
      {
         var damage = 0;
         _loc1_.pOpponent.showDamagePts(damage);
      }
      _loc1_.pTurnList.pGags = undefined;
   }
};
obj.showMessage = function(str)
{
   var _loc1_ = this;
   _loc1_._parent.message_mc.message_txt.text = "";
   _loc1_._parent.message_mc.messageShadow_txt.text = "";
   _loc1_._parent.message_mc.message_txt.text = str.toUpperCase();
   _loc1_._parent.message_mc.messageShadow_txt.text = str.toUpperCase();
};
obj.playAnimationSequence = function()
{
   var _loc1_ = this;
   var num = 0;
   _loc1_.pAnimationList = [_loc1_.pTurnList.pStance,_loc1_.pTurnList.pTactic,_loc1_.pTurnList.pGags];
   _loc1_.doStance();
};
obj.setOpponent = function(mc)
{
   this.pOpponent = mc;
};
obj.setLoc = function(pX, pY)
{
   this._x = pX;
   this._y = pY;
};
obj.showWinPose = function()
{
   this.moveToTile(this.pOrigX,"doWinDance");
};
obj.doWinDance = function()
{
   this.gotoAndStop("win");
};
_global.CogPlayer = function(pName, pDir, pHealth, pInventory, pLevel)
{
   this.init(pName,pDir,pHealth,pInventory,pLevel);
};
CogPlayer.extend(PlayerClass);
var obj = CogPlayer.prototype;
obj.init = function(pName, pDir, pHealth, pInventory, pLevel)
{
   super.init(pName,pDir,pHealth,pInventory);
   this.pLevel = pLevel;
};
obj.checkBounds = function(dir)
{
   var _loc1_ = this;
   if(dir == "forward")
   {
      if(_loc1_._x <= _loc1_.pBounds.xMin)
      {
         return 0;
      }
   }
   else if(_loc1_._x >= _loc1_.pBounds.xMax)
   {
      return 0;
   }
   return 1;
};
obj.die = function()
{
   var _loc1_ = this;
   gMyGame.scoreboard.endgamebutton.enabled = 0;
   gPlayList.playSound("cogDeathSound");
   _loc1_.showMessage("");
   _loc1_.gotoAndStop("die");
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(_loc1_.body._currentframe == _loc1_.body._totalframes)
      {
         gMyGame.endGame(_loc1_.pOpponent,1);
         _loc1_.onEnterFrame = undefined;
      }
   };
};
obj.dropSquash = function()
{
   var _loc1_ = this;
   var _loc2_ = _loc1_._yscale;
   _loc1_._yscale = _loc1_._yscale - _loc2_ * 0.1;
   if(_loc1_._yscale <= 0)
   {
      _loc1_._yscale = 100;
   }
};
obj.updateDamageMeter = function()
{
   var _loc1_ = this;
   var _loc3_ = _loc1_.damage_meter._totalframes;
   var _loc2_ = Math.round(_loc1_.pHealth / _loc3_ + 1);
   _loc1_.damage_meter.gotoAndStop(_loc2_);
   gMyGame.scoreboard.enemyHealth_txt.htmlText = "<P ALIGN=\'CENTER\'>" + _loc1_.pHealth + "/ " + _loc1_.pMaxHealth + "</P>";
   if(_loc1_.pHealth <= 0)
   {
      _loc1_.onEnterFrame = undefined;
      _loc1_.pOpponent.showWinPose();
      _loc1_.die();
   }
};
obj.startTurn = function()
{
   var _loc1_ = this;
   gMyGame.scoreboard.action_txt.htmlText = "<P ALIGN=\'CENTER\'>" + _loc1_.pName + "\'s Turn...<BR>Please Wait.</P>";
   var obj = _loc1_.createEmptyMovieClip("timer",5000);
   obj.startTime = getTimer();
   obj.onEnterFrame = function()
   {
      var _loc1_ = getTimer() - obj.startTime;
      if(_loc1_ >= 1000)
      {
         this._parent.chooseMovement();
         this.removeMovieClip();
      }
   };
};
obj.chooseMovement = function()
{
   var _loc1_ = this;
   var _loc3_ = _loc1_.pInventory.getCategory("Stance");
   if(_loc1_.pHealth < 4)
   {
      _loc1_.pTurnList.pStance = _loc3_.getItem("Move Back");
   }
   else
   {
      var xDist = _loc1_.getNumTilesBetween(_loc1_.pOpponent);
      if(xDist > 3)
      {
         _loc1_.pTurnList.pStance = _loc3_.getItem("Move Forward");
      }
      else
      {
         _loc1_.pTurnList.pStance = _loc3_.getItem("Stand Still");
      }
   }
   var _loc2_ = _loc1_.pInventory.getCategory("Tactic");
   if(_loc1_.pHealth < 4)
   {
      _loc1_.pTurnList.pTactic = _loc2_.getItem("Scare");
   }
   else
   {
      var rand = random(10) + _loc1_.pLevel;
      if(rand >= 5)
      {
         var xDist = _loc1_.getNumTilesBetween(_loc1_.pOpponent);
         if(xDist > 4)
         {
            _loc1_.pTurnList.pTactic = _loc2_.getItem("Lure");
         }
      }
      else
      {
         _loc1_.pTurnList.pTactic = _loc2_.getItem("Nothing");
      }
   }
   _loc1_.chooseGag();
};
obj.chooseGag = function()
{
   var _loc1_ = this;
   var gags = _loc1_.pInventory.getCategory("Gags");
   var gagList = gags.getList();
   var numGags = gagList.length;
   var randomGag = gagList[random(numGags)];
   _loc1_.pTurnList.pGags = randomGag;
   var easy_index = _loc1_.pTurnList.pGags.getEasyIndex();
   var rand = random(8 + _loc1_.pLevel);
   var randomChance = rand;
   var hit_flippy = randomChance >= easy_index;
   _loc1_.pHitOpponent = hit_flippy;
   var _loc3_ = _loc1_.pTurnList;
   var stanceType = _loc3_.pStance.getName();
   var stanceText = stanceType.split(" ");
   var tacticName = _loc3_.pTactic.getName();
   var tacticType = _loc3_.pTactic.getType();
   var _loc2_ = _loc3_.pGags.getName();
   var gagType = _loc3_.pGags.getType();
   var tact = tacticName != "Nothing"?" and " + tacticName + "s " + _loc1_.pOpponent.pName:"";
   if(gagType == "Say")
   {
      var gagMsg = _loc2_;
   }
   else
   {
      var gagMsg = !_loc2_.startsWithVowel()?"A " + _loc2_:"An " + _loc2_;
   }
   var str = _loc1_.pName + " uses his " + _loc2_ + ".";
   _loc1_.showMessage(str);
   _loc1_.doStance();
};
_global.HumanPlayer = function(pName, pDir, pHealth, pInventory)
{
   this.init(pName,pDir,pHealth,pInventory);
};
HumanPlayer.extend(PlayerClass);
var obj = HumanPlayer.prototype;
obj.init = function(pName, pDir, pHealth, pInventory)
{
   var _loc1_ = this;
   super.init(pName,pDir,pHealth,pInventory);
   var stance = _loc1_.pInventory.getCategory("Stance");
   _loc1_.pTurnList.pStance = stance.getDefault();
   var _loc3_ = _loc1_.pInventory.getCategory("Tactic");
   _loc1_.pTurnList.pTactic = _loc3_.getDefault();
   var _loc2_ = _loc1_.pInventory.getCategory("Gags");
   var gagSubDefault = _loc2_.getDefaultCategory();
   var defaultGag = gagSubDefault.getDefault();
   _loc1_.pTurnList.pGags = defaultGag;
};
obj.chooseMovement = function()
{
   var _loc1_ = this;
   var _loc3_ = _loc1_.pInventory.getCategory("Stance");
   if(_loc1_.pHealth < 4)
   {
      _loc1_.pTurnList.pStance = _loc3_.getItem("Move Back");
   }
   else
   {
      var xDist = _loc1_.getNumTilesBetween(_loc1_.pOpponent);
      if(xDist > 3 and random(2))
      {
         _loc1_.pTurnList.pStance = _loc3_.getItem("Move Forward");
      }
      else
      {
         _loc1_.pTurnList.pStance = _loc3_.getItem("Stand Still");
      }
   }
   var _loc2_ = _loc1_.pInventory.getCategory("Tactic");
   if(_loc1_.pHealth < 4)
   {
      _loc1_.pTurnList.pTactic = _loc2_.getItem("Scare");
   }
   else
   {
      var rand = random(12);
      if(rand <= 4)
      {
         var xDist = _loc1_.getNumTilesBetween(_loc1_.pOpponent);
         if(xDist > 4)
         {
            _loc1_.pTurnList.pTactic = _loc2_.getItem("Lure");
         }
      }
      else
      {
         _loc1_.pTurnList.pTactic = _loc2_.getItem("Nothing");
      }
   }
};
obj.returnHit = function(hit_opponent)
{
   this.pHitOpponent = hit_opponent;
   this.doSequence();
};
obj.startTurn = function()
{
   gMyGame.toggleMenus();
   gMyGame.scoreboard.action_txt.htmlText = "";
};
obj.checkBounds = function(dir)
{
   var _loc1_ = this;
   if(dir == "forward")
   {
      if(_loc1_._x >= _loc1_.pBounds.xMax)
      {
         return 0;
      }
   }
   else if(_loc1_._x <= _loc1_.pBounds.xMin)
   {
      return 0;
   }
   return 1;
};
obj.die = function()
{
   var _loc1_ = this;
   gMyGame.scoreboard.endgamebutton.enabled = 0;
   gPlayList.playSound("toonDieSound");
   _loc1_.showMessage("");
   _loc1_.gotoAndStop("die");
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      var _loc2_ = _loc1_._xscale;
      _loc1_._xscale = _loc1_._yscale = _loc1_._yscale - _loc2_ * 0.2;
      if(_loc1_._xscale <= 0.5)
      {
         gMyGame.endGame(_loc1_.pOpponent,1);
         _loc1_.onEnterFrame = undefined;
      }
   };
};
obj.onSelect = function()
{
   var _loc1_ = this.pListBox.getSelectedItem();
   var _loc2_ = _loc1_.getName();
   this.pTurnList[_loc2_] = _loc1_;
};
obj.onGo = function()
{
   var _loc2_ = this;
   if(_loc2_.pTurnList.pGags.getQuantity() != 0)
   {
      var _loc1_ = _loc2_.pTurnList.pGags.getType();
      if(_loc1_ != undefined)
      {
         _loc2_.chooseMovement();
         gMyGame.toggleMenus();
         if(_loc1_ == "Say" or _loc1_ == "Skip")
         {
            _loc2_.doSequence();
         }
         else
         {
            gMyGame.scoreboard.action_txt.htmlText = "<P ALIGN=\'CENTER\'>Now Click The Meter When It\'s In The Green To Launch Your Gag!</P>";
            var _loc3_ = _loc2_.pTurnList.pGags.getEasyIndex();
            gMyGame.scoreboard.meter.setMoveProps(_loc3_);
            gMyGame.scoreboard.meter.setToMove();
         }
      }
   }
};
obj.doSequence = function()
{
   gMyGame.scoreboard.action_txt.htmlText = "<P ALIGN=\'CENTER\'>Please Wait...</P>";
   var _loc1_ = this.pTurnList;
   _loc1_.pStance.removeQuantity(1);
   _loc1_.pTactic.removeQuantity(1);
   _loc1_.pGags.removeQuantity(1);
   var stanceType = _loc1_.pStance.getName();
   var stanceText = stanceType.split(" ");
   var tacticName = _loc1_.pTactic.getName();
   var tacticType = _loc1_.pTactic.getType();
   var _loc2_ = _loc1_.pGags.getName();
   var _loc3_ = _loc1_.pGags.getType();
   var animationFrames = ["Stance_" + stanceType,"Tactic_" + tacticName,"Gag_" + _loc3_ + "_" + _loc2_];
   var gagObjType = _loc2_;
   this.setAnimationSequence(animationFrames,gagObjType);
   this.playAnimationSequence();
   var tact = tacticName != "Nothing"?" and " + tacticName + "s " + this.pOpponent.pName:"";
   if(_loc3_ == "Say")
   {
      var gagMsg = _loc3_ + "s " + _loc2_;
   }
   else if(_loc3_ == "Skip")
   {
      var gagMsg = "Skips A Turn";
   }
   else
   {
      var gagMsg = !_loc2_.startsWithVowel()?_loc3_ + "s A " + _loc2_:_loc3_ + "s An " + _loc2_;
   }
   var str = this.pName + " " + gagMsg + ".";
   this.showMessage(str);
};
obj.setCategory = function(cat)
{
   var _loc1_ = "p" + cat;
   this.pSelectedCategory = _loc1_;
};
obj.setSelectedItem = function(obj)
{
   var _loc1_ = this;
   _loc1_.pTurnList[_loc1_.pSelectedCategory] = obj;
   if(_loc1_.pSelectedCategory == "pGags")
   {
      gMyGame.scoreboard.showIcon(obj.getName());
   }
};
obj.updateDamageMeter = function()
{
   var _loc1_ = this;
   var numframes = gMyGame.scoreboard.laff_meter_mc.teeth._totalframes;
   var _loc3_ = _loc1_.pHealth / _loc1_.pMaxHealth;
   var _loc2_ = Math.round(numFrames * _loc3_);
   gMyGame.scoreboard.laff_meter_mc.teeth.gotoAndStop(Math.max(1,_loc2_));
   gMyGame.scoreboard.laff_meter_mc.health_txt.text = _loc1_.pHealth;
   gMyGame.scoreboard.laff_meter_mc.maxHealth_txt.text = _loc1_.pMaxHealth;
   if(_loc1_.pHealth <= 0)
   {
      _loc1_.onEnterFrame = undefined;
      gMyGame.scoreboard.laff_meter_mc.gotoAndStop("dead");
      _loc1_.pOpponent.showWinPose();
      _loc1_.die();
   }
};
obj.doWinDance = function()
{
   if(this.pHealth > 3)
   {
      var _loc1_ = "win2";
   }
   else
   {
      _loc1_ = "win";
   }
   this.gotoAndStop(_loc1_);
};
