/// @description Create dummy and various UI to be invisible
instance_create(ball_player.x,ball_player.y+320,obj_dummy)
with(inst_passive) {
	x += 4000;
}
with(inst_boots) {
	y += 1000
}
with(obj_turret) {
	hp = 50;
}
obj_shop.tabs = false;
with(ins_sort) {
	visible = false;
}
with(inst_utility) {
	instance_destroy()
}

instance_destroy(choose_void)
instance_destroy(choose_curve)

ob = instance_create(150,4500,choose_molotov)
ob.drawOnce = 0;
global.shopState = "Passives"
obj_shop.wipe = true;

stage = 0;