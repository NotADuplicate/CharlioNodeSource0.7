function scr_forward_position(targetX, targetY){
    var path = path_add();
    var success = mp_grid_path(global.AiPathGrid, path, obj_bigBall.x, obj_bigBall.y, targetX, targetY, true);

    if (!success) {
        path_delete(path);
        return {x: ball_player.x, y: ball_player.y }; // no path found
    }

    // get first point along ball's path (the direction ball should move)
	var num = path_get_number(path)
    var nx = path_get_point_x(path, min(25, num-1));
    var ny = path_get_point_y(path, min(25, num-1));
	
	//TODO make forward not stand in tower
	if(point_distance(nx,ny,tower.x,tower.y) < 250) {
		if(point_distance(x,y,enemy.x,enemy.y) > 500) {
			state = "Backing";
			nx = x;
			ny = y;
		} else{
			nx = x + random_range(-150,150);
			ny = y + random_range(-150,150);
		}
	}

    path_delete(path);

    return { x: nx, y: ny };
}