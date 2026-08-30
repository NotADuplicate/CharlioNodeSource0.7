// Inherit the parent event
event_inherited();

pointDir = scr_angle_step(pointDir, gunDir, 20);

if(global.testMode) {
	link.x = x;
	link.y = y;
	link.hp = hp;
	link.gunDir = pointDir;
}
else {
	with(ball_game) {
		node_send(buffer,"eventName","P","Num",other.num,"X",round(other.x),"Y",round(other.y),"Dir",round(other.pointDir),"Health",round(other.hp));
	}
}
link.frost = frost;
link.bleed = bleed;

//Keep track of enemy's last 7 distances (for reaction time based things)
i = 6;
while(i > 0) {
	enemyDistances[i] = enemyDistances[i-1];
	i--;
}
if(enemy == noone) {
	enemyDistances[0] = 1000;
} else {
	enemyDistances[0] = point_distance(x,y,enemy.x,enemy.y);
}