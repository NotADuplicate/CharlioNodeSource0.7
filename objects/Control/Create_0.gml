var color;
color = make_colour_rgb(0, 0, 0);
width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);
global.system = light_init(width, height, 1100, color, 1, -1, sp);

light = light_create(global.system, sp_light, 1, c_white, 1, 0, true);
//mouselight = light_create(global.system, sp_light, 1, c_white, 1, 0, true);