///Repeat for collisions
// You can write your code in this editor
if(collision_line(x,y,xp,yp,standoff_player,false,false)) {
	if(num != standoff_player.num) {
		standoff_player.alarm[1] = 1;
		standoff_player.killNum = num
		instance_destroy(self);
	}
}
	xp = x;
	yp = y;