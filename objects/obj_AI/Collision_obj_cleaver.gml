/// @description Insert description here
// You can write your code in this editor
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_dummy_damage(20,other.num,false, spr_cleaver, false)
	instance_destroy(other);
	
	if(invincibility <= 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",other.num,"Status Num", 3)
		}
		bleed = 90;
		path_end();
	}
}
