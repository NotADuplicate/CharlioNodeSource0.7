/// @description Send bushFire
if(other.num == ball_player.num) {
	with(ball_game) {
				node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",other.x,"Y",other.y,"Obj",obj_bushFire,"Dir",0)
	}
}