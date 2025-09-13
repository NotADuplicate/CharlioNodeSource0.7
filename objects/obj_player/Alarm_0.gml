/// @description Pick color and place
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

maxhp = 90 + ((num+seed) mod 11);
hp = maxhp;

///Go to random place
visible = true;
if(global.teaming == 0) {
    seed = random_get_seed();
    random_set_seed(num*seed);
    x = irandom_range(50,950);
    y = irandom_range(50,700);
    random_set_seed(seed);
}
else {
    x = global.team;
    y = global.teaming
    //y = (round(num/obj_client.loop)*800)+100;
}

///Get passive
switch(global.passive) {
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

