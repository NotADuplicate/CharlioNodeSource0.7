/// @description Insert description here
// You can write your code in this editor
dist = point_distance(x,y,ball_player.x,ball_player.y)
if(dist < 500 && collision_line(x,y,ball_player.x,ball_player.y,inst_solid,false,false) == noone) {
	if(ball_player.spellShield == 0) {
		ins = instance_create(0,0,obj_flash);
		ins.dur = (abs(500-dist)/5)+2;
	}
}
if(num == ball_player.num)  {
	instance_create(x,y,obj_flashLight);
	with(obj_monster) {
		if(collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
			knownAlpha = image_alpha
		}
	}
}
instance_destroy()