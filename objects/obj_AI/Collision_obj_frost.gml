/// @description Get frosted if not theirs
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_dummy_damage(20, other.num, false);
	frost = 120;
	path_end();
}