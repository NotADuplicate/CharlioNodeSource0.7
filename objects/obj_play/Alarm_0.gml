if(global.finishedTutorial) {
	modal = instance_create(0,0,obj_modal);
	modal.txt = "You're ready to play!\n\nAfter every match you'll unlock a new ability or weapon!"
	global.finishedTutorial = false;
	global.gunLock = true;
}