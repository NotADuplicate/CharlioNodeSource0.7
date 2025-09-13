/// @description Insert description here
// You can write your code in this editor
if(!pause) {
	light[| eLight.Direction] = 0;
	light[| eLight.Flags] |= eLightFlags.Dirty;
	// We have to do another lighting pass because we've disabled doing it automatically
	lighting_set_dirty(true);
}