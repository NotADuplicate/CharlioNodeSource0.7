/// @description Apply jungle buff to allies
if(point_distance(x,y,ball_player.x,ball_player.y) < 300) {	
	if(global.teamNum[num] == global.teamNum[ball_player.num]) {
		scr_get_buff("Ammo", global.jungle, 450);
		scr_get_buff("Damage", global.jungle, 450);
		scr_get_buff("Speed", global.jungle, 450);
		scr_get_buff("Resistance", global.jungle, 450);
		scr_get_buff("Defense", global.jungle, 450);
		scr_get_buff("Power", global.jungle, 450);
	}
}
scr_ball_sound(snd_monsterBuff,x,y)
instance_create(x,y,obj_healZone);
instance_destroy()