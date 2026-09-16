if(global.finishedTutorial) {
	modal = instance_create(0,0,obj_modal);
	modal.txt = "You're ready to play!\nConnect to find a lobby and start balling!"
	global.finishedTutorial = false;
}