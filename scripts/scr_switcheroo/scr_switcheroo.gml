function scr_switcheroo(argument0, argument1) {
	var num = argument0;
	var loop = argument1
	global.picked1 = irandom_range(1,loop)
	global.picked2 = global.picked1;
	while(global.picked2 == global.picked1) {
		global.picked2 = irandom_range(1,loop)
	}
	if(num == global.picked1) {
		return(global.picked2)
		global.otherImp = global.picked1
	}
	else if(num == global.picked2) {
		return(global.picked1)
		global.otherImp = global.picked2
	}
	else
		return(num)


}
