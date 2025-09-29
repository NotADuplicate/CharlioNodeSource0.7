/// @description Yeah the player understands ammo by now
stage = 4;
obj_shop.wipe = true;
obj_shop.tabs = true;
obj_shop.firstDraw = true;
arrowX = 0;
arrowY = 0;

remindingText = true;
alarm[6] = 450;

//Set grid for some reason
global.bb = mp_grid_create(0,0,floor(room_width/32),floor(room_height/32),32,32);
mp_grid_add_instances(global.bb,ball_wall,false);