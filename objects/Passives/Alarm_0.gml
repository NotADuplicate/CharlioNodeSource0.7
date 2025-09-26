//Set list
list[0] = attackDamage;
list[1] = abilityDamage;
list[2] = fireRate;
list[3] = plasma; //offense
list[4] = defense;
list[5] = resistance;
list[6] = size;
list[7] = ammoHealth; //defense
list[8] = ammoRegen;
list[9] = cooldownReduction;
list[10] = maxAmmo; //resources
list[11] = healing;
list[12] = moreKb;
list[13] = bushHop
list[14] = fourthSlot

var i =0;
repeat(array_length(list)) {
	list[i].passiveIndex = i;
	i++;
}