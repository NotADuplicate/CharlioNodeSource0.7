/// @description Show progress
if(index > 0) {
	sprite_index = spr_reviveBlue;
	image_index = round(index/5);
}
else {
	sprite_index = spr_reviveBlue;
	image_index = round(abs(index/5));
}
if(abs(index) > 100) {
	if(num == ball_player.num) {
		with(ball_player) {
			speed = 0;
			visible = true;
			x = other.x;
			y = other.y;
			moveSpd = global.baseMove
			hp = round(maxhp/2);
			poisonDmg=0;
			global.dead = false;
			global.ammo = 5;
			view_set_visible(0,true)
			view_set_visible(1,false)
			respawnTimer = 0;
			scr_cleanse(true);
		}
	}
	instance_destroy();
}
index -= sign(index)

timer -= delta_time/1000000;
if(timer < 2) {
	image_alpha = timer/2;
}
if(timer < 0) {
	instance_destroy();
}