with(inst_utility) { instance_destroy(); }
i = 0;
while(i < array_length(Abilities.list)){
	xPos = 540 + ((i) mod 8)*60
	yPos = 900 + 50*floor((i/8))
	ins = instance_create(xPos,yPos,inst_utility);
	ins.utility = Abilities.list[i];
	i++
}