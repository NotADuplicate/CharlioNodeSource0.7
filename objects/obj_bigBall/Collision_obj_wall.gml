/// @description Get pushed
if(other.hp < speed*5) {
	speed -= other.hp/5;
	instance_destroy(other);
}
else {
	other.hp -= speed*5
	move_bounce_all(true)
}