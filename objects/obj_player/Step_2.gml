/// @description Die to the ring
if(x < -5 || y < -5 || x > 1029 || y > 777) {
    scr_damage(1,"the ring");
}

///Slam against wall
///Collisions
if(place_meeting(x+hspeed,y,obj_wall)) {
    hspeed = 0;
}
if(place_meeting(x,y+vspeed,obj_wall)) {
    vspeed = 0;
}

if(collision_line(x,y,x+hspeed,y+vspeed,obj_wall,false,false)) {
	speed = 0;
}