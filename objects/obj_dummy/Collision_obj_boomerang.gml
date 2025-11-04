/// @description Take damage
    if(invincibility == 0) {
		scr_dummy_damage(round(other.dmg*1.3),other.num,true, spr_boomerange, false);
		invincibility = 10;
		motion_add(other.direction,other.speed/3);
    }
