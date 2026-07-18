function mp_grid_update_circle(_grid, _center_x, _center_y, _radius, _cell_size, _add_obstacle) {
	return;
    // 1. Get cell bounding box around the circle
    var _start_cell_x = floor((_center_x - _radius) / _cell_size);
    var _end_cell_x   = floor((_center_x + _radius) / _cell_size);
    var _start_cell_y = floor((_center_y - _radius) / _cell_size);
    var _end_cell_y   = floor((_center_y + _radius) / _cell_size);
    
    // 2. Loop through the grid cells in this bounding box
    for (var _cx = _start_cell_x; _cx <= _end_cell_x; _cx++) {
        for (var _cy = _start_cell_y; _cy <= _end_cell_y; _cy++) {
            
            // Get the center room coordinate of this specific cell
            var _room_x = (_cx * _cell_size) + (_cell_size / 2);
            var _room_y = (_cy * _cell_size) + (_cell_size / 2);
            
            // 3. Check if this cell center falls within the circle radius
            if (point_distance(_center_x, _center_y, _room_x, _room_y) <= _radius) {
                
                if (_add_obstacle) {
                    // Block the cell temporarily
                    mp_grid_add_cell(_grid, _cx, _cy);
                } else {
                    // 4. Safe Clear: Check if a permanent wall is inside this cell
                    // Replace 'obj_wall' with your actual parent wall object name
                    var _has_wall = collision_rectangle(_cx * _cell_size, _cy * _cell_size, (_cx + 1) * _cell_size - 1, (_cy + 1) * _cell_size - 1, obj_wall, false, true);
                    
                    if (!_has_wall) {
                        mp_grid_clear_cell(_grid, _cx, _cy);
                    }
                }
            }
        }
    }
}
