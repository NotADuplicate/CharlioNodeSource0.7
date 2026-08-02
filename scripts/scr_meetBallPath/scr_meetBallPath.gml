// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_meetBallPath(targetX, targetY, travelCaution){
    var path = path_add();
    var success = mp_grid_path(global.AiPathGrid, path, obj_bigBall.x, obj_bigBall.y, targetX, targetY, true);

    if (!success) {
		show_debug_message("Pathing failed")
        path_delete(path);
        return {x: targetX, y: targetY }; // no path found
    }

    // get first point along ball's path (the direction ball should move)
	var num = path_get_number(path)
	/*show_debug_message("Num:")
	show_debug_message(num)
	show_debug_message("ballx")
	show_debug_message(obj_bigBall.x)
	var i = 0 ;
	repeat(num) {
		show_debug_message(path_get_point_x(path,i))
		i++;
	}*/
    var nx = path_get_point_x(path, min(travelCaution, num-1));
    var ny = path_get_point_y(path, min(travelCaution, num-1));

    path_delete(path);
	//show_debug_message(nx)
	//show_debug_message(ny)

    return { x: nx, y: ny };
}