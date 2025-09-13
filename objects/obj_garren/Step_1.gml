/// @description Respawn
if(timer > 0 && ball_game.started) {
	timer -= (delta_time/1000000)
	if(timer < 0.5) {
		timer = 0;
		dead = false
		x = xpos;
		y = ypos;
		image_alpha = 1;
		hp = maxhp
		ins = instance_create(0,0,spawn_marker)
		ins.drag = false;
	}
	if(timer < 120 && garrenBuff) {
		garrenBuff = false
		i = 1;
		repeat(global.loop) {
			global.players[i].garren = false;
			i++;
		}
	}
}