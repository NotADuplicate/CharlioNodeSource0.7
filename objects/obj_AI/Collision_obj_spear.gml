	scr_dummy_damage(40,other.num,false, spr_spear, false)
	instance_destroy(other);
	if(invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",other.num,"Status Num", 16)
		}
		broken = 180;
		brokenNum = other.num;
	}