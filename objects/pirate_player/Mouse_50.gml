/// @description Insert description here
// You can write your code in this editor
if(shopping == false && pirate && beast == false) {
	if(reload == 0 && clip > 0) {
		scr_pirate_shoot(dev,global.attack);
		if(dev < 45)
			dev += 3;
		clip--;
		switch(global.attack) {
			case pirate_bullet:
				reload = 2;
			break;
			case obj_shotgun:
				reload = 30;
			break;
		}
	}
}