if(active && global.teamNum[num] != global.teamNum[other.num]) {
	active = false;
	other.bleed = 150;
	other.bleedNum = num;
}