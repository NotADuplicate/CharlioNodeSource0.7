// Own and replace approach paths instead of accumulating them on every update.
function scr_ball_approach_path(_tx, _ty, _avoid_ball, _direct_only = false) {
    if (_tx < 0 || _ty < 0 || _tx >= room_width || _ty >= room_height) return false;
    // A zero-length staging route reports success but leaves the bot idle.
    if (point_distance(x, y, _tx, _ty) < 2) return false;
    var _ball = instance_find(obj_bigBall, 0);
    var _clearance = _ball.radius + 24;
    var _route = path_add();
    var _changed = [];
    var _grid = global.bb;
    var _sx = floor(x / 32);
    var _sy = floor(y / 32);
    var _start_blocked = mp_grid_get_cell(_grid, _sx, _sy) != 0;

    // Retreats use this helper too, and must avoid hostile tower range.
    // Ordinary movement stays on scr_pathfind's original grid semantics.
    if (state != "Push" && state != "Thirst") {
        _changed = scr_ai_block_tower_cells(_grid);
    }

    // Save only cells we change: walls must survive temporary ball avoidance.
    if (_avoid_ball) {
        var _left = max(0, floor((_ball.x - _clearance - 32) / 32));
        var _right = min(floor(room_width / 32) - 1, floor((_ball.x + _clearance + 32) / 32));
        var _top = max(0, floor((_ball.y - _clearance - 32) / 32));
        var _bottom = min(floor(room_height / 32) - 1, floor((_ball.y + _clearance + 32) / 32));
        for (var _cx = _left; _cx <= _right; _cx++) {
            for (var _cy = _top; _cy <= _bottom; _cy++) {
                // Half a cell diagonal prevents grid diagonals cutting the ball.
                if (point_distance(_cx * 32 + 16, _cy * 32 + 16, _ball.x, _ball.y) < _clearance + 23
                && mp_grid_get_cell(_grid, _cx, _cy) == 0) {
                    array_push(_changed, {x: _cx, y: _cy});
                    mp_grid_add_cell(_grid, _cx, _cy);
                }
            }
        }
    }
    mp_grid_clear_cell(_grid, _sx, _sy);
    var _ok = false;
    // Do not snap body-push targets into neighbouring cells behind the ball.
    if (!place_meeting(_tx, _ty, ball_wall)
    && scr_ai_walk_segment(x, y, _tx, _ty)
    && scr_ai_tower_segment(x, y, _tx, _ty)
    && (!_avoid_ball || scr_ball_approach_segment(x, y, _tx, _ty, _clearance))) {
        path_add_point(_route, x, y, 100);
        path_add_point(_route, _tx, _ty, 100);
        _ok = true;
    } else if (!_direct_only && !place_meeting(_tx, _ty, ball_wall)) {
        _ok = mp_grid_path(_grid, _route, x, y, _tx, _ty, true);
    }
    for (var _i = 0; _i < array_length(_changed); _i++) {
        mp_grid_clear_cell(_grid, _changed[_i].x, _changed[_i].y);
    }
    if (_start_blocked) mp_grid_add_cell(_grid, _sx, _sy);

    // Validate the actual route, including its first segment out of the start cell.
    if (_ok) {
        var _px = x;
        var _py = y;
        for (var _j = 0; _j < path_get_number(_route); _j++) {
            var _nx = path_get_point_x(_route, _j);
            var _ny = path_get_point_y(_route, _j);
            if ((_avoid_ball && !scr_ball_approach_segment(_px, _py, _nx, _ny, _clearance))
            || !scr_ai_walk_segment(_px, _py, _nx, _ny)
            || !scr_ai_tower_segment(_px, _py, _nx, _ny)) {
                _ok = false;
                break;
            }
            _px = _nx;
            _py = _ny;
        }
    }
    if (!_ok) {
        path_delete(_route);
        return false;
    }
    path_end();
    if (ballApproachPath != -1 && path_exists(ballApproachPath)) path_delete(ballApproachPath);
    ballApproachPath = _route;
    targetX = _tx;
    targetY = _ty;
    var _speed = link.dashing > 0 ? 20 : 5;
    if (enraged) _speed *= 1.5;
    if (pushingBall > 0) _speed /= 2;
    if (frost > 0) _speed = 2;
    if (bleed == 0 && speed < 1) path_start(_route, _speed, path_action_stop, true);
    return true;
}

