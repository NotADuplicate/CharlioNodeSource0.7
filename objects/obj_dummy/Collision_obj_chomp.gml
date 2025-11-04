/// @description Get bit 
if(other.active) {
	scr_dummy_damage(other.dmg,other.num,false, spr_bite, false);
	biteNum = other.num
	biteHeal = other.dmg * global.players[other.num].magic
	if(chummed> 0)
		biteHeal += 200
	other.active = false;
	with(ball_game) {
		node_send(buffer,"eventName","Targeted Status","Target",other.biteNum,"User",other.biteHeal,"Status Num", 2)
	}
}