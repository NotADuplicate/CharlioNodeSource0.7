/// @description Insert description here
// You can write your code in this editor
if(other.num != num) {
	motion_set(other.direction,20);
	scr_dummy_damage(80,other.num,false, spr_engine, false)
	if(global.teamNum[other.num] != global.teamNum[num]) {
		burn = 250;
		burnNum = other.num;
	}
}