/// @description Insert description here
// You can write your code in this editor
scale = max(min(20, global.players[num].hp/10), 3);

ins = instance_create(x,y,effect_shockwave)
image_xscale = scale;
image_yscale = scale;
ins.image_yscale = 1.35 * scale/20;
ins.image_xscale = 1.35 * scale/20;