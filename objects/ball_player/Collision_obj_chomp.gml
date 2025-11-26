/// @description Get bit 
if(global.invincibility == 0 && other.active && global.teamNum[other.num] != global.teamNum[num]) {
	scr_damage(other.dmg,other.num,false, spr_fangs, false);
	biteNum = other.num
	biteHeal = other.dmg * global.players[other.num].magic/global.resistance;
	if(chummed> 0)
		biteHeal += 200
	other.active = false;
	with(ball_game) {
		node_send(buffer,"eventName","Targeted Status","Target",other.biteNum,"User",other.biteHeal,"Status Num", 2)
	}
}