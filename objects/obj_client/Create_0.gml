/// @description Create buffer
#macro network_send_packet network_send_packetudp
#macro show_message show_popsfk
var size = 1024;
var type = buffer_grow;
var alignment = 1;
buffer = buffer_create(size,type,alignment);
global.players[0] = 0;
extra = true;
global.playBall = false;
draw_set_color(c_white)
ping = 0;

global.gameMode = "Comp"
pingTime = 3;
global.mons = 21;
global.colors[0] = spr_white;
global.colors[1] = spr_red;
global.colors[2] = spr_yellow;
global.colors[3] = spr_green;
global.colors[4] = spr_purple;
global.colors[5] = spr_blue;
global.colors[6] = spr_white;
global.colors[7] = spr_red;
global.colors[8] = spr_yellow;
global.colors[9] = spr_green;
global.colors[10] = spr_purple;
global.colors[11] = spr_blue;
index =0;
/* */
///Set other vars
global.ready = 0;
ready = false;
global.users = 0;
global.ballStart = false;
global.ult = "Win";
global.ammo = 0;
global.attack = obj_bullet;
global.atktext = "Pistol";
global.utility = "";
global.passive = "speed";
global.trumpClass = "Trump";
timer = 0;
reload = 0;
global.connected = false;
backlog = 0;
spray = 0;
draw_set_halign(fa_center);
global.game = 0;
global.spectator = false;


global.testMode = false;
triedConnect = false;


/* */
///Get name
randomize();
i = 1;
global.team = choose(950,50);
if(global.team = 50) {
	global.teamside = -1;
}
else
	global.teamside = 1;
repeat(10) {
    global.kills[i] = 0;
    global.deaths[i] = 0;
    global.wins[i] = 0;
    i++;
}

//load name if possible
alarm[1] = 1;


var i = 0;
repeat(10) {
	global.players[i] = 1;
	global.names[i] = "Peen";
	global.teamNum[i] = 1;
	i++;
}


/* */
/*  */
