x = link.x;
y = link.y+30;
visible = link.visible;
if(global.teamNum[link.num] == global.teamNum[ball_player.num] || link.seen == false) {
	visible = false;
}