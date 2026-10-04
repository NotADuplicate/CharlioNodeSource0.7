/// @description Draw shop GUI
if(height > 0) {
	draw_rectangle_color(xp,yp,xp2,yp+height,rectColor,rectColor,rectColor,rectColor,false);
	draw_line_width_color(xp,yp,xp2,yp,6,borderColor,borderColor);
	draw_line_width_color(xp,yp+height,xp2,yp+height,6,borderColor,borderColor);
	draw_line_width_color(xp,yp,xp,yp+height,6,borderColor,borderColor);
	draw_line_width_color(xp2,yp,xp2,yp+height,6,borderColor,borderColor);
}

if(surface_exists(global.shopSurf) == false) {
	global.shopSurf = surface_create(950,700);
}

if(height > 1 && wipe == false) {
	draw_surface_part(global.shopSurf,0,0,xp2-xp,height,xp,yp);
}

surface_set_target(global.shopSurf);

if(tabs) {
	var abilityTabColor = rectColor;
	var passiveTabColor = rectColor;

	if(global.shopState == "Abilities")
		abilityTabColor = tabsColor;
	else
		passiveTabColor = tabsColor;

	draw_rectangle_color(0,0,475,60,abilityTabColor,abilityTabColor,abilityTabColor,abilityTabColor,false);
	draw_rectangle_color(475,0,950,60,passiveTabColor,passiveTabColor,passiveTabColor,passiveTabColor,false);

	draw_line_width_color(0,0,950,0,2,borderColor,borderColor);
	draw_line_width_color(0,60,950,60,2,borderColor,borderColor);
	draw_line_width_color(475,0,475,60,2,borderColor,borderColor);

if(global.shopState == "Abilities") {
	draw_set_alpha(0.28);
	draw_rectangle_color(
		8, 51, 467, 60,
		tabGlowColor, tabGlowColor,
		tabGlowColor, tabGlowColor,
		false
	);

	draw_set_alpha(1);
	draw_rectangle_color(
		8, 56, 467, 60,
		borderColor, borderColor,
		borderColor, borderColor,
		false
	);
}
else {
	draw_set_alpha(0.28);
	draw_rectangle_color(
		483, 51, 942, 60,
		tabGlowColor, tabGlowColor,
		tabGlowColor, tabGlowColor,
		false
	);

	draw_set_alpha(1);
	draw_rectangle_color(
		483, 56, 942, 60,
		borderColor, borderColor,
		borderColor, borderColor,
		false
	);
}

draw_text_transformed(290,20,"Abilities",2,2,0);
draw_text_transformed(634,20,"Passives",2,2,0);
}
else {
	draw_rectangle_color(0,0,950,60,rectColor,rectColor,rectColor,rectColor,false);
}

if(wipe) {
	draw_rectangle_color(0,60,950,700,rectColor,rectColor,rectColor,rectColor,false);
}

switch(global.shopState) {
	case "Abilities":
		draw_line_width_color(650,60,650,700,2,borderColor,borderColor);
		
		if(recentlyHeld > 0) {
			draw_rectangle_color(0,80,950,700,rectColor,rectColor,rectColor,rectColor,false);
			with(inst_utility) {
				drawOnce = 2;
			}
			recentlyHeld--;
		}

		if(global.utilityHeld) {
			recentlyHeld = 2;
		}

		draw_rectangle_color(651,80,940,700,rectColor,rectColor,rectColor,rectColor,false);

		var textY = 180
		if(global.utilityClass != "") {
			draw_sprite_ext(global.utilityClass.sprite,0,785,120,2,2,0,c_white,1)
			draw_text_ext_transformed(785,textY,global.utilityClass.name,25,260,2,2,0);
			textY += string_height_ext(global.utilityClass.name,25,260)*2 + 20;
			draw_text_ext(785,textY,global.utilityClass.text,24,250);
			textY += string_height_ext(global.utilityClass.text,24,250) + 20;
			draw_line_color(700,textY,890,textY,borderColor,borderColor)
			draw_line_color(795,textY+15,795,textY+80,borderColor,borderColor)
			textY += 25;
			draw_text(730,textY,"Ammo Cost")
			draw_text(870,textY,"Cooldown")
			textY += 25;
			draw_text_transformed(730,textY,global.utilityClass.ammoCost,2,2,0)
			draw_text_transformed(870,textY,string(global.utilityClass.cooldown) + "s",2,2,0)
			if(global.insufficientLevels > 1) {
				draw_text_colour(795,565,"Insufficient Levels!",c_red,c_red,c_red,c_red,global.insufficientLevels/10)
				global.insufficientLevels -= 0.5;
			} else {
				draw_text(795,565,"EQUIP TO SLOT")
			}
		}

		/*if(global.free == 0)
			draw_text(770,600,"Swap out an ability for free!");
		else
			draw_text(770,600,string(round(global.free)) + " seconds until free swap");*/
	break;
case "Passives":
	var panelBg = make_color_rgb(22,24,23);
	var panelAlt = make_color_rgb(31,32,29);
	var gold = make_color_rgb(201,157,60);
	var ivory = make_color_rgb(232,225,207);
	var muted = make_color_rgb(120,120,115);
	var availableLevels = global.leveled;

	draw_set_halign(fa_center);
	draw_set_color(panelBg);

	draw_rectangle_color(10,70,575,690,panelBg,panelBg,panelBg,panelBg,false);
	draw_rectangle_color(590,70,940,400,panelBg,panelBg,panelBg,panelBg,false);
	draw_rectangle_color(590,415,940,690,panelBg,panelBg,panelBg,panelBg,false);

	draw_set_color(borderColor);
	draw_rectangle(10,70,575,690,true);
	draw_rectangle(590,70,940,400,true);
	draw_rectangle(590,415,940,690,true);


	if(!instance_exists(obj_tutorial) || obj_tutorial.stage > 7) {
		draw_set_color(ivory);
		draw_text_transformed(260,78,"Mobility",1.4,1.4,0);
		draw_text_transformed(260,193,"Offense",1.4,1.4,0);
		draw_text_transformed(260,319,"Defense",1.4,1.4,0);

		draw_set_color(borderColor);
		draw_line(25,195,560,195);
		draw_line(25,315,560,315);
//		draw_line(25,365,560,365);

		if(!instance_exists(obj_tutorial) || obj_tutorial.stage > 13) {
			draw_set_color(ivory);
			draw_text_transformed(260,448,"Resources",1.4,1.4,0);
			draw_text_transformed(260,578,"Utility",1.4,1.4,0);

			draw_set_color(borderColor);
			draw_line(25,448,560,448);
			draw_line(25,580,560,580);
		}
	}

	var selectedItem;
	var selectedTitle;
	var selectedName;
	var selectedText;
	var selectedSprite;
	var buttonText;
	var buttonEnabled;

var passiveSelected = global.selectedOption != "Weapon";

if(passiveSelected) {
	selectedItem = global.selectedPassive;
	selectedTitle = "SELECTED PASSIVE";
	selectedName = selectedItem.name;
	selectedType = selectedItem.type;
	selectedText = selectedItem.text;
	selectedSprite = selectedItem.sprite;

	if(selectedItem.stacks >= selectedItem.maxStacks) {
		buttonText = "MAX RANK";
		buttonEnabled = false;
	}
	else if(availableLevels <= 0) {
		buttonText = "INSUFFICIENT LEVELS";
		buttonEnabled = false;
	}
	else {
		buttonText = "BUY RANK — 1 LEVEL";
		buttonEnabled = true;
	}
}
else {
	selectedTitle = "SELECTED WEAPON";
	selectedName = scr_gun_name(global.attack);
	selectedType = "PRIMARY WEAPON";
	selectedText = scr_gun_text(global.attack)
	selectedSprite = scr_gun_sprite(global.attack);
	buttonText = "EQUIP — FREE";
	buttonEnabled = true;
}

draw_set_halign(fa_center);
draw_set_color(ivory);
draw_text_transformed(765,82,selectedTitle,1.35,1.35,0);

draw_set_color(borderColor);
draw_line(605,112,925,112);

draw_rectangle_color(
	610,128,690,208,
	c_ltgray,c_ltgray,c_ltgray,c_ltgray,
	false
);

if(sprite_exists(selectedSprite)) {
	if(global.selectedOption == "Weapon") {
		draw_sprite_ext(selectedSprite,0,635,168,2,2,0,c_white,1);
	} else {
		draw_sprite_ext(selectedSprite,0,650,168,2,2,0,c_white,1);
	}
}

draw_set_halign(fa_left);
draw_set_color(ivory);
draw_text_transformed(710,128,selectedName,1.5,1.5,0);

draw_set_color(muted);
draw_text_transformed(710,174,string_upper(selectedType),1,1,0);

draw_set_color(borderColor);
draw_line(710,201,920,201);

draw_set_halign(fa_center);
draw_set_color(ivory);
draw_text_ext(765,220,selectedText,18,290);

if(passiveSelected) {
	draw_set_color(ivory);

	var rankSize = 10;
	var rankGap = 7;
	var rankWidth = selectedItem.maxStacks*rankSize
		+ max(0,selectedItem.maxStacks-1)*rankGap;
	var rankX = 765-rankWidth*.5;

	for(var rank = 0; rank < selectedItem.maxStacks; rank++) {
		if(rank < selectedItem.stacks) {
			draw_rectangle_color(
				rankX,306,
				rankX+rankSize,316,
				ivory,ivory,ivory,ivory,
				false
			);
		}
		else {
			draw_set_color(muted);
			draw_rectangle(
				rankX,306,
				rankX+rankSize,316,
				true
			);
		}

		rankX += rankSize+rankGap;
	}
}

var buttonColor = buttonEnabled ? gold : muted;

draw_rectangle_color(
	610,335,920,385,
	buttonColor,buttonColor,buttonColor,buttonColor,
	false
);

draw_rectangle_color(
	615,340,915,380,
	panelAlt,panelAlt,panelAlt,panelAlt,
	false
);

draw_set_color(buttonColor);
draw_set_halign(fa_center);
draw_text_transformed(765,351,buttonText,1.15,1.15,0);

	draw_set_color(ivory);
	draw_text_transformed(765,427,"PRIMARY WEAPON",1.35,1.35,0);
	draw_set_color(borderColor);
	draw_line(605,457,925,457);

	draw_set_color(muted);
	draw_text(765,665,"Switching weapons is free");

	draw_set_color(c_white);
	draw_set_halign(fa_center);
break;
}

if(!global.shop) {
	if(height > 0)
		height -= 100;
}
else if(height < 700) {
	if(height < 100)
		wipe = true;

	height += 70;
}

surface_reset_target();

if(height > 1 && wipe == true) {
	draw_surface_part(global.shopSurf,0,0,xp2-xp,height,xp,yp);
	wipe = false;
}