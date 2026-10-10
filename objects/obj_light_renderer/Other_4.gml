/// @desc Capture tile and background layers in this room
environment_layers = [];
var layers = layer_get_all();
for(var i = 0; i < array_length(layers); ++i) {
	var layer_id = layers[i];
	var elements = layer_get_all_elements(layer_id);
	for(var j = 0; j < array_length(elements); ++j) {
		var type = layer_get_element_type(elements[j]);
		if(type == layerelementtype_tilemap || type == layerelementtype_background) {
			array_push(environment_layers, [layer_id, layer_get_script_begin(layer_id), layer_get_script_end(layer_id)]);
			layer_script_begin(layer_id, lighting_environment_layer_begin);
			layer_script_end(layer_id, lighting_environment_layer_end);
			break;
		}
	}
}
