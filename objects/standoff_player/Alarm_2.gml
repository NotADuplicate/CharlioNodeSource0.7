/// @description Actually die
instance_destroy(standoff_light)
instance_destroy(player_light)
instance_change(obj_corpse,false);
instance_create(500,350,obj_bright);