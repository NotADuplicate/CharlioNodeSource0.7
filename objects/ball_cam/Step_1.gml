/// @description Spectating
if(global.spectator || global.dead) {
	if(linked) {
		if(link.x < 10)
			linked = false
		else {
			x = link.x;
			y = link.y;
		}
		if(global.spectator) {
			if((keyboard_check(ord("D"))-keyboard_check(ord("A"))) != 0 || (keyboard_check(ord("S"))-keyboard_check(ord("W"))) != 0)
				linked = false;
		}
	}
	else if(global.spectator) {
	    x += 8*(keyboard_check(ord("D"))-keyboard_check(ord("A")))
	    y += 8*(keyboard_check(ord("S"))-keyboard_check(ord("W")))
		if(keyboard_check(vk_shift)) {
		    x += 8*(keyboard_check(ord("D"))-keyboard_check(ord("A")))
		    y += 8*(keyboard_check(ord("S"))-keyboard_check(ord("W")))
		}
	}
}