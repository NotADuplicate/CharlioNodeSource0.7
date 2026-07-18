function scr_pick_tower(sameTeam){
	show_debug_message("Picking tower for ai on team")
	show_debug_message(global.teamNum[num])
	lowestTurretNum = 100
	lowestTurret = noone;
	with(obj_turret) {
		show_debug_message("Tower number: on team:")
		show_debug_message(num)
		show_debug_message(global.teamNum[num])
		if(num < other.lowestTurretNum) {
			if((global.teamNum[num] != global.teamNum[other.num] && !sameTeam) || (global.teamNum[num] == global.teamNum[other.num] && sameTeam)) {
				other.lowestTurret = self;
				other.lowestTurretNum = num;
			}
		}
	}
	if(lowestTurret == noone) {
		with(obj_goalPoint) {
			if((team != global.teamNum[other.num] && !sameTeam) || (team == global.teamNum[other.num] && sameTeam)) {
				other.lowestTurret = self;
			}
		}
	}
	return lowestTurret;
}