/// @desc Draws the composited shadow map
/// @arg x The X position at which to draw the shadow map
/// @arg y The Y position at which to draw the shadow map
function draw_shadow_map(argument0, argument1) {

	var X = argument0;
	var Y = argument1;
	var surface = global.worldShadowMap;

	//
	//	Set subtractive blend mode
	//
	gpu_set_blendmode(bm_subtract);

	//
	//	Subtract world light map from the shadow
	//
	shader_set(__WORLD_SHADOW_MAP_SHADER);

	// Shadow intensity
	shader_set_uniform_f(global.u_AmbientShadow, global.ambientShadowIntensity);
	shader_set_uniform_i(global.u_EnvironmentPass, false);
	shader_set_uniform_i(global.u_VisualPass, false);
	shader_set_uniform_f_array(global.u_TexelSize_ShadowMap, [1.0 / surface_get_width(surface), 1.0 / surface_get_height(surface)]);

	//
	// Draw shadow map to the screen
	//
	draw_surface(surface, X, Y);

	if(global.lightingEnvironmentReady && surface_exists(global.lightingEnvironmentSurface)) {
		texture_set_stage(global.u_Environment, surface_get_texture(global.lightingEnvironmentSurface));
		shader_set_uniform_i(global.u_EnvironmentPass, true);
		shader_set_uniform_f(global.u_EnvironmentVisibility, global.environmentDarknessVisibility);
		// RGB is already weighted by darkness; do not multiply it by source alpha.
		gpu_set_blendmode_ext_sepalpha(bm_one, bm_one, bm_zero, bm_one);
		draw_surface(surface, X, Y);
	}

	// Reuse the vision texture and shader; no cosmetic shadow maps or surfaces.
	var renderer = instance_find(obj_light_renderer, 0);
	if(renderer != noone && (array_length(renderer.lighting_flashes) > 0 || instance_exists(obj_fire))) {
		shader_set_uniform_i(global.u_EnvironmentPass, false);
		shader_set_uniform_i(global.u_VisualPass, true);
		gpu_set_blendmode_ext_sepalpha(bm_one, bm_one, bm_zero, bm_one);
		for(var i = 0; i < array_length(renderer.lighting_flashes); ++i) {
			var flash = renderer.lighting_flashes[i];
			var fade = flash.remaining / flash.duration;
			lighting_draw_visual_light(surface, X, Y, flash.x, flash.y, flash.radius,
				flash.intensity * fade * fade, flash.colour);
		}
		// Draw from living instances: no registration, repeated flashes or cleanup.
		with(obj_fire) {
			lighting_draw_visual_light(surface, X, Y, x, y, light_radius * light_flicker,
				light_intensity * light_flicker, light_colour);
		}
		shader_set_uniform_i(global.u_VisualPass, false);
	}

	shader_reset();

	//
	//	Reset blend mode
	//
	gpu_set_blendmode(bm_normal);


}

/// @desc Short cosmetic flash at a world position; intensity is 0..1.
function lighting_flash(_x, _y, _intensity = 0.6) {
	var renderer = instance_find(obj_light_renderer, 0);
	if(renderer == noone || _intensity <= 0) return;
	// Bound the worst-case draw cost of simultaneous explosions.
	if(array_length(renderer.lighting_flashes) >= 16) array_delete(renderer.lighting_flashes, 0, 1);
	array_push(renderer.lighting_flashes, {
		x: _x, y: _y, radius: 240, duration: 0.2,
		remaining: 0.2, intensity: clamp(_intensity, 0, 1), colour: $55B4FF
	});
}

/// @desc Draw one bounded cosmetic light while the vision shader/additive pass is active.
function lighting_draw_visual_light(_surface, _camera_x, _camera_y, _x, _y, _radius, _intensity, _colour) {
	var width = surface_get_width(_surface);
	var height = surface_get_height(_surface);
	var sx = _x - _camera_x;
	var sy = _y - _camera_y;
	// A source outside the visible camera cannot contribute a glow.
	if(sx < 0 || sy < 0 || sx >= width || sy >= height) return;
	var left = max(0, floor(sx - _radius));
	var top = max(0, floor(sy - _radius));
	var right = min(width, ceil(sx + _radius));
	var bottom = min(height, ceil(sy + _radius));
	shader_set_uniform_f(global.u_VisualLight, sx / width, sy / height, _radius);
	draw_surface_part_ext(_surface, left, top, right - left, bottom - top,
		_camera_x + left, _camera_y + top, 1, 1, _colour, _intensity);
}
