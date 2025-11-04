/// @description Heal allies and damage enemies
var heals = Abilities.healBomb.healing;
var dmg = Abilities.healBomb.damage;
if(point_distance(x,y,ball_player.x,ball_player.y) < 300) {	
	if(global.teamNum[num] == global.teamNum[ball_player.num]) {
		scr_heal(heals,num);
	}
	else
		scr_damage(30,num,false, spr_healthBomb, false)
}
if(instance_exists(obj_AI) && point_distance(x,y,obj_AI.x,obj_AI.y) < 300) {
	obj_AI.hp += 100;
}
scr_ball_sound(snd_healBomb,x,y)
instance_create(x,y,obj_healZone);
instance_destroy()