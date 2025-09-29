/// @description Increase text size for reminding
if(remindingText) {
	if(textScale < 1.5)
		textScale += .25;
	alarm[6] = reminderTimer;
}