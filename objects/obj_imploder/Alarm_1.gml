/// @description Insert description here
// You can write your code in this editor
if(point_distance(x,y,ball_player.x,ball_player.y) < 300) {
	dir = point_direction(x,y,ball_player.x,ball_player.y)+180
	scr_player_move(dir,30)
}
else if(point_distance(x,y,ball_player.x,ball_player.y) < 500) {
	dir = point_direction(x,y,ball_player.x,ball_player.y)+180
	scr_player_move(dir,15)
}
ins = instance_create(x,y,obj_implosion)
ins.num = num
ins.alarm[0] = 6;
instance_destroy();

//shoot reverse explosions
dir = 0;
repeat(12) {
    ins = instance_create(x+lengthdir_x(250,dir),y+lengthdir_y(250,dir),obj_explosion);
    ins.num = num;
    ins.dmg = 5;
    ins.direction = dir+180;
    dir += 30;
	ins.alarm[1] = 10;
}
instance_create(x,y,effect_implosion)