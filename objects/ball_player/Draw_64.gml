/// @description Draw gui
draw_set_alpha(0.7)
if(global.ballGameOver == 0 && global.UI) {
	if((!instance_exists(obj_tutorial) || obj_tutorial.stage > 5)) {
		if(global.levelSpent > 9) {
			levelDrawOffset += 6;
			global.levelSpent--
		} else if(global.levelSpent > 3) {
			levelDrawOffset -= 6;
			global.levelSpent--
		} else if(global.levelSpent > 0) {
			levelDrawOffset += 6;
			global.levelSpent--
		}
		else {
			levelDrawOffset = 0;
		}
		if(global.gameMode != "Rumble") {
			
			//draw_healthbar(20+levelDrawOffset,20,300+levelDrawOffset,40,100*(global.xp/global.xpMax),c_dkgray,c_white,c_white,0,true,true)
			//draw_text_color(160+levelDrawOffset,20,global.leveled,c_black,c_black,c_black,c_black,1);
			draw_sprite_ext(spr_levelBar,0,50,50,0.4,0.5,0,c_white,0.8)
			draw_healthbar(50,45,221,53,100*(global.xp/global.xpMax),c_black,#FDD354,#FDD354,0,true,true)
			draw_sprite_ext(spr_levelDiamond,0,35,35,0.3,0.3,0,c_white,0.8);
			draw_text_transformed_colour(35,21,global.leveled,1.5,1.5,0,#FDD354,#FDD354,#FDD354,#FDD354,1)
		}
	}

	if(keyboard_check(vk_tab) == false && (!instance_exists(obj_tutorial) || obj_tutorial.stage > 0)) {
		if(global.dead) 
			draw_text(500,40,round(respawnTimer)); 
		else if(global.shop == false && (!instance_exists(obj_tutorial) || obj_tutorial.stage > 2)) {
			draw_sprite_ext(spr_frame,0,512,40,0.75,0.75,0,c_white,0.75);
			draw_text_transformed_colour(512,12,string_hash_to_newline(global.ammo),2,2.5,0,#FDD354,#FDD354,#FDD354,#FDD354,0.8);
		}
	}

	numAbilities = (global.right != 0) + (global.space != 0) + (global.Q != 0) + (global.R != 0)
	if((global.shop == false && global.dead == false) || global.gameMode == "Royale") {
		yp = 710;
		xp = 552-(64*(numAbilities-1));
		if(numAbilities > 0) {
			draw_sprite_ext(spr_frameMiddle, 0, (xp+numAbilities*32-32),yp-1,numAbilities*1.35-0.9,0.4,0,c_white,1);
			draw_sprite_ext(spr_frameEdge, 0, xp-20,yp-1,0.45,0.4,0,c_white,1);
			draw_sprite_ext(spr_frameEdge, 0, xp+numAbilities*64-44,yp-1,-0.45,0.4,0,c_white,1);
		}
		if(global.right != 0) {
			rightCoolMax = scr_ability_UI(xp,yp,global.right, global.rightCool, rightCoolMax, global.rightbutton, "rightHover");
			xp += 64;
		}
		if(global.Q != 0) {
			QCoolMax = scr_ability_UI(xp,yp,global.Q, global.QCool, QCoolMax, global.Qbutton, "QHover");
			xp += 64;
		}
		if(global.space != 0) {
			spaceCoolMax = scr_ability_UI(xp,yp,global.space, global.spaceCool, spaceCoolMax, global.spacebutton, "spaceHover");
			xp += 64;
		}
		if(global.R != 0) {
			RCoolMax = scr_ability_UI(xp,yp,global.R, global.RCool, RCoolMax, global.Rbutton, "RHover");
		}
	}
}
draw_set_alpha(1)