function scr_pathfind() {
		//if(path_index != -1)
		//	path_delete(path_index);
	     goalx = argument[0]; 
		 goaly = argument[1]
	     aa = path_add(); 
		 mp_grid_clear_cell(global.bb, x,y);
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
	     path_start(aa,argument[2],path_action_stop,true);


}
