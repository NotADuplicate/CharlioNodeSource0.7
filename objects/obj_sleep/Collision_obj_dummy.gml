/// @description Insert description here
// You can write your code in this editor
if(other.num != num) {
	//if(global.teamNum[other.num] != global.teamNum[num]) {
		with(other) {
			scr_dummy_damage(Abilities.rest.damage,num,false, spr_sleeping, false);
			motion_add(point_direction(x,y,other.x,other.y),-8)
		}
	//}
}