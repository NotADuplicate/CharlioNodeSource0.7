/// @description Tick timer by a second
timer--;
if(timer == 0) {
    instance_destroy();
    if(instance_exists(obj_player)) {
        if(obj_player.num != num)
            instance_destroy(obj_player);
    }
}
else
    alarm[0] = 30;

