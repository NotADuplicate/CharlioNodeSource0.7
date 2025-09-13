/// @description Draw words
xp = 256;
var n = 0;
repeat(2) {
	if(global.hidden == n && global.bandit) {
		if(global.hint)
			draw_text_color(xp,50,global.clue[n],c_red,c_red,c_red,c_red,1);
	}
	else
		draw_text(xp,50,global.word[n]);
	n++;
	xp += 512;
}
if(global.bandit) {
	
	draw_text_color(512,670,global.word[2],c_green,c_green,c_green,c_green,1);
	
	if(global.level < 10) {
		draw_text(512,700,global.powerup[global.level+1]);
		draw_healthbar(256,720,738,740,100*(global.count/global.timer),c_black,c_white,c_white,0,true,true);
	}
}
/*if(global.bandit) {
	if(global.loop mod 2 == 0) { //if teams are balanced
		draw_text(512,50,global.word[1]);
	}
	else {//on smaller team
		draw_text(400,50,global.word[1]);
		draw_text(600,50,global.word[2]);
	}
}
else
	draw_text(512,50,global.word[0]);
