class Game
{
   var strikes = 1;
   var depths = new Object();
   var powerup = new Object();
   var docWidth_num = 650;
   var docHeight_num = 550;
   var horizonY = 50;
   var groundY = 160;
   var ceilingY = 90;
   var startX = -100;
   var foulX = 600;
   var targetX = 1500;
   var targetX_array = new Array();
   var targetArrayPos = 1;
   var targetScalePerc = 1;
   var baseScore = 100;
   var myScore = 0;
   var myTargets = 0;
   var powerupID_num = 0;
   var step = new Object();
   var panOnStartUp = false;
   var powerupReady_boolean = false;
   function Game()
   {
      var _loc1_ = this;
      AsBroadcaster.initialize(_loc1_);
      _loc1_.depths.world = 100;
      _loc1_.depths.ground = 50;
      _loc1_.depths.foulLine = 350;
      _loc1_.depths.bg = 300;
      _loc1_.depths.shadow = 375;
      _loc1_.depths.targets = 400;
      _loc1_.depths.bullseye_mc = 405;
      _loc1_.depths.crowd = 390;
      _loc1_.depths.horse = 4015;
      _loc1_.depths.player = 500;
      _loc1_.depths.bomb = 4005;
      _loc1_.depths.scorch = 700;
      _loc1_.depths.explosion = 800;
      _loc1_.depths.scoreBoard = 1000;
      _loc1_.depths.hud = 1100;
      _loc1_.depths.menu = 5000;
      _loc1_.step.panCam = 0;
      _loc1_.step.roundInit = 1;
      _loc1_.step.choosePowerup = 2;
      _loc1_.step.running = 3;
      _loc1_.step.angling = 4;
      _loc1_.step.inGame = 5;
      _loc1_.step.gameOver = 6;
      _loc1_.step.reset = 7;
      _loc1_.powerup.bigBlast = 1;
      _loc1_.powerup.triShot = 2;
      _loc1_.powerup.heatSeek = 3;
      _loc1_.targetX_array = [1200,1500,1800];
      _global.GAMESCORE.changeto(0);
      _loc1_.onGameStart();
   }
   function makeWorld()
   {
      var _loc1_ = this;
      _loc1_.world_mc = _root.attachMovie("world_mc","world_mc",_loc1_.depths.world);
      _loc1_.world_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.world_mc);
      _loc1_.world_mc._y = _loc1_.docHeight_num * 0.45;
      if(_loc1_.panOnStartUp)
      {
         _loc1_.world_mc._x = - _loc1_.targetX_array[_loc1_.targetArrayPos] + _loc1_.startX + _loc1_.docWidth_num / 2;
      }
   }
   function menuInit()
   {
      stopAllSounds();
      this.makeMenu(1,"menuBG_mc");
   }
   function makeMenu(menuID_num, linkID, menuData)
   {
      var _loc1_ = this;
      var _loc2_ = new Object();
      _loc2_.linkID = linkID;
      _loc2_.menuID_num = menuID_num;
      _loc2_.docHeight_num = _loc1_.docHeight_num;
      _loc2_.docWidth_num = _loc1_.docWidth_num;
      _loc2_.menuData = menuData;
      _loc1_.menu_mc = _root.attachMovie("menu_mc","menu_mc",_loc1_.depths.menu);
      _loc1_.menu_mc.init(_loc2_);
      _loc1_.menu_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.menu_mc);
   }
   function gameInit()
   {
      var _loc1_ = this;
      _loc1_.myScore = 0;
      _loc1_.myTargets = 0;
      _root.GAMESCORE.changeto(0);
      _loc1_.strikes = 1;
      _loc1_.panOnStartUp = true;
      _loc1_.powerupReady_boolean = false;
      _loc1_.targetScalePerc = 1;
      _loc1_.powerupBtn_array = new Array();
      _loc1_.makeScoreBoard();
      _loc1_.makeHUD();
      _loc1_.makeUserInput();
      _loc1_.roundInit();
      _loc1_.makeEndText("startText_mc");
      _loc1_.myStep = _loc1_.step.panCam;
      _loc1_.panCam();
      _loc1_.panOnStartUp = false;
      _loc1_.setPromptText("Click Screen To Start");
   }
   function roundInit()
   {
      var _loc1_ = this;
      _loc1_.addScore(0);
      _loc1_.addTarget(0);
      _loc1_.makeWorld();
      _loc1_.makeGround();
      _loc1_.makeBG();
      _loc1_.makeFoulLine();
      _loc1_.makePlayer();
      _loc1_.makeTarget();
      _loc1_.broadcastMessage("onDefaultAngle");
      _loc1_.bg_mc.wrapping();
      _loc1_.score_array = new Array();
      _loc1_.boomCount_num = 0;
      if(_loc1_.powerupReady_boolean == true)
      {
         _loc1_.makeMenu(9);
         _loc1_.myStep = _loc1_.step.selectPowerUp;
         _loc1_.setPromptText("Select A Powerup");
      }
      else
      {
         _loc1_.myStep = _loc1_.step.roundInit;
         _loc1_.setPromptText("Click Screen To Start");
      }
      var _loc3_ = 0;
      var _loc2_ = _loc1_.powerupBtn_array.length;
      while(true)
      {
         _loc2_;
         if(_loc2_--)
         {
            if(_loc1_.powerupBtn_array[_loc2_].toggle_boolean)
            {
               _loc1_.powerupBtn_array[_loc2_].onDeactivate();
            }
            else if(_loc1_.powerupBtn_array[_loc2_].onPress != null)
            {
               _loc3_ = _loc3_ + 1;
            }
            _loc1_.powerupBtn_array[_loc2_].onUnPause();
            continue;
         }
         break;
      }
      if(_loc1_.panOnStartUp == false)
      {
         _loc1_.resetCam();
      }
   }
   function reset()
   {
      var _loc1_ = this;
      _loc1_.broadcastMessage("onKeyReset");
      _loc1_.world_mc.removeMovieClip();
      _loc1_.ground_mc.removeMovieClip();
      _root.bg.removeMovieClip();
      _loc1_.bg_mc.removeMovieClip();
      _loc1_.foulLine_mc.removeMovieClip();
      _loc1_.player_mc.removeMovieClip();
      _loc1_.target_mc.removeMovieClip();
      _loc1_.pCrowd_mc.removeMovieClip();
      _loc1_.pHorse_mc.removeMovieClip();
      _loc1_.pBullsEye_mc.removeMovieClip();
      _loc1_.bomb_mc.removeMovieClip();
      _loc1_.score_array = new Array();
      _loc1_.boomCount_num = 0;
   }
   function makeGround()
   {
      var _loc1_ = this;
      _loc1_.ground_mc = _root.createEmptyMovieClip("ground_mc",_loc1_.depths.ground);
      _loc1_.ground_mc._x = _loc1_.docWidth_num / 2;
      _loc1_.ground_mc._y = _loc1_.docHeight_num - _loc1_.horizonY;
      _loc1_.ground_mc._width = _loc1_.docWidth_num;
      _loc1_.ground_mc._height = _loc1_.docHeight_num - _loc1_.horizonY;
   }
   function addToWorld(idName, newName, depth, x, y)
   {
      var _loc1_ = this.world_mc.attachMovie(idName,newName,depth);
      _loc1_._x = x;
      _loc1_._y = y;
      return _loc1_;
   }
   function makeBG(bgNum)
   {
      var _loc1_ = this;
      bgNum = 1;
      _loc1_.bg_mc = _loc1_.addToWorld("bg_mc","bg_mc",_loc1_.depths.bg,0,0);
      _loc1_.bg_mc.world_mc = _loc1_.world_mc;
      _loc1_.bg_mc.docWidth_num = _loc1_.docWidth_num;
      _loc1_.bg_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.bg_mc);
      _loc1_.bgLinkID_str = "backGround1_mc";
      var _loc3_ = _loc1_.bg_mc.attachMovie(_loc1_.bgLinkID_str,"bg1_mc",_loc1_.depths.bg + 1);
      _loc3_._x = 0;
      var _loc2_ = _loc1_.bg_mc.attachMovie(_loc1_.bgLinkID_str,"bg2_mc",_loc1_.depths.bg + 2);
      _loc2_._x = _loc2_._width - 1;
   }
   function makeFoulLine()
   {
      var _loc1_ = this;
      _loc1_.foulLine_mc = _loc1_.addToWorld("foulLine_mc","foulLine_mc",_loc1_.depths.foulLine,_loc1_.foulX,_loc1_.groundY);
   }
   function makePlayer()
   {
      var _loc1_ = this;
      _loc1_.playerLinkID_str = _global.gPusher + "_push";
      _loc1_.player_mc = _loc1_.world_mc.attachMovie("player_mc","player_mc",_loc1_.depths.player);
      var _loc2_ = new Object();
      _loc2_.linkID = _loc1_.playerLinkID_str;
      _loc2_.x = _loc1_.startX;
      _loc2_.y = _loc1_.groundY;
      if(_loc1_.playerLinkID_str == "spyro_mc")
      {
         _loc2_.bombLinkID = "bomb1_mc";
      }
      else if(_loc1_.playerLinkID_str == "sgtByrd_mc")
      {
         _loc2_.bombLinkID = "bomb3_mc";
      }
      else if(_loc1_.playerLinkID_str == "blink_mc")
      {
         _loc2_.bombLinkID = "bomb4_mc";
      }
      else if(_loc1_.playerLinkID_str == "hunter_mc")
      {
         _loc2_.bombLinkID = "bomb5_mc";
      }
      else
      {
         _loc2_.bombLinkID = "bomb2_mc";
      }
      _loc1_.player_mc.init(_loc2_);
      _loc1_.player_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.player_mc);
   }
   function makeTarget()
   {
      var _loc1_ = this;
      _loc1_.target_mc = _loc1_.addToWorld("target_mc","target_mc",_loc1_.depths.targets,_loc1_.targetX_array[_loc1_.targetArrayPos],_loc1_.groundY);
      _loc1_.target_mc._width = _loc1_.target_mc._width * _loc1_.targetScalePerc;
      _loc1_.target_mc._height = _loc1_.target_mc._height * _loc1_.targetScalePerc;
      _loc1_.target_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.target_mc);
      _loc1_.pCrowd_mc = _loc1_.addToWorld("crowd_mc","crowd_mc",_loc1_.depths.crowd,_loc1_.target_mc._x,_loc1_.groundY - 150);
      _loc1_.pHorse_mc = _loc1_.addToWorld("horse_mc","horse_mc",_loc1_.depths.horse,_loc1_.target_mc._x + 110,_loc1_.groundY);
      _loc1_.pBullsEye_mc = _loc1_.addToWorld("Bullseye_mc","bullseye_mc",_loc1_.depths.bullseye_mc,_loc1_.target_mc._x,_loc1_.groundY - 79 * _loc1_.targetScalePerc);
   }
   function makeUserInput()
   {
      var _loc1_ = this;
      _loc1_.userInput_mc = _root.attachMovie("userInput_mc","userInput_mc",_loc1_.depths.world + 1);
      _loc1_.userInput_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.userInput_mc);
   }
   function makeScoreBoard()
   {
      var _loc1_ = this;
      _loc1_.scoreBoard_mc = _root.createEmptyMovieClip("scoreBoard_mc",_loc1_.depths.scoreBoard + 10);
      var score_mc = _loc1_.scoreBoard_mc.attachMovie("score_mc","score_mc",_loc1_.depths.scoreBoard + 20);
      score_mc._x = 5;
      score_mc._y = 2;
      _loc1_.strike_mc = _loc1_.scoreBoard_mc.attachMovie("strike_mc","strike_mc",_loc1_.depths.scoreBoard + 41);
      _loc1_.strike_mc._x = 5;
      _loc1_.strike_mc._y = 30;
      _loc1_.strike_mc.gotoAndStop(_loc1_.strikes);
      var targetsHit_mc = _loc1_.scoreBoard_mc.attachMovie("targetsHit_mc","targetsHit_mc",_loc1_.depths.scoreBoard + 42);
      targetsHit_mc._x = 5;
      targetsHit_mc._y = 61;
      var sponsorGameBG_mc = _loc1_.scoreBoard_mc.attachMovie("sponsorGameBG_mc","sponsorGameBG_mc",_loc1_.depths.scoreBoard + 36);
      sponsorGameBG_mc._x = 325;
      sponsorGameBG_mc._y = 492.5;
      var logoSpyroSmall_mc = _loc1_.scoreBoard_mc.attachMovie("logoSpyroSmall_mc","logoSpyroSmall_mc",_loc1_.depths.scoreBoard + 38);
      logoSpyroSmall_mc._x = 50;
      logoSpyroSmall_mc._y = 445;
      var boxSpyro_mc = _loc1_.scoreBoard_mc.attachMovie("boxSpyro_mc","boxSpyro_mc",_loc1_.depths.scoreBoard + 40);
      boxSpyro_mc._x = 510;
      boxSpyro_mc._y = 445;
      boxSpyro_mc._width = boxSpyro_mc._width * 0.7;
      boxSpyro_mc._height = boxSpyro_mc._height * 0.7;
      var btn_endGame_mc = _loc1_.scoreBoard_mc.attachMovie("button_mc","btn_endGame_mc",_loc1_.depths.scoreBoard + 39);
      var _loc2_ = new Object();
      _loc2_.linkID = "btn_endGame_mc";
      _loc2_.alignmentX = "center";
      _loc2_.alignmentY = "bottom";
      _loc2_.x = _loc1_.docWidth_num * 0.5;
      _loc2_.y = _loc1_.docHeight_num * 0.99;
      _loc2_.textData = new Object();
      _loc2_.scriptID = "onEndGame";
      btn_endGame_mc.init(_loc2_);
      btn_endGame_mc.addListener(_loc1_);
      _loc1_.addListener(btn_endGame_mc);
      var _loc3_ = new Object();
      _loc3_.linkID = "promptImage_mc";
      _loc3_.x = _loc1_.docWidth_num * 0.5;
      _loc3_.y = _loc1_.docHeight_num * 0.99;
      _loc1_.prompt_mc = _loc1_.scoreBoard_mc.attachMovie("prompt_mc","prompt_mc",_loc1_.depths.scoreboard + 70);
      _loc1_.prompt_mc.init(_loc3_);
      _loc1_.prompt_mc.switchOff();
      _loc1_.prompt_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.prompt_mc);
   }
   function makeHUD()
   {
      var _loc2_ = this;
   }
   function makeEndText(linkName)
   {
      var _loc1_ = this;
      var _loc3_ = linkName;
      _loc1_.endText_mc = _loc1_.scoreBoard_mc.attachMovie(_loc3_,_loc3_,_loc1_.depths.scoreBoard + 50);
      _loc1_.endText_mc._x = 325;
      var _loc2_ = _loc3_ != "startText_mc"?150:250;
      _loc1_.endText_mc._y = _loc2_;
   }
   function getDist(x1, x2, y1, y2)
   {
      var _loc1_ = new Object();
      _loc1_.x = x1 - x2;
      _loc1_.y = y1 - y2;
      _loc1_.t = Math.sqrt(_loc1_.x * _loc1_.x + _loc1_.y * _loc1_.y);
      return _loc1_;
   }
   function foul()
   {
      var _loc1_ = this;
      _loc1_.addStrike();
      _loc1_.makeEndText("endTextTooFar_mc");
      if(_loc1_.strikes > 3)
      {
         _loc1_.makeEndText("endTextGameOver2_mc");
      }
      _loc1_.powerupReady_boolean = false;
      _loc1_.broadcastMessage("onStopRunning");
      _loc1_.myStep = _loc1_.step.reset;
   }
   function addStrike()
   {
      var _loc1_ = this;
      _loc1_.strikes = _loc1_.strikes + 1;
      _loc1_.strike_mc.gotoAndStop(_loc1_.strikes);
      if(_loc1_.strikes > 3)
      {
         _loc1_.makeEndText("endTextGameOver1_mc");
      }
   }
   function setNextTarget()
   {
      this.targetScalePerc = this.targetScalePerc * 0.9;
   }
   function makeScore(tBomb_mc, bomb_data)
   {
      var _loc1_ = this;
      _loc1_.powerupReady_boolean = false;
      _loc1_.onSetPowerup(null);
      var dist = _loc1_.getDist(tBomb_mc.pos.x,_loc1_.target_mc._x,0,0);
      var tTargetWidthOffset_num = 5;
      var i = _loc1_.powerupBtn_array.length;
      while(i--)
      {
         if(_loc1_.powerupBtn_array[i].toggle_boolean)
         {
            var _loc2_ = i + 1;
            if(_loc2_ == _loc1_.powerup.bigBlast)
            {
               var tTargetWidthOffset_num = 180;
            }
            else if(_loc2_ == _loc1_.powerup.triShot)
            {
               if(_loc1_.powerupBtn_array[0].toggle_boolean == false)
               {
                  var tTargetWidthOffset_num = 5;
               }
            }
         }
      }
      if(Math.abs(dist.x) < _loc1_.target_mc._width / 2 + tTargetWidthOffset_num)
      {
         var scorePerc = 1 - Math.abs(dist.x) / (_loc1_.target_mc._width / 2 + tTargetWidthOffset_num);
         if(scorePerc >= 0.9)
         {
            scorePerc = 1;
         }
         var multScore = Math.ceil(_loc1_.baseScore * scorePerc);
         var myScore = Math.ceil(multScore * 0.1) * 10;
         _loc1_.score_array.push(myScore);
      }
      else
      {
         var myScore = 0;
         _loc1_.score_array.push(myScore);
      }
      _loc1_.bombCount_num = _loc1_.bombCount_num - 1;
      if(_loc1_.bombCount_num <= 0)
      {
         var myHiScore_num = 0;
         var i = _loc1_.score_array.length;
         while(i--)
         {
            var _loc3_ = _loc1_.score_array[i];
            if(_loc3_ > myHiScore_num)
            {
               myHiScore_num = _loc3_;
            }
         }
         if(myHiScore_num == 0)
         {
            _loc1_.makeEndText("endTextMissed_mc");
            _loc1_.addStrike();
            _root.playSound(_root.miss_sound,1);
            _loc1_.showBombHit(bomb_data,0);
         }
         else
         {
            if(myHiScore_num == _loc1_.baseScore)
            {
               myHiScore_num = 125;
               _root.bullsEyeSound.start();
               _loc1_.makeEndText("endTextBullseye_mc");
               _root.playSound(_root.goodJob_sound,1);
            }
            else
            {
               _loc1_.makeEndText("endTextGoodJob_mc");
               _root.playSound(_root.goodJob_sound,1);
            }
            _loc1_.showBombHit(bomb_data,1);
            _loc1_.addScore(myHiScore_num);
            _loc1_.addTarget(1);
            _loc1_.setNextTarget();
         }
         _loc1_.myStep = _loc1_.step.reset;
         _loc1_.score_array = new Array();
      }
   }
   function addScore(amount)
   {
      var _loc1_ = _root;
      var _loc2_ = amount;
      this.myScore = this.myScore + _loc2_;
      _loc1_.GAMESCORE.changeby(_loc2_);
      _loc1_.score_text = "<P ALIGN=\'LEFT\'>Score: " + _loc1_.GAMESCORE.show() + "</P>";
      _loc1_.goodJob1_text = "<p align=\'center\'><font face = \'custom1_fnt\' color=\'#FFFFFF\' size = \'32\'>Good Job!<br>You Scored: " + _loc2_ + " pts<br>- Click To Continue -</font></p>";
      _loc1_.goodJob2_text = "<p align=\'center\'><font color=\'#000000\' size = \'32\'>Good Job!<br>You Scored: " + _loc2_ + " pts<br>- Click To Continue -</font></p>";
   }
   function addTarget(amount)
   {
      this.myTargets = this.myTargets + amount;
      _root.targetsHit_text = "Targets Hit: " + this.myTargets;
   }
   function panCam()
   {
      var _loc1_ = this;
      _loc1_.broadcastMessage("onStartWrapping");
      _loc1_.world_mc._x = - _loc1_.target_mc._x + _loc1_.startX + _loc1_.docWidth_num / 2;
      _loc1_.bg_mc.wrapping();
      _loc1_.broadcastMessage("onStartPanning");
   }
   function resetCam()
   {
      var _loc1_ = this;
      _loc1_.broadcastMessage("onStopPanning");
      _loc1_.world_mc._x = - _loc1_.player_mc._x + _loc1_.startX + _loc1_.docWidth_num / 2;
      _loc1_.bg_mc.wrapping();
   }
   function setPromptText(tPrompt_str)
   {
      var _loc1_ = new Object();
      _loc1_.txt_size = 12;
      _loc1_.txt_color = 16777215;
      _loc1_.displayTime = 1;
      _loc1_.waitForClick = false;
      _loc1_.txt_str = tPrompt_str;
      this.prompt_mc.addToTextDisplayCue(_loc1_);
      this.prompt_str = tPrompt_str;
   }
   function onShowInfo(tInfo_str)
   {
      var _loc1_ = new Object();
      _loc1_.txt_size = 12;
      _loc1_.txt_color = 16777215;
      _loc1_.displayTime = 1;
      _loc1_.waitForClick = false;
      _loc1_.txt_str = tInfo_str;
      this.prompt_mc.addToTextDisplayCue(_loc1_);
   }
   function onHideInfo()
   {
      this.setPromptText(this.prompt_str);
   }
   function onPanning()
   {
      var _loc1_ = this;
      _loc1_.world_mc._visible = true;
      _loc1_.bg_mc._visible = true;
      _root.bg_mc._visible = true;
      _loc1_.world_mc._x = _loc1_.world_mc._x + 15;
      var _loc2_ = - _loc1_.player_mc._x + _loc1_.startX + _loc1_.docWidth_num / 2;
      if(_loc1_.world_mc._x >= _loc2_)
      {
         _loc1_.myStep = _loc1_.step.roundInit;
         _loc1_.resetCam();
      }
   }
   function onInputGo()
   {
      var _loc1_ = this;
      var _loc3_ = _root;
      if(_loc1_.myStep == _loc1_.step.panCam)
      {
         _loc1_.resetCam();
         if(_loc1_.powerupReady_boolean == true)
         {
            _loc1_.makeMenu(9);
            _loc1_.myStep = _loc1_.step.selectPowerUp;
            _loc1_.setPromptText("Click On Powerup to Activate Or Click Screen To Start");
         }
         else
         {
            _loc1_.setPromptText("Click Screen To Start");
            _loc1_.myStep = _loc1_.step.roundInit;
         }
      }
      else if(_loc1_.myStep == _loc1_.step.choosePowerup)
      {
         _loc1_.myStep = _loc1_.step.roundInit;
      }
      else if(_loc1_.myStep == _loc1_.step.roundInit)
      {
         _loc1_.broadcastMessage("onStartRunning");
         _loc1_.broadcastMessage("onStartWrapping");
         var _loc2_ = _loc1_.powerupBtn_array.length;
         while(true)
         {
            _loc2_;
            if(_loc2_--)
            {
               _loc1_.powerupBtn_array[_loc2_].onPause();
               continue;
            }
            break;
         }
         _loc1_.myStep = _loc1_.step.running;
         _loc1_.endText_mc.removeMovieClip();
         _loc3_.buttonSound.start();
         _loc1_.setPromptText("Click Screen To Set Angle");
      }
      else if(_loc1_.myStep == _loc1_.step.running)
      {
         _loc1_.broadcastMessage("onStartAngle");
         _loc1_.myStep = _loc1_.step.angling;
         _loc3_.buttonSound.start();
         _loc1_.setPromptText("Click Screen To Shoot");
         _loc3_.cannonRiseSound.start();
      }
      else if(_loc1_.myStep == _loc1_.step.angling)
      {
         _loc3_.cannonRiseSound.stop("cannonRiseSound");
         _loc1_.broadcastMessage("onStopRunning");
         _loc1_.broadcastMessage("onStartThrowing");
         _loc1_.myStep = _loc1_.step.inGame;
         _loc1_.setPromptText("");
      }
      else if(_loc1_.myStep == _loc1_.step.gameOver)
      {
         _loc1_.myStep = _loc1_.step.reset;
      }
      else if(_loc1_.myStep == _loc1_.step.reset)
      {
         if(_loc1_.strikes > 3)
         {
            _loc1_.onEndGame();
         }
         else
         {
            _loc1_.endText_mc.removeMovieClip();
            _loc1_.reset();
            _loc1_.roundInit();
         }
      }
   }
   function onPlayerMoved()
   {
      var _loc1_ = this;
      _loc1_.world_mc._x = - _loc1_.player_mc._x + _loc1_.startX + _loc1_.docWidth_num / 2;
      if(_loc1_.player_mc._x >= _loc1_.foulX)
      {
         _loc1_.broadcastMessage("onStopRunning");
         _loc1_.broadcastMessage("onStopWrapping");
         _loc1_.foul();
      }
   }
   function onHeatSeek(tBomb_mc)
   {
      var _loc3_ = tBomb_mc;
      var _loc1_ = this.target_mc._x - _loc3_.pos.x;
      if(_loc1_ > 0)
      {
         var foulToTargetDist = Math.abs(this.target_mc._x - this.foulX);
         var bombToTargetPerc = _loc1_ / foulToTargetDist;
         var _loc2_ = (1 - bombToTargetPerc) * 0.05;
      }
      else
      {
         _loc2_ = 0;
      }
      var heatSeekDist_num = _loc1_ * _loc2_;
      _loc3_.pos.x = _loc3_.pos.x + heatSeekDist_num;
      _loc3_.vel.x = _loc3_.vel.x * (1 - _loc2_);
   }
   function onBombMoved(tBomb_mc)
   {
      var _loc1_ = this;
      _loc1_.world_mc._x = - tBomb_mc.pos.x + _loc1_.startX + _loc1_.docWidth_num / 2;
   }
   function onBombExploded(tBomb_mc, bomb_data)
   {
      var _loc1_ = this;
      _loc1_.myStep = _loc1_.step.reset;
      _loc1_.makeScore(tBomb_mc,bomb_data);
   }
   function onPlayerAngled(rot)
   {
      this.broadcastMessage("onHUDangleUpdate",rot);
   }
   function onMakeBomb(bombData)
   {
      var _loc1_ = this;
      var _loc2_ = bombData;
      _root.cannonSound.start();
      _loc2_.scale = 1;
      _loc1_.bombCount_num = 1;
      _loc2_.boomScalePerc_num = 1;
      var i = _loc1_.powerupBtn_array.length;
      while(i--)
      {
         if(_loc1_.powerupBtn_array[i].toggle_boolean)
         {
            var _loc3_ = i + 1;
            if(_loc3_ == _loc1_.powerup.bigBlast)
            {
               _loc2_.scale = 1.5;
               _loc2_.boomScalePerc_num = 1.5;
            }
            else if(_loc3_ == _loc1_.powerup.triShot)
            {
               if(_loc1_.powerupBtn_array[0].toggle_boolean == false)
               {
                  _loc2_.scale = 0.8;
                  _loc2_.boomScalePerc_num = 0.5;
               }
               _loc1_.bombCount_num = 3;
            }
            else if(_loc3_ == _loc1_.powerup.heatSeek)
            {
               _loc1_.powerupID_num = 3;
            }
         }
      }
      _loc2_.boundMaxY_num = _loc1_.groundY - 64;
      _loc2_.powerupID_num = _loc1_.powerupID_num;
      _loc2_.moveMessage_str = "onBombMoved";
      _loc1_.bomb_mc = _loc1_.world_mc.attachMovie("bomb_mc","bomb_mc",_loc1_.depths.bomb);
      _loc1_.shadow_mc = _loc1_.world_mc.attachMovie("shadow_mc","shadow_mc",_loc1_.depths.shadow);
      _loc1_.bomb_mc.init(_loc2_,_loc1_.shadow_mc);
      _loc1_.bomb_mc.addListener(_loc1_);
      _loc1_.addListener(_loc1_.bomb_mc);
      if(_loc1_.powerupBtn_array[1].toggle_boolean == true)
      {
         var tVely = _loc2_.vel.y;
         _loc2_.vel.y = tVely + 8;
         _loc2_.pos.x = _loc2_.pos.x + 10;
         _loc2_.moveMessage_str = null;
         var tBomb_mc = _loc1_.world_mc.attachMovie("bomb_mc","bomb2_mc",_loc1_.depths.bomb + 2);
         tBomb_mc.init(_loc2_);
         tBomb_mc.vel.x = tBomb_mc.vel.x - 20;
         tBomb_mc.addListener(_loc1_);
         _loc1_.addListener(tBomb_mc);
         _loc2_.vel.y = tVely - 8;
         _loc2_.pos.x = _loc2_.pos.x - 10;
         var tBomb_mc = _loc1_.world_mc.attachMovie("bomb_mc","bomb3_mc",_loc1_.depths.bomb + 3);
         tBomb_mc.init(_loc2_);
         tBomb_mc.vel.x = tBomb_mc.vel.x + 20;
         tBomb_mc.addListener(_loc1_);
         _loc1_.addListener(tBomb_mc);
      }
      _loc1_.broadcastMessage("onStartFalling");
      _root.whistleUp_sound.start();
   }
   function onMakeBoom(boomData)
   {
      var _loc1_ = this;
      var _loc2_ = boomData;
      _loc1_.boomCount_num = _loc1_.boomCount_num + 1;
      var _loc3_ = _loc1_.world_mc.attachMovie("explosion_mc","explosion_mc" + _loc1_.boomCount_num,_loc1_.depths.explosion + _loc1_.boomCount_num);
      _loc3_._x = _loc2_.x;
      _loc3_._y = _loc2_.y;
      _loc3_._xscale = _loc3_._yscale = _loc2_.scale;
      var scorch_mc = _loc1_.world_mc.attachMovie("scorch_mc","scorch_mc" + _loc1_.boomCount_num,_loc1_.depths.scorch + _loc1_.boomCount_num);
      scorch_mc._x = _loc2_.x;
      scorch_mc._y = _loc2_.y;
      scorch_mc._xscale = scorch_mc._yscale = _loc2_.scale;
      _root.playSound(_root.explosion_sound,1);
      _loc1_.shadow_mc.removeMovieClip();
   }
   function showBombHit(bomb_data, result_num)
   {
      var _loc1_ = this;
      var linkage_str = _global.gShot + "_land_mc_" + result_num;
      var pX;
      var _loc3_ = undefined;
      switch(result_num)
      {
         case 0:
            _root.birdSound.start();
            pX = bomb_data.x;
            _loc3_ = _loc1_.groundY;
            _loc1_.pHorse_mc.gotoAndStop("sad");
            break;
         case 1:
            _loc1_.pHorse_mc.gotoAndStop("happy");
            _loc1_.shadow_mc.removeMovieClip();
            pX = bomb_data.x;
            _loc3_ = _loc1_.groundY - 68 * _loc1_.targetScalePerc;
      }
      var _loc2_ = _loc1_.world_mc.attachMovie(linkage_str,"explosion_mc" + _loc1_.boomCount_num,_loc1_.depths.explosion + _loc1_.boomCount_num);
      _loc2_._x = pX;
      _loc2_._y = _loc3_;
      if(result_num == 1)
      {
         var flippy_w = 54;
         var flippy_r = _loc2_._x + flippy_w;
         var target_r = _loc1_.target_mc._x + _loc1_.target_mc._width / 2 - 8 * _loc1_.targetScalePerc;
         var flippy_l = _loc2_._x - flippy_w;
         var target_l = _loc1_.target_mc._x - _loc1_.target_mc._width / 2 + 8 * _loc1_.targetScalePerc;
         if(flippy_r > target_r)
         {
            while(_loc2_._x + 54 > _loc1_.target_mc._x + _loc1_.target_mc._width / 2 + 8 * _loc1_.targetScalePerc)
            {
               _loc2_._x = _loc2_._x - 1;
            }
         }
         else if(flippy_l < target_l)
         {
            while(_loc2_._x - 54 < _loc1_.target_mc._x - _loc1_.target_mc._width / 2 + 8 * _loc1_.targetScalePerc)
            {
               _loc2_._x = _loc2_._x + 1;
            }
         }
      }
      _loc1_.boomCount_num = _loc1_.boomCount_num + 1;
   }
   function onLevelDone()
   {
      this.reset();
      this.makeMenu();
   }
   function onReset()
   {
      this.reset();
   }
   function onSetCharacter(tPlayerLinkID_str)
   {
      this.playerLinkID_str = tPlayerLinkID_str;
   }
   function onSetBG(tBgLinkID_str)
   {
      this.bgLinkID_str = tBgLinkID_str;
   }
   function onSetPowerup(tPowerupID_num)
   {
      this.powerupID_num = tPowerupID_num;
   }
   function onActivatePowerupBtn(tPowerupID_num)
   {
      var _loc1_ = this;
      _loc1_.powerupBtn_array[tPowerupID_num - 1].onActivate();
      _loc1_.setPromptText("Click On Powerup to Activate Or Click Screen To Start");
      _loc1_.myStep = _loc1_.step.choosePowerup;
   }
   function onGameStart()
   {
      this.reset();
      this.gameInit();
   }
   function onEndMenu()
   {
      var _loc1_ = this;
      _loc1_.menu_mc.removeMovieClip();
      _loc1_.scoreBoard_mc.removeMovieClip();
      _loc1_.gameInit();
   }
   function onRestartGame()
   {
      var _loc1_ = this;
      _loc1_.scoreBoard_mc.removeMovieClip();
      _loc1_.menu_mc.removeMovieClip();
      _loc1_.world_mc.removeMovieClip();
      _loc1_.makeMenu(1,"menuBG_mc");
   }
   function onSendScore()
   {
      var _loc1_ = this;
      _loc1_.scoreBoard_mc.removeMovieClip();
      _loc1_.menu_mc.removeMovieClip();
      _loc1_.world_mc.removeMovieClip();
      _root.gotoAndPlay("sendscoreframe");
   }
   function onEndGame()
   {
      var _loc1_ = this;
      var _loc2_ = _root;
      stopAllSounds();
      _loc1_.reset();
      _loc1_.scoreBoard_mc.removeMovieClip();
      _loc2_.gameOver_text = "<p align=\'center\'>Congratulations!<br>Your Score Was:<br><br>" + _loc2_.GAMESCORE.show() + "<Play Game></p>";
      if(_loc1_.playerLinkID_str == "spyro_mc")
      {
         var tCharLinkID_str = "spyroMenu_mc";
      }
      else if(_loc1_.playerLinkID_str == "sgtByrd_mc")
      {
         var tCharLinkID_str = "sgtByrdMenu_mc";
      }
      else if(_loc1_.playerLinkID_str == "blink_mc")
      {
         var tCharLinkID_str = "blinkMenu_mc";
      }
      else if(_loc1_.playerLinkID_str == "hunter_mc")
      {
         var tCharLinkID_str = "hunterMenu_mc";
      }
      _loc2_.gotoAndPlay("gameoverframe");
      _loc1_.myStep = 99;
   }
}
