///Buy if you can afford and visible
if(visible && global.loot >= cost) {
	global.loot -= cost;
	alarm[0] = 1;
	alarm[1] = 2;
}