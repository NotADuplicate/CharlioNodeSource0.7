/// @description Movement
    xspd = spd*(keyboard_check(ord("D"))-keyboard_check(ord("A")))
    yspd = spd*(keyboard_check(ord("S"))-keyboard_check(ord("W")))
    
///Collisions

    if(!place_meeting(x+xspd,y,obj_wall) || global.passive == "Juggernaut") {
        x += xspd;
    }
    if(!place_meeting(x,y+yspd,obj_wall) || global.passive == "Juggernaut") {
        y += yspd;
    }
if(x < -5 || y < -5 || x > 1029 || y > 777) {
    if(global.passive == "Edge Runner") {
        x += xspd*2;
        y += yspd*2;
        if(random_range(0,1) > .5)
            hp += 1;
    }
}

///Invincibility
if(global.invincibility > 0) {
    global.invincibility--;
}


///Be pushed
if(instance_exists(obj_push)) {
    push = instance_nearest(x,y,obj_push);
    dist = point_distance(x,y,push.x,push.y)
    if(dist < 400) {
        dir = point_direction(push.x,push.y,x,y);
        dist = ((400-dist)*push.magnitude/4500)/knockback;
        x += lengthdir_x(dist,dir);
        y += lengthdir_y(dist,dir);
    }
}

///Slow down from knockback
if(speed > 0) {
    speed -= knockback;
}
else if(speed <0) {
    speed = 0;
}

