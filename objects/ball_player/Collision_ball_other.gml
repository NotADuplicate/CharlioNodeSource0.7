/// @description Ramming speed and death touch
if(other.murderball > 0 && other.murderball < 140)
	scr_damage(300,num,false)
	
if(other.ramming && rammed == 0) {
	scr_damage(other.spdDmg,other.num,false);
	rammed = 45;
}
/*if(global.ramming) {
	
}