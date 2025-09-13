/// @description Insert description here
// You can write your code in this editor
with(obj_portal) {
	if(num == other.num)
		other.link = self
}
ins = instance_create(x,y,obj_portal)
ins.num = num
if(link != 0) {
	ins.link = link
	link.link = ins;
	link.alarm[0] = 300;
	ins.alarm[0] = 300;
}
instance_destroy();