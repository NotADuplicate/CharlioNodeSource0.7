function scr_pathfind(dodge_fire) {
		//if(path_index != -1)
		//	path_delete(path_index);
	     goalx = argument[0]; 
		 goaly = argument[1]
	     aa = path_add(); 
		 var cell_x = x div 32;
		 var cell_y = y div 32;
		 var occupied = mp_grid_get_cell(global.bb,cell_x,cell_y)
		 if(occupied)
			mp_grid_clear_cell(global.bb, cell_x,cell_y);
	     failed = mp_grid_path(global.bb,aa,x,y,goalx,goaly,true); 
		 if(failed == false) {
			failed = mp_grid_path(global.bb,aa,x,y,goalx-30,goaly,true); 
			if(failed == false) {
				failed = mp_grid_path(global.bb,aa,x,y,goalx,goaly+30,true); 
				 if(failed == false) {
					failed = mp_grid_path(global.bb,aa,x,y,goalx,goaly-30,true); 
					if(failed == false) {
						failed = mp_grid_path(global.bb,aa,x,y,goalx+30,goaly,true); 
					}
				 }
			}
		 }
		 if(occupied)
			 mp_grid_add_cell(global.bb, cell_x, cell_y)
	     path_start(aa,argument[2],path_action_stop,true);
		 return aa;
}
