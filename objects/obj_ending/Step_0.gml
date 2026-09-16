/// @description Insert description here
// You can write your code in this editor
ball_game.lore = lore;
if(image_xscale < 160) {
	image_xscale += 1;
	image_yscale += 1;
}	
else {
	instance_destroy();
	if(instance_exists(obj_tutorial)) {
		global.finishedTutorial = true;
		instance_destroy(inst_game);
		instance_destroy(obj_tutorial);
		room_goto(room1);
	}
}
