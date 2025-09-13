/// @description Kill all others and player to reset game
    if(instance_exists(standoff_player)) {
        with(standoff_other) {
            instance_destroy();
        }
        instance_destroy(standoff_player);
    }
    
    //Make new player and others
    //loop = buffer_read(buffer,buffer_u8);
    //index = buffer_read(buffer,buffer_u8);
    //random_set_seed(buffer_read(buffer,buffer_u8));
	var i = 1;
	global.loop = loop;
	Rnum = scr_bandit(obj_client.index);
	global.count = 0;
	global.timer = 450;
	global.accuracy = 1;
	global.level = 0;
    repeat(loop) {
		if(i == obj_client.index) {
			ins = instance_create(0,0,standoff_player);
			ins.num = i;
		}
		else {
			ins = instance_create(0,0,standoff_other);
			ins.num = i;
		}
		i++;
	}
	
//Pick clues

global.hidden = choose(0,1);

//Pick words make sure no 2 words are the same
global.word[0] = scr_word();
global.word[1] = global.word[0];
while(global.word[1] == global.word[0]) {
	global.word[1] = scr_word();
}
global.word[2] = global.word[1];
while(global.word[1] == global.word[2] || global.word[2] == global.word[0]) {
	global.word[2] = scr_word();
}
global.word[3] = global.word[2];
while(global.word[1] == global.word[3] || global.word[3] == global.word[0] || global.word[3] == global.word[2]) {
	global.word[3] = scr_word();
}