function scr_ball_approach_segment(_ax, _ay, _bx, _by, _clearance) {
    var _ball = instance_find(obj_bigBall, 0);
    var _dx = _bx - _ax;
    var _dy = _by - _ay;
    var _length2 = _dx * _dx + _dy * _dy;
    var _t = 0;
    if (_length2 > 0) _t = clamp(((_ball.x - _ax) * _dx + (_ball.y - _ay) * _dy) / _length2, 0, 1);
    var _nearest = point_distance(_ax + _dx * _t, _ay + _dy * _t, _ball.x, _ball.y);
    // An overlapping bot may move out, but never farther into the ball.
    return _nearest >= min(_clearance, point_distance(_ax, _ay, _ball.x, _ball.y)) - 0.1;
}

function scr_ball_approach() {
    var _ball = instance_find(obj_bigBall, 0);
    // Finish a short body-contact nudge before retrying precise positioning.
    if (ballDislodgeTime > 0
    && point_distance(_ball.x, _ball.y, ballDislodgeX, ballDislodgeY) < 12
    && scr_ball_corner_contact()) return;
    ballDislodgeTime = 0;
    var _dx = _ball.x - pushPos.x;
    var _dy = _ball.y - pushPos.y;
    var _length = point_distance(0, 0, _dx, _dy);
    if (_length < 1) {
        // A failed objective path must not disable the old corner fallback.
        if (scr_ball_corner_contact()) return;
        path_end();
        walkingAround = true;
        ballStageGoal = noone;
        return;
    }
    _dx /= _length;
    _dy /= _length;
    // Near the objective, prefer the tower itself over a short grid segment
    // which can point sideways along a cell boundary.
    var _tower = scr_ball_push_tower();
    if (instance_exists(_tower)) {
        var _tower_dist = max(1, point_distance(_ball.x, _ball.y, _tower.x, _tower.y));
        _dx = (_tower.x - _ball.x) / _tower_dist;
        _dy = (_tower.y - _ball.y) / _tower_dist;
    }
    if (is_struct(ballRecoveryGoal)) {
        if (point_distance(_ball.x, _ball.y, ballRecoveryGoal.ballX, ballRecoveryGoal.ballY) < 32
        && scr_ball_push_clear(ballRecoveryGoal.dx, ballRecoveryGoal.dy)) {
            _dx = ballRecoveryGoal.dx;
            _dy = ballRecoveryGoal.dy;
        } else ballRecoveryGoal = noone;
    }
    // Commit to a reachable staging point until reached. Re-selecting the
    // preferred point every update was reversing detours near corners.
    if (is_struct(ballStageGoal)) {
        var _goal = ballStageGoal;
        var _valid_goal = scr_ball_stage_goal_valid(_goal);
        if (_valid_goal
        && point_distance(x, y, _goal.x, _goal.y) > 8
        && scr_ball_approach_path(_goal.x, _goal.y, true)) {
            walkingAround = true;
            pushPos = {x: _ball.x - _goal.dx * 20, y: _ball.y - _goal.dy * 20};
            return;
        }
        if (_valid_goal) {
            _dx = _goal.dx;
            _dy = _goal.dy;
        } else {
            // Do not keep following an old, unbounded clearance destination.
            if (path_index == ballApproachPath) path_end();
            ballRecoveryGoal = noone;
        }
        ballStageGoal = noone;
    }
    pushPos = {x: _ball.x - _dx * 20, y: _ball.y - _dy * 20};
    var _distance = point_distance(x, y, _ball.x, _ball.y);
    var _alignment = ((_ball.x - x) * _dx + (_ball.y - y) * _dy) / max(1, _distance);
    gunDir = point_direction(x, y, _ball.x, _ball.y);

    // Use the same forward-facing cone as the staging waypoints. Requiring
    // exact rear alignment strands bots at the angled waypoints near walls.
    // Correct onto the intended push line as we enter contact. A radial
    // target preserves sideways error and can keep aiming into an adjacent
    // wall, alternating between backing out and approaching the ball.
    var _contact = max(4, _ball.radius * 0.5);
    var _contact_x = _ball.x - _dx * _contact;
    var _contact_y = _ball.y - _dy * _contact;
    if (_alignment > 0.7 && ballPushStallTime < 1
    && scr_ball_push_clear(_dx, _dy)
    && collision_line(x, y, _ball.x, _ball.y, ball_wall, false, false) == noone) {
        var _at_contact = point_distance(x, y, _contact_x, _contact_y) < 2;
        if (_at_contact || scr_ball_approach_path(_contact_x, _contact_y, false, true)) {
            // Contact itself still applies a body impulse in the collision
            // event. Do not back away just because this tiny path has ended.
            if (_at_contact) path_end();
            walkingAround = false;
            scr_ball_push_shoot(_dx, _dy);
            return;
        }
        // A wall on the far side of the ball must not make this branch idle
        // forever. Try another approach if the contact point is unreachable.
    }

    walkingAround = true;
    var _radius = _ball.radius + 72;
    var _rear = point_direction(0, 0, -_dx, -_dy);
    // Recalculate from the live ball; never wait for an obsolete waypoint.
    var _angles = [0, 15, -15, 30, -30, 45, -45, 60, -60, 90, -90, 120, -120, 150, -150, 180];
    for (var _i = 0; _i < array_length(_angles); _i++) {
        var _angle = _rear + _angles[_i];
        var _push_dx = -lengthdir_x(1, _angle);
        var _push_dy = -lengthdir_y(1, _angle);
        // A stance is only useful if it can actually push the ball somewhere.
        // On a stall, try a different direction instead of repeating the same
        // approach/back-away cycle against the wall.
        if (!scr_ball_push_clear(_push_dx, _push_dy)) continue;
        if (ballPushStallTime >= 1 && abs(_angles[_i]) < 30) continue;
        // Prefer a shorter straight approach over a large sideways detour
        // when the full staging radius overlaps a wall.
        var _radii = [_radius, _ball.radius + 48, _ball.radius + 32];
        for (var _r = 0; _r < array_length(_radii); _r++) {
            var _stage_x = _ball.x + lengthdir_x(_radii[_r], _angle);
            var _stage_y = _ball.y + lengthdir_y(_radii[_r], _angle);
            var _cx = _ball.x - _push_dx * _contact;
            var _cy = _ball.y - _push_dy * _contact;
            if (place_meeting(_cx, _cy, ball_wall) || !scr_ai_walk_segment(_stage_x, _stage_y, _cx, _cy)) continue;
            if (scr_ball_approach_path(_stage_x, _stage_y, true)) {
                ballStageGoal = {x: _stage_x, y: _stage_y, ballX: _ball.x, ballY: _ball.y, dx: _push_dx, dy: _push_dy};
                ballRecoveryGoal = {ballX: _ball.x, ballY: _ball.y, dx: _push_dx, dy: _push_dy};
                pushPos = {x: _ball.x - _push_dx * 20, y: _ball.y - _push_dy * 20};
                ballPushStallTime = 0;
                return;
            }
        }
    }
    // The committed version fell back to walking into pushPos when neither
    // side worked, and body collisions still pushed during repositioning.
    // Restore that direct-contact escape before any clearance-only movement.
    if (scr_ball_corner_contact()) return;

    // Only back out while still within contact clearance. Repeated targets
    // based on x/y made each failed attempt walk another 64px away, eventually
    // carrying the bot to a map edge while it stayed committed to Push.
    // Once clear, retry local push positions; do not extend the retreat.
    if (_distance >= _ball.radius + 32) {
        ballStageGoal = noone;
        path_end();
        return;
    }
    var _away = point_direction(_ball.x, _ball.y, x, y);
    var _escape_angles = [0, 45, -45, 90, -90];
    for (var _j = 0; _j < array_length(_escape_angles); _j++) {
        var _out = _away + _escape_angles[_j];
        var _out_x = _ball.x + lengthdir_x(_radius, _out);
        var _out_y = _ball.y + lengthdir_y(_radius, _out);
        if (scr_ball_approach_path(_out_x, _out_y, true)) {
            ballStageGoal = {x: _out_x, y: _out_y, ballX: _ball.x, ballY: _ball.y, dx: _dx, dy: _dy};
            return;
        }
    }
    path_end();
}

