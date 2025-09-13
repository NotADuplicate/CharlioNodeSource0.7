/// @description Insert description here
// You can write your code in this editor
if(other.num != num) {
	scr_player_move(point_direction(other.x,other.y,x,y),8);
	if(global.teamNum[other.num] != global.teamNum[num]) {
		scr_damage(Abilities.rest.damage,other.num,false);
	}
}