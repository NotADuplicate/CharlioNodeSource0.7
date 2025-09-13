/// @description Put in position
seed = random_get_seed();
Rnum = num + seed;
dir = seed + (Rnum/global.loop)*360;
x = 500 + lengthdir_x(300,dir);
y = 380 + lengthdir_y(200,dir);
//instance_create(x,y,standoff_light);