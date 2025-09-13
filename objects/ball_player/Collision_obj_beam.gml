/// @description Insert description here
// You can write your code in this editor
if(global.teamNum[other.num] != global.teamNum[num] && other.image_alpha == 1) {
	scr_damage(5,other.num,false)
	global.slow = .5;
}
else if(other.image_alpha = 1 && hp < maxhp && other.num != num) {
	hp += 2 * global.players[other.num].healing;
}