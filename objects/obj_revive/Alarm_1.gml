/// @description Link to souls
if(instance_exists(ball_player)) {
    with(ball_other) { //attach chain to a player
        if(num == other.num) {
            other.link = self;
        }
    }
    with(ball_player) {
        if(num == other.num) {
            other.link = self;
        }
    }
}
else
    instance_destroy();

with(ball_corpse) {
	if(point_distance(x,y,other.x,other.y) < 200) {
		if(global.teamNum[num] == global.teamNum[other.num]) {
			reviving = other;
		}
	}
}