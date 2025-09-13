/// @description Draw minimap
if(keyboard_check(global.mapKey)) {
	draw_set_alpha(0.5)

	xp1 = 480;
	xp2= 980
	yp1 = 470
	yp2= 746
	scale = 0.077

	if(!surface_exists(minimap)) {
		minimap = surface_create(500,276)
		alarm[0] = 1;
		alarm[1] = 1;
	} else {
	if(position_meeting(ball_player.x, ball_player.y, obj_regen)) {
		if(global.teleportTimer > 0)
			draw_text(700, 445, string(round(global.teleportTimer)) + " seconds until free teleport");
		else 
			draw_text(700, 445, "Press T on the minimap to teleport anywhere.");
	}
	else {
		draw_text(700, 445, "Press T on the minimap to teleport anywhere.");
	}
	draw_surface(minimap,xp1,yp1)

	playerx = obj_player.x*scale + xp1+1
	playery = obj_player.y*scale + yp1+1
	color = global.teamNum[obj_player.num] == 1 ? c_red : c_blue;

	if(playerx > xp1 && playerx < xp2 && playery > yp1 && playery < yp2)
		draw_rectangle_color(playerx-2,playery-2,playerx+2,playery+2,color,color,color,color,false)
		
	for (var i = 0; i < instance_number(ball_other); i++) {
	    var inst = instance_find(ball_other, i);
		if(inst.position_known && inst.seen==0) {
			playerx = inst.x*scale + xp1+1
			playery = inst.y*scale + yp1+1
			color = global.teamNum[inst.num] == 1 ? c_red : c_blue;
			draw_rectangle_color(playerx-2,playery-2,playerx+2,playery+2,color,color,color,color,false)
		}
	}

	ballx = obj_bigBall.x*scale+xp1
	bally = obj_bigBall.y*scale+yp1

	if(ballx > xp1 && ballx < xp2 && bally > yp1 && bally < yp2)
		draw_circle_color(ballx,bally,5,c_blue,c_blue,false)
	}

	draw_set_alpha(1)
}