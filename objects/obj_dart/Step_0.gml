///Repeat for collisions
// You can write your code in this editor
if(collision_line(x,y,xp,yp,pirate_player,false,false)) {
	if(num != pirate_player.num) {
		pirate_player.marked = true;
		pirate_game.alarm[10] = 1;
		scr_text(10,"You've been marked by the beast");
		instance_destroy(self);
	}
}
if(collision_line(x,y,xp,yp,inst_solid,false,false)) {
	instance_destroy();
}
	xp = x;
	yp = y;