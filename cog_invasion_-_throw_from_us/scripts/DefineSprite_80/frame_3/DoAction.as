if(120 < Number(depth))
{
   depth = 1;
}
duplicateMovieClip("p1","p" && depth,16384 + depth);
rot_new = random(360);
alpha_new = Number(random(80)) + 20;
setProperty("p" && depth, _rotation, rot_new);
setProperty("p" && depth, _alpha, alpha_new);
depth = Number(depth) + 1;
