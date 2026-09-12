/// @description Read map
alarm[0] = 1; //set all walls
alarm[1] = 2; //draw monsters
scale = 0.1
width = room_width*scale;
height = 2725*scale; // room height ignoring bottom area
minimap = surface_create(width,height)
failTimer = 0;
failMessage = "";
global.mapShowing = false
