/// @description Get the client to connect
if(global.options == false) {
global.testMode = true;
obj_client.socket = network_create_socket(network_socket_ws)
global.names[1] = global.name;


	        global.ammo = 0;
			global.playBall = false;
	        global.ready = 0;
	        obj_client.ready = false;
			global.mons = 21;
			i = 0;
			repeat(10) {
				global.players[i] = self;
				i++;
			}
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
			global.gameMode = "Norms"//buffer_read(buffer,buffer_string)
			ins = instance_create_depth(0,0,-1000,ball_game);
			instance_create(0,0,obj_tutorial)
			
			room_goto(baby_room);
			
	        ins.alarm[3] = 1;
	        ins.loop = 1
	        obj_client.index = 1
	        random_set_seed(1)
	        global.ammodrop = 50/30//(buffer_read(buffer,buffer_u8)/30);
	        //global.ultdrop = buffer_read(buffer,buffer_u8)
			global.abilityNum = 1//buffer_read(buffer,buffer_u8)/100;
			global.leveled = 5//round(global.ultdrop/10)
			global.cSwitch = true//buffer_read(buffer,buffer_bool);
	        global.teaming = true//buffer_read(buffer,buffer_bool);
}