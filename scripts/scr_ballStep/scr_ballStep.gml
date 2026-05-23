function scr_ballStep(dt_scale){
var move_x = xspd * dt_scale;
var move_y = yspd * dt_scale;

var move_len = point_distance(0, 0, move_x, move_y);
var substeps = ceil(move_len / radius)

var step_x = move_x / substeps;
var step_y = move_y / substeps;

var hit = false;

function ball_hits_wall(_x, _y) {
	if(place_meeting(_x, _y, obj_turret)) {
		turret = instance_nearest(x,y,obj_turret);
		if(power(turret.hp, 2) > (power(xspd,2) + power(yspd,2))) * 0.75
			return true;
	}
    return place_meeting(_x, _y, server_walls);
}

for (var i = 0; i < substeps; i++) {
    var next_x = x + step_x;
    var next_y = y + step_y;

    if (!ball_hits_wall(next_x, next_y)) {
        x = next_x;
        y = next_y;
        continue;
    }

    hit = true;

    var hit_x = ball_hits_wall(x + step_x, y);
    var hit_y = ball_hits_wall(x, y + step_y);

    if (hit_x && !hit_y) {
        // Horizontal collision only
        xspd *= -0.7;
        step_x *= -0.7;

        // Still allow vertical movement if possible
        if (!ball_hits_wall(x, y + step_y)) {
            y += step_y;
        }
    }
    else if (hit_y && !hit_x) {
        // Vertical collision only
        yspd *= -0.7;
        step_y *= -0.7;

        // Still allow horizontal movement if possible
        if (!ball_hits_wall(x + step_x, y)) {
            x += step_x;
        }
    }
    else {
        // Corner / ambiguous collision.
        // Choose the axis with greater movement, as an approximation.
        if (abs(step_x) > abs(step_y)) {
            xspd *= -0.7;
            step_x *= -0.7;

            if (!ball_hits_wall(x, y + step_y)) {
                y += step_y;
            }
        } else {
            yspd *= -0.7;
            step_y *= -0.7;

            if (!ball_hits_wall(x + step_x, y)) {
                x += step_x;
            }
        }
    }
}

// Convert bounced substep displacement back into velocity.
// This is important if a collision changed step_x or step_y.
if (hit) {
    xspd = step_x * substeps / dt_scale;
    yspd = step_y * substeps / dt_scale;
}

// Friction after movement/collision
if (oil == 0) {
    var spd = point_distance(0, 0, xspd, yspd);

    if (spd > 0) {
        var new_spd = max(spd - fric * dt_scale, 0);
		new_spd = min(new_spd, 40);
        var scale = new_spd / spd;

        xspd *= scale;
        yspd *= scale;
    } else {
        xspd = 0;
        yspd = 0;
    }
}
}