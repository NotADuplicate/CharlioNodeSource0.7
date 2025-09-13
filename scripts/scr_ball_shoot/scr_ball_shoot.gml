function scr_ball_shoot() {
	if(instance_exists(ball_player)) {
	    dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
		xp = ball_player.x;
		yp = ball_player.y;
		xp -= lengthdir_x(10,dir)
		yp -= lengthdir_y(10,dir)
		with(obj_gun) {
			if(num == ball_player.num) {
				other.xp = shootX;
				other.yp = shootY;
			}
		}
	    buffer = ball_game.buffer;
		var ob;
		if(global.upgraded) {
			switch(global.attack) {
				case obj_shotgun:
					ob = upgraded_shotgun;
					break;
				case obj_bullet:
					ob = upgraded_bullet;
					break;
				case obj_minigun:
					ob = upgraded_minigun;
					break;
				case chad_bullet:
					ob = upgraded_chad;
					break;
				case virgin_bullet:
					ob = upgraded_virgin;
					break;
				case obj_grenade:
					ob = upgraded_grenade;
					break;
				case other_bolt:
					ob = upgraded_bolt;
					break;
				case obj_boomerang:
					ob = upgraded_boomerang;
					break;
				case obj_void:
					ob = upgraded_void;
					break;
				case obj_melee:
					ob = upgraded_melee;
					break;
			}
		} else {
			ob = global.attack;
		}
		node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",xp,"Y",yp,"Dir",dir,"Obj", ob, "Upgraded", global.upgraded)
	}
}