function scr_ball_corner_contact() {
    var _ball = instance_find(obj_bigBall, 0);
    if (state != "Push" || _ball.murderball > 0) return false;
    var _away = point_direction(_ball.x, _ball.y, x, y);
    var _contact = max(4, _ball.radius * 0.5);
    var _angles = [0, 30, -30, 60, -60, 90, -90, 135, -135, 180];
    for (var _i = 0; _i < array_length(_angles); _i++) {
        var _angle = _away + _angles[_i];
        var _cx = _ball.x + lengthdir_x(_contact, _angle);
        var _cy = _ball.y + lengthdir_y(_contact, _angle);
        // Validate the reachable contact point, not a ray to the centre:
        // a ball partly overlapping a corner can still expose a pushable face.
        if (place_meeting(_cx, _cy, ball_wall)) continue;
        var _at_contact = point_distance(x, y, _cx, _cy) < 2;
        if (_at_contact || scr_ball_approach_path(_cx, _cy, false, true)) {
            if (_at_contact) path_end();
            targetX = _cx;
            targetY = _cy;
            walkingAround = false;
            ballStageGoal = noone;
            ballRecoveryGoal = noone;
            // Use the nudge's direction for the collision guard; otherwise
            // a bot on the 'wrong' side still walks in but applies no impulse.
            pushPos = {x: _ball.x + lengthdir_x(20, _angle), y: _ball.y + lengthdir_y(20, _angle)};
            if (ballDislodgeTime <= 0) {
                ballDislodgeTime = 0.5;
                ballDislodgeX = _ball.x;
                ballDislodgeY = _ball.y;
            }
            // Intentionally no weapon call: normal tower-shot rules still
            // apply after the ball moves and normal positioning resumes.
            return true;
        }
    }
    return false;
}

