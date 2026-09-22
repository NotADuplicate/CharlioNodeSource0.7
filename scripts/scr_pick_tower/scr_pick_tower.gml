function scr_pick_tower(sameTeam){
	show_debug_message(global.teamNum[num])
	lowestTurretNum = instance_number(obj_turret) > 2 ? 100 : -100;
	lowestTurret = noone;
	with(obj_turret) {
		if(num < other.lowestTurretNum ^^ instance_number(obj_turret) > 2) {
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