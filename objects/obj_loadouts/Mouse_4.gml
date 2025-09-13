/// @description Move down to the loadout screen or back up
global.loadoutView = !global.loadoutView;
if(!global.loadoutView) {
	view_set_visible(1,false)
	view_set_visible(0,true)
}
else {
	view_set_visible(0,false)
	view_set_visible(1,true)
}