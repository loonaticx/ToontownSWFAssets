this.onEnterFrame = null;
_root.myInterface.sonar["b" + n].removeMovieClip();
_root.myInterface.sonar.factory.count = _root.myInterface.sonar.factory.count - 1;
_root.myInterface.hits = _root.myInterface.hits + 1;
_root.kills = _root.kills + 1;
this.swapDepths(3000);
this.removeMovieClip();
