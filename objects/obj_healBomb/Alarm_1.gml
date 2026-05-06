/// @description Heal all players
var heals = Abilities.healBomb.healing;
var dmg = Abilities.healBomb.damage;
if(point_distance(x,y,ball_player.x,ball_player.y) < 300) {	
	scr_heal(heals,num);
}
if(instance_exists(obj_AI) && point_distance(x,y,obj_AI.x,obj_AI.y) < 300) {
	obj_AI.hp += heals;
}
scr_ball_sound(snd_healBomb,x,y)
instance_create(x,y,obj_healZone);
instance_destroy()