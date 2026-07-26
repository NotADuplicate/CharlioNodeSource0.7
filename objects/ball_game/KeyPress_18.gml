abilityList = [Abilities.shuriken, Abilities.frost, Abilities.axe, Abilities.blastOff, Abilities.bloodshot, Abilities.cleaver, Abilities.dash, Abilities.healBomb];
ability1 = choose(Abilities.shuriken, Abilities.frost, Abilities.axe, Abilities.blastOff, Abilities.bloodshot, Abilities.cleaver, Abilities.dash, Abilities.healBomb);
gunObj = choose(Abilities.pistol,Abilities.melee,Abilities.shotgun);

var _weights = { damage: 1, ballPush: 0.5 };

show_debug_message("Starting set:")
show_debug_message(ability1.name)
show_debug_message(gunObj.name)

var _ranked = ability_recommend(abilityList, [ability1,gunObj]);
show_debug_message(_ranked)
ability2 = _ranked[0].ability;

_ranked = ability_recommend(abilityList, [ability1,ability2,gunObj]);
ability3 = _ranked[0].ability;
show_debug_message(_ranked)