///Take damage
if(other.num != num) {
	hp -= round(other.dmg*3);
	if(hp < 1) {
		pirate_game.killnum = other.num;
	}
	instance_destroy(other);
}