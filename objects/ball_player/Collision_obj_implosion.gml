/// @description Insert description here
// You can write your code in this editor
if(speed > 1)
	speed *= .9;
else
	speed = 0;
if(global.teamNum[other.num] != global.teamNum[num]) { 
	global.assistScore[other.num] += 5;
}