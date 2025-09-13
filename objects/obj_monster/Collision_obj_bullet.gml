/// @description Insert description here
// You can write your code in this editor
if(other.num < 10) {
	if(other.dmg == 24)
		scr_monster_dmg(15,other.num,true)
	else
		scr_monster_dmg(other.dmg*1.5,other.num,true)
	if(other.ammo && other.num == ball_player.num && global.ammo < global.maxAmmo) 
		global.ammo++
}
else {
	hp -= 80;
}
instance_destroy(other);