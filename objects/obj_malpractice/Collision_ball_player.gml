if(active && global.teamNum[num] != global.teamNum[other.num]) {
	active = false;
	other.bleed = 120;
	other.bleedNum = num;
}