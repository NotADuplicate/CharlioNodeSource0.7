function scr_pushBallPath(targetX, targetY, push_distance) {
    var _ball = instance_find(obj_bigBall, 0);
    var _path = path_add();
    var _success = mp_grid_path(global.AiPathGrid, _path, _ball.x, _ball.y, targetX, targetY, true);
    var _dx = 0;
    var _dy = 0;
    if (_success) {
        // A route may have just two points. Never skip its first corner.
        for (var _i = 0; _i < path_get_number(_path); _i++) {
            _dx = path_get_point_x(_path, _i) - _ball.x;
            _dy = path_get_point_y(_path, _i) - _ball.y;
            if (point_distance(0, 0, _dx, _dy) > 4) break;
        }
    }
    path_delete(_path);
    if (!_success || point_distance(0, 0, _dx, _dy) <= 4) {
        // A tower may occupy the goal cell. Use a clear direct approach;
        // never use the human player's position as the fallback direction.
        if (collision_line(_ball.x, _ball.y, targetX, targetY, ball_wall, false, false) != noone)
            return {x: _ball.x, y: _ball.y};
        _dx = targetX - _ball.x;
        _dy = targetY - _ball.y;
    }
    var _length = max(1, point_distance(0, 0, _dx, _dy));
    return {x: _ball.x - _dx / _length * push_distance, y: _ball.y - _dy / _length * push_distance};
}
