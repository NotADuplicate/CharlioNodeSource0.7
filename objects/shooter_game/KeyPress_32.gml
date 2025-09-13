/// @description Switch view
if(instance_exists(obj_player) && instance_exists(obj_other)) {

}
else {
    if(__view_get( e__VW.YView, 0 ) == 0) {
        __view_set( e__VW.YView, 0, 768 );
    }
    else
        __view_set( e__VW.YView, 0, 0 );
}

