/// @description Insert description here
// You can write your code in this editor
obj_bigBall.x = obj_bigBall.startX;
obj_bigBall.y = obj_bigBall.startY;
obj_bigBall.alarm[8] = 2;
ball_game.started = true;
remindingText = true;
stage = 9

global.bb = mp_grid_create(0,0,floor(room_width/32),floor(room_height/32),32,32);
mp_grid_add_instances(global.bb,ball_wall,false);

global.AiPathGrid = mp_grid_create(0,0,floor(room_width/32),floor(room_height/32),32,32);
mp_grid_add_instances(global.AiPathGrid,ball_wall,false);
mp_grid_add_instances(global.AiPathGrid,jungle_wall,false);