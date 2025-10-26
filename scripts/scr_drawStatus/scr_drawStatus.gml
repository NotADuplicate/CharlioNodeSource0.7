// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drawStatus(){
	
	//First Count the statuses
	var statusCount = -1;
	if(confuse > 0) {
		statusCount++;
	}

	if(inversion > 0) {
		statusCount++;
	}

	if(bleed > 0) {
		statusCount++;
	}
	
	if(milked > 0) {
		statusCount++;
	}

	if(chummed > 0) {
		statusCount++;
	}
	
	if(enraged)
		statusCount++;

	if(poison > 0) 
		statusCount++;
	
	if(tossGrabbed > 0)
		statusCount++;
	
	if(decay > 0) {
		statusCount++;
	}
	
	if(broken > 0)
		statusCount++;
	
	if(frost > 0)
		statusCount++;
	
	if(stunned > 0)
		statusCount++;
		
	if(kicking > 80) 
		statusCount++;
		
	if(controlled > 0)
		statusCount++;

	//Now actually draw the icons
	
	var dt = delta_time / 33333;
	var yp = y-(30*(image_yscale/2+.5));
	var xp = x-20*statusCount;
	
	if(confuse > 0) {
		draw_sprite_ext(spr_confuse,0,xp,yp,1,1,0,c_white,confuse/30);
		xp += 40;
		confuse-= dt;
	}

	if(inversion > 0) {
		draw_sprite_ext(spr_inversion,0,xp,yp,1,1,0,c_white,inversion/30);
		xp += 40;
		inversion-= dt;
	}

	if(bleed > 0) {
		draw_sprite_ext(spr_blood,0,xp,yp,1,1,0,c_white,0.5+bleed/200);
		xp += 40;
		bleed-= dt;
	}
	
	if(milked > 0) {
		draw_sprite_ext(spr_milkDrop,0,xp,yp,1,1,0,c_white,milked/100);
		xp += 40;
		milked-= dt;
	}

	if(chummed > 0) {
		draw_sprite_ext(spr_meat,0,xp,yp,1,1,0,c_white,chummed/100); 
		xp += 40;
		chummed-= dt;
	}
	
	if(controlled > 0) {
		dir = point_direction(x,y,controlledX, controlledY)
		draw_sprite_ext(spr_telekenesis,0,xp,yp,1,1,dir,c_white,controlled/100); 
		xp += 40;
		controlled-= dt;
	}

	if(marked > 0) {
		draw_sprite_ext(spr_airstrike,0,round(x),round(y),image_xscale*1.5,image_yscale*1.5,0,c_white,1)
		marked-= dt;
	}
	
	if(murderball > 0) {
		draw_sprite_ext(spr_deathball,0,x,y,1.5,1.5,0,c_white,1);
		murderball-= dt;
	}
	
	if(enraged) {
		draw_sprite_ext(spr_anger,0,xp,yp,0.7,0.7,0,c_white,1);
		xp += 40;
	}
	
	if(glassShield > 0) {
		draw_sprite_ext(spr_glass_defense,0,round(x),y,1.4,1.4,0,c_white,1);
		glassShield -= dt;
		if(glassShield <= 0) {
			broken = 180;
		}
	}
	
	if(blocking > 0) {
		draw_sprite_ext(spr_defense,0,round(x),y,1.4,1.4,0,c_white,1);
		blocking-= dt;
	}

	if(poison > 0) {
		draw_sprite_ext(spr_poison,0,xp,yp,1,1,0,c_white,poison/100);
		xp += 40;
	}
	
	if(tossGrabbed > 0)
		draw_sprite_ext(spr_hand,0,round(x),yp,1,1,0,c_white,tossGrabbed/30);
	
	if(decay > 0) {
		draw_sprite_ext(spr_decay,0,xp,yp,1,1,0,c_white,decay/100);
		xp += 40;
		decay-= dt;
	}
	
	if(kicking > 80) {
		draw_sprite_ext(spr_kick,0,xp,yp,1,1,0,c_white,1);
		xp += 40;
		kicking -= dt;
	} else if(kicking > 0) {
		kicking -= dt;
	}
	
	if(spellShield > 0) {
		draw_sprite_ext(spr_spellShield,0,round(x),round(y),2,2,0,c_white,spellShield/100);
		spellShield-= dt;
	}
	
	if(broken > 0) {
		draw_sprite_ext(spr_broken,0,xp,yp,1,1,0,c_white,broken/100);
		broken -= dt;
		xp += 40;
	}
	
	if(frost > 0) {
		draw_sprite_ext(spr_frost,0,xp,yp,1,1,0,c_white,frost/100);
		frost -= dt;
		xp += 40;
	}
	
	if(stunned > 0) {
		draw_sprite_ext(spr_stun,0,xp,yp,1.5,1.5,stunned*4,c_white,stunned/100);
		xp += 40;
		stunned-= dt;
	}
	
	if(oil > 0) {
		ins = instance_create(round(x),round(y),obj_oil)
		ins.num = num
		oil -= dt;
	}
	
	if(cryo > 0) 
		draw_sprite_ext(HD_ice,0,round(x),round(y),.15,.15,0,c_white,cryo/100);
}