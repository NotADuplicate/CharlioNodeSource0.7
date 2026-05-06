function scr_towerUpdate(nums, healths, maxHealths){
	show_debug_message("Tower update")
	if(nums == "" || nums == undefined) {
		show_debug_message("Nums undefined")
		return;
	}
	
	for(var i = 0; i < instance_number(obj_turret); i++) {
		var towerId = (nums[| i])
		with(obj_turret) {
			if(num == towerId) {
				hp = (healths[| i]);
				maxhp = (maxHealths[| i]);
			}
		}
	}
}