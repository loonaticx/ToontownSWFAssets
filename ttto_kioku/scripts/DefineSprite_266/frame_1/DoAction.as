function movieInit()
{
   gameLevel = 0;
   powerMax = 6;
   power = 6;
   answerRestTime = 0;
   getScore = 0;
   goodCount = 0;
   gameOverFlg = false;
   cogName = ["オベッカー","タイコモチー","チョロマカシー","ブアイソン","カリカリン","ガッツキー","セコビッチ","ツーハーン","イエスマン","ニマイジタン","ドケッチオ","タッシャーナ","ガミガミーナ","ツケコミン","カッチリン","オオゲーサ","リストラマン","ウラギリン","スウジスキー","クロマクール","ヘッドハンター","ドクター・トラブル","カネモッチン","アイソマン","デッパラーダ","ホウノトリ","シャークロン","オマカセンヌ","ビッグチーズ","ビッグホワイト","ドロビッグ","ビッグスマイル"];
   cogMes = ["ボスに言いつけてやるぞ！","うーん、キミ、\nおいしそうだね。","私にはカンタンに\n勝てると思ってるだろ？","なんだ、キミは。","用があるならさっさと言え、\n急いでるんだ！","しぼりにしぼってやるぞ！","貴重な時間を\n割かせないでくれ。","むしゃくしゃしてるんだ、\n近寄るとあぶないぜ。","ボスが間違ったことは\n一度もないのさ。","ダブルトラブルを\n与えてやる！","これがキミの\nオファーなのかい？","話術なら負けないよ。","ちょっとあんた、\n何様のつもりだい！","あやしい者では\nありませんよ。","身の程を知ったほうが\nいいですよ。","キミと私はともだち！\nね、そうだろう？","キミのようなヤツはクビだ！","この目がウソを\n言っているように見えるかい？","私の計算によると…\nキミの負けだ！","私に逆らおうというのか？","頭を狩られるだけじゃ済まんぞ！","キミのようなトゥーンには\nお灸をすえねば。","キミ、カネの素晴らしさを\n知らないね？","私のジャマをするとは\nいい度胸だ！","キサマの会社を\nのっとってやる！","キミは私に勝てっこないよ。","カネのハンターに\nケンカを売るのか？","キミの運命、\n私に任せてみない？","スライスしてやろうか？\nなんちゃって。","恐怖で髪が\n白くならんようにな。","有り金ぜんぶ\n置いていきな！","この笑顔で人は\nダマされるのだよ！"];
   hiscore = hiscore_so.data.hiscore;
   if(hiscore_so.data.hiscore == undefined)
   {
      hiscore = 0;
   }
}
function stageInit()
{
   moveMode = 0;
   floorMove = [];
   cogs = [];
   answerCog = [];
   answer = [];
   elvPos = 0;
   levelWait = 1800;
   returnWait = 3000;
   doorWait = 8 - Math.floor(gameLevel / 4);
   doorOpenTime = 1500 - gameLevel * 40;
   moveWait = 28 - gameLevel;
}
function setQuestion()
{
   floorMove = [];
   if(gameLevel >= 0 && gameLevel <= 4)
   {
      floorMove = [0,1,2,3,4];
      moveMode = 1;
   }
   else if(gameLevel > 4 && gameLevel <= 9)
   {
      floorMove = [4,3,2,1,0];
      moveMode = 2;
   }
   else if(gameLevel > 9)
   {
      var _loc1_ = [0,1,2,3,4];
      i = 0;
      while(i < 5)
      {
         var _loc2_ = Math.floor(Math.random() * _loc1_.length);
         floorMove[i] = _loc1_[_loc2_];
         _loc1_.splice(_loc2_,1);
         i++;
      }
      moveMode = 3;
   }
   if(gameLevel < 2)
   {
      maxCog = 8;
   }
   else if(gameLevel < 4)
   {
      maxCog = 12;
   }
   else if(gameLevel < 6)
   {
      maxCog = 16;
   }
   else if(gameLevel < 8)
   {
      maxCog = 20;
   }
   else if(gameLevel < 10)
   {
      maxCog = 24;
   }
   else if(gameLevel < 12)
   {
      maxCog = 28;
   }
   else
   {
      maxCog = 32;
   }
   _loc1_ = [];
   i = 0;
   while(i < maxCog)
   {
      _loc1_.push(i);
      i++;
   }
   cogs = [];
   i = 0;
   while(i < 5)
   {
      _loc2_ = Math.floor(Math.random() * _loc1_.length);
      cogs[i] = _loc1_[_loc2_];
      _loc1_.splice(_loc2_,1);
      i++;
   }
}
function powerDown()
{
   laffmeter.nextFrame();
   power--;
   if(power <= 0)
   {
      gameOverFlg = true;
   }
}
hiscore_so = SharedObject.getLocal("tt_hiscore");
movieInit();
