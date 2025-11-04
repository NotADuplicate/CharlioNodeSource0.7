function scr_damage(amount, damager, type, icon, DoT) {
	if(global.invincibility == 0 && global.dead == false) {
		if(global.sponge != -1 && point_distance(x,y,global.sponge.x,global.sponge.y) < 300) { //deal damage to tank instead
				if(damager == ball_player.num)
					thing = global.sponge.num
				else
					thing = damager;
			with(ball_game) {
				node_send(buffer,"eventName","Sponge Damage","Num",global.sponge.num,"Ad",type,"Killer",other.thing,"Dmg",amount)
			}
		}
		else {
		if(ball_player.broken > 0) {
			amount *= 2;
		}
		if(damager < 10 && global.game == "Ball" && damager != ball_player.num) {
			if(type) {
				if(global.players[damager].firePassive && global.teamNum[damager] != global.teamNum[ball_player.num] && burn < 45) {
					with(ball_game) { //send plasma passive
						node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",53);
					}
					ball_player.magicBurnNum = damager; 
				}
				amount *= global.players[damager].atk/global.defense;
			}
			else
				amount *= global.players[damager].magic/global.resistance;
		}
		else {
			if(type) 
				amount *= 1/global.defense;
			else
				amount *= 1/global.resistance;
		}
		if(typeof(damager) != "string") {
		    if(damager == obj_client.index){ //deal half damage to self
				if(global.passive == "Self Resistance")
					amount = round(amount/3);
			}
			else if(global.teaming != 0 && global.teamNum[damager] == global.teamNum[obj_player.num]) //no friendly fire
				amount = 0;
		}
		
		ball_player.hp -= amount;
		while(ball_player.hp < 1 && ball_player.livePass && global.ammo > 0) {
			global.ammo -= 1
			ball_player.hp += 5;
		}
		if(ball_player.hp < 0) { amount += ball_player.hp; } //max damage of players hp
		
		if(amount > 0 && damager != ball_player.num && damager < 10) {
			with(ball_game) {
				node_send(buffer,"eventName","Damage Dealt","Dealer",damager,"Target",ball_player.num,"Amount",amount,"Ability",type)
			}
		}
		if(amount > 0) {
			scr_insert_damage_source(amount, damager, icon);
		}
		if(ball_player.sleeping > 0 && amount > 0) {
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
				scr_ball_die(amount,damager, icon)
			}
	        else {
	            obj_client.dead = obj_player.num;
	            if(typeof(damager) != "string") {
	                obj_client.killer = damager//send to server which person to attribute the kill to
	            }
	            else
	                obj_client.killer = 0; //attribute kill to noone
	            instance_destroy(obj_player);
	            obj_client.alarm[1] = 1;
	            death = instance_create(x,y,obj_death);
	            death.num = damager;
	        }
	    }
		if(instance_exists(ball_player)) {
			with(ball_game) {
				node_send(buffer,"eventName","Player Health","Num",ball_player.num,"Hp",ball_player.hp)
			}
		}
	}
	}
	else if(ball_player.blocking > 0 && amount > 10) {
		scr_ball_sound(snd_block,ball_player.x,ball_player.y)
	}


}
