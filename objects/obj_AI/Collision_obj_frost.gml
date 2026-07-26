/// @description Get frosted if not theirs
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_dummy_damage(20, other.num, false, spr_frost, false);
	instance_destroy(other);
	
	if(invincibility <= 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",other.num,"Status Num", 17)
		}
		frost = 30*Abilities.frost.duration;
		path_end();
	}
}