// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_hook_stop(obType,obNum){
	
	with(obType) {
		//show_message("Whoop");
		if(num == obNum) {
			show_debug_message("Destroyed through stopping")
			instance_destroy();
		}
	}
}