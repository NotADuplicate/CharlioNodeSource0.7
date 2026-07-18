/// @function scr_flee_path(enemy)
/// @description
/// Returns [x, y] for a local waypoint that moves away from enemy while
/// avoiding ball_wall objects. The function remembers which side of a wall
/// the instance is following, preventing left/right jitter.
///
/// Call this from the fleeing AI instance.
///
/// @param enemy Instance to flee from.
///
/// @returns {Array<Real>} [target_x, target_y]
function scr_flee_path(enemy)
{
    // ---------------------------------------------------------
    // Settings
    // ---------------------------------------------------------
	show_debug_message("Fleeing")

    var _direct_flee_distance = 240;
    var _waypoint_distances   = [160, 128, 96, 64, 40];

    // Radius used when checking whether the AI fits beside a wall.
    var _collision_radius = 14;

    // Angles tested on either side of the ideal flee direction.
    var _angle_step = 15;
    var _maximum_angle = 90;

    // Distance at which a saved waypoint is considered reached.
    var _waypoint_reached_distance = 14;

    /*
        Number of failed recalculations before changing which side of
        the wall the AI follows.

        Since this function runs three times per second, 2 means the
        AI waits roughly 2/3 of a second before switching sides.
    */
    var _side_switch_failures = 2;


    // ---------------------------------------------------------
    // Validate enemy
    // ---------------------------------------------------------

    if (!instance_exists(enemy))
    {
        return [x, y];
    }


    // ---------------------------------------------------------
    // Initialize persistent state on this AI instance
    // ---------------------------------------------------------

    if (!variable_instance_exists(id, "__flee_side"))
    {
        /*
            0  = no side selected
            1  = clockwise side
            -1 = counterclockwise side
        */
        __flee_side = 0;

        __flee_target_x = x;
        __flee_target_y = y;
        __flee_target_valid = false;

        __flee_side_failures = 0;
        __flee_last_direction = 0;
    }


    // ---------------------------------------------------------
    // Local route-clear function
    //
    // Checks the center of the route plus two parallel lines,
    // approximating the width of the fleeing AI.
    // ---------------------------------------------------------

    var _route_clear = function(
        _from_x,
        _from_y,
        _to_x,
        _to_y,
        _radius
    )
    {
        if (
            collision_circle(
                _to_x,
                _to_y,
                _radius,
                ball_wall,
                false,
                true
            ) != noone
        )
        {
            return false;
        }

        var _route_direction = point_direction(
            _from_x,
            _from_y,
            _to_x,
            _to_y
        );

        var _side_x = lengthdir_x(
            _radius,
            _route_direction + 90
        );

        var _side_y = lengthdir_y(
            _radius,
            _route_direction + 90
        );

        // Center line.
        if (
            collision_line(
                _from_x,
                _from_y,
                _to_x,
                _to_y,
                ball_wall,
                false,
                true
            ) != noone
        )
        {
            return false;
        }

        // One edge of the AI.
        if (
            collision_line(
                _from_x + _side_x,
                _from_y + _side_y,
                _to_x + _side_x,
                _to_y + _side_y,
                ball_wall,
                false,
                true
            ) != noone
        )
        {
            return false;
        }

        // Other edge of the AI.
        if (
            collision_line(
                _from_x - _side_x,
                _from_y - _side_y,
                _to_x - _side_x,
                _to_y - _side_y,
                ball_wall,
                false,
                true
            ) != noone
        )
        {
            return false;
        }

        return true;
    };


    // ---------------------------------------------------------
    // Determine the ideal direction directly away from the enemy
    // ---------------------------------------------------------

    var _enemy_distance = point_distance(
        x,
        y,
        enemy.x,
        enemy.y
    );

    var _away_direction;

    if (_enemy_distance > 0.5)
    {
        _away_direction = point_direction(
            enemy.x,
            enemy.y,
            x,
            y
        );

        __flee_last_direction = _away_direction;
    }
    else
    {
        /*
            If both instances are centered on the same position,
            there is no mathematically defined away direction.
        */
        _away_direction = __flee_last_direction;
    }


    // ---------------------------------------------------------
    // First try walking directly away
    // ---------------------------------------------------------

    var _direct_x =
        x + lengthdir_x(
            _direct_flee_distance,
            _away_direction
        );

    var _direct_y =
        y + lengthdir_y(
            _direct_flee_distance,
            _away_direction
        );

    _direct_x = clamp(
        _direct_x,
        _collision_radius,
        room_width - _collision_radius
    );

    _direct_y = clamp(
        _direct_y,
        _collision_radius,
        room_height - _collision_radius
    );

    var _direct_move_x = _direct_x - x;
    var _direct_move_y = _direct_y - y;

    var _away_vector_x = x - enemy.x;
    var _away_vector_y = y - enemy.y;

    /*
        A nonnegative dot product means the movement is sideways
        relative to the enemy or moving away from them.

        A negative value means it initially moves toward the enemy.
    */
    var _direct_outward_dot =
        _away_vector_x * _direct_move_x
        +
        _away_vector_y * _direct_move_y;

    var _direct_distance_from_enemy = point_distance(
        _direct_x,
        _direct_y,
        enemy.x,
        enemy.y
    );

    var _direct_is_outward =
        _direct_outward_dot >= 0
        &&
        _direct_distance_from_enemy > _enemy_distance;

    if (
        _direct_is_outward
        &&
        _route_clear(
            x,
            y,
            _direct_x,
            _direct_y,
            _collision_radius
        )
    )
    {
        /*
            Once the direct route is available, stop following the
            previous wall and resume moving directly away.
        */
        __flee_side = 0;
        __flee_side_failures = 0;
        __flee_target_valid = false;

        return [_direct_x, _direct_y];
    }


    // ---------------------------------------------------------
    // Continue toward the current committed waypoint when valid
    // ---------------------------------------------------------

    if (__flee_target_valid)
    {
        var _saved_distance = point_distance(
            x,
            y,
            __flee_target_x,
            __flee_target_y
        );

        if (_saved_distance > _waypoint_reached_distance)
        {
            var _saved_move_x = __flee_target_x - x;
            var _saved_move_y = __flee_target_y - y;

            var _saved_outward_dot =
                _away_vector_x * _saved_move_x
                +
                _away_vector_y * _saved_move_y;

            var _saved_enemy_distance = point_distance(
                __flee_target_x,
                __flee_target_y,
                enemy.x,
                enemy.y
            );

            var _saved_target_is_outward =
                _saved_outward_dot >= 0
                &&
                _saved_enemy_distance >= _enemy_distance;

            if (
                _saved_target_is_outward
                &&
                _route_clear(
                    x,
                    y,
                    __flee_target_x,
                    __flee_target_y,
                    _collision_radius
                )
            )
            {
                return [
                    __flee_target_x,
                    __flee_target_y
                ];
            }
        }

        // Reached or invalidated.
        __flee_target_valid = false;
    }


    // ---------------------------------------------------------
    // Search for local waypoints around the wall
    // ---------------------------------------------------------

    /*
        Index 0 represents side -1.
        Index 1 represents side +1.
    */
    var _best_valid = [false, false];
    var _best_x = [x, x];
    var _best_y = [y, y];
    var _best_score = [-1000000000, -1000000000];

    for (var _side_index = 0; _side_index < 2; _side_index++)
    {
        var _side = (_side_index == 0) ? -1 : 1;

        for (
            var _angle_offset = _angle_step;
            _angle_offset <= _maximum_angle;
            _angle_offset += _angle_step
        )
        {
            var _candidate_direction =
                _away_direction
                +
                _angle_offset * _side;

            for (
                var _distance_index = 0;
                _distance_index < array_length(_waypoint_distances);
                _distance_index++
            )
            {
                var _candidate_distance =
                    _waypoint_distances[_distance_index];

                var _candidate_x =
                    x + lengthdir_x(
                        _candidate_distance,
                        _candidate_direction
                    );

                var _candidate_y =
                    y + lengthdir_y(
                        _candidate_distance,
                        _candidate_direction
                    );

                _candidate_x = clamp(
                    _candidate_x,
                    _collision_radius,
                    room_width - _collision_radius
                );

                _candidate_y = clamp(
                    _candidate_y,
                    _collision_radius,
                    room_height - _collision_radius
                );

                var _move_x = _candidate_x - x;
                var _move_y = _candidate_y - y;

                /*
                    This check guarantees that the straight segment to
                    the candidate does not initially move toward enemy.
                */
                var _outward_dot =
                    _away_vector_x * _move_x
                    +
                    _away_vector_y * _move_y;

                if (_outward_dot < 0)
                {
                    continue;
                }

                var _candidate_enemy_distance = point_distance(
                    _candidate_x,
                    _candidate_y,
                    enemy.x,
                    enemy.y
                );

                var _distance_gain =
                    _candidate_enemy_distance
                    -
                    _enemy_distance;

                if (_distance_gain < 0)
                {
                    continue;
                }

                if (
                    !_route_clear(
                        x,
                        y,
                        _candidate_x,
                        _candidate_y,
                        _collision_radius
                    )
                )
                {
                    continue;
                }

                /*
                    Prefer:
                    - More distance gained from enemy.
                    - Longer useful movement.
                    - Smaller deviation from directly away.
                */
                var _score =
                    _distance_gain * 4
                    +
                    _candidate_distance
                    -
                    _angle_offset * 2;

                if (_score > _best_score[_side_index])
                {
                    _best_valid[_side_index] = true;
                    _best_score[_side_index] = _score;
                    _best_x[_side_index] = _candidate_x;
                    _best_y[_side_index] = _candidate_y;
                }
            }
        }
    }


    // ---------------------------------------------------------
    // Select or maintain a wall-following side
    // ---------------------------------------------------------

    var _selected_index = -1;

    if (__flee_side == 0)
    {
        // No side committed yet, so select the better valid side.
        if (_best_valid[0] && _best_valid[1])
        {
            _selected_index =
                (_best_score[0] >= _best_score[1])
                ? 0
                : 1;
        }
        else if (_best_valid[0])
        {
            _selected_index = 0;
        }
        else if (_best_valid[1])
        {
            _selected_index = 1;
        }

        if (_selected_index != -1)
        {
            __flee_side =
                (_selected_index == 0)
                ? -1
                : 1;

            __flee_side_failures = 0;
        }
    }
    else
    {
        var _preferred_index =
            (__flee_side == -1)
            ? 0
            : 1;

        var _opposite_index =
            1 - _preferred_index;

        if (_best_valid[_preferred_index])
        {
            // Continue following the already selected side.
            _selected_index = _preferred_index;
            __flee_side_failures = 0;
        }
        else
        {
            /*
                Do not immediately switch sides. Waiting through a
                couple of failed updates prevents oscillation.
            */
            __flee_side_failures++;

            if (
                __flee_side_failures >= _side_switch_failures
                &&
                _best_valid[_opposite_index]
            )
            {
                _selected_index = _opposite_index;

                __flee_side =
                    (_opposite_index == 0)
                    ? -1
                    : 1;

                __flee_side_failures = 0;
            }
        }
    }


    // ---------------------------------------------------------
    // Return selected waypoint
    // ---------------------------------------------------------

    if (_selected_index != -1)
    {
        __flee_target_x = _best_x[_selected_index];
        __flee_target_y = _best_y[_selected_index];
        __flee_target_valid = true;

        return [
            __flee_target_x,
            __flee_target_y
        ];
    }


    /*
        There is currently no direction that:
        - avoids the wall,
        - fits the AI,
        - and does not move toward enemy.

        Remaining still is safer than violating the flee constraint.
    */
    return [x, y];
}