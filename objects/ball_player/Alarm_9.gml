/// @description Technically respawn
speed = 0;
visible = true;
x = startingX;
y = startingY;
moveSpd = global.baseMove
hp = maxhp;
poisonDmg=0;
global.dead = false;
global.ammo = global.maxAmmo
view_set_visible(0,true)
view_set_visible(1,false)
respawnTimer = 0;
scr_cleanse(true);