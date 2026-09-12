/// @description Show progress
if(index > 0) {
	sprite_index = spr_reviveBlue;
	image_index = round(index/5);
}
else if(index < 0){
	sprite_index = spr_reviveBlue;
	image_index = round(abs(index/5));
}
if(abs(index) > 100) {
	if(num == ball_player.num) {
		var reviveNum = reviving.num;
		with(ball_player) {
			speed = 0;
			visible = true;
			x = other.x;
			y = other.y;
			moveSpd = global.baseMove
			scr_cleanse(true);
			hp = 1;
			scr_heal(Abilities.revive.healing-1, reviveNum)
			poisonDmg=0;
			global.dead = false;
			global.ammo = 5;
			view_set_visible(0,true)
			view_set_visible(1,false)
			respawnTimer = 0;
		}
	}
	instance_destroy();
}
if(abs(index) > 1) {
	index -= sign(index) 
} else { index = 0; }

timer -= delta_time/1000000;
if(timer < 4) {
	image_alpha = timer/4;
}
if(timer < 0) {
	instance_destroy();
}