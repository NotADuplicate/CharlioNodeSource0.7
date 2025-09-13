/// @description Keep position and direction
// You can write your code in this editor
/// Light at x y
if(instance_exists(standoff_player)) {
	x = standoff_player.x;
	y = standoff_player.y;
}
light[|eLight.X] = x;
light[|eLight.Y] = y;
light[|eLight.Direction] = point_direction(x,y,mouse_x,mouse_y);