///@description Create all the players
i = 1;
global.loop = loop;
pirate = scr_IsAPirate(obj_client.index);
        repeat(loop) {
            if(i == obj_client.index) {
                ins = instance_create(500,350,pirate_player);
                ins.num = i;
                global.players[i] = ins;
            }
            else  {
                ins = instance_create(300,350,pirate_other);
                ins.num = i;
                global.players[i] = ins;
            }
            //global.names[i] = 0;
            i++;
        }
global.loot = 0;
global.gen = 0;
global.countdown = 200;
global.piratecount = round(global.loop/3);
global.alive = true;
global.ship = true;
global.points = 0;
global.genGain = 0;
global.killGain = 0;
killnum = 0;

alarm[5] = 5; //count the booty
//Create generators
while(instance_number(obj_generator) < 4) {
	ob = instance_find(possible_generator,irandom_range(0,instance_number(possible_generator)-1))
	with(ob) {
		instance_change(obj_generator,true);
	}
}
repeat(global.baseTreasure) {
	ob = instance_find(possible_booty,irandom_range(0,instance_number(possible_booty)-1))
	with(ob) {
		instance_change(obj_booty,true);
	}
}