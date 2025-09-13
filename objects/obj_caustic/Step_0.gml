/// @description Slowly fade
if(b != 0)
	hp--;
	
if(hp < 0) {
	instance_destroy();
}
/*if(global.teamNum[num] != global.teamNum[obj_client.index]) {
    if(visible == true) {
        if(image_alpha > .1) {
            image_alpha -= .01;
        }
        else
            visible = false;
    }
}

