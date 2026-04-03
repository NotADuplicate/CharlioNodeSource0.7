/// @description Read map
alarm[0] = 1; //set all walls
alarm[1] = 2; //draw monsters
scale = 0.1
width = room_width*scale;
height = room_height*scale;
minimap = surface_create(width,height)
failTimer = 0;
failMessage = "";
global.mapShowing = false
