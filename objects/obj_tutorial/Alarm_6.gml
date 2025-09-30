/// @description Increase text size for reminding
if(remindingText) {
	textShake = 8;
	if(textScale < 1.3)
		textScale += .15;
	alarm[6] = reminderTimer;
}