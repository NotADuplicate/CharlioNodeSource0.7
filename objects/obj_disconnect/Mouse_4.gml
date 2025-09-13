/// @description Get the client to connect
global.testMode = false;
with(obj_tutorial) {
	instance_destroy();
}
obj_client.alarm[9] = 1;
if(instance_exists(inst_game))
	instance_destroy(inst_game)
room_goto(room1);