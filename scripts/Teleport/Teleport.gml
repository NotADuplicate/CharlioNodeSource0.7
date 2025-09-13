function Teleport() constructor {
	sprite = spr_revenant;
	ammoCost = 3;
	cooldown = 30; 
	name = "Warp"
	abilityName = "teleport"
	text = "Teleport to anywhere on your screen with a 0.3 second delay"
	
	
	static abilityPressed = function(buffer) {
		if(ball_game.started && global.ammo >= ammoCost) {
			node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", mouse_x, "Y", mouse_y, "Obj", obj_teleport, "Dir", 0)
			scr_ball_ammo(ammoCost);
			return(cooldown);
		} else {
			return(0);
		}
	} 
}