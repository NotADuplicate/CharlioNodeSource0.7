/// @description Kill all others and player to reset game
    if(instance_exists(obj_player)) {
        with(obj_other) {
            instance_destroy();
        }
        with(obj_star) {
            instance_destroy();
        }
        instance_destroy(obj_player);
    }
    
    //Make new player and others
    //loop = buffer_read(buffer,buffer_u8);
    //index = buffer_read(buffer,buffer_u8);
    //random_set_seed(buffer_read(buffer,buffer_u8));
    obj_spawner.alarm[0] = 1;
    healuse = 1;
    obj_spawner.alarm[1] = round(irandom_range(400,1000)*global.ultdrop);
	var i = 1;
    repeat(loop) {
		if(global.teaming == 0 || global.teamNum[i] != 0) {
		if(i == obj_client.index) {
			ins = instance_create(0,0,obj_player);
			ins.num = i;
		}
		else {
			ins = instance_create(0,0,obj_other);
			ins.num = i;
		}
		}
		i++;
	}

