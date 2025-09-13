/// @desc Creates a light using variables

switch("Point Light") {
	case "Point Light":
		light = light_create_point(x, y, Light_Shadow_Length, Light_Color, 230, 1.1);
		//sprite_index = spr_light_point;
		break;
	case "Spot Light":
		light = light_create_spot(x, y, Light_Shadow_Length, Light_Color, 2000, 1.5, 40, 0);
		sprite_index = spr_light_spot;
		break;
		
	case "Area Light":
		light = light_create_area(x, y, Light_Shadow_Length, Light_Color, Light_Range, Light_Intensity, Light_Width, Light_Direction);
		sprite_index = spr_light_area;
		image_angle = Light_Direction;
		break;
		
	case "Directional Light":
		light = light_create_directional(x, y, Light_Shadow_Length, Light_Color, Light_Range, Light_Intensity,0)// point_direction(x,y,mouse_x,mouse_y));
		//sprite_index = spr_light_directional;
		image_angle = Light_Direction;
		break;
		
	case "Line Light":
		light = light_create_line(x, y, Light_Shadow_Length, Light_Color, Light_Range, Light_Intensity, Light_Width, Light_Direction);
		sprite_index = spr_light_line;
		image_angle = Light_Direction;
		break;
}
// Set LUTs
if(LUT_Intensity != noone) {
	light[| eLight.LutIntensity] = sprite_get_texture(LUT_Intensity, 0);
}

// Add the light to the world
light_add_to_world(light);