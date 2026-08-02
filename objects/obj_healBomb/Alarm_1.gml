/// @description Heal all players
var heals = Abilities.healBomb.healing;
if(point_distance(x,y,ball_player.x,ball_player.y) < 300) {	
	scr_heal(heals,num);
}
with(obj_AI) {
	if(point_distance(x,y,other.x,other.y) < 300)
	hp += heals;
}
scr_ball_sound(snd_healBomb,x,y)
instance_create(x,y,obj_healZone);
instance_destroy()