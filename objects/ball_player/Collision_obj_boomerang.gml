/// @description Take damage
if(other.num == num && other.speed > 0) {

}
else if(other.num == num) {
	instance_destroy(other);
	global.ammo += 3;
	if(global.ammo > global.maxAmmo) {
		global.ammo = global.maxAmmo;
	}
}
else if(ghosting == 0) {
    if(other.hitCooldown == 0) {
		scr_damage(round(other.dmg*1.3),other.num,true, spr_boomerange, false);
		other.hitCooldown = 10;
		scr_player_move(other.direction,other.speed/3);
    }
	else if(stasis) {
		scr_player_move(other.direction,other.speed/3);
	}
}

