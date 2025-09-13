// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function node_send(){
	if(global.spectator == false) {
		var data = ds_map_create();
		buffer = argument[0]
		i = 1
		while(i < argument_count) {
			data[? argument[i]] = argument[i+1]
			i += 2
		}
		if(data[? "eventName"] == "Player Create" || data[? "eventName"] == "Ready") {
			show_debug_message(json_encode(data))
		}
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_text,json_encode(data))
		
		
		
		if(global.testMode) { //single player send buffer right back to yourself
			scr_ball_receive(data)
		}
		else {
			network_send_packetudp(obj_client.socket,buffer,buffer_tell(buffer))
		}
	}
}