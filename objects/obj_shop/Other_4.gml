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
} 
else if(global.gameMode == "Simple") {
	i = 0;
	numAbilities = 0;
	repeat(array_length(Abilities.list)) {
		if(variable_instance_exists(Abilities.list[i],"unlocked") && Abilities.list[i].unlocked) { numAbilities++; }
		i++;
	}
	i = 0;
	cols = clamp(ceil(sqrt(numAbilities)), 4, 8);
	rows = ceil(numAbilities / cols);
	spacing = 486 / max(3, max(cols, rows) - 1);
	var abilityIndex = 0;

	while(i < numAbilities) {
		ability = Abilities.list[abilityIndex];
		if(variable_instance_exists(ability,"unlocked") && ability.unlocked) {
			xPos = 68 + (i mod cols) * spacing;
			yPos = 140 + floor(i / cols) * spacing;
			ins = instance_create(xPos, yPos, inst_utility);
			ins.utility = ability;
			i++;
		}
		abilityIndex++;
	}
	
	with(inst_atk) {
		instance_destroy()
	}
	i = 0;
	numGuns = 0;
	repeat(array_length(Abilities.gunObjs)) {
		if(Abilities.gunObjs[i].unlocked) { numGuns++; }
		i++;
	}
	i = 0;
	var gunIndex = 0;
	var gun;
	while(i < numGuns) {
		gun = Abilities.gunObjs[gunIndex];
		if(gun.unlocked) {
			xPos = 1600 + (i mod 4)*70
			yPos = 4740 + 70*floor(i/4)
			ins = instance_create(xPos,yPos,inst_atk);
			ins.atk = gun.bullet;
			ins.spr = scr_gun_sprite(gun.bullet);
			i++;
		}
		gunIndex++;
	}
}
else {
	i = 0;
	while(i < array_length(Abilities.list)){
		xPos = 34 + ((i) mod 8)*81
		yPos = 125 + 85*floor((i/8))
		ins = instance_create(xPos,yPos,inst_utility);
		ins.utility = Abilities.list[i];
		i++
	}
	with(inst_atk) {
		instance_destroy()
	}
	i = 0;
	numGuns = array_length(Abilities.gun);
	while(i < numGuns){
		xPos = 1600 + (i mod 4)*70
		yPos = 4740 + 70*floor(i/4)
		ins = instance_create(xPos,yPos,inst_atk);
		ins.atk = Abilities.gun[i];
		ins.spr = scr_gun_sprite(Abilities.gun[i])
		i++
	}
}
i = 0;
numMobility = 0;
numOffense = 0;
numDefense = 0;
numResources = 0;
numUtility = 0;

repeat(array_length(Passives.list)) {
	if(variable_instance_exists(Passives.list[i],"unlocked") && Passives.list[i].unlocked) { 
		show_debug_message("Passive is unlocked!")
		if(Passives.list[i].type == "Mobility") { numMobility++; }
		if(Passives.list[i].type == "Offense") { numOffense++; }
		if(Passives.list[i].type == "Defense") { numDefense++; }
		if(Passives.list[i].type == "Resources") { numResources++; }
		if(Passives.list[i].type == "Utility") { numUtility++; }
	}
	i++;
}
i = 0;
passiveIndex = 0;
while(i < numMobility){
	if(Passives.list[passiveIndex].unlocked) { 
		xPos = 1050 + 450/numMobility * (i+.5);
		yPos = 4337;
		ins = instance_create(xPos,yPos,inst_passive);
		passiveOb = Passives.list[passiveIndex];
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		ins.passiveIndex = passiveIndex;
		ins.maxStacks = passiveOb.maxStacks;
		i++
	}
	passiveIndex++;
}
j = 0;
while(j < numOffense){
	if(Passives.list[passiveIndex].unlocked) { 
		xPos = 1050 + 450/numOffense * (j+.5);
		yPos = 4455;
		ins = instance_create(xPos,yPos,inst_passive);
		passiveOb = Passives.list[passiveIndex];
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		ins.passiveIndex = passiveIndex;
		ins.maxStacks = passiveOb.maxStacks;
		j++;
	}
	passiveIndex++;
}
j = 0;
while(j < numDefense){
	if(Passives.list[passiveIndex].unlocked) { 
		xPos = 1050 + 450/numDefense * (j+.5);
		yPos = 4585;
		ins = instance_create(xPos,yPos,inst_passive);
		passiveOb = Passives.list[passiveIndex];
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		ins.passiveIndex = passiveIndex;
		ins.maxStacks = passiveOb.maxStacks;
		j++;
	}
	passiveIndex++;
}
j = 0;
if(!instance_exists(obj_tutorial)) {
	while(j < numResources){
		if(Passives.list[passiveIndex].unlocked) { 
			xPos = 1050 + 450/numResources * (j+.5);
			yPos = 4715;
			ins = instance_create(xPos,yPos,inst_passive);
			passiveOb = Passives.list[passiveIndex];
			ins.spr = passiveOb.sprite;
			ins.str = passiveOb.text;
			ins.passiveIndex = passiveIndex;
			ins.maxStacks = passiveOb.maxStacks;
			j++;
		}
		passiveIndex++;
	}
	j = 0;
	while(j < numUtility){
		if(Passives.list[passiveIndex].unlocked) { 
			xPos = 1050 + 450/numUtility * (j+.5);
			yPos = 4840
			ins = instance_create(xPos,yPos,inst_passive);
			passiveOb = Passives.list[passiveIndex];
			ins.spr = passiveOb.sprite;
			ins.str = passiveOb.text;
			ins.passiveIndex = passiveIndex;
			ins.maxStacks = passiveOb.maxStacks;
			j++;
		}
		passiveIndex++;
	}
}