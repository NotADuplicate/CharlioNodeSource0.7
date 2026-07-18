// Inherit the parent event
event_inherited();

link.x = x;
link.y = y;
link.hp = hp;

//Keep track of enemy's last 7 distances (for reaction time based things)
i = 6;
while(i > 0) {
	enemyDistances[i] = enemyDistances[i-1];
	i--;
}
enemyDistances[0] = point_distance(x,y,enemy.x,enemy.y);