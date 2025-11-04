/// @description Insert description here
// You can write your code in this editor
	if(chummed > 0)
		scr_damage(4,chumNum,false, spr_meat, false)
	else
		scr_damage(3,num,false, spr_skull, false);
motion_add(point_direction(other.x,other.y,x,y),1);