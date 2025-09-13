function scr_resetVote(argument0) {
	num = argument0
	i = 1;
	global.switchLiving--;
	repeat(global.loop) {
		global.votes[i] = 0;
		i++;
	}
	with(obj_vote) {
		if(num = argument0) {
			instance_destroy()
		}
		else {
			select = false;
			sprite_index = spr_black;
		}
	}
	if(num == global.picked1 || num == global.picked2) {
		global.impNum--;
		if(global.impNum < 1) {
			ins = instance_create(0,0,switch_win);
			ins.winners = "Detectives"
		}		
	}
	if(instance_number(obj_vote) == global.impNum) {
			ins = instance_create(0,0,switch_win);
			ins.winners = "Impostors"
	}
	if(num == switch_game.num)
		global.dead = true;
	global.time = 120;
	switch_game.secret = true;


}
