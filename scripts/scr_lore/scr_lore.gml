// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lore(){
	var randomPlayer = irandom_range(1,global.loop);
	var randomAbilitySlot = irandom_range(1,3);
	var ability = global.knownLoadout[randomPlayer, randomAbilitySlot]
	if(ability != 0 && ability != 1 && variable_instance_exists(ability, "tooltip")) {
		return ability.tooltip;
	}
	//basic text if no ability is found
	return(choose(
	"Enrage was found by John B. Enrage who died shortly after his discovery",
	"Gaming moments can get heated so remember to use fire axe to crit on burning targets",
	"The Beholder became an evil monster after her soundcloud career failed",
	"The airstrike ability was first used by Obama",
	"Reflect is made using Uno reverse cards",
	"Cassandra Varga was the first woman to cross the Atlantic using only Ninja Dash",
	"The first man to ever throw a boomerang died",
	"Cleaver was invented by Fiacre Frenchmen who used it to prepare Confit de Canard",
	"Enrage a bad player and they will be enraged for the rest of their life.\n Enrage a good player and they will be enraged for the rest of your life",
	"Wall is a subtle nod to trump dash",
	"Armor break was invented a million years ago\n It only found its use 999 thousand years later with the invention of armor.",
	"Using bloodshot hurts.",
	"Body slam can stun longer when used by a player with larger size.\nIt's a favorite ability of your mother.",
	"Chomp was originally used for eating food, before its combat potential was discovered",
	"The proletariat has nothing to lose but their chains.\n This is part of what makes chainbreaker so effective.",
	"Dash was primarily used for food delivery, but didn't reach its full potential until the discovery of doors.",
	"Death touch causes death upon touch.",
	"Flash was an original ability idea present in only this game.",
	"Frost shot is great at slowing enemies and only okay at slowing global warming",
	"90% of humans ever born are currently using the ghost ability",
	"Swapper only swaps your positions with another player\n It cannot be used to create a freaky friday situation",
	"Revive isn't used in medical settings due to lobbying by the funeral industry.",
	"Shatter is great for punishing players near the ball.",
	"Sleep dart would be a leading insomnia cure if it kept you asleep for more than 5 seconds.",
	"Teleport is the 2nd most effective method of transport behind trains.",
	"Soccer evolved into Charlio Ball when players discovered no rule against using guns",
	"Doctors recommending limiting bullet intake to <1 per day",
	"Good Luck!",
	"When all else fails, you can always rage quit!",
	"In the past, people who wanted to shoot each other with guns had to become criminals",
	"Want to see Charlio Ball live and in person? \nToo bad!",
	"Rumors that Charlio Ball is 'unstable' and 'crashes frequently' are false.",
	"Charlio Ball LLC is above the law and cannot be held responsible for anything"));
}