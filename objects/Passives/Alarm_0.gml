//Set list
list[0] = moreKb;
list[1] = bushHop
list[2] = moveSpd; //mobility
list[3] = attackDamage;
list[4] = abilityDamage;
list[5] = fireRate;
list[6] = plasma; 
list[7] = scope; //offense
list[8] = defense;
list[9] = resistance;
list[10] = size;
list[11] = ammoHealth; //defense
list[12] = ammoRegen;
list[13] = cooldownReduction;
list[14] = maxAmmo; //resources
list[15] = healing;
list[16] = fourthSlot

var i =0;
repeat(array_length(list)) {
	list[i].passiveIndex = i;
	i++;
}