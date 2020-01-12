if(soundTog != false)
{
   soundTog = true;
}
_root.playSound = function(track, loops)
{
   if(soundTog)
   {
      track.start(0,loops);
   }
};
_root.cannonSound = new Sound(_root);
_root.cannonSound.attachSound("cannonSound");
_root.bullsEyeSound = new Sound(_root);
_root.bullsEyeSound.attachSound("bullseyeSound");
_root.cannonRiseSound = new Sound(_root);
_root.cannonRiseSound.attachSound("cannonRiseSound");
_root.createEmptyMovieClip("bonus_mc",18);
_root.bonus_sound = new Sound(_root.bonus_mc);
_root.bonus_sound.attachSound("bonus_sound");
_root.bonus_sound.setVolume(100);
_root.createEmptyMovieClip("explosion_mc",2);
_root.explosion_sound = new Sound(_root.explosion_mc);
_root.explosion_sound.attachSound("explosion_sound");
_root.explosion_sound.setVolume(70);
_root.createEmptyMovieClip("gameover_mc",3);
_root.gameover_sound = new Sound(_root.gameover_mc);
_root.gameover_sound.attachSound("gameover_sound");
_root.gameover_sound.setVolume(20);
_root.createEmptyMovieClip("menuBeep_mc",5);
_root.menuBeep_sound = new Sound(_root.menuBeep_mc);
_root.menuBeep_sound.attachSound("menuBeep_sound");
_root.menuBeep_sound.setVolume(100);
_root.createEmptyMovieClip("whistleUp",666);
_root.whistleUp_sound = new Sound(_root);
_root.whistleUp_sound.attachSound("whistleUp_sound");
_root.whistleUp_sound.setVolume(100);
_root.createEmptyMovieClip("music_mc",7);
_root.music_sound = new Sound(_root.music_mc);
_root.music_sound.attachSound("music_sound");
_root.music_sound.setVolume(30);
_root.createEmptyMovieClip("musicMenu_mc",8);
_root.musicMenu_sound = new Sound(_root.musicMenu_mc);
_root.musicMenu_sound.attachSound("musicMenu_sound");
_root.musicMenu_sound.setVolume(30);
_root.createEmptyMovieClip("miss_mc",9);
_root.miss_sound = new Sound(_root.miss_mc);
miss_sound.attachSound("miss_sound");
miss_sound.setVolume(60);
_root.createEmptyMovieClip("goodJob_mc",10);
_root.goodJob_sound = new Sound(_root.goodJob_mc);
goodJob_sound.attachSound("goodJob_sound");
goodJob_sound.setVolume(60);
_root.birdSound = new Sound(_root);
_root.birdSound.attachSound("birdSound");
