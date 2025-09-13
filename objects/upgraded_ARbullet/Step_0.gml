/// @description Slow and fade
speed -= slow;
image_alpha -= slow/40;
if(speed < 3) 
    instance_destroy();

