/// @description When mouse leaves self
if(room != room1 && clicked && variable_global_get(abilityVar) != 0) { //start dragging away
	if(mouse_x > xp + 22 || mouse_x < xp - 22 || mouse_y > yp + 22 || mouse_y < yp-22) {
		global.utilitySwapHeld = true;
		global.utilityHeld = true;
		global.utilityClass = variable_global_get(abilityVar);
		clicked = false;
	}
}