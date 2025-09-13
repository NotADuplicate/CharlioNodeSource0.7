/// @description Slowly fade
hp -= 0.25;	
if(hp < 0) {
	instance_destroy();
}

if(global.teamNum[num] == global.teamNum[ball_player.num] && point_distance(x,y,ball_player.x,ball_player.y) < 300) {
	scr_heal(0.5,num);
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

