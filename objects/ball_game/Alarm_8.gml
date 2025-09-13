/// @description Spawn creep
if(creepSpawn > 0) {
	alarm[8] = 90;
	crp = instance_create(0,0,obj_creep);
	crp.side = global.garrenMinions;
}