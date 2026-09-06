var extension = 0;
var xp = x;
var yp = y;
var dx = lengthdir_x(32,dir);
var dy = lengthdir_y(32,dir);
var hitPlayer = false;
if(firstHitPlayer > 0) {firstHitPlayer--; } //ensures the first collision does bonus dmg then tick dmg
while(extension < len && collision_line(xp,yp,xp+dx,yp+dy,ball_wall,false,true) == noone) {
	extension += 32;
	draw_sprite_ext(spr_eyeBeam,tick,xp,yp,1,4,dir,c_white,1);
	xp += dx;
	yp += dy;
	if(!hitPlayer && point_distance(xp,yp,ball_player.x,ball_player.y) < 32) {
		hitPlayer = true;
		with(ball_player) {
			var dmg = other.firstHitPlayer == 0 ? 50 : 8;
			scr_damage(dmg,num,true,spr_laserTrap,false);
			scr_player_move(other.dir,dmg/5);
		}
		firstHitPlayer = 3;
	}
}
draw_sprite_ext(spr_eyeBeam,tick,xp,yp,0.5,4,dir,c_white,1);
if(collision_line(xp,yp,xp+dx,yp+dy,ball_wall,false,true) != noone) {
	while(!position_meeting(xp,yp,ball_wall)) {
		xp += dx/5;
		yp += dy/5;
	}
	draw_sprite_ext(spr_beamImpact,tick,xp,yp,3,3,90+dir,c_white,1);
}