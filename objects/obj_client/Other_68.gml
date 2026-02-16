/// @description Check for clients and data
var type_event = async_load[? "type"];
switch(type_event) {
    case network_type_data: //receieve data
        //handle data
		var buffer_raw = async_load[? "buffer"]
		var buffer_processed = buffer_read(buffer_raw,buffer_text)
		

		var realData = json_decode(buffer_processed)
		global.received = true;
		scr_recieved_packet(realData)
    break;
}

