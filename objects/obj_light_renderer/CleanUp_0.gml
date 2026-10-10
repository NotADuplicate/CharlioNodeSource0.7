/// @desc Restore the room's layer callbacks
for(var i = 0; i < array_length(environment_layers); ++i) {
	var entry = environment_layers[i];
	if(layer_exists(entry[0])) {
		layer_script_begin(entry[0], entry[1]);
		layer_script_end(entry[0], entry[2]);
	}
}
