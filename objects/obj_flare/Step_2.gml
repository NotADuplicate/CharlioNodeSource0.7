/// @description See monsters
if(global.teamNum[num] == global.teamNum[ball_player.num]) {
	with(obj_monster) {
		if(collision_line(xpos,ypos,other.x,other.y,ball_wall,false,false) == noone) {
			knownAlpha = image_alpha
		}
	}
}
//part_particles_create(global.partSystem,x,y,part_smoke,1);