/// @description Back (B)
global.stun += 1;
if(x == ball_game.lastX && y == ball_game.lastY && global.stun < 3) {
	back++;
	if(back > backMax) {
		x = startingX;
		y = startingY;
		global.ammo = global.maxAmmo
		back = 0;
		if(backReset) {
			global.QCool = 0;
			global.spaceCool = 0;
			global.rightCool = 0;
		}
	}
}
else
	back = 0;