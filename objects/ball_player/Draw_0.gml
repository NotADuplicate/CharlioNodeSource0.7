/// @description Draw HP and statuses
var dt = delta_time / 35000;

draw_healthbar(round(x)-20,round(y)-(10*(image_yscale))-5,round(x)+20,round(y)-(10*(image_yscale))-15,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);

if(hp > maxhp)
	draw_healthbar(round(x)-20,round(y)-(24*(image_yscale/3+.5)),round(x)+20,round(y)-(18*(image_yscale/3+.5)),200*(hp-maxhp)/maxhp,c_green,c_aqua,c_aqua,0,true,true); //draw overheal
	
draw_healthbar(round(x)-20,round(y)+(24*(image_yscale/3+.5)),round(x)+20,round(y)+(18*(image_yscale/3+.5)),(global.ammo/global.maxAmmo)*100,c_ltgray,c_red,c_green,0,true,true); //draw ammo

if(global.boot == "Charge" && charge > 0) 
	draw_healthbar(round(x)-20,round(y)+34,round(x)+20,round(y)+28,charge/3,c_ltgray,c_white,c_white,0,true,true); //draw charge boots charge
	
if(global.healthText)
	draw_text(round(x),round(y)-(10*(image_yscale))-20,round(hp));

if(back > 0)
	draw_healthbar(round(x)-30,round(y)-36,round(x)+30,round(y)-28,(back/backMax)*100,c_ltgray,c_white,c_white,0,true,true);
	
if(curseCharge > 0)
	draw_healthbar(round(x)-30,round(y)-36,round(x)+30,round(y)-28,curseCharge/(1.5),c_ltgray,c_white,c_white,0,true,true);
	
if(batCharge > 0)
	draw_healthbar(round(x)-30,round(y)-36,round(x)+30,round(y)-28,batCharge,c_ltgray,c_white,c_white,0,true,true);
	
if(sponge)
	draw_circle(round(x),round(y),300,true);

if(stasis == 0) { //draw self i guess???
	draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,c_white,image_alpha)
}
else {
	draw_sprite_ext(spr_stasisAdventure,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,c_white,1)
}
draw_text(round(x),round(y)-(50*(image_yscale/3)) - 27,string_hash_to_newline(global.names[num])); //name

scr_drawStatus();
//player specific shit
	if(shield > 0) {
		draw_sprite_ext(spr_sponge,0,round(x),round(y)-30*(image_yscale/2+.5),1,1,0,c_white,shield/100);
		shield-= dt;
		if(shield <= 0) {
			global.defense = global.defense/2;
			global.resistance = global.resistance/2;
			shield = 0;
		}
	}
	
	if(nugg > 0) {
		draw_sprite(spr_nugg,0,round(x),round(y)-(30*(image_yscale/2+.5)));
		nugg-= dt;
	}

	if(jugg > 0) {
		draw_sprite(spr_jugg,0,round(x),round(y)-(30*(image_yscale/2+.5)));
		jugg-= dt;
	}

if(ninja > 0 && ninjaSlash == false)
	draw_line_width_color(round(x),round(y),round(x)+lengthdir_x(ninja*10,point_direction(round(x),round(y),mouse_x,mouse_y)),round(y)+lengthdir_y(ninja*10,point_direction(round(x),round(y),mouse_x,mouse_y)),5,c_green,c_purple)

// Draw the arc
if(global.throwRange > 0) {
	start_x = x;
	start_y = y;
	if(point_distance(x,y,mouse_x,mouse_y) < global.throwRange) {
		end_x = mouse_x;
		end_y = mouse_y;
	} else {
		var dir = point_direction(x,y,mouse_x,mouse_y);
		end_x = x+lengthdir_x(global.throwRange,dir)
		end_y = y+lengthdir_y(global.throwRange,dir)
	}
	max_height = 90+(global.throwRange-point_direction(x,y,mouse_x,mouse_y))/3;
	control_point_x = (start_x + end_x) / 2;;
	control_point_y = (start_y+end_y)/2 - max_height

	var num_segments = 10+point_distance(start_x,start_y,end_x,end_y)/25; // Adjust for smoothness

	for (var i = 1; i <= num_segments; i++) {
	    var t = i / num_segments;

	    // Calculate point on the Quadratic Bézier curve
	    var curr_x = (1 - t) * (1 - t) * start_x + 2 * (1 - t) * t * control_point_x + t * t * end_x;
	    var curr_y = (1 - t) * (1 - t) * start_y + 2 * (1 - t) * t * control_point_y + t * t * end_y;

	    draw_circle(curr_x,curr_y,3,false)
	}
	
	if(global.throwRange < 800)
		global.throwRange+=20;
}