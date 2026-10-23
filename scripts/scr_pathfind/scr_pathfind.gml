// Ordinary movement retains the original grid planner and nearby-goal retries.
// Ball approach/contact uses its own planner; do not apply its stricter wall
// sweeps or direct-path shortcuts to travel and combat.
function scr_pathfind(_goal_x, _goal_y, _move_speed, _avoid_towers = false) {
    var _grid = global.bb;
    var _route = path_add();
    var _changed = [];
    if (_avoid_towers) _changed = scr_ai_block_tower_cells(_grid);
    var _cell_x = floor(x / 32);
    var _cell_y = floor(y / 32);
    var _occupied = mp_grid_get_cell(_grid, _cell_x, _cell_y) != 0;
    mp_grid_clear_cell(_grid, _cell_x, _cell_y);

    var _offsets = [[0, 0], [-30, 0], [0, 30], [0, -30], [30, 0]];
    var _success = false;
    for (var _i = 0; _i < array_length(_offsets); _i++) {
        // A failed attempt may leave points from a previous candidate.
        path_clear_points(_route);
        if (mp_grid_path(_grid, _route, x, y,
            _goal_x + _offsets[_i][0], _goal_y + _offsets[_i][1], true)) {
            if (!_avoid_towers || scr_ai_tower_route(_route, 0)) {
                _success = true;
                break;
            }
        }
    }

    if (_occupied) mp_grid_add_cell(_grid, _cell_x, _cell_y);
    // Restore only cells added for tower avoidance, including the start cell
    // if it was originally empty. Never leave this per-bot mask in global.bb.
    for (var _j = 0; _j < array_length(_changed); _j++) {
        mp_grid_clear_cell(_grid, _changed[_j].x, _changed[_j].y);
    }

    if (!_success) {
        path_delete(_route);
        // A transient bad target must not cancel a route already in progress.
        // Still stop a route inherited from Push if it would enter a tower.
        if (_avoid_towers && path_index != -1
        && !scr_ai_tower_route(path_index, path_position)) path_end();
        if (variable_instance_exists(id, "navigationPath") && path_exists(navigationPath)) return navigationPath;
        return -1;
    }

    path_end();
    if (variable_instance_exists(id, "navigationPath") && path_exists(navigationPath)) path_delete(navigationPath);
    navigationPath = _route;
    path_start(_route, _move_speed, path_action_stop, true);
    return _route;
}
