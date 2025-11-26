/// @description Move to correct place
if(initialized) {
	dir = global.players[num].gunDir;
	if(sprite_index == spr_boomerange || sprite_index == spr_melee || throwing) {
		image_angle = 0;
		if(dir < 270 && dir > 90)
			x = global.players[num].x+14*global.players[num].scale;
		else
			x = global.players[num].x-14*global.players[num].scale;
		 y = global.players[num].y;
		 image_yscale = scale;
		 image_xscale = scale*sign(global.players[num].image_xscale)*-1;
		 shootX = ball_player.x + lengthdir_x(18*scale,dir);
		 shootY = ball_player.y + lengthdir_y(18*scale,dir);
	}
	else {		
		y = global.players[num].y+10;
		image_yscale = scale;
		if(dir < 270 && dir > 90)  {
			image_xscale = -scale;
			image_angle = dir+180;
		}
		else {
			image_xscale = scale;
			image_angle = dir;
		}
	
		if(sprite_index == spr_pistol || sprite_index == spr_biggun || sprite_index == spr_shotgun || sprite_index == spr_chargeGun) {
			x = global.players[num].x+6*sign(image_xscale)*global.players[num].scale;
			if(dir > 20 && dir < 160)
				depth = 2;
			else
				depth = 0;
			var newDir = dir;
			if(dir > 90 && dir < 270)
				newDir = dir-27;
			if(dir < 90 || dir > 270)
				newDir = dir+27
			shootX = x + lengthdir_x(20*scale,newDir) + 7*scale*sign(image_xscale);
			shootY = y + lengthdir_y(20*scale,newDir);
		}
		else {
			x = global.players[num].x-6*sign(image_xscale)*global.players[num].scale;
			depth = 0;
			shootX = x + lengthdir_x(20*scale,dir) + 7*scale*sign(image_xscale);
			shootY = y + lengthdir_y(20*scale,dir);
			if(sprite_index == spr_curveGun || sprite_index == spr_curveGunDown) {
				if(clockwise) {
					sprite_index = image_xscale < 0 ? spr_curveGunDown : spr_curveGun
				} else {
					sprite_index = image_xscale > 0 ? spr_curveGunDown : spr_curveGun
				}
			}
		}
	}
	
	if(revving) {
		image_speed = 1;
		if(revSound == 0) {
			revSound = scr_ball_sound(snd_rev, x, y, 0);
		}
	} else {
		if(revSound != 0) {
			if(audio_sound_get_track_position(revSound) < 23) {
				image_speed = 0.5;
				audio_sound_set_track_position(revSound,23);
			}
			if(!audio_is_playing(snd_rev)) {
				revSound = 0;
			}
		} else {
			image_speed = 0;
		}
	}
}

if(upgraded > 270) {
	scale *= 1.025;
	upgraded--;
}
else if(upgraded > 30) {
	upgraded--;
} else if(upgraded > 0) {
	scale /= 1.025;
	upgraded --;
	if(upgraded == 0 && num == ball_player.num) {
		global.upgraded = false;
	}
}
else {
	scale = baseScale
}