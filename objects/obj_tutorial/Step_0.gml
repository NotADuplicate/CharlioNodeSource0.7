/// @description Insert description here
// You can write your code in this editor
if(stage == 0 && obj_dummy.hp > 200) {
	tutText = "Go into your spawn area (green square at the top) and press P to open the shop"
	stage = 1;
	remindingText = true;
	reminderTimer = 450;
	alarm[6] = 450;
}
else if(stage == 1 && global.shop) {
	tutText = "Click on a gun to select your new primary fire. \n Press P to exit the shop and test it."
	textY = 400
	textX = 300
	stage = 2;
	surface = true
	remindingText = false;
	textScale = 1;
}
else if(stage == 2 && global.attack != obj_bullet && global.shop == false) {
	surface = false;
	tutText = "Shooting guns requires ammo. \n Ammo is displayed at the top of the screen and on the bar below your character"
	textX = 550;
	textY = 675;
	if(global.shop) {
		arrowX = 0;
		arrowY = 0;
	} else {
		arrowX = 500;
		arrowY = 90
	}
	stage = 3;
	alarm[1] = 1000;
}
if(stage == 3) {
	if(global.shop) {
		arrowX = 0;
		arrowY = 0;
	} else {
		arrowX = 500;
		arrowY = 90
	}
	if(global.shop) {
		surface = true;
		//obj_shop.wipe = true;
		textY = 100
		textX = 300
		tutText = "Try out a few new guns"
	}
	else {
		surface = false;
		textX = 550;
		textY = 675;
		tutText = global.atktext + "\n" + scr_gun_text(global.attack)
	}
}
if(stage == 4) {
	if(global.shop) {
		surface = true;
		if(global.shopState == "Abilities") {
			tutText = "Click on an ability to select it \n then click on an ability slot at the bottom left to equip it. \n You have 3 ability slots which each use different buttons."
		}
		else {
			textY = 400
			textX = 300
			tutText = "Click on 'Abilities' in the top left to see abilities"
		}
	}
	else {
		surface = false;
		textX = 550;
		textY = 675;
		if(global.leveled < 5) {
			textScale = 1;
			alarm[6] = 450;
			global.levelSpent = 0;
			stage = 5;
			surface = false; 
			button = "right click"
			//Find what you selected
			if(global.space == Abilities.molotov) 
				button = "space"
			else if(global.right == Abilities.molotov)
				button = "right click"
			else if(global.Q == Abilities.molotov)
				button = "Q"
		}
		tutText = "Go back to the shop to get abilities"
	}
}

if(stage == 5) {
	textX = 550;
	textY = 600;
	tutText = "Hold " + button + " to aim the molotov and release to throw. \n Use the molotov cocktail to burn the dummy to death"
	if(obj_dummy.burn > 0 && obj_dummy.hp < 10) {
		textScale = 1;
		alarm[6] = 600;
		stage = 6;
		
		select_Q.visible = true;
		select_space.visible = true;

		ob = instance_create(200,4500,inst_utility);
		ob.utility = Abilities.armorBreak;
		ob = instance_create(250,4500,inst_utility)
		ob.utility = Abilities.finisher;
		ob = instance_create(300,4500,inst_utility)
		ob.utility = Abilities.dash;
		
		with(inst_utility) {
			drawOnce = 2;
		}

		drawAbilities = true;
		obj_shop.wipe = true;
	}
}
if(stage == 6) {
	if(global.shop && drawAbilities) {
		with(inst_utility) {
			drawOnce = 3;
		}
		drawAbilities = false;
	}
	if(global.shop == false) {
		textX = 550;
		textY = 600;
		tutText = "Go back to the shop to get more abilities"
	}
	else if(global.shopState == "Abilities") {
		surface = true;
		textY = 400
		textX = 300
		tutText = "Fill up your ability slots. Each ability costs a level"
		arrowX = 120;
		arrowY = 60;
		if(global.leveled < 4) {
			textScale = 1;
			remindingText = false;
			stage = 7;
			surface = false;
			obj_shop.wipe = true;
			with(inst_utility) {
				drawOnce = 2;
			}
			arrowX = 0;
			arrowY = 0;
		}
	}
}
else if(stage == 7 && global.shop == false) {
	if(alarm[3] < 1) 
		alarm[3] = 150;
		textX = 550;
		textY = 600;
		tutText = "Your 3 abilities can be activated by right click, Q, and spacebar. \n All abilities cost ammo and have a cooldown period"
}
if(stage == 8) {
	if(global.shop) {
		if(global.shopState == "Abilities") {
			textY = 400
			textX = 300
			if(surface == false) {
				surface = true;
				obj_shop.wipe = true;
				with(inst_utility) {
					drawOnce = 2;
				}
			}
			tutText = "Click the passives tab in the top right"
		}
		else {
			textY = 450
			if(surface == false) {
				surface = true;
				obj_shop.wipe = true;
				with(inst_utility) {
					drawOnce = 2;
				}
			}
			tutText = "Click on a passive to see what it does.\nDouble click it to select it"
		}
	}
	else {
		surface = false
		textX = 550;
		textY = 600;
		tutText = "Go back to the shop to select passives"
	}
	if(global.passiveCount > 0 && remindingText) { //progress once you buy a passive
		remindingText = false;
		textScale = 1;
		alarm[4] = 300;
	}
}
else if(stage == 9) { //go to ball
	if(global.shop == false) {
		surface = false;
		textX = 550;
		textY = 600;
		tutText = "Press M to see the map"
	}
	if(keyboard_check(global.mapKey)) {
		stage = 10;
		textScale = 1;
		remindingText = false;
	}
}
else if(stage == 10) { //go to ball
		surface = false;
		textX = 550;
		textY = 200;
		tutText = "Go to the ball in the middle of the top of the map"
	if(point_distance(ball_player.x,ball_player.y,obj_bigBall.x,obj_bigBall.y) < 500) {
		stage = 11;
		remindingText = true;
		alarm[6] = 600;
	}
}
else if(stage == 11) { //push into       
		surface = false;
		textX = 550;
		textY = 600;
		tutText = "Push the ball left to the enemy tower\n The ball can be pushed with your body or your gun and some abilities"
		if(point_distance(2100,700,obj_bigBall.x,obj_bigBall.y) < 500) { //ball gets close to tower
			stage = 12;
			textScale = 1;
			alarm[6] = 3000;
		}
}
else if(stage == 12) { //push into tower
	surface = false;
	textX = 550;
	textY = 600;
	tutText = "Standing close to enemy tower deals damage to you. \n Destroy the tower by pushing the ball into it"
	if(instance_number(obj_turret) < 6) {
		stage = 13;
		textScale = 1;
		alarm[6] = 450;
		drawAbilities = true;
	}
}
else if(stage == 13) {
	tutText = "You can hold B in order to return back to your spawn";
	if(position_meeting(ball_player.x,ball_player.y, obj_regen)) {
		textScale = 1;
		remindingText = false;
		stage = 14;
		alarm[5] = 1000;
		global.leveled = 5;
		obj_shop.wipe = true;

		ob = instance_create(200,4400,inst_utility);
		ob.utility = Abilities.blastOff;
		ob = instance_create(250,4400,inst_utility)
		ob.utility = Abilities.bloodshot;
		ob = instance_create(300,4400,inst_utility)
		ob.utility = Abilities.frost;
		ob = instance_create(200,4300,inst_utility);
		ob.utility = Abilities.block;
		ob = instance_create(250,4300,inst_utility)
		ob.utility = Abilities.healBomb;
		ob = instance_create(300,4300,inst_utility)
		ob.utility = Abilities.flash;
		with(obj_shop) {
			alarm[2] = 1;
		}
	}
}
else if(stage == 14) {
	tutText = "There are more abilities and passives now available to you.";
	
	if(global.shop && drawAbilities) {
		with(inst_utility) {
			drawOnce = 3;
		}
		drawAbilities = false;
	}
}
else if(stage == 15) { 
	global.teleportTimer = 0;
	tutText = "There are monsters that are represented by icons on the map. \n Press M to view the map and teleport to a monster";
	if(keyboard_check(global.mapKey)) { 
		arrowX = 875;
		arrowY = 577;
	} else {
		arrowX = 0;
		arrowY = 0;
	}
	
	nearestMonster = instance_nearest(ball_player.x,ball_player.y,obj_monster);
	if(point_distance(ball_player.x,ball_player.y, nearestMonster.x, nearestMonster.y) < 300) {
		stage = 16;
	}
}
else if(stage == 16) {
	tutText = "Killing monsters gives you a temporary buff.";
}