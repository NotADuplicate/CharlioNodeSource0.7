function scr_decide_fight_monster(monster){
	var desire = gunObj.monsterTake*100 + hp + (monster.maxhp - monster.hp)*5 - point_distance(x,y,monster.x,monster.y) + random_range(-600,300)
	if(state == "Travel" || state == "Travel Ball") {
		desire -= 300;
	} else {
		desire -= 600;
	}
	if(monster.hp < monster.maxhp) { desire += 250; }
	if(desire > 0) {
		if(collision_line(x,y,monster.x,monster.y,ball_wall,false,false) != noone && desire < 400) { return; }
		state = "Fight Monster";
	}
}