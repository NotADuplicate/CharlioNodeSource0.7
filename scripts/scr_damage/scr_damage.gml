function scr_damage() {
	if(global.invincibility == 0 && global.dead == false) {
	    var dmg = argument[0];
		if(global.sponge != -1 && point_distance(x,y,global.sponge.x,global.sponge.y) < 300) { //deal damage to tank instead
				if(argument[1] == ball_player.num)
					thing = global.sponge.num
				else
					thing = argument[1];
			with(ball_game) {
				node_send(buffer,"eventName","Extra Shit","Num",global.sponge.num,"Ad",argument[2],"Killer",other.thing,"Dmg",argument[0])
			}
		}
		else {
		if(ball_player.broken > 0) {
			dmg *= 2;
		}
		if(argument[1] < 10 && global.game == "Ball" && argument[1] != ball_player.num) {
			if(argument[2]) {
				if(global.players[argument[1]].firePassive && global.teamNum[argument[1]] != global.teamNum[ball_player.num] && burn < 45) {
					with(ball_game) { //send plasma passive
						node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",53);
						ball_player.magicBurnNum = argument[1];
					}
				}
				dmg *= global.players[argument[1]].atk/global.defense;
			}
			else
				dmg *= global.players[argument[1]].magic/global.resistance;
		}
		else {
			if(argument[2]) 
				dmg *= 1/global.defense;
			else
				dmg *= 1/global.resistance;
		}
		if(typeof(argument[1]) != "string") {
		    if(argument[1] == obj_client.index){ //deal half damage to self
				if(global.passive == "Self Resistance")
					dmg = round(dmg/3);
			}
			else if(global.teaming != 0 && global.teamNum[argument[1]] == global.teamNum[obj_player.num]) //no friendly fire
				dmg = 0;
		}
		if(dmg > 0 && argument[1] != ball_player.num && argument[1] < 10) {
			with(ball_game) {
				node_send(buffer,"eventName","Damage Dealt","Dealer",argument[1],"Target",ball_player.num,"Amount",dmg,"Ability",argument[2])
			}
		}
	    obj_player.hp -= dmg;
		if(ball_player.sleeping > 0 && dmg > 0) {
			ball_player.sleeping = 0;
			global.slow = 1;
			with(ball_game) {
				node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 25)
			}
		}
    
	    if(obj_player.hp < 1) { //die
	        //obj_player.x = 1500;
	        if(global.revive = true && global.ammo > 0) { //get revived
	            obj_player.hp = 10;
	            //scr_ammo(global.ammo);
	            global.invincibility = 30;
	            global.revive = false;
	            obj_player.x = irandom_range(50,950);
	            obj_player.y = irandom_range(50,700);
	            obj_player.speed = 0;
	        }
			else if(instance_exists(ball_player)) {
				scr_ball_die(dmg,argument[1])
			}
	        else {
	            obj_client.dead = obj_player.num;
	            if(typeof(argument[1]) != "string") {
	                obj_client.killer = argument[1]//send to server which person to attribute the kill to
	            }
	            else
	                obj_client.killer = 0; //attribute kill to noone
	            instance_destroy(obj_player);
	            obj_client.alarm[1] = 1;
	            death = instance_create(x,y,obj_death);
	            death.num = argument[1];
	        }
	    }
		if(instance_exists(ball_player)) {
			with(ball_game) {
				node_send(buffer,"eventName","Player Health","Num",ball_player.num,"Hp",ball_player.hp)
			}
		}
	}
	}
	else if(ball_player.blocking > 0 && argument[0] > 10) {
		scr_ball_sound(snd_block,ball_player.x,ball_player.y)
	}


}
