show_debug_message("SENDING PLAYER CREATE")
node_send(buffer,"eventName","Player Create","Num", index, "Name", global.name, "Team", global.teamside)