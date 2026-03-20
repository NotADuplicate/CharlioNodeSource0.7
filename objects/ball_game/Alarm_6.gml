/// @Disconnect if not heard from server
if(!global.testMode && !global.received) {
	obj_client.alarm[9] = 1;
	instance_destroy();
	modal = instance_create(0,0,obj_modal);
	modal.txt = "Connection Lost."
	room_goto(room1);
}
global.received = false;
alarm[6] = 90;