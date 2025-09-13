/// @description Insert description here
// You can write your code in this editor
loaded = true;

///Create buffer
var size = 1024;
var type = buffer_grow;
var alignment = 1;
buffer = buffer_create(size,type,alignment);
socket = obj_client.socket;
global.offset = choose(0,1);
global.word[0] = 0;
global.word[1] = 0;
global.word[2] = 0;
global.bandit = false;
global.firing = 1;
global.hint = false;

//global.powerup[1] = "Clue";
global.powerup[1] = "Faster Firing";
global.powerup[2] = "Dash (Shift)";
global.powerup[3] = "Accuracy";
global.powerup[4] = "Reload on Kill";
global.powerup[5] = "Perfect Accuracy";
global.powerup[6] = "Death";
global.powerup[7] = "";
global.powerup[8] = "";
global.powerup[9] = "";
global.powerup[10] = "";

global.gold = false;