function scr_reflect() {
	ob = argument[0];
	dir = argument[1];
	ob.direction = direction;
	ob.speed+= 6;
	if(ob.speed < 0){
	    ob.direction += 180;
	}
	ob.image_angle = ob.direction;
	ob.num = num;
	ob.reflected = true;
}
