/// @description Turn one of the escape pods into an MTF dock
ins = instance_find(obj_pod,choose(0,1));
with(ins) {
	instance_change(MTF_dock,true);
}