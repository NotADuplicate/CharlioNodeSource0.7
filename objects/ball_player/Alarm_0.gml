/// @description Pick color and place
seed = random_get_seed();
if(spectating)
	visible = false;
if(global.gameMode == "Royale") { //set colors
	sprite_index = global.colors[(num+seed) mod 6];
	global.teamNum[num] = num;
}
else {//same team = same colors
	if(global.teamNum[num] == 1)
		sprite_index = spr_adventurer;
	else
		sprite_index = spr_blue;
}

maxhp = 250;
hp = maxhp;

///Go to random place
visible = true;
if(global.gameMode == "Royale") {
	global.attack = obj_bullet;
	spawn = instance_find(royale_spwanPoints,(num+seed) mod instance_number(royale_spwanPoints))
	x = spawn.x;
	y = spawn.y;
}
else {
	with(obj_regen) {
		if(global.teamNum[num] = global.teamNum[other.num]) {
			other.x = x;
			other.y = y;
		}
	}
}
startingX = x;
startingY = y;
gun.num = num;

if(global.atktext != "Pistol") {
	with(ball_game) {
		node_send(buffer,"eventName","Extra Shit 2","Gun Name",global.atktext, "Gun Num", ball_player.num);
	}
}
///Get passive
/*switch(global.passive) {
    case "regen":
        regen++;
    break;
    case "speed":
        spd+= 2;
    break;
    case "hp":
        maxhp += 30;
        hp = maxhp;
    break;
    case "melee":
        dmg++;
    break;
    case "Juggernaut":
        knockback = 1;
        buffer_seek(obj_client.buffer, buffer_seek_start, 0);
        buffer_write(obj_client.buffer, buffer_u8, 12);
        buffer_write(obj_client.buffer, buffer_u8, num);
        network_send_packet(obj_client.socket,obj_client.buffer,buffer_tell(obj_client.buffer));
    break;
    case "Blast Resistance":
        bRes = .35;
    break;
    case "Bullet Resistance":
        def = .7;
    break;
    case "Fast Firing":
        global.shooting = 2;
    break;
    case "Revenant":
        global.revive = true;
    break;
}

