if(global.connected) {
	instance_destroy();
	if(!instance_exists(obj_disconnect)) {
		instance_create(533,667,obj_disconnect);
	}
}