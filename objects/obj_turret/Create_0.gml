  /// @description Insert description here
// You can write your code in this editor
shooting = 0;
invin = 0;
maxhp = 90;
hp = 90;
if(global.gameMode == "Rumble") {
	maxhp = 50;
	hp = 50;
}
alarm[1] = 10;
alarm[0] = 10;
layer = layer_create(-1000);
inv = 0;
bigRange = 200;
pushForce = 5;
firing = false;
beamLength = 0;
target = noone;