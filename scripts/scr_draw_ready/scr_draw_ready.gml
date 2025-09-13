// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_ready(){
	with(draw_game) {
		i = 0;
		while(i < 3) {
	            buffer_seek(buffer, buffer_seek_start, 0);
	            buffer_write(buffer, buffer_u8, 7); //bullet
			    buffer_write(buffer, buffer_u8, obj_client.index);
				buffer_write(buffer, buffer_u8, i);
	            buffer_write(buffer, buffer_string, global.actions[i]);
				buffer_write(buffer,buffer_u8,global.actionTarget[i])
	            network_send_packet(socket, buffer, buffer_tell(buffer));
				global.userActions[obj_client.index,i] = global.actions[i];
				global.userActionTarget[obj_client.index,i] = global.actionTarget[i];
				i++;
		}
		draw_player.ready = false;
		draw_player.aiming = false;
		draw_player.rushing = 0;
		ready = false
		global.revealed = -1;
		global.turnDamage = 2;
		global.drawTurn = true;
		with(draw_other) {
			ready = false;
			rushing = 0;
			aiming = false;
		}
	}
}