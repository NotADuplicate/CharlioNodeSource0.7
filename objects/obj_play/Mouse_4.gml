/// @description Get the client to connect
with(inst_menuButton) {
	x -= 500;
}

instance_create(x+500,y,obj_connect);
instance_create(x+500,y+120,obj_singlePlayer);