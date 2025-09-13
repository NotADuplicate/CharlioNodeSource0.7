/// @description Get bit
if(other.active) {
	other.active = false
	scr_monster_dmg(other.dmg,other.num,false)
	biteNum = other.num
	biteHeal = other.dmg
	if(other.num == ball_player.num) {
		with(ball_game) {
		node_send(buffer,"eventName","Targeted Status", "Target", other.biteNum, "User", other.biteHeal, "Status Num", 2)
		}
	}
}