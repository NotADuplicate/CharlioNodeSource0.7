// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_sprite(ability){
	switch(ability) {
		case "Hook":
			return(spr_hook);
		break;
		case "heal":
			return(spr_heal);
		break;
		case "dash":
			return(spr_speed)
		break;
		case "push":
			return(spr_push);
		break;
		case "wall":
			return(spr_barrier);
		break;
		case "airstrike":
			return(spr_airstrike);
		break;
		case "reflect":
			return(spr_reflect);
		break;
		case "Stasis":
			return(spr_clock);
		break;
		case "Chainbreaker":
			return(spr_chain);
		break;
		case "mine":
			return(spr_mine);
		break;
		case "flash":
			return(spr_flash);
		break;
		case "teleport":
			return(spr_revenant);
		break;
		case "finisher":
			return(spr_grave);
		break;
		case "invisibility":
			return(spr_eye);
		break;
		case "molotov":
			return(spr_molotov);
		break;
		case "ward":
			return(spr_ward);
		break;
		case "cleaver":
			return(spr_cleaver);
		break;
		case "Death Touch":
			return(spr_deathball);
		break;
		case "Enrage":
			return(spr_anger);
		break;
		case "Block":
			return(spr_defense);
		break;
		case "Poison Dagger":
			return(spr_knife);
		break;
		case "Gas Trap":
			return(spr_caustic);
		break;
		case "Spell Shield":
			return(spr_spellShield);
		break;
		case "Healing Point":
			return(spr_ward);
		break;
		case "Decay":
			return(spr_decay);
		break;
		case "Ammo Shot":
			return(spr_ammo);
		break;
		case "Armor Break":
			return(spr_spear);
		break;
		case "Frost Shot":
			return(spr_frost);
		break;
		case "Ninja Slash":
			return(spr_ninja);
		break;
		case "Blast Off":
			return(spr_engine);
		break;
		case "Oil Can":
			return(spr_jerryCan);
		break;
		case "Flare Gun":
			return(spr_flare);
		break;
		case "Fire Axe":
			return(spr_fireaxe);
		break;
		case "Shield Bash":
			return(SD_shieldBash);
		break;
		case "Sledge Hammer":
			return(spr_sledge);
		break;
		case "Cryofreeze":
			return(spr_ice);
		break;
		case "Leech":
			return(spr_leech);
		break;
		case "Big Gun":
			return(spr_biggun);
		break;
		case "Flashbang":
			return(spr_flashbang);
		break;
		case "Implosion Grenade":
			return(spr_pushBomb);
		break;
		case "Inverter":
			return(spr_inversion);
		break;
		case "Health Bomb":
			return(spr_healthBomb);
		break;
		case "Portal Gun":
			return(spr_portalGun);
		break;
		case "Swapper":
			return(spr_swapper);
		break;
		case "Hyper Beam":
			return(spr_laserTrap);
		break;
		case "Duel Bomb":
			return(spr_duel);
		break;
		case "Sleep Dart":
			return(spr_blowDart);
		break;
		case "Toss":
			return(spr_glove);
		break
		case "Warp Points":
			return(SD_blueWarp);
		break;
		case "Blood Shot":
			return(spr_blood);
		break;
		case "Fertilizer":
			return(spr_fertilizer);
		break;
		case "Machete":
			return(SD_machete);
		break;
		case "Quill":
			return(spr_quill);
		break;
		case "Leap":
			return(bush_boots);
		break;
		case "Bat":
			return(SD_bat);
		break;
		case "Milk":
			return(SD_milk);
		break;
		case "Confuse":
			return(spr_confuse);
		break;
		case "Chum":
			return(spr_meat);
		break;
		case "Holster":
			//spr = scr_gun_sprite(global.holster)
			return(spr_holster);
		break;
		case "Quick Tap":
			return(spr_fastfire);
		break;
		case "Body Slam":
			return(spr_jugg);
		break;
		case "Shield":
			return(spr_sponge);
		break;
		case "PokeBall":
			return(spr_pokeball);
		break;
		case "Wind Bomb":
			return(spr_windBomb);
		break;
		case "Gravity Well":
			return(spr_gravity);
		break;
		case "Ability Shield":
			return(spr_magicSponge);
		break;
		case "Mark":
			return(spr_airstrike);
		break;
		case "Chomp":
			return(spr_fangs);
		break;
		case "Ghost":
			return(spr_ghost);
		break;
		case "Bump":
			return(spr_blast);
		break;
		case "Rest":
			return(spr_sleeping);
		break;
		case "Jam":
			return(spr_jam);
		break;
		case "Drone":
			return(spr_drone);
		break;
		case "Shuriken":
			return(spr_shuriken);
		break;
		case "Curse":
			return(spr_pentagram);
		break;
		case "Cross Zone":
			return(SD_crossZone);
		break;
		case "Caltrops":
			return(spr_caltrops);
		break;
		case "Rocket":
			return(spr_rocket);
		break;
	}
	show_debug_message(ability);
}