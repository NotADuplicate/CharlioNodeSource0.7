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

	shader_reset();

	//
	//	Reset blend mode
	//
	gpu_set_blendmode(bm_normal);


}
