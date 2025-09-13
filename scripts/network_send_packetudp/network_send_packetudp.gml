// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function network_send_packetudp(socket,bufferid,size){
	//show_debug_message("SENDING");
	buffer_seek(bufferid,buffer_seek_start,0)
	str = json_decode(buffer_read(bufferid,buffer_string))
	if(str == -1) {
		buffer_seek(bufferid,buffer_seek_start,0)
		show_debug_message(buffer_read(bufferid,buffer_u8))
		penis = pospfkk;
	}
	//network_send_raw(socket,bufferid,size,network_send_text)
	network_send_udp_raw(socket,global.serverip,4000,bufferid,size)
}