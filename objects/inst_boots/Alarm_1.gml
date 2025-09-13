/// @description Insert description here
// You can write your code in this editor
if(selected == 0) {
	selected = 1
}
else if(selected == 1 && (global.leveled > 0 || global.boot != "") && global.bootsObj != self) {
	if(global.boot == "")
		global.leveled--;
	global.bootsObj = self
	if(global.boot = "Speed") {
		global.baseMove--;
		ball_player.moveSpd--;
	}
	alarm[0] = 1;
	with(ball_game) {
		node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",0,"Ability",-1, "PassiveSprite", other.spr)
	}
	audio_play_sound(snd_buy,1,false)
}