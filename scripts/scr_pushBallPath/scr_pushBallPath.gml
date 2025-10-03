// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pushBallPath(targetX, targetY, push_distance){
    var path = path_add();
    var success = mp_grid_path(global.AiPathGrid, path, obj_bigBall.x, obj_bigBall.y, targetX, targetY, true);

    if (!success) {
        path_delete(path);
        return undefined; // no path found
    }

    // get first point along ball's path (the direction ball should move)
    var nx = path_get_point_x(path, 3);
    var ny = path_get_point_y(path, 3);

    var dx = nx - obj_bigBall.x;
    var dy = ny - obj_bigBall.y;
    var len = point_distance(0, 0, dx, dy);
    if (len == 0) len = 1; // avoid div by 0

    dx /= len;
    dy /= len;

    var pushx = obj_bigBall.x - dx * push_distance;
    var pushy = obj_bigBall.y - dy * push_distance;

    path_delete(path);

    return { x: pushx, y: pushy };
}