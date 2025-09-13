/// @description Spectating
if(global.spectator) {
	/*if(mouse_check_button(mb_right)) {
		x = cameraPinx + (mousePinx-mouse_x)
		y = cameraPiny + (mousePiny-mouse_y)
	}*/
	if(linked) {
		if(link.x < 10)
			linked = false
		else {
			x = link.x;
			y = link.y;
		}
		if((keyboard_check(ord("D"))-keyboard_check(ord("A"))) != 0 || (keyboard_check(ord("S"))-keyboard_check(ord("W"))) != 0)
			linked = false;
	}
	else {
	    x += 8*(keyboard_check(ord("D"))-keyboard_check(ord("A")))
	    y += 8*(keyboard_check(ord("S"))-keyboard_check(ord("W")))
	}
}
/*		mousePinx = mouse_x;
		mousePiny = mouse_y;
		cameraPinx = x;
		cameraPiny = y;