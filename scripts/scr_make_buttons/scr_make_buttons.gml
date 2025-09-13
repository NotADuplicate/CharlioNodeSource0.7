// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_make_buttons(amnt){
	n = 0;
	with(obj_button) {
		instance_destroy()
	}
	with(ins_output) {
		instance_destroy()
	}
	var columns = min(amnt,10)
	var rows = floor((amnt-1)/10)+1
	xp = 1000/(columns+1)
	yp = 750/(rows+1)
	repeat(rows) {
		repeat(columns) {
			if(n <= amnt) {
				ins = instance_create(xp,yp,obj_button);
				ins.num = n
				global.buttons[n] = 0;
				xp += 1300/(columns+1)
				n++;
			}
		}
		yp += 700/(rows+1)
		xp = 1000/(columns+1)
	}
}