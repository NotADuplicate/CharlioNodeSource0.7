/// @description Spawn stars
instance_create(irandom_range(30,990),irandom_range(30,700),obj_not);
alarm[0] = round((100*global.ammodrop)/(instance_number(obj_other)+1));

