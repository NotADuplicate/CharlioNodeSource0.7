function scr_blockGen() {
	//Set Vars
	walls = false
	size = 10;
	xsize = 13;
	
	var startxp = 512-(floor(xsize/2)*64);
	var xp = startxp;
	var ny = 0;
	//var mid = floor(size/2);
	var yp = (384-(floor(size/2)*64)+92);


	//Build outside walls
	/*ins = instance_create(xp-64,yp-64,obj_border);
	ins.image_angle = 0;
	ins.image_xscale = size+2;
	ins = instance_create(xp-64,yp-64,obj_border);
	ins.image_angle = 270;
	ins.image_xscale = size+2;*/


	//Build inside tiles
	repeat(size) {
		ny++;
		xp = startxp;
		if(ny = 1 || ny = size) 
			instance_create(xp,yp,block_tile);
		repeat(xsize) {
			instance_create(xp,yp,block_tile);
			xp += 64;
		}
		if(ny = 1 || ny = size) 
			instance_create(xp-64,yp,block_tile);
		yp += 64;
	}

	//Build outside walls
	/*ins = instance_create(xp,yp,obj_border);
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
	}*/


}
