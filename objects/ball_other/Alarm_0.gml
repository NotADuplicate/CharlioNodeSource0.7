/// @description Pick color
seed = random_get_seed();
if(global.gameMode == "Royale") { //set colors
	sprite_index = global.colors[(num+seed) mod 6];
	global.teamNum[num] = num;
}
else {//same team = same colors
	if(global.teamNum[num] == 1)
		sprite_index = spr_adventureWalk;
	else if(global.teamNum[num] == -1)
		sprite_index = spr_bAdventureWalk;
	else if(global.teamNum[num] == 0) 
		spectating = false;
}
if((global.teamNum[num] == global.teamNum[ball_player.num] && global.gameMode != "Royale") || ball_player.spectating) {
	sameTeam = true;
	lt = instance_create(x,y,obj_light_follower)
	lt.ins = self;
}
else
	sameTeam = false;

gun.num = num;
//sprite_index = global.colors[(num+seed) mod 6];
//maxhp = hp;

