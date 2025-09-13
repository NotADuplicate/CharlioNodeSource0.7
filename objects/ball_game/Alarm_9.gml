/// @description Start creep wave
if(global.waves > 0) {
	global.waves--;
	crp = instance_create(0,0,obj_creep);
	crp.side = global.garrenMinions;
	alarm[9] = 60;
}
/*if(global.waves > 0) {
	alarm[8] = 1;
	creepSpawn = 5;
	alarm[9] = 1200;
	global.waves--;
}