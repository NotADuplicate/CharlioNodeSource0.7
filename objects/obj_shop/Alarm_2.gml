/// @description Create extra passives for tutorial
i = 8;
numOffense = 4;
numDefense = 4;
numResources = 3;
numUtility = 4;

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
wipe = true;