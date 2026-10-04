var camera = view_camera[0];

var viewX = camera_get_view_x(camera);
var viewY = camera_get_view_y(camera);
var viewW = camera_get_view_width(camera);
var viewH = camera_get_view_height(camera);

var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

var scaleX = guiW/viewW;
var scaleY = guiH/viewH;

var oldMatrix = matrix_get(matrix_world);

matrix_set(
	matrix_world,
	matrix_build(
		-viewX*scaleX,
		-viewY*scaleY,
		0,
		0,0,0,
		scaleX,
		scaleY,
		1
	)
);

if(age < chargeDuration) {
	gpu_set_blendmode(bm_add);

	for(var i = 0; i < array_length(chargeParticles); i++) {
		var particle = chargeParticles[i];

		var px = x + lengthdir_x(particle.distance,particle.angle);
		var py = y + lengthdir_y(particle.distance,particle.angle);

		var tailDistance = particle.distance + 16;
		var tx = x + lengthdir_x(tailDistance,particle.angle);
		var ty = y + lengthdir_y(tailDistance,particle.angle);

		draw_line_width_color(
			tx,ty,
			px,py,
			particle.size,
			make_color_rgb(20,80,255),
			particle.color
		);

		draw_rectangle_color(
			px-particle.size,
			py-particle.size,
			px+particle.size,
			py+particle.size,
			particle.color,
			particle.color,
			particle.color,
			particle.color,
			false
		);
	}

	var chargeProgress = age/chargeDuration;
	var coreRadius = 3 + chargeProgress*6;

	draw_circle_color(
		x,y,
		coreRadius,
		c_white,
		make_color_rgb(50,160,255),
		false
	);

	gpu_set_blendmode(bm_normal);
	draw_set_color(c_white);
	draw_set_alpha(1);
	exit;
}

var radius = currentRadius;
var t = radius / maxRadius;
var time = age;
var centerX = x;
var centerY = y;

gpu_set_blendmode(bm_add);

var layerRadius = radius * 1.10;
var layerAlpha = 0.18 * (1 - t * 0.35);

draw_primitive_begin(pr_trianglefan);
draw_vertex_color(centerX,centerY,make_color_rgb(20,100,255),layerAlpha);

for(var i = 0; i <= segments; i++) {
	var angle = i / segments * pi * 2;

	var noise =
		sin(angle * 7  + time * 4)  * 0.10 +
		sin(angle * 13 - time * 7)  * 0.06 +
		sin(angle * 29 + time * 11) * 0.035;

	var r = layerRadius * (1 + noise);

	draw_vertex_color(
		centerX + cos(angle) * r,
		centerY + sin(angle) * r,
		make_color_rgb(15,80,255),
		0
	);
}

draw_primitive_end();

layerRadius = radius;
layerAlpha = 0.55;

draw_primitive_begin(pr_trianglefan);
draw_vertex_color(centerX,centerY,make_color_rgb(110,220,255),layerAlpha);

for(var i = 0; i <= segments; i++) {
	var angle = i / segments * pi * 2;

	var noise =
		sin(angle * 8  - time * 5) * 0.075 +
		sin(angle * 17 + time * 8) * 0.045 +
		sin(angle * 37 - time * 13) * 0.025;

	var r = layerRadius * (1 + noise);

	draw_vertex_color(
		centerX + cos(angle) * r,
		centerY + sin(angle) * r,
		make_color_rgb(40,170,255),
		0.08
	);
}

draw_primitive_end();

layerRadius = radius * 0.72;
layerAlpha = 0.90;

draw_primitive_begin(pr_trianglefan);
draw_vertex_color(centerX,centerY,c_white,layerAlpha);

for(var i = 0; i <= segments; i++) {
	var angle = i / segments * pi * 2;

	var noise =
		sin(angle * 6  + time * 8)  * 0.055 +
		sin(angle * 19 - time * 10) * 0.035 +
		sin(angle * 41 + time * 15) * 0.018;

	var r = layerRadius * (1 + noise);

	draw_vertex_color(
		centerX + cos(angle) * r,
		centerY + sin(angle) * r,
		make_color_rgb(170,235,255),
		0.25
	);
}

draw_primitive_end();

for(var ring = 0; ring < 3; ring++) {
	var ringRadius = radius * (0.80 + ring * 0.10);
	var previousX = 0;
	var previousY = 0;

	for(var i = 0; i <= segments; i++) {
		var angle = i / segments * pi * 2;

		var noise =
			sin(angle * (11 + ring * 4) + time * (8 + ring)) * 0.035 +
			sin(angle * 31 - time * 12) * 0.015;

		var r = ringRadius * (1 + noise);
		var px = centerX + cos(angle) * r;
		var py = centerY + sin(angle) * r;

		if(i > 0) {
			var pulse = sin(angle * 18 + time * 14 + ring);

			if(pulse > 0.15) {
				draw_line_width_color(
					previousX,previousY,
					px,py,
					2 + ring,
					c_white,
					make_color_rgb(40,160,255)
				);
			}
		}

		previousX = px;
		previousY = py;
	}
}

for(var i = 0; i < 28; i++) {
	var seed = frac(sin(i * 91.345) * 47453.5453);
	var angle = seed * pi * 2;
	var fragmentLength = radius * (0.06 + frac(seed * 17.3) * 0.12);
	var fragmentRadius = radius * (0.80 + frac(seed * 31.7) * 0.25);

	var x1 = centerX + cos(angle) * fragmentRadius;
	var y1 = centerY + sin(angle) * fragmentRadius;
	var x2 = centerX + cos(angle) * (fragmentRadius + fragmentLength);
	var y2 = centerY + sin(angle) * (fragmentRadius + fragmentLength);

	draw_line_width_color(
		x1,y1,x2,y2,
		1 + frac(seed * 43.1) * 3,
		c_white,
		make_color_rgb(30,100,255)
	);
}

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_white);

matrix_set(matrix_world,oldMatrix);