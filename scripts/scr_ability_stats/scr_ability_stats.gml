// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_stats(ability, stat){
	switch(ability) {
		case "Hook":
			switch(stat) {
				case "Ammo":
					return(2);
				break;
				case "Cooldown":
					return(16);
				break;
			}
		break;
		case "heal":
			switch(stat) {
				case "Ammo":
					return(3);
				break;
				case "Cooldown":
					return(4);
				break;
				case "Healing":
					return(120);
				break;
			}
		break;
		case "dash":
			switch(stat) {
				case "Ammo":
					return(1);
				break;
				case "Cooldown":
					return(3);
				break;
			}
		break;
		case "push":
			switch(stat) {
				case "Ammo":
					return(1);
				break;
				case "Cooldown":
					return(5);
				break;
			}
		break;
		case "wall":
			switch(stat) {
				case "Ammo":
					return(1);
				break;
				case "Cooldown":
					return(14);
				break;
			}
		break;
		case "airstrike":
			switch(stat) {
				case "Ammo":
					return(4);
				break;
				case "Cooldown":
					return(8);
				break;
			}
		break;
		case "reflect":
			switch(stat) {
				case "Ammo":
					return(2);
				break;
				case "Cooldown":
					return(7);
				break;
			}
		break;
		case "Stasis":
			switch(stat) {
				case "Ammo":
					return(3);
				break;
				case "Cooldown":
					return(30);
				break;
				case "Duration":
					return(3);
				break;
			}
		break;
		case "Chainbreaker":
			switch(stat) {
				case "Ammo":
					return(3);
				break;
				case "Cooldown":
					return(7);
				break;
				case "Duration":
					return(2);
				break;
			}
		break;
		case "mine":
			return(spr_mine);
		break;
		case "flash":
			switch(stat) {
				case "Ammo":
					return(2);
				break;
				case "Cooldown":
					return(18);
				break;
			}
		break;
		case "teleport":
			switch(stat) {
				case "Ammo":
					return(4);
				break;
				case "Cooldown":
					return(70);
				break;
			}
		break;
		case "finisher":
			switch(stat) {
				case "Ammo":
					return(1);
				break;
				case "Cooldown":
					return(10);
				break;
			}
		break;
		case "invisibility":
			return("Beome invisible to enemies for 4 seconds.");
		break;
		case "molotov":
			switch(stat) {
				case "Ammo":
					return(2);
				break;
				case "Cooldown":
					return(15);
				break;
				case "Duration":
					return(2);
				break;
			}
		break;
		case "ward":
			return(spr_ward);
		break;
		case "cleaver":
			return("Fires a slow moving projectile which bleeds an enemy for 3 seconds. While bleeding, enemies take 90 damage per second while walking. The damage is not applied if they take knockback or teleport.");
		break;
		case "Death Touch":
			return("Shoots a fast moving projectile which deals no damage but applies death touch for 5 seconds to any player or ball it hits. Any player who touches something afflicted with death touch instantly dies.");
		break;
		case "Enrage":
			return("Use to enrage a nearby player including yourself. While enraged, the target moves 50% faster, shoots twice as fast, has half cool downs, but also takes increasing damage over time. Enrage goes away upon dying, going back to base, or standing still.");
		break;
		case "Block":
			return("Become invincible for 1 second");
		break;
		case "Poison Dagger":
			return("Fires a fast moving projectile which deals 20 damage and poisons a target for 12 seconds. Poison damage stacks exponentially so being poisoned for 10 seconds deals 50 damage, but being poisoned for 20 seconds deals 180 damage");
		break;
		case "Gas Trap":
			return("Use to place a gas trap which has 200 health and can be hidden in bushes. Use again to release a slow moving gas cloud from the trap, dealing 20 damage per second to any enemies inside and poisoning them.");
		break;
		case "Spell Shield":
			return("Use to apply a spell shield to any player or ball for 8 seconds. While shielded the target cannot be affected by any status effect.");
		break;
		case "Healing Point":
			return("Place a healing point where you are standing which has 200 health and heals any allies (including yourself) by 15 health per second while inside its radius.");
		break;
		case "Decay":
			return("Use on an enemy to decay them for 10 seconds. While decayed, any healing they recieve is applied as damage");
		break;
		case "Ammo Shot":
			return("Shoot a projectile which deals 100 damage. Costs 4 ammo");
		break;
		case "Armor Break":
			return("Shoot a slow moving spear which deals 40 damage and applies armor broken for 6 seconds. While armor broken, target takes double damage from all sources.");
		break;
		case "Frost Shot":
			return("Shoot a fast moving projectile which deals 20 damage and frosts a target for 6 seconds. While frosted, the target moves at half speed and does not take knockback from any sources.");
		break;
		case "Ninja Slash":
			return("Hold to charge your range and release to dash. Dashing into enemies deals 70 damage, 140 if they are poisoned.");
		break;
		case "Blast Off":
			return("Create a short range rocket blast which sends you flying in the opposite direction. Hitting an enemy with the blast deals 80 damage and burns for 8 seconds.");
		break;
		case "Oil Can":
			return("Throw an oil can which oils any nearby player or ball when it lands. While oiled, players take triple damage from burning and recieve almost no friction from knockback.");
		break;
		case "Flare Gun":
			return("Fires a fast moving flare which goes through walls and gives vision. Hitting enemies deals 30 damage and applies 8 seconds of buring.");
		break;
		case "Fire Axe":
			return("Swing a short range axe which deals 50 damage to enemies or 170 damage if they are burning");
		break;
		case "Shield Bash":
			return("Fire a short range large projectile which stuns enemies for 1.5 seconds. While stunned targets move at half speed and cannot use any abilities or weapons.");
		break;
		case "Sledge Hammer":
			return(spr_sledge);
		break;
		case "Cryofreeze":
			return("Use to freeze any nearby player for 5 seconds. While frozen players cannot move, attack, or recieve knockback or damage but they heal 30 health per second. Using fire attacks against frozen players thaws them faster.");
		break;
		case "Leech":
			return("Fires a medium ranged projectile which leeches onto an enemy and drains 30 health per second while connected, giving you 60 health per second. The connection breaks if the target gets far enough away from you.");
		break;
		case "Big Gun":
			return("Fuckin' big");
		break;
		case "Flashbang":
			return("Throws a flashbang which lands after 2 seconds and flashes any player with a direct line of sight to it. Being closer to the flashbang when it goes off flashes you longer, for up to 5 seconds.");
		break;
		case "Implosion Grenade":
			return("Throw a bomb which pulls players towards it when it lands");
		break;
		case "Inverter":
			return("Throw a bomb which inverts nearby players and the ball. While inverted, they take knockback in the opposite direction");
		break;
		case "Health Bomb":
			switch(stat) {
				case "Ammo":
					return(3);
				break;
				case "Cooldown":
					return(16);
				break;
				case "Healing":
					return(50);
				break;
				case "Damage":
					return(30);
				break;
			}
		break;
		case "Portal Gun":
			return("Shoot portals which fade after 10 seconds, anything can pass through portals and maintain its velocity");
		return;
		case "Swapper":
			return("Fire a projectile that passes through walls which will cause you to swap places with any player it hits.");
		break;
		case "Hyper Beam":
			return("Charge a beam for 1 second. Once fired it spans the whole map and does 90 damage per second to anyone it is hitting for 2 seconds")
		break;
		case "Duel Bomb":
			return("Throw a bomb which pulls any nearby players into the duel dimension. They remain there for 8 seconds or until there is only 1 team alive, then they teleport to their position before entering the duel dimension.")
		break;
		case "Sleep Dart":
			return("Shoot a dart which applies drowsy to enemies. Enemies will be drowsy for 2 seconds before falling asleep for 5 seconds. Taking damage while asleep causes them to wake up")
		break;
		case "Toss":
			return("Makes a short range grab attack. Release to throw any grabbed players to the location of your mouse")
		break;
		case "Warp Points":
			return("Place a warp point where you a standing. There is no limit to how many warp points can exist at a time. Anyone on your team can teleport from one to any other. Warp points are destroyed if an enemy walks on them.")
		break;
		case "Blood Shot":
			return("Fire a projectile which deals 100 damage. Using this ability makes you take 50 AP damage");
		break;
		case "Fertilizer":
			return("Throw fertilizer which lands after 1.5 seconds creating a bush. The bush disappears after 30 seconds");
		break;
		case "Machete":
			return("Make a slashing attack which deals 70 damage. Hitting a bush will destroy the bush for 60 seconds. Any enemies inside a bush when it is destroyed will take 200 damage. Deals double damage to jungle camps")
		break;
		case "Quill":
			return("Hold to leave a trail behind you. 2 seconds after releasing the trail will explode.")
		break;
		case "Leap":
			return("Quickly jump a short distance. Only works if you jump to or from a bush")
		break;
		case "Bat":
			return("Hold to charge and release to swing. Damage ramps from 60 to 180 over 3 seconds of charging. Cannot walk or attack while charging. Can hit airborne targets.")
		break;
		case "Milk":
			return("Throw a glass of milk which covers nearby enemies in milk. Attacking milky enemies heals you the amount of damage dealt. Can be thrown at allies to put out fire.")
		break;
		case "Confuse":
			return("A skill shot which confuses enemies for 3 seconds. When confused you cannot change directions and continue walking in the direction you were previously walking.");
		break;
		case "Chum":
			return("Throw a bucket which covers nearby players in chum. While chummed players will lure nearby monsters and take double damage from monsters")
		break;
		case "Holster":
			return("Use to switch guns. After selecting this ability, equip a different gun to switch between them.");
		break;
		case "Quick Tap":
			return("Use to instantly reload your gun and become ready to attack.")
		break;
		case "Body Slam":
			return("Jump straight up and down over 1 second, creating a shockwave where you land. The shockwave stuns nearby enemies for a duration depending on your current HP. (100 HP = 1 second of stun)")
		break;
		case "Shield":
			return("Shield yourself or an ally for 7 seconds. While shielded they take half damage from attack damage.")
		break
		case "Ability Shield":
			return("Shield yourself or an ally for 7 seconds. While shielded they take half damage from ability damage.")
		break
		case "PokeBall":
			return("Throw at a monster to capture it. Throw again to release the monster where the PokeBall lands. The monster keeps the same amount of HP it had when it was captured.")
		break;
		case "Wind Bomb":
			return("A thrown ability which, when it lands, deals 30 damage and knocks nearby players up for 1 second");
		break;
		case "Gravity Well":
			return("Instantly places a gravity well where your mouse is. Any airborne objects (thrown abilities as well as airborne players) will be pulled towards it.")
		break;
		case "Mark":
			return("Use this ability within 3 seconds of dealing AD damage to an opponent to teleport next to them.")
		break;
		case "Chomp":
			return("A melee attack which deals damage equal to 50% of the user's missing health. Hitting an enemy heals the user to an amount equal to damage dealt.")
		break;
		case "Ghost":
			return("Become ghosted for 2 seconds. While ghosted you take no damage or knockback from AD sources");
		break;
		case "Rest":
			return("Deal 135 damage to any nearby enemies but put yourself to sleep for 5 seconds.");
		break;
		case "Bump":
			return("Knock back nearby players and the ball in the direction your mouse is pointed.")
		break;
		case "Jam":
			return("A point and click ability which jams a target's gun for 1.5 seconds. While jammed they cannot use their primary weapon.");
		break;
		case "Drone":
			return("Fire a drone which can take control of the ball. While controlling the ball you can move the ball with WASD but you lose ammo every second. The longer you are droning the faster it uses ammo")
		break;
		case "Shuriken":
			return("Shoot a shuriken which deals 50 damage. If you hit you refund the ammo and reset the cooldown to 1 second.");
		break;
		case "Curse":
			return("Shoot a projectile which curses enemies. After you curse an enemy you begin charging the attack and can recast to deal 50-200 damage depending on how long you charged. Being moved resets the charge.")
		break;
		case "Cross Zone":
			return("A thrown ability that creates a zone when it lands. When entering or exiting this zone you take 100 damage")
		break;
		case "Caltrops":
			return("A thrown ability which scatters caltrops over an area that apply 1 second of bleed to enemies who walk on them")
		break;
	}
}