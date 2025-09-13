/// @description Slowly fade
if(num != obj_client.index) {
    if(visible == true) {
        if(image_alpha > .1) {
            image_alpha -= .01;
        }
        else
            visible = false;
    }
}

