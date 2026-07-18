/// @description Insert description here
// You can write your code in this editor
ai = instance_create(125, 125, obj_AI);
ai.num = 2;
ai.team = 1;
global.teamNum[2] = -1;
global.names[2] = "AI"

ai = instance_create(125, 125, obj_AI);
ai.num = 3;
ai.team = 1;
global.teamNum[3] = -1;
global.names[3] = "Enemy"

ai2 = instance_create(3757, 95, obj_AI);
ai2.num = 4;
ai2.team = 3;
ai2.enemy = ai;
global.teamNum[4] = 1;
global.names[4] = "Ally"

global.aiPushing[1] = false;
global.aiPushing[3] = false;
stage = 17