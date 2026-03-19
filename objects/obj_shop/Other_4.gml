/// @description Create item slots
if(global.gameMode == "Comp"){
	i = 0;
	while(i < 8){
		xPos = 58 + ((i) mod 4)*140
		yPos = 4155 + 95*floor((i/4))
		ins = instance_create(xPos,yPos,inst_utility);
		ins.utility = global.loadoutSet[global.selectedLoadout][i];
		i++
	}
	ins1 = instance_find(inst_atk,0) 
	ins1.spr = scr_gun_sprite(global.loadoutSet[global.selectedLoadout][8])
	ins1.atk = global.loadoutSet[global.selectedLoadout][8]
	ins2 = instance_find(inst_atk,1) 
	ins2.spr = scr_gun_sprite(global.loadoutSet[global.selectedLoadout][9])
	ins2.atk = global.loadoutSet[global.selectedLoadout][9]
} else if(global.gameMode == "Simple") {
	i = 0;
	while(i < 16){
		xPos = 58 + ((i) mod 4)*140
		yPos = 4155 + 95*floor((i/4))
		ins = instance_create(xPos,yPos,inst_utility);
		ins.utility = Abilities.simpleAbilities[i];
		i++
	}
	with(inst_atk) {
		instance_destroy()
	}
	i = 0;
	numGuns = 7;
	while(i < numGuns){
		xPos = 1600 + (i mod 4)*70
		yPos = 4690 + 70*floor(i/4)
		ins = instance_create(xPos,yPos,inst_atk);
		ins.atk = Abilities.gun[i];
		ins.spr = scr_gun_sprite(Abilities.gun[i])
		i++
	}
}
else {
	i = 0;
	while(i < array_length(Abilities.list)){
		xPos = 48 + ((i) mod 8)*60
		yPos = 4155 + 50*floor((i/8))
		ins = instance_create(xPos,yPos,inst_utility);
		ins.utility = Abilities.list[i];
		i++
	}
	with(inst_atk) {
		instance_destroy()
	}
	i = 0;
	numGuns = instance_exists(obj_tutorial) ? 6 : array_length(Abilities.gun);
	while(i < numGuns){
		xPos = 1600 + (i mod 4)*70
		yPos = 4690 + 70*floor(i/4)
		ins = instance_create(xPos,yPos,inst_atk);
		ins.atk = Abilities.gun[i];
		ins.spr = scr_gun_sprite(Abilities.gun[i])
		i++
	}
}
i = 0;
numOffense = 4;
numDefense = 4;
numResources = 3;
numUtility = 4;
while(i < numOffense){
	if(!instance_exists(obj_tutorial) || i < 2) {
		xPos = 1050 + 450/numOffense * (i+.5);
		yPos = 4430;
		ins = instance_create(xPos,yPos,inst_passive);
		passiveOb = Passives.list[i];
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		ins.passiveIndex = i;
		ins.maxStacks = passiveOb.maxStacks;
	}
	i++
}
while(i < numOffense+numDefense){
	if(!instance_exists(obj_tutorial) || i < 2+numOffense) {
		xPos = 1050 + 450/numDefense * (i-numOffense+.5);
		yPos = 4560;
		ins = instance_create(xPos,yPos,inst_passive);
		passiveOb = Passives.list[i];
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		ins.passiveIndex = i;
		ins.maxStacks = passiveOb.maxStacks;
	}
	i++
}
if(!instance_exists(obj_tutorial)) {
	while(i < numOffense+numDefense+numResources){
		xPos = 1050 + 450/numResources * (i-numOffense-numDefense+.5);
		yPos = 4690;
		ins = instance_create(xPos,yPos,inst_passive);
		passiveOb = Passives.list[i];
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		ins.passiveIndex = i;
		ins.maxStacks = passiveOb.maxStacks;
		i++
	}
	while(i < numOffense+numDefense+numResources+numUtility){
		xPos = 1050 + 450/numUtility * (i-numOffense-numDefense-numResources+.5);
		yPos = 4810
		ins = instance_create(xPos,yPos,inst_passive);
		passiveOb = Passives.list[i];
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		ins.passiveIndex = i;
		ins.maxStacks = passiveOb.maxStacks;
		i++
	}
}