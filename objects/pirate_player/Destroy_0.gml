///Let others know to die
// You can write your code in this editor
instance_destroy(inst_incentive);
pirate_game.alarm[1] = 1;
if(pirate) {
	repeat(global.loot) {
		instance_create(x,y,moving_booty);
	}
}
if(hp < 1) {
	global.alive = false;
}