/// @desc Executed before compositing the lighting map
function lighting_pre_composite() {

	// Reset counters
	global.worldRebuiltLights = 0;
	global.worldActiveShadowCasters = 0;

	// Get the camera
	var camera = lighting_get_active_camera();
	var camera_x = camera[eLightingCamera.X];
	var camera_y = camera[eLightingCamera.Y];
	var camera_right = camera_x + camera[eLightingCamera.Width];
	var camera_bottom = camera_y + camera[eLightingCamera.Height];

	// ball_cam's position is the center of the player's view. Use instance
	// bounds for this cheap rejection, before walking any polygon vertices.
	var region_enabled = instance_exists(ball_cam);
	var region_left, region_top, region_right, region_bottom;
	if(region_enabled) {
		var focus = instance_find(ball_cam, 0);
		region_left = focus.x - 1000;
		region_top = focus.y - 550;
		region_right = focus.x + 1000;
		region_bottom = focus.y + 550;
		global.lightingCasterRegion = [region_left, region_top, region_right, region_bottom];
	}
	else global.lightingCasterRegion = undefined;

	with(obj_shadow_caster) {
		outside_lighting_region = region_enabled && (bbox_right < region_left
			|| bbox_left > region_right || bbox_bottom < region_top || bbox_top > region_bottom);
		if(outside_lighting_region) continue;

		// Get shadow caster flags
		var shadow_caster_dirty = (flags & eShadowCasterFlags.Dirty) != 0;
		var shadow_caster_static = (flags & eShadowCasterFlags.Static) != 0;

		// Update this shadow caster's polygon if necessary
		var bounds_changed = shadow_caster_dirty || !shadow_caster_static || cached_polygon_area == undefined;
		if(bounds_changed) {
			// Rebuild polygon cache
			cached_polygon_area = polygon_get_area(polygon);
		}
		if(bounds_changed || last_camera == undefined || !array_equals(last_camera, camera)) {
			// Bounds or camera changed; retain the same overlap test for partial visibility.
			// Get whether the polygon is outside the active camera
			outside_active_camera = !rectangle_in_rectangle(cached_polygon_area[0], cached_polygon_area[1], cached_polygon_area[2], cached_polygon_area[3],
															camera_x, camera_y, camera_right, camera_bottom);
			// And keep track of the camera we compared against
			last_camera = camera;
		}
	}


}
