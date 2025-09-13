/// @description Insert description here
// You can write your code in this editor

x = link.x;
y = link.y;
if(locke == 0) {
	alarm[3] = 1;
	if(trail2 != "Penis") {
		trail2 = trail
		trail = instance_create(x,y,obj_trail);
		trail.quill = self
		if(point_distance(trail.x,trail.y,trail2.x,trail2.y) < 100)
			trail.trail = trail2
		trail.num = num;
	}
	else {
		trail2 = "Benis"
		trail = instance_create(x,y,obj_trail);
		trail.trail = 0;
		trail.num = num;
		trail.quill = self
	}
}
else {
	alarm[3] = 3;
	trail[num] = instance_create(x,y,obj_trail);
	trail[num].alarm[0] = alarm[0];
	if(num != 0)
		trail[num].trail = trail[num-1]
	num++
}