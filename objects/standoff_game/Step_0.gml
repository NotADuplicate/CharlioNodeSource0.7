/// @description Increment power up
if(global.bandit) {
	global.count++;
	if(global.count > global.timer) {
		global.count = 0;
		global.level++;
		global.timer = 550;
		if(instance_exists(standoff_player)) {
			switch(global.powerup[global.level]) {
				case "Clue": //clue
					global.hint = true;
					global.timer = 450;
				break;
				case "Faster Firing":
					global.timer = 450;
					global.firing = 2;
				break;
				case "Silent Gun":
					global.timer = 600;
				break;
				case "Dash (Shift)":
					global.dash = true;
				break;
				case "Reload on Kill":
					global.gold = true;
				break;
				case "Accuracy":
					global.accuracy = 2;
				break;
				case "Perfect Accuracy":
					global.accuracy = 5;
				break;
				case "Death":
					standoff_player.alarm[1] = 1;
					global.timer = 999999;
				break;
			}
		}
	}
}