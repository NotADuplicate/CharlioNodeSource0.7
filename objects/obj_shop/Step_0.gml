// cancel pending when closing shop
if(!global.shop && global.pendingLevels > 0) {
	with(inst_passive) {
		global.leveled += pendingStacks;
		pendingStacks = 0;
	}
	global.pendingLevels = 0;
}