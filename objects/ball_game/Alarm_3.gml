/// @description Kill all others and player to reset game
//alarm[1] = 3

global.playBall = true;
instance_create(0,0,obj_junglePass);
    if(instance_exists(ball_player)) {
        with(ball_other) {
            instance_destroy();
        }
        with(obj_star) {
            instance_destroy();
        }
        instance_destroy(ball_player);
    }
    
instance_create(0,0,obj_UI)
global.ballGameOver = 0
	
if(global.abilityNum < 90) {
	global.abilityNum = round(global.abilityNum*instance_number(inst_utility))
	while(instance_number(inst_utility) > global.abilityNum) {
		instance_destroy(instance_find(inst_utility,irandom_range(0,instance_number(inst_utility)-1)))
	}
}
    //Make new player and others
    //loop = buffer_read(buffer,buffer_u8);
    //index = buffer_read(buffer,buffer_u8);
    //random_set_seed(buffer_read(buffer,buffer_u8));
	var i = 1;
	instance_create(0,0,ball_cam)
	leftLoadoutY = 80//4338
	rightLoadoutY = 80//4338
	global.loop = loop
    repeat(loop) {
		scr_createBallPlayer(i);
		i++;
	}
if(global.spectator) { //make fake player ig
	obj_client.index = 0;
	ins = instance_create(0,0,ball_player);
	ins.num = 0;
	ins.spectating = true;
}
global.players[100] = obj_bigBall
global.ballStart = true;


var i = 0;