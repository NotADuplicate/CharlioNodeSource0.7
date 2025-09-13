/// @description Insert description here
// You can write your code in this editor
if(other.num != num) {
    scr_damage(7,other.num);
	instance_destroy(other);
	if(burn < 200)
		burn += 10;
}