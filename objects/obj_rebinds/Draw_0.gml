if(surface_exists(global.optionsSurf)) { 
	if(global.options && global.optionState == "Controls") {
		surface_set_target(global.optionsSurf);
		var i = 0;
		var bind;
		yp = 180;
		repeat(array_length(bindList)) {
			bind = bindList[i];
			draw_text_transformed(200,yp,bind.title,2,2,0);
			draw_text_transformed(600,yp,bind.globalButton,2,2,0);
			yp += 60;
			i ++;
		}
	
		surface_reset_target();
	}
} else {
	global.optionsSurf = surface_create(950,600);
}