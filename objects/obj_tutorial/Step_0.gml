/// @description Insert description here
// You can write your code in this editor
if(stage == 0 && obj_dummy.hp > 200) {
	tutText = "Go into your spawn area (green square at the top) and press P to open the shop"
	stage = 1;
}
if(stage == 1 && global.shop) {
	tutText = "Click on a gun to select your new primary fire. \n Press P to exit the shop and test it."
	textY = 400
	textX = 300
	stage = 2;
	surface = true
}
if(stage == 2 && global.attack != obj_bullet && global.shop == false) {
	surface = false;
	tutText = "Shooting guns requires ammo. \n Ammo is displayed at the top of the screen and on the bar below your character"
	textX = 550;
	textY = 675;
	arrowX = 500;
	arrowY = 90
	stage = 3;
	alarm[1] = 1000;
}
if(stage == 3) {
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
	tutText = "Press " + button + " to use the ability. \n Use the molotov cocktail to burn the dummy to death"
	if(obj_dummy.burn > 0 && obj_dummy.hp < 10) {
		stage = 6;
		obj_shop.wipe = true;
		with(inst_utility) {
			drawOnce = 2;
		}
		select_Q.visible = true;
		select_space.visible = true;

		ob = instance_create(200,4500,choose_pierce)
		ob.drawOnce = 0;
		ob = instance_create(250,4500,choose_finisher)
		ob.drawOnce = 0;
		ob = instance_create(300,4500,choose_dash)
		ob.drawOnce = 0;

	}
}
if(stage == 6) {
	if(global.shop == false) {
		textX = 550;
		textY = 600;
		tutText = "Go back to the shop to get more abilities"
	}
	else if(global.shopState == "Abilities") {
		surface = true;
		textY = 400
		textX = 300
		tutText = "Fill up your ability slots. Each ability costs a level"//"Go to the abilities screen and pick out 2 more abilities to fill up your ability slots"
		arrowX = 120;
		arrowY = 60;
		if(global.leveled < 4) {
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

if(stage == 7 && global.shop == false) {
	if(alarm[3] < 1) 
		alarm[3] = 120;
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
	}
}
else if(stage == 10) { //go to ball
		surface = false;
		textX = 550;
		textY = 300;
		tutText = "Go to the ball in the middle of the top of the map"
	if(point_distance(ball_player.x,ball_player.y,obj_bigBall.x,obj_bigBall.y) < 500) {
		stage = 11;
	}
}
else if(stage == 11) { //push into       
		surface = false;
		textX = 550;
		textY = 600;
		tutText = "Push the ball left to the enemy tower\n The ball can be pushed with your body or your gun and some abilities"
	if(point_distance(2100,700,obj_bigBall.x,obj_bigBall.y) < 500) { //ball gets close to tower
		stage = 12;
	}
}
else if(stage == 12) { //push into tower
	surface = false;
	textX = 550;
	textY = 600;
	tutText = "Standing close to enemy tower deals damage to you. \n Destroy the tower by pushing the ball into it"
	if(instance_number(obj_turret) < 6) {
		stage = 13;
	}
}
else if(stage == 13) {
	tutText = "Congrats! That's all the basics of Charlio ball!\nFeel free to explore the map more or use escape to exit and enter a real match!";
}