/// @description Build the walls
dir = direction + 90;
dist = 64;
repeat(5) {
    xp = x + lengthdir_x(dist,dir);
    yp = y + lengthdir_y(dist,dir);
    dist -= 32;
    wall = instance_create(xp,yp,obj_wall);
    wall.image_angle = dir;
}

