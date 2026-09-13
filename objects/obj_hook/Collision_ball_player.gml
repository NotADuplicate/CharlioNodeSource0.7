/// @description Hook to enemies
if(ready) {//other != link && hooked = 0 && ready) {
	if(other.spellShield > 0) 
		instance_destroy();
	hooked = ball_player;
	alarm[0] = 60;
	with(ball_game) {
		node_send(buffer,"eventName","Targeted Status", "Target", other.num, "User",ball_player.num, "Status Num", 1)
	}
}