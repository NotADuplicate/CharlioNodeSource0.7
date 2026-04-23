/// @description Draw ability stats if hovered 
if(keyboard_check(vk_tab)) {
	xp = global.teamNum[num] == -1 ? 200 : 824;
	i = 1;
	repeat(3) { //draw 3 white boxes and abilities
		if(global.knownLoadout[num,i] != 0) {
			statUi = scr_stats_UI(global.knownLoadout[num,i], -1);
			var statText = statUi[0];
			var height = statUi[1];
			scr_hover_UI(xp,y+16,statText,self,"hover"+string(i),-1,height)
		}
		xp += 40 * global.teamNum[num];
		i++;
	}
	if(global.knownLoadout[num,4] != 0) {
		statUi = scr_stats_UI(global.knownLoadout[num,i], -1);
		var statText = statUi[0];
		var height = statUi[1];
		scr_hover_UI(xp,y+16,statText,self,"hover"+string(i),-1,height)
	}
}