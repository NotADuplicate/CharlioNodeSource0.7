/// @description Insert description here
// You can write your code in this editor
x = link.x;
y = link.y;
image_angle -= 36;
xp = x +lengthdir_x(90,image_angle+20);
yp = y +lengthdir_y(90,image_angle+20);
slow.x = x;
slow.y = y;
//part_particles_create(global.partSystem,xp,yp,part_smoke,1);