/// @Disconnect if not heard from server
if(!global.testMode && !global.received) {
	obj_client.alarm[9] = 1;
	instance_destroy();
	instance_create(0,0,obj_dcModal);
	room_goto(room1);
}
global.received = false;
alarm[6] = 90;