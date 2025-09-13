/// @description Draw monsters
surface_set_target(minimap)

scale = 0.077

for (var i = 0; i < instance_number(obj_monster); i++){
    var inst = instance_find(obj_monster, i);

	x1 = (inst.x-(16*inst.image_xscale))*scale
	y1 = (inst.y-(16*inst.image_yscale))*scale
	x2 = (inst.x+(16*inst.image_xscale))*scale
	y2 = (inst.y+(16*inst.image_yscale))*scale
	if(x1 > 20) {
		draw_rectangle_color(x1,y1,x2,y2,c_orange,c_orange,c_orange,c_orange,false) 
		spr = spr_orange
		switch(inst.object_index) {
			case ammo_monster:
				spr = spr_ammo;
				break;
			case cooldown_monster:
				spr = spr_clock;
				break;
			case dmg_monster:
				spr = spr_attack;
				break;
			case health_monster:
				spr = spr_heart;
				break;
			case jungle_monster:
				spr = spr_jungle;
				break;
			case power_monster:
				spr = spr_wand;
				break;
			case speed_monster:
				spr = spr_speed;
			break;
		}
		draw_sprite_ext(spr,0,(x1+x2)/2,(y1+y2)/2,0.35,0.35,0,c_white,1)
	}
}

surface_reset_target()