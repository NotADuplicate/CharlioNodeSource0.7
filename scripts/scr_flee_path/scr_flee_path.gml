/// @function scr_flee_path(enemy)
/// @description
/// Finds a safe local position to flee toward.
///
/// - Prefers moving directly away from enemy.
/// - Slides along walls when directly-away movement is blocked.
/// - Never intentionally moves toward enemy.
/// - Remembers its previous flee direction to reduce jitter.
/// - Returns EXACTLY [x, y] if no valid escape direction exists.
///
/// @param enemy Instance to flee from
/// @returns [target_x, target_y]
function scr_flee_path(enemy)
{
    if (!instance_exists(enemy)) {
        return [x, y];
    }


    // ---------------------------------------------------------
    // SETTINGS
    // ---------------------------------------------------------

    // Distances tested along each possible escape direction.
    // Long distances first so the AI prefers open corridors.
    var _test_distances = [
        160,
        128,
        96,
        64,
        40,
        24
    ];

    // How wide the AI should be treated for wall checking.
    //var 14 = 14;

    /*
        Directions checked:

             away
               |
          15   |   15
        30     |     30
       ...     |     ...
       90      |      90

        We never go beyond 90 degrees because that would mean
        initially moving toward the enemy.
    */
    var _angle_step = 15;
    var _maximum_angle = 90;

    /*
        Allow this many pixels of numerical/slight distance loss.

        This does NOT permit genuinely running toward the enemy.
        It just prevents tiny floating point / geometry differences
        from rejecting a basically sideways route.
    */
    var _distance_tolerance = 2;

    /*
        Minimum useful movement.

        If there isn't even this much safe movement in any legal
        direction, consider the AI trapped.
    */
    var _minimum_escape_distance = 12;

    /*
        Preference for continuing approximately the same direction
        as the previous flee calculation.

        Higher = less left/right jitter.
    */
    var _continuity_bonus = 35;


    // ---------------------------------------------------------
    // PERSISTENT STATE
    // ---------------------------------------------------------

    if (!variable_instance_exists(id, "__flee_direction")) {
        __flee_direction = 0;
        __flee_direction_valid = false;
    }


    // ---------------------------------------------------------
    // HELPER: CHECK WHETHER WE CAN MOVE STRAIGHT TO A POINT
    // ---------------------------------------------------------

    var _route_clear = function(
        _from_x,
        _from_y,
        _to_x,
        _to_y
    )
    {
        // ---------------------------------------------
        // Do NOT clamp targets to the room.
        //
        // If it goes outside the room, that direction
        // is invalid. We'll choose a different direction.
        // ---------------------------------------------

        if (
            _to_x < 14
            || _to_x > room_width - 14
            || _to_y < 14
            || _to_y > room_height - 14
        ) {
            return false;
        }


        // Destination itself must have enough room for the AI.
        if (
            collision_circle(
                _to_x,
                _to_y,
                14,
                ball_wall,
                false,
                true
            ) != noone
        ) {
            return false;
        }


        var _direction = point_direction(
            _from_x,
            _from_y,
            _to_x,
            _to_y
        );


        /*
            Use slightly less than the full collision radius for
            the swept-path side checks.

            Using the full radius can falsely reject movement
            parallel to a wall when the AI is already sitting
            immediately beside it.
        */
        var _side_distance =
            14 * 0.65;

        var _side_x = lengthdir_x(
            _side_distance,
            _direction + 90
        );

        var _side_y = lengthdir_y(
            _side_distance,
            _direction + 90
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
        ) {
            return false;
        }


        // Left side of AI.
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
        ) {
            return false;
        }


        // Right side of AI.
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
        ) {
            return false;
        }


        return true;
    };


    // ---------------------------------------------------------
    // DIRECTION DIRECTLY AWAY FROM ENEMY
    // ---------------------------------------------------------

    var _enemy_distance = point_distance(
        x,
        y,
        enemy.x,
        enemy.y
    );

    var _away_direction;

    if (_enemy_distance > 0.01) {
        _away_direction = point_direction(
            enemy.x,
            enemy.y,
            x,
            y
        );
    }
    else {
        /*
            Extremely unlikely, but if centered exactly on enemy,
            use our previous escape direction if we have one.
        */
        if (__flee_direction_valid) {
            _away_direction = __flee_direction;
        }
        else {
            _away_direction = 0;
        }
    }


    // Vector pointing away from the enemy.
    var _away_x = x - enemy.x;
    var _away_y = y - enemy.y;


    // ---------------------------------------------------------
    // SEARCH POSSIBLE ESCAPE DIRECTIONS
    // ---------------------------------------------------------

    var _best_found = false;

    var _best_x = x;
    var _best_y = y;

    var _best_direction = _away_direction;
    var _best_score = -infinity;


    /*
        Search in this order:

            0
            +15, -15
            +30, -30
            ...
            +90, -90

        But we still score every valid direction rather than just
        taking the first one.
    */
    for (
        var _angle_offset = 0;
        _angle_offset <= _maximum_angle;
        _angle_offset += _angle_step
    ) {
        var _side_count =
            (_angle_offset == 0) ? 1 : 2;

        for (
            var _side_index = 0;
            _side_index < _side_count;
            _side_index++
        ) {
            var _side;

            if (_angle_offset == 0) {
                _side = 0;
            }
            else {
                _side =
                    (_side_index == 0)
                    ? 1
                    : -1;
            }


            var _direction =
                _away_direction
                + _angle_offset * _side;


            /*
                Find the longest clear movement available in this
                direction.
            */
            var _direction_found = false;

            var _candidate_x = x;
            var _candidate_y = y;

            var _candidate_distance = 0;


            for (
                var _distance_index = 0;
                _distance_index
                    < array_length(_test_distances);
                _distance_index++
            ) {
                var _distance =
                    _test_distances[_distance_index];

                var _test_x =
                    x + lengthdir_x(
                        _distance,
                        _direction
                    );

                var _test_y =
                    y + lengthdir_y(
                        _distance,
                        _direction
                    );


                if (
                    !_route_clear(
                        x,
                        y,
                        _test_x,
                        _test_y
                    )
                ) {
                    continue;
                }


                // ---------------------------------------------
                // Make sure movement isn't toward enemy.
                // ---------------------------------------------

                var _move_x = _test_x - x;
                var _move_y = _test_y - y;

                /*
                    Positive = moving away.
                    Zero     = moving exactly sideways.
                    Negative = moving toward enemy.
                */
                var _outward_dot =
                    _away_x * _move_x
                    +
                    _away_y * _move_y;

                if (_outward_dot < 0) {
                    continue;
                }


                var _new_enemy_distance =
                    point_distance(
                        _test_x,
                        _test_y,
                        enemy.x,
                        enemy.y
                    );

                /*
                    This is mostly redundant with the dot product,
                    but protects against odd edge cases.
                */
                if (
                    _new_enemy_distance
                    < _enemy_distance
                    - _distance_tolerance
                ) {
                    continue;
                }


                /*
                    Distances are ordered largest -> smallest.

                    Therefore the first valid one is the longest
                    safe movement in this direction.
                */
                _candidate_x = _test_x;
                _candidate_y = _test_y;
                _candidate_distance = _distance;

                _direction_found = true;

                break;
            }


            if (!_direction_found) {
                continue;
            }


            if (
                _candidate_distance
                < _minimum_escape_distance
            ) {
                continue;
            }


            // -------------------------------------------------
            // SCORE THIS ESCAPE DIRECTION
            // -------------------------------------------------

            var _candidate_enemy_distance =
                point_distance(
                    _candidate_x,
                    _candidate_y,
                    enemy.x,
                    enemy.y
                );

            var _distance_gain =
                _candidate_enemy_distance
                - _enemy_distance;


            /*
                Main priorities:

                1. Actually gain distance from enemy.
                2. Have lots of open space.
                3. Stay relatively close to directly-away.
                4. Continue previous direction when reasonable.
            */
            var _score =
                _distance_gain * 4
                + _candidate_distance
                - _angle_offset * 0.75;


            // ---------------------------------------------
            // Continuity / anti-jitter bonus
            // ---------------------------------------------

            if (__flee_direction_valid) {
                var _direction_difference = abs(
                    angle_difference(
                        _direction,
                        __flee_direction
                    )
                );

                /*
                    Full bonus when same direction.
                    Gradually disappears by 90 degrees difference.
                */
                if (_direction_difference < 90) {
                    _score +=
                        _continuity_bonus
                        * (
                            1
                            - _direction_difference / 90
                        );
                }
            }


            if (
                !_best_found
                || _score > _best_score
            ) {
                _best_found = true;

                _best_score = _score;

                _best_x = _candidate_x;
                _best_y = _candidate_y;

                _best_direction = _direction;
            }
        }
    }


    // ---------------------------------------------------------
    // VALID ESCAPE FOUND
    // ---------------------------------------------------------

    if (_best_found) {
        __flee_direction = _best_direction;
        __flee_direction_valid = true;

        return [
            _best_x,
            _best_y
        ];
    }


    // ---------------------------------------------------------
    // TRAPPED
    // ---------------------------------------------------------

    /*
        No meaningful direction exists that:

        - stays inside the room
        - avoids ball_wall
        - has physical clearance for the AI
        - does not move toward the enemy

        So consider this a genuine failed flee attempt.

        IMPORTANT:
        These are the exact current coordinates, allowing the caller
        to detect the condition.
    */

    __flee_direction_valid = false;

    return [x, y];
}