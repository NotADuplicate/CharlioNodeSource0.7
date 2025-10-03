/// @description Insert description here
// You can write your code in this editor
draw_self()
//draw_text(x,y,pushForce);
draw_healthbar(x-25,y-16,x+5,y-10,100*(hp/maxhp),c_black,c_red,c_green,0,true,true)
if(broken) {
	draw_sprite(spr_broken,0,x,y-25);
}
draw_circle_color(x,y,bigRange,c_red,c_red,true);

if(global.teamNum[num] != global.teamNum[ball_player.num] && point_distance(x,y,ball_player.x,ball_player.y) < bigRange) {
	if(beamLength < bigRange)
		beamLength+= 35;
	targetX = ball_player.x;
	targetY = ball_player.y;
} else if(beamLength >0) {
	beamLength -= 35;
}

if(beamLength > 0) {
	if(point_distance(x,y, targetX, targetY) < beamLength) {
		beamX = targetX;
		beamY = targetY;
	} else {
		dir = point_direction(x,y, targetX, targetY);
		beamX = x+lengthdir_x(beamLength, dir);
		beamY = y+lengthdir_y(beamLength, dir);
	}
	draw_line_width_color(x,y,beamX,beamY,3,c_red,c_red);
	
}
