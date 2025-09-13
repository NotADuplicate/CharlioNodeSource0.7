/// @description Increment timer
if(timer < 250)
    timer++;
if(global.attack == obj_minigun && timer > 1) {
    if(reload == 0) {
		if(totalspray > 0) {
			repeat(global.shooting) {
				scr_shoot();
				totalspray--;
			    with(obj_player) { //get pushed
			        dir = point_direction(mouse_x,mouse_y,x,y);
			        if(global.passive == "Juggernaut") {
			            len = 3;
			        }
			        else if(global.passive == "Fast Firing"){
			            len = 11;
			        }
					else
						len = 8;
					motion_set(dir,len);
			    }
			}
		}
		else if(global.ammo > 0){
			totalspray = 15;
			scr_ammo(1);
		}
    } 
}

