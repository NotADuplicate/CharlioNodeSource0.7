/// @description Tick

++tick;

// Expire flashes in Step so lifetime is independent of draw count/viewports.
for(var i = array_length(lighting_flashes) - 1; i >= 0; --i) {
	lighting_flashes[i].remaining -= delta_time * 0.000001;
	if(lighting_flashes[i].remaining <= 0) array_delete(lighting_flashes, i, 1);
}
