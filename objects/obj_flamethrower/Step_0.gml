/// @description Insert description here
// You can write your code in this editor
if(flames > 0) {
	flames--;
	ins = instance_create(x,y,obj_flame)
	ins.direction = direction + random_range(-30,30);
	ins.num = num;
}
else
	instance_destroy();
x = link.x;
y = link.y