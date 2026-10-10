/// @desc Gets the area of a polygon
/// @arg polygon The polygon to get the area of
/// @returns An array with 4 points
function polygon_get_area(argument0) {

	var polygon = argument0;

	// Number of points in polygon
	var points = polygon[ePolygon.Length];

	// Accumulate in scalars, then allocate the result once. This avoids repeated
	// array reads/writes in the per-vertex loop, preserving the existing comparisons.
	var left = 1000000000;
	var top = 1000000000;
	var right = -1000000000;
	var bottom = -1000000000;
	var vertex_end_index = ePolygon.Count + points;

	for(var i = ePolygon.Count; i < vertex_end_index; ++i) {
		var pt = polygon[i];
		var px = pt[eVertex.X];
		if(px < left) left = px;
		else if(px > right) right = px;
	
		var py = pt[eVertex.Y];
		if(py < top) top = py;
		else if(py > bottom) bottom = py;
	}

	return [left, top, right, bottom];


}
