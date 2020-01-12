obj = eval("floorSignMC.sign" + (floorMove[elvPos] + 1));
obj.gotoAndStop(1);
if(gameLevel < 3)
{
   questionPat = 0;
}
else if(gameLevel < 6)
{
   questionPat = Math.floor(Math.random() * 3);
}
else
{
   questionPat = Math.floor(Math.random() * 5);
}
if(questionPat == 0)
{
   subQuestion = floorMove[Math.floor(Math.random() * 5)];
   answer[0] = Math.floor(Math.random() * 4);
   answerCog = [];
   answerCog[answer[0]] = cogs[subQuestion];
   k = [];
   i = 0;
   while(i < 5)
   {
      if(subQuestion != i)
      {
         k.push(i);
      }
      i++;
   }
   i = 0;
   while(i < 4)
   {
      if(i != answer[0])
      {
         d = Math.floor(Math.random() * k.length);
         answerCog[i] = cogs[k[d]];
         k.splice(d,1);
      }
      i++;
   }
}
else if(questionPat == 1)
{
   answerCog = [-1,-1,-1,-1];
   answer[0] = Math.floor(Math.random() * 4);
   do
   {
      rnd = Math.floor(Math.random() * maxCog);
   }
   while(cogs[0] == rnd || cogs[1] == rnd || cogs[2] == rnd || cogs[3] == rnd || cogs[4] == rnd);
   
   answerCog[answer[0]] = rnd;
   k = [];
   i = 0;
   while(i < 5)
   {
      k.push(cogs[i]);
      i++;
   }
   i = 0;
   while(i < 4)
   {
      if(i != answer[0])
      {
         d = Math.floor(Math.random() * k.length);
         answerCog[i] = k[d];
         k.splice(d,1);
      }
      i++;
   }
}
else if(questionPat == 2)
{
   answerCog = [-1,-1,-1,-1];
   answer[0] = Math.floor(Math.random() * 4);
   answerCog[answer[0]] = cogs[Math.floor(Math.random() * 5)];
   k = [];
   i = 0;
   while(i < maxCog)
   {
      flg = false;
      j = 0;
      while(j < 5)
      {
         if(cogs[j] == i)
         {
            flg = true;
            break;
         }
         j++;
      }
      if(!flg)
      {
         k.push(i);
      }
      i++;
   }
   i = 0;
   while(i < 4)
   {
      if(i != answer[0])
      {
         d = Math.floor(Math.random() * k.length);
         answerCog[i] = k[d];
         k.splice(d,1);
      }
      i++;
   }
}
else if(questionPat >= 3)
{
   answerCog = [-1,-1,-1,-1];
   var k = [0,1,2,3,4];
   i = 0;
   while(i < 4)
   {
      var d = Math.floor(Math.random() * k.length);
      answer[i] = floorMove[k[d]];
      answerCog[i] = cogs[floorMove[k[d]]];
      k.splice(d,1);
      i++;
   }
}
questionPlate.line1 = "";
questionPlate.line2 = "";
if(questionPat == 0)
{
   questionPlate.line1 = subQuestion + 1 + "階にいたのはだれ？";
}
else if(questionPat == 1)
{
   questionPlate.line2 = "どの階にも\nいなかったのはだれ？";
}
else if(questionPat == 2)
{
   questionPlate.line1 = "出てきたのはだれ？";
}
else if(questionPat == 3)
{
   questionPlate.line2 = "下の階にいたコグから\nじゅんにクリックしてね";
}
else if(questionPat == 4)
{
   questionPlate.line2 = "上の階にいたコグから\nじゅんにクリックしてね";
}