// Contact is reported by the collision event, once per physics step. This is
// elapsed body-pushing time, not the number of navigation/alarm updates.
function scr_ball_push_tick() {
    var _ball = instance_find(obj_bigBall, 0);
    var _dt = min(0.1, delta_time / 1000000);
    if (state != "Push") {
        ballDislodgeTime = 0;
        ballBodyPushTime = 0;
        ballPushStallTime = 0;
        ballStageGoal = noone;
        ballRecoveryGoal = noone;
        ballApproachProgressX = x;
        ballApproachProgressY = y;
        ballApproachNoProgressTime = 0;
    } else {
        ballDislodgeTime = max(0, ballDislodgeTime - _dt);
        if (point_distance(_ball.x, _ball.y, ballDislodgeX, ballDislodgeY) >= 12) ballDislodgeTime = 0;
        if (point_distance(x, y, ballApproachProgressX, ballApproachProgressY) >= 4) {
            ballApproachProgressX = x;
            ballApproachProgressY = y;
            ballApproachNoProgressTime = 0;
        } else {
            ballApproachNoProgressTime += _dt;
        }
        if (ballBodyContact && !walkingAround) ballBodyPushTime += _dt;
        else ballBodyPushTime = 0;
        if (point_distance(_ball.x, _ball.y, ballProgressX, ballProgressY) >= 8) {
            ballProgressX = _ball.x;
            ballProgressY = _ball.y;
            ballPushStallTime = 0;
        } else if (ballBodyContact && !walkingAround) {
            ballPushStallTime += _dt;
        }
    }
    ballBodyContact = false;
}

