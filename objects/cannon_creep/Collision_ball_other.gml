/// @description Insert description here
// You can write your code in this editor
if(global.teamNum[other.num] != side) {
	hp--;
	if(hp < 0) {
		if(side != global.teamNum[ball_player.num])
			global.xp += 80;
		instance_destroy()
	}
}