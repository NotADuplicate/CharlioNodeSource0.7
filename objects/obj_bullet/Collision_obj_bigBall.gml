/// @description Make impact and posibly refund ammo
instance_create(x+lengthdir_x(38,image_angle),y+lengthdir_y(38,image_angle),obj_impact)
instance_destroy()
if(ammo && num == ball_player.num && global.ammo < global.maxAmmo) {
	global.ammo++;
}