function scr_ball_approach_committed() {
    // Going around a corner deliberately loses sight of the ball. Do not let
    // the state machine cancel that route and replace it with Travel Ball's
    // route to the centre of the ball on the next step.
    if (state != "Push" || ballApproachPath == -1 || path_index != ballApproachPath
    || !path_exists(ballApproachPath) || ballApproachNoProgressTime >= 2) return false;
    if (is_struct(ballStageGoal)) {
        return scr_ball_stage_goal_valid(ballStageGoal);
    }
    // A straight route into body contact may also start more than 300px away.
    return !walkingAround;
}

function scr_ball_stage_goal_valid(_goal) {
    if (!is_struct(_goal)) return false;
    var _ball = instance_find(obj_bigBall, 0);
    return _goal.x >= 0 && _goal.y >= 0 && _goal.x < room_width && _goal.y < room_height
        && point_distance(_goal.x, _goal.y, _goal.ballX, _goal.ballY) <= _ball.radius + 72 + 0.1
        && point_distance(_ball.x, _ball.y, _goal.ballX, _goal.ballY) < 24;
}

function scr_ai_skirmish_tower_blocked() {
    if (!instance_exists(enemy)) return false;
    var _distance = max(1, point_distance(x, y, enemy.x, enemy.y));
    var _combat_x = enemy.x + (x - enemy.x) / _distance * fightingDist;
    var _combat_y = enemy.y + (y - enemy.y) / _distance * fightingDist;
    for (var _i = 0; _i < instance_number(obj_turret); _i++) {
        var _tower = instance_find(obj_turret, _i);
        if (_tower.hp < 3 || global.teamNum[_tower.num] == global.teamNum[num]) continue;
        // An enemy being near a tower is not sufficient: if our preferred
        // fighting distance is reachable outside its range, keep fighting.
        if (point_distance(enemy.x, enemy.y, _tower.x, _tower.y) < _tower.bigRange + 24
        && point_distance(_combat_x, _combat_y, _tower.x, _tower.y) < _tower.bigRange + 24) return true;
    }
    return false;
}

function scr_ai_skirmish_tower_tick() {
    if (state != "Skirmish" || !instance_exists(enemy) || !scr_ai_skirmish_tower_blocked()) {
        skirmishTowerWaitTime = 0;
        skirmishTowerEnemy = noone;
        return false;
    }
    if (skirmishTowerEnemy != enemy) {
        skirmishTowerEnemy = enemy;
        skirmishTowerWaitTime = 0;
    }
    skirmishTowerWaitTime += max(0, delta_time / 1000000);
    if (skirmishTowerWaitTime + 0.000001 < 4) return false;
    var _pusher = noone;
    for (var _i = 0; _i < instance_number(obj_AI); _i++) {
        var _bot = instance_find(obj_AI, _i);
        if (_bot != self && _bot.team == team && _bot.state == "Push") {
            _pusher = _bot;
            break;
        }
    }
    state = _pusher == noone ? "Push" : "Forward";
    global.aiPushing[team] = true;
    // Give the new objective time to start, rather than immediately rolling
    // another random Skirmish transition while the enemy remains nearby.
    recentlySwithced = max(recentlySwithced, 80);
    skirmishTowerWaitTime = 0;
    skirmishTowerEnemy = noone;
    alarm[2] = 1;
    return true;
}

function scr_ball_push_tower() {
    var _ball = instance_find(obj_bigBall, 0);
    var _nearest = noone;
    var _best = 1000000;
    for (var _i = 0; _i < instance_number(obj_turret); _i++) {
        var _tower = instance_find(obj_turret, _i);
        var _distance = point_distance(_ball.x, _ball.y, _tower.x, _tower.y);
        if (_tower.hp >= 3 && global.teamNum[_tower.num] != global.teamNum[num]
        && _distance < _tower.bigRange + 64 && _distance < _best) {
            _nearest = _tower;
            _best = _distance;
        }
    }
    return _nearest;
}

function scr_ball_push_clear(_dx, _dy) {
    var _ball = instance_find(obj_bigBall, 0);
    // Resolve a small existing contact overlap consistently at the starting
    // position. Integer collision masks can otherwise reject even parallel
    // movement when the ball is already touching a wall.
    var _radius = max(1, _ball.radius - 2);
    for (var _shrink = 0; _shrink < 2; _shrink++) {
        if (collision_circle(_ball.x, _ball.y, _radius, ball_wall, false, false) == noone) break;
        _radius = max(1, _radius - 1);
    }
    if (collision_circle(_ball.x, _ball.y, _radius, ball_wall, false, false) != noone) return false;
    // Check the ball's width, not just a centre line that can clip a corner.
    for (var _distance = 16; _distance <= 48; _distance += 16) {
        if (collision_circle(_ball.x + _dx * _distance, _ball.y + _dy * _distance,
            _radius, ball_wall, false, false) != noone) return false;
    }
    return true;
}

function scr_ball_push_shoot(_dx, _dy) {
    var _ball = instance_find(obj_bigBall, 0);
    var _distance = point_distance(x, y, _ball.x, _ball.y);
    var _cost = (gunObj.name == "Pistol" || gunObj.name == "Melee") ? 1 : 2;
    if (gunObj.name == "Grenade Launcher" || reload > 0 || ammo < _cost
    || _distance < 1 || _distance > min(250, gunObj.maxRange)) return false;
    var _shot_x = (_ball.x - x) / _distance;
    var _shot_y = (_ball.y - y) / _distance;
    var _tower = scr_ball_push_tower();
    if (instance_exists(_tower)) {
        // Near towers, wait for actual sustained point-blank body contact.
        // The ray through the ball must pass through the tower, not sideways
        // merely because the body-push planner accepted a recovery angle.
        if (ballBodyPushTime + 0.000001 < 0.5 || _distance > _ball.radius + 24) return false;
        var _tx = _tower.x - _ball.x;
        var _ty = _tower.y - _ball.y;
        var _forward = _shot_x * _tx + _shot_y * _ty;
        var _miss = abs(_shot_x * _ty - _shot_y * _tx);
        if (_forward <= 0 || _miss > 24
        || collision_line(_ball.x, _ball.y, _tower.x, _tower.y, ball_wall, false, false) != noone) return false;
    } else {
        // Body contact may tolerate an angle; gun impulses require alignment.
        if (_shot_x * _dx + _shot_y * _dy < 0.98 || !scr_ball_push_clear(_shot_x, _shot_y)) return false;
    }
    gunObj.aiUse(self, point_direction(x, y, _ball.x, _ball.y));
    ballBodyPushTime = 0;
    return true;
}

function scr_ai_walk_segment(_ax, _ay, _bx, _by) {
    // Use the actual asymmetric/scaled player bounds. A fixed-radius sweep
    // can reject every escape route for a bot already standing beside a wall.
    var _left = bbox_left - x;
    var _right = bbox_right - x;
    var _top = bbox_top - y;
    var _bottom = bbox_bottom - y;
    return collision_line(_ax, _ay, _bx, _by, ball_wall, false, false) == noone
        && collision_line(_ax + _left, _ay + _top, _bx + _left, _by + _top, ball_wall, false, false) == noone
        && collision_line(_ax + _right, _ay + _top, _bx + _right, _by + _top, ball_wall, false, false) == noone
        && collision_line(_ax + _left, _ay + _bottom, _bx + _left, _by + _bottom, ball_wall, false, false) == noone
        && collision_line(_ax + _right, _ay + _bottom, _bx + _right, _by + _bottom, ball_wall, false, false) == noone;
}

function scr_ai_tower_segment(_ax, _ay, _bx, _by) {
    if (state == "Push" || state == "Thirst") return true;
    var _dx = _bx - _ax;
    var _dy = _by - _ay;
    var _length2 = _dx * _dx + _dy * _dy;
    for (var _i = 0; _i < instance_number(obj_turret); _i++) {
        var _tower = instance_find(obj_turret, _i);
        if (_tower.hp < 3 || global.teamNum[_tower.num] == global.teamNum[num]) continue;
        var _t = 0;
        if (_length2 > 0) _t = clamp(((_tower.x - _ax) * _dx + (_tower.y - _ay) * _dy) / _length2, 0, 1);
        var _nearest = point_distance(_ax + _dx * _t, _ay + _dy * _t, _tower.x, _tower.y);
        // If knocked under a tower, allow outward motion to safety.
        if (_nearest < min(_tower.bigRange + 24, point_distance(_ax, _ay, _tower.x, _tower.y)) - 0.1) return false;
    }
    return true;
}

function scr_ai_block_tower_cells(_grid) {
    var _changed = [];
    for (var _i = 0; _i < instance_number(obj_turret); _i++) {
        var _tower = instance_find(obj_turret, _i);
        if (_tower.hp < 3 || global.teamNum[_tower.num] == global.teamNum[num]) continue;
        var _range = _tower.bigRange + 24;
        for (var _gx = max(0, floor((_tower.x - _range - 23) / 32)); _gx <= min(floor(room_width / 32) - 1, floor((_tower.x + _range + 23) / 32)); _gx++) {
            for (var _gy = max(0, floor((_tower.y - _range - 23) / 32)); _gy <= min(floor(room_height / 32) - 1, floor((_tower.y + _range + 23) / 32)); _gy++) {
                if (point_distance(_gx * 32 + 16, _gy * 32 + 16, _tower.x, _tower.y) < _range + 23
                && mp_grid_get_cell(_grid, _gx, _gy) == 0) {
                    array_push(_changed, {x: _gx, y: _gy});
                    mp_grid_add_cell(_grid, _gx, _gy);
                }
            }
        }
    }
    return _changed;
}

function scr_ai_tower_route(_route, _position) {
    // Only inspect the remaining route. Rechecking old points behind a moving
    // bot can falsely report a tower crossing and stop an otherwise safe path.
    var _length = path_get_length(_route);
    var _travelled = 0;
    var _previous_x = x;
    var _previous_y = y;
    for (var _i = 0; _i < path_get_number(_route); _i++) {
        var _nx = path_get_point_x(_route, _i);
        var _ny = path_get_point_y(_route, _i);
        if (_i > 0) _travelled += point_distance(path_get_point_x(_route, _i - 1),
            path_get_point_y(_route, _i - 1), _nx, _ny);
        if (_travelled + 0.01 < _position * _length) continue;
        if (!scr_ai_tower_segment(_previous_x, _previous_y, _nx, _ny)) return false;
        _previous_x = _nx;
        _previous_y = _ny;
    }
    return true;
}

function scr_ai_safe_tower_target() {
    if (state == "Push" || state == "Thirst") return;
    for (var _i = 0; _i < instance_number(obj_turret); _i++) {
        var _tower = instance_find(obj_turret, _i);
        if (_tower.hp < 3 || global.teamNum[_tower.num] == global.teamNum[num]) continue;
        if (point_distance(targetX, targetY, _tower.x, _tower.y) < _tower.bigRange + 48) {
            var _dir = point_direction(_tower.x, _tower.y, x, y);
            targetX = _tower.x + lengthdir_x(_tower.bigRange + 64, _dir);
            targetY = _tower.y + lengthdir_y(_tower.bigRange + 64, _dir);
        }
    }
}

function scr_ai_ball_blocks_combat_shot(_target) {
    // Combat must not bypass the deliberate tower-shot rules by firing at
    // a player on the other side of the ball.
    if (_target == noone || !instance_exists(scr_ball_push_tower())) return false;
    return collision_line(x, y, _target.x, _target.y, obj_bigBall, false, false) != noone;
}

