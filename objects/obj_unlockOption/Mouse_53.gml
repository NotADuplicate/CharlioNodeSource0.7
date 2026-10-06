if(!global.options) {
	var cardHalfWidth = 190;
	var cardLeft = x-cardHalfWidth;
	var cardRight = x+cardHalfWidth;
	var cardTop = 140;
	var cardBottom = 720;

	var hovered = point_in_rectangle(
		mouse_x,mouse_y,
		cardLeft,cardTop,
		cardRight,cardBottom
	);

	if(hovered) {
		item.unlocked = true;
		scr_set_unlocks();
		with(obj_modal) {
			instance_destroy();
		}
		draw_set_halign(fa_center)
	}
}