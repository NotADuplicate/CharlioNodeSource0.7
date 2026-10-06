global.game = 0;
if(instance_exists(inst_game))
	instance_destroy(inst_game)
with(solo_server) { instance_destroy(); }
with(obj_tutorial) { instance_destroy(); }
room_goto(room1);