///Repeat for collisions
// You can write your code in this editor
if(collision_line(x,y,xp,yp,pirate_player,false,false)) {
	if(num != pirate_player.num) {
		pirate_player.hp -= dmg;
		if(pirate_player.hp < 1) {
			pirate_game.killnum = num;
		}
		instance_destroy(self);
	}
}
if(collision_line(x,y,xp,yp,inst_solid,false,false)) {
	wall = collision_line(x,y,xp,yp,inst_solid,false,false);
	wall.hp -= dmg;
	instance_destroy();
}
	xp = x;
	yp = y;