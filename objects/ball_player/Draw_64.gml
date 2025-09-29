/// @description Draw gui
if(!instance_exists(obj_tutorial) || obj_tutorial.stage > 5) {
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
	draw_healthbar(20+levelDrawOffset,20,300+levelDrawOffset,40,100*(global.xp/global.xpMax),c_dkgray,c_white,c_white,0,true,true)
	draw_text_color(160+levelDrawOffset,20,global.leveled,c_black,c_black,c_black,c_black,1);
}

if(keyboard_check(vk_tab) == false && (!instance_exists(obj_tutorial) || obj_tutorial.stage > 0)) {
	if(global.dead)
		draw_text(500,40,string_hash_to_newline(round(respawnTimer)));
	else if(global.shop == false)
		draw_text(500,30,string_hash_to_newline(global.ammo));
}



if((global.shop == false && global.dead == false) || global.gameMode == "Royale") {
	yp = 710;
	xp = 300;
	rightCoolMax = scr_ability_UI(xp,yp,global.right, global.rightCool, rightCoolMax, global.rightbutton, "rightHover");
	xp += 64;
	QCoolMax = scr_ability_UI(xp,yp,global.Q, global.QCool, QCoolMax, global.Qbutton, "QHover");
	xp += 64;
	spaceCoolMax = scr_ability_UI(xp,yp,global.space, global.spaceCool, spaceCoolMax, global.spacebutton, "spaceHover");
	xp += 64;
	RCoolMax = scr_ability_UI(xp,yp,global.R, global.RCool, RCoolMax, global.Rbutton, "RHover");
}