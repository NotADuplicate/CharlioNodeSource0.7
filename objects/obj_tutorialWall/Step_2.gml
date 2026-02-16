///Check if should destroy in later stage of tutorial
if(instance_exists(obj_tutorial) && obj_tutorial.stage >= 9) {
	instance_destroy();
}