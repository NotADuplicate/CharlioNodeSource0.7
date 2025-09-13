/// @description Fade and break
if(hp > 0) {
    image_alpha = (hp/25)+.5;
}
else
    instance_destroy();

