/// @description Heal allies and damage enemies
var heals = Abilities.healBomb.healing;
var dmg = Abilities.healBomb.damage;
if(point_distance(x,y,ball_player.x,ball_player.y) < 300) {	
	if(global.teamNum[num] == global.teamNum[ball_player.num]) {
		/*if(ball_player.decay > 0)
			scr_damage(heals,ball_player.decayNum,false);
		else {
			if(ball_player.num != num)
				ball_player.hp += 60 * global.players[num].healing;
			else
				ball_player.hp += 60;
			if(ball_player.hp > 250 && ball_player.overheal == false)
				ball_player.hp = 250;
		}*/
		scr_heal(heals,num);
	}
	else
		scr_damage(30,num,false)
}
scr_ball_sound(snd_healBomb,x,y)
instance_create(x,y,obj_healZone);
instance_destroy()