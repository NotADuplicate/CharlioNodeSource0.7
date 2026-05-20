/// @description Link to player
link = global.players[num];
x = link.x;
y = link.y;
visible = true;
active = true;
image_angle += 45;
slow = instance_create(x,y,obj_whirlwind_slow);
slow.num = num;
slow.active = true;