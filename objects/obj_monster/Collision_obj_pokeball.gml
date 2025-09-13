/// @description Get captured
if(maxhp < 1000) {//dont work on the big bois
	global.poke = true;
	pokeNum = other.num;
	pokeHp = hp;
	instance_destroy(other)
}