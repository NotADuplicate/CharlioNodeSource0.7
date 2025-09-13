/// @description Insert description here
// You can write your code in this editor
if(pokeNum == 0) {
	if(hp < maxhp)
		hp += regen;
}
else
	hp = pokeHp
if(invin > 0)
	invin--;
	
if(burn > 0) {
	burn--;
	if(burn mod 5 == 0) {
		if(oil > 0)
			hp-=3;
		else
			hp--;
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	}
}
oil--;
broken--;