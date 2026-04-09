/// @description Do blast off
show_debug_message("Blasted off")
show_debug_message(blastOffDir)
var bo = instance_create(x,y,obj_rocketBlast);
bo.direction = blastOffDir;
bo.image_angle = blastOffDir
bo.num = num;
path_end();
motion_add(blastOffDir+180, 30);