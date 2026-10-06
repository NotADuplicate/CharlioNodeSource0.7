		node_send(obj_client.buffer,"eventName","Game Over", "Winner", obj_bigBall.x < 1000 ? -1 : 1, 
			"playersBallPush", ds_list_create(), "towerDamages", ds_list_create(), "healingDealt", ds_list_create(),
			"soulsCollected", ds_list_create(), "selfDamageBlocked", ds_list_create(), "mvpId", 1);