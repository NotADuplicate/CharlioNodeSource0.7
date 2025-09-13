// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_kart_shoot(user,dir){
	with(kart_shot) {
		if(num == user) {
			dir -= 45;
			repeat(9) {
				ins = instance_create(x,y,kart_bullet);
				ins.direction = dir;
				dir += 10;
			}
			instance_destroy()
		}
	}
}