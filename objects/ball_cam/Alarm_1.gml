if(global.spectator) {
	lt = instance_create(x,y,obj_light_follower)
	lt.ins = self;
}