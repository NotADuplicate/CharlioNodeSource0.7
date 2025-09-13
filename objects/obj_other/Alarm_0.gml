/// @description Pick color
seed = random_get_seed();
if(global.teaming == 0) { //set colors
	if(global.cSwitch == true)
	    sprite_index = global.colors[(num+seed) mod 6];
	else
	    sprite_index = global.colors[num];
}
else {//same team = same colors
	sprite_index = global.colors[2+global.teamNum[num]];
}

//sprite_index = global.colors[(num+seed) mod 6];
//maxhp = hp;