// Latch the retreat until safe so combat/loot decisions cannot cancel it.
function scr_ball_tower_escape() {
    if (state == "Dead") return false;
    if (instance_exists(escapeTower)) {
        if (escapeTower.hp >= 3 && point_distance(x, y, escapeTower.x, escapeTower.y) < escapeTower.bigRange + 48) {
            state = "Escape Tower";
            return true;
        }
        escapeTower = noone;
    }
    if (state == "Escape Tower") state = "Travel Ball";
    var _ball = instance_find(obj_bigBall, 0);
    for (var _i = 0; _i < instance_number(obj_turret); _i++) {
        var _tower = instance_find(obj_turret, _i);
        var _ball_distance = point_distance(_ball.x, _ball.y, _tower.x, _tower.y);
        var _ball_inside = _ball_distance <= _tower.bigRange;
        var _was_inside = _ball_inside;
        var _tracked = false;
        // Observe crossings even while we are outside. An approaching ball
        // outside the radius is not the same as a ball leaving tower cover.
        for (var _history = 0; _history < array_length(towerBallRange); _history++) {
            if (towerBallRange[_history].tower == _tower) {
                _was_inside = towerBallRange[_history].inside;
                towerBallRange[_history].inside = _ball_inside;
                _tracked = true;
                break;
            }
        }
        if (!_tracked) array_push(towerBallRange, {tower: _tower, inside: _ball_inside});
        var _distance = point_distance(x, y, _tower.x, _tower.y);
        if (_tower.hp >= 3 && global.teamNum[_tower.num] != global.teamNum[num]
        && state != "Push" && state != "Thirst" && state != "Dead" && state != "Backing"
        && _distance < _tower.bigRange + 24) {
            escapeTower = _tower;
            state = "Escape Tower";
            walkingAround = true;
            alarm[2] = 1;
            return true;
        }
        if (_tower.hp < 3 || global.teamNum[_tower.num] == global.teamNum[num]
        || _distance >= _tower.bigRange) continue;
        var _targeting_us = _tower.target == self || _tower.target == link;
        var _outward = (_ball.x - _tower.x) * _ball.xspd + (_ball.y - _tower.y) * _ball.yspd;
        var _leaving = false;
        if (_outward > 0 && _ball_distance <= _tower.bigRange) {
            // Predict until we can get out, including a navigation update.
            var _steps = clamp(ceil((_tower.bigRange + 48 - _distance) / 5) + 6, 6, 60);
            var _speed = point_distance(0, 0, _ball.xspd, _ball.yspd);
            var _travel = 0;
            for (var _step = 0; _step < _steps; _step++) {
                _travel += _speed;
                if (_ball.oil == 0) _speed = max(0, min(40, _speed - _ball.fric));
            }
            var _dir = point_direction(0, 0, _ball.xspd, _ball.yspd);
            var _future_x = _ball.x + lengthdir_x(_travel, _dir);
            var _future_y = _ball.y + lengthdir_y(_travel, _dir);
            _leaving = point_distance(_future_x, _future_y, _tower.x, _tower.y) > _tower.bigRange
                && collision_line(_ball.x, _ball.y, _future_x, _future_y, ball_wall, false, false) == noone;
        }
        // Local tower logic stores the object asset; network updates may store
        // an instance. Accept both representations of a ball target.
        var _exposed = _tower.target == noone || _tower.target == obj_bigBall || _tower.target == _ball || _targeting_us;
        var _just_left = _was_inside && !_ball_inside;
        // Entering tower range to body-push is intentional, even if the tower
        // currently targets us. Retreat only when the ball is leaving cover.
        if (state != "Thirst" && _exposed && (_leaving || _just_left)) {
            escapeTower = _tower;
            state = "Escape Tower";
            walkingAround = true;
            global.aiPushing[team] = false;
            alarm[2] = 1;
            return true;
        }
    }
    return false;
}

function scr_ball_tower_escape_path() {
    if (!instance_exists(escapeTower)) return;
    var _away = point_direction(escapeTower.x, escapeTower.y, x, y);
    var _angles = [0, 30, -30, 60, -60, 90, -90, 120, -120, 180];
    var _radius = escapeTower.bigRange + 64;
    for (var _i = 0; _i < array_length(_angles); _i++) {
        var _angle = _away + _angles[_i];
        if (scr_ball_approach_path(escapeTower.x + lengthdir_x(_radius, _angle),
            escapeTower.y + lengthdir_y(_radius, _angle), true)) return;
    }
    path_end();
}
