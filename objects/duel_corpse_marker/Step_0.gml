/// @description Warp corpse to preduel location
var corpseExists = false;
with(ball_corpse) {
	if(num == other.num) { //this means they died in the duel dimension
		corpseExists = true;
		var duelingOther = instance_nearest(x,y,ball_other)
		var duelingPlayer = instance_nearest(x,y,ball_player)
		var stillDueling = false;
		if(duelingOther != noone && duelingOther.x < 6480 && duelingOther.x> 5000 && duelingOther.y > 3800 && duelingOther.y < 5200) {
			stillDueling = true;
			show_debug_message("Dueling other in range");
		} else if(duelingPlayer.x < 6480 && duelingPlayer.x> 5000 && duelingPlayer.y > 3800 && duelingPlayer.y < 5200) {
			stillDueling = true;
			show_debug_message("Dueling player in range");
			show_debug_message(ball_player.x);
		}
		
		if(!stillDueling) {
			show_debug_message("Not still dueling");
			x = other.x;
			y = other.y;
			instance_destroy(other);
		}
	}
}
if(!corpseExists) {
	vanish++;
	if(vanish > 30) {
		show_debug_message("Vanishing");
		instance_destroy();
	}
}