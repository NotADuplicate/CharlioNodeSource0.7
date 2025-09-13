function scr_trumpGen(argument0, argument1) {
	//Set Vars
	size = argument0;
	walls = argument1;
	if(size mod 2 == 0) //increase size and make sure its odd
		size += 3;
	else
		size += 2;
	
	var startxp = 512-(floor(size/2)*64);
	var xp = startxp;
	var ny = 0;
	var mid = floor(size/2);
	var yp = 384-(floor(size/2)*64);


	//Build outside walls
	ins = instance_create(xp-64,yp-64,obj_border);
	ins.image_angle = 0;
	ins.image_xscale = size+2;
	ins = instance_create(xp-64,yp-64,obj_border);
	ins.image_angle = 270;
	ins.image_xscale = size+2;


	//Build inside tiles
	repeat(size) {
		ny++;
		xp = startxp;
		if(ny = 1 || ny = size) 
			instance_create(xp,yp,obj_placeholder);
		repeat(size) {
			instance_create(xp,yp,obj_tile);
			xp += 64;
		}
		if(ny = 1 || ny = size) 
			instance_create(xp-64,yp,obj_placeholder);
		yp += 64;
	}

	//Build outside walls
	ins = instance_create(xp,yp,obj_border);
	ins.image_angle = 180;
	ins.image_xscale = size+2;
	ins = instance_create(xp,yp,obj_border);
	ins.image_angle = 90;
	ins.image_xscale = size+2;


	//Build wall tiles
	if(walls) {
		instance_create(512,384-(mid*64),defo_wall);
		instance_create(512,384+(mid*64),defo_wall);
		instance_create(512+(mid*64),384,defo_wall);
		instance_create(512-(mid*64),384,defo_wall);
	}


}
