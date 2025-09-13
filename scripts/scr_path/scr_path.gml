function scr_path() {
	    if(path_index > 0)
	        path_delete(path_index)
	     goal = argument[0]; 
	     aa = path_add(); 
	     bb = mp_grid_create(0,0,room_width/32,room_height/32,32,32);
	     mp_grid_add_instances(bb,inst_solid,false);
	     mp_grid_add_instances(bb,defo_wall,false);
	     mp_grid_clear_cell(bb, x,y);
	     failed = mp_grid_path(bb,aa,x,y,goal.x,goal.y,true); 
	     return failed; 


}
