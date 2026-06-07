/// @description Insert description here
// You can write your code in this editor
active = true;
if(global.teamNum[num] == global.teamNum[ball_player.num]) {
	lt = instance_create(x,y,obj_light_follower)
	lt.ins = self;
}