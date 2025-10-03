/// @description Make light for cam
if(num == ball_player.num) {
	lt = instance_create(x,y,obj_light_follower)
	lt.ins = self;
}