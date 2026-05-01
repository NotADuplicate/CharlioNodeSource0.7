//Set list
list[0] = attackDamage;
list[1] = abilityDamage;
list[2] = fireRate;
list[3] = plasma; 
list[4] = scope; //offense
list[5] = defense;
list[6] = resistance;
list[7] = size;
list[8] = ammoHealth; //defense
list[9] = ammoRegen;
list[10] = cooldownReduction;
list[11] = maxAmmo; //resources
list[12] = healing;
list[13] = moreKb;
list[14] = bushHop
list[15] = fourthSlot

var i =0;
repeat(array_length(list)) {
	list[i].passiveIndex = i;
	i++;
}