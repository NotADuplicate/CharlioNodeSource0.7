function scr_tower_dmg() {
	with(obj_turret) {
	    if(num == argument[0]) {
			hp -= argument[1];
	    }
	}
}
