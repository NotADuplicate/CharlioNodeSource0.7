/// @description Do image_angle
image_angle = direction;

///TP to player
if(speed == 0) {
    if(instance_exists(link)) {
        x = link.x;
        y = link.y;
    }
    else {
        speed = 65*global.players[num].scope;
    }
}
else if(dmg < dmgRamp * 8) {
	dmg += dmgRamp*global.players[num].scope;
} else {
	dmg = dmgRamp*8;
}
if(charge < 75 && speed == 0)
	charge += fire;


//Hit player
if(speed > 0) {
	var i = 0;
	xDist = lengthdir_x(speed,direction);
	yDist = lengthdir_y(speed, direction);
	repeat(3) {
		if(place_meeting(x+xDist*i,y+yDist*i,ball_player)) { 
			if(ball_player.num != num && ball_player.ghosting == 0) {
			    scr_damage(dmg,num,true, spr_rifle, false);
			    instance_destroy();
			    scr_player_move(direction,dmg/20);
				i = -1000;
			}
			i += 0.33;
		}
	}
}