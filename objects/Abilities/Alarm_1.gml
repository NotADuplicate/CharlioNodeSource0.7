scr_load_unlocks();
var baseUnlocks = [molotov, block, dash, shatter, bump, cleaver, bloodshot, blastOff];
var i = 0;
with(Passives) {
	basePassives = [attackDamage, abilityDamage, moveSpd, defense, resistance, ammoRegen, cooldownReduction];
	repeat(array_length(basePassives)) {
		basePassives[i].unlocked = true;
		i++;
		show_debug_message("Made passive base unlock")
	}
}
i = 0;
repeat(array_length(baseUnlocks)) {
	baseUnlocks[i].unlocked = true;
	i++;
}
var baseGuns = [melee, chargeGun, popGun, shotgun]
i = 0;
repeat(array_length(baseGuns)) {
	baseGuns[i].unlocked = true;
	i++;
}