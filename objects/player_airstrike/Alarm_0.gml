/// @description Destroy and send buffer to create actual airstrike
instance_destroy();
if(instance_exists(obj_player)) {
    buffer = obj_client.buffer;
	node_send(buffer,"eventName","Bullet","X",x,"Y",y,"Dir",round(dir),"Obj",other_airstrike,"Num",obj_player.num)
}

