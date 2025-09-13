/// @description Check for clients and data
var type_event = async_load[? "type"];
//show_debug_message("Something")
switch(type_event) {
    case network_type_data: //receieve data
        //handle data
		var buffer_raw = async_load[? "buffer"]
		var buffer_processed = buffer_read(buffer_raw,buffer_text)
		

		var realData = json_decode(buffer_processed)
		scr_recieved_packet(realData)
		if(realData[? "eventName"] != "Player Update" && realData[? "eventName"] != "Ping")
		if(realData[? "eventName"] == "Player UI") {
			show_debug_message(buffer_processed)
		}
    break;
}

