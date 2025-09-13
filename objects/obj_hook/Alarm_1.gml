/// @description Establish link
if(instance_exists(ball_player)) {
    with(ball_other) {
        if(num == other.num) {
            other.link = self;
        }
    }
    with(ball_player) {
        if(num == other.num) {
            other.link = self;
        }
    }
	x = link.x;
	y = link.y;
}
else {
    instance_destroy();
	show_debug_message("Destroyed through missing link");
}