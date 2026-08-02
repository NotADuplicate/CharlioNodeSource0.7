/// scr_ability_synergy
/// Ability stats + synergy system for GameMaker Studio 2 (GML)
///
/// Core idea:
///   - Each AbilityStats struct has its own base stats, plus a "synergies"
///     map describing how OTHER stats (from abilities in the same loadout)
///     boost THIS ability's stats.
///   - synergies[$ targetStat][$ sourceStat] = multiplier
///     e.g. synergies.damage.mobility = 3
///     means "this ability's damage gets +3 per point of mobility
///     already present in the loadout".
///   - To recommend abilities, ability_recommend() tries each candidate in
///     the loadout and scores the WHOLE group at once (see
///     ability_loadout_score), so synergy bonuses are correctly resolved
///     in dependency order and a candidate gets credit for boosting
///     abilities already equipped, not just its own stats.

#region Constructor

function AbilityStats() constructor {
    // -- core combat stats --
    // Add as many of these as you want; you never need to "register" a
    // new stat name anywhere else. Just add the field here.
    damage      = 0;
    monsterTake = 0;
    mobility    = 0;
    ballPush    = 0;
    fire        = 0;
    selfDamage  = 0;
	ammoSupply  = 0;
	CC			= 0;
	zoning		= 0;
	healing		= 0;
	AP			= 0;
	AD			= 0;
	healPassive = 0;
    
    // synergies[$ targetStat][$ sourceStat] = multiplier
    synergies = {};
    
    /// @function add_synergy(targetStat, sourceStat, multiplier)
    /// @description "targetStat gains +multiplier per point of sourceStat
    ///               already present in the loadout"
    static add_synergy = function(_targetStat, _sourceStat, _multiplier) {
        if (!variable_struct_exists(synergies, _targetStat)) {
            synergies[$ _targetStat] = {};
        }
        synergies[$ _targetStat][$ _sourceStat] = _multiplier;
        return self;
    }
    
    /// @function get_effective_stats([loadout])
    /// @param {Struct} [_loadout] - stat values to read synergy sources from.
    ///        Pass ability_loadout_effective_stats() so any dependency
    ///        chains between stats (A boosted by B, B boosted by C, etc.)
    ///        are already resolved in the right order before this ability
    ///        reads from them. Omit _loadout to just get this ability's raw
    ///        base stats with no synergy applied.
    /// @return {Struct} this ability's stats with synergy bonuses applied
    static get_effective_stats = function(_loadout = undefined) {
        var _result = ability_get_own_stats(self);
        
        if (!is_undefined(_loadout)) {
            var _targets = variable_struct_get_names(synergies);
            for (var i = 0; i < array_length(_targets); i++) {
                var _target = _targets[i];
                var _sources = synergies[$ _target];
                var _sourceNames = variable_struct_get_names(_sources);
                var _bonus = 0;
                for (var j = 0; j < array_length(_sourceNames); j++) {
                    var _source = _sourceNames[j];
                    var _mult = _sources[$ _source];
                    var _loadoutVal = variable_struct_exists(_loadout, _source)
                        ? _loadout[$ _source] : 0;
                    _bonus += _loadoutVal * _mult;
                }
                _result[$ _target] = (variable_struct_exists(_result, _target)
                    ? _result[$ _target] : 0) + _bonus;
            }
        }
        
        if (variable_struct_exists(_result, "damage") && variable_struct_exists(_result, "damageMultiplier")) {
            _result.damage *= _result.damageMultiplier;
        }
        
        return _result;
    }
}

#endregion

#region Helpers

/// @function ability_get_own_stats(ability)
/// @description Plain struct of just this ability's numeric combat stats
///              (skips the synergies struct and methods).
function ability_get_own_stats(_ability) {
    var _out = {};
    var _names = variable_struct_get_names(_ability);
    for (var i = 0; i < array_length(_names); i++) {
        var _name = _names[i];
        if (_name == "synergies") continue;
        var _val = _ability[$ _name];
        if (is_method(_val)) continue;
        if (is_real(_val)) {
            _out[$ _name] = _val;
        }
    }
    return _out;
}

/// @function ability_aggregate_stats(abilityArray)
/// @param {Array<Struct.AbilityStats>} _abilities - abilities in the loadout
/// @return {Struct} summed raw base stats across all of them
function ability_aggregate_stats(_abilities) {
    var _agg = {};
    for (var i = 0; i < array_length(_abilities); i++) {
        var _own = ability_get_own_stats(_abilities[i]);
        var _names = variable_struct_get_names(_own);
        for (var j = 0; j < array_length(_names); j++) {
            var _name = _names[j];
            _agg[$ _name] = (variable_struct_exists(_agg, _name)
                ? _agg[$ _name] : 0) + _own[$ _name];
        }
    }
    return _agg;
}

/// @function ability_array_contains_string(array, value)
/// @description Small helper since not all GameMaker versions ship array_contains.
function ability_array_contains_string(_array, _value) {
    for (var i = 0; i < array_length(_array); i++) {
        if (_array[i] == _value) return true;
    }
    return false;
}

/// @function ability_resolve_stat(name, abilities, raw, resolved, resolving)
/// @description Internal recursive helper. Resolves the fully synergy-adjusted
///              value of a single stat across a loadout by first resolving
///              whatever stats feed INTO it (working backwards through the
///              chain, however deep it goes), then applying this stat's own
///              synergy bonuses on top of those already-resolved values.
///              e.g. to resolve "damage" (boosted by "slow"), it first fully
///              resolves "slow" - which means first resolving whatever "slow"
///              depends on ("fire"), before "slow" is used to boost "damage".
///              Results are memoized in _resolved so each stat is only
///              computed once no matter how many other stats depend on it.
///              If a chain loops back on a stat that's still being resolved
///              higher up the call stack (a cycle), that link falls back to
///              the stat's raw, un-boosted value instead of recursing
///              further - i.e. that part of the loop is effectively applied
///              in whatever order the loop happened to be entered.
/// @param {String} _name - stat name to resolve
/// @param {Array<Struct.AbilityStats>} _abilities - every ability in the loadout
/// @param {Struct} _raw - raw (un-synergized) stat totals, from ability_aggregate_stats
/// @param {Struct} _resolved - memo of already-resolved stat values (mutated)
/// @param {Struct} _resolving - stat names currently on the call stack (mutated)
/// @return {Real} the resolved value for this stat
function ability_resolve_stat(_name, _abilities, _raw, _resolved, _resolving) {
    if (variable_struct_exists(_resolved, _name)) return _resolved[$ _name];
    
    var _rawValue = variable_struct_exists(_raw, _name) ? _raw[$ _name] : 0;
    
    if (variable_struct_exists(_resolving, _name)) {
        // Cycle detected - this stat is already being resolved further up
        // the call stack. Break the loop here by contributing just the raw
        // value for this particular link; the rest of the chain still
        // resolves normally above us.
        return _rawValue;
    }
    
    _resolving[$ _name] = true;
    
    var _total = _rawValue;
    for (var i = 0; i < array_length(_abilities); i++) {
        var _synergies = _abilities[i].synergies;
        if (!variable_struct_exists(_synergies, _name)) continue;
        
        var _sources = _synergies[$ _name];
        var _sourceNames = variable_struct_get_names(_sources);
        for (var j = 0; j < array_length(_sourceNames); j++) {
            var _source = _sourceNames[j];
            var _mult = _sources[$ _source];
            var _sourceValue = ability_resolve_stat(_source, _abilities, _raw, _resolved, _resolving);
            _total += _sourceValue * _mult;
        }
    }
    
    variable_struct_remove(_resolving, _name);
    _resolved[$ _name] = _total;
    return _total;
}

/// @function ability_loadout_effective_stats(abilities)
/// @description Computes the fully synergy-resolved totals for every stat
///              across the whole group, respecting dependency order - if
///              stat A's synergy depends on stat B, B is resolved first
///              (and if B depends on C, C first, and so on down the chain),
///              rather than every stat only ever reading everyone else's
///              raw, un-boosted values. Cycles (a chain that loops back on
///              itself) are broken automatically - see ability_resolve_stat.
/// @param {Array<Struct.AbilityStats>} _abilities
/// @return {Struct} resolved effective totals, keyed by stat name
function ability_loadout_effective_stats(_abilities) {
    var _raw = ability_aggregate_stats(_abilities);
    var _resolved = {};
    var _resolving = {};
    
    // collect every stat name that appears anywhere - as a raw stat, or as
    // a synergy target/source - so the returned struct covers all of them
    var _allNames = variable_struct_get_names(_raw);
    for (var i = 0; i < array_length(_abilities); i++) {
        var _targets = variable_struct_get_names(_abilities[i].synergies);
        for (var t = 0; t < array_length(_targets); t++) {
            var _target = _targets[t];
            if (!ability_array_contains_string(_allNames, _target)) {
                array_push(_allNames, _target);
            }
            var _sourceNames = variable_struct_get_names(_abilities[i].synergies[$ _target]);
            for (var s = 0; s < array_length(_sourceNames); s++) {
                if (!ability_array_contains_string(_allNames, _sourceNames[s])) {
                    array_push(_allNames, _sourceNames[s]);
                }
            }
        }
    }
    
    for (var i = 0; i < array_length(_allNames); i++) {
        ability_resolve_stat(_allNames[i], _abilities, _raw, _resolved, _resolving);
    }
    
    return _resolved;
}

/// @function ability_loadout_score(abilities, [weights], [caps], [defaultWeight])
/// @description Scores an entire loadout at once (base stats + every
///              cross-ability synergy bonus), instead of scoring one
///              ability in isolation. Caps are applied to the loadout's
///              final total for a stat, so it doesn't matter which
///              ability contributed how much of it.
/// @param {Array<Struct.AbilityStats>} _abilities
/// @param {Struct} [_weights] - optional per-stat weighting
/// @param {Struct} [_caps] - optional per-stat caps applied to the loadout total.
///        Stats not listed are uncapped.
/// @param {Real} [_defaultWeight] - weight for stats not listed in _weights (default 1)
/// @return {Real} total loadout score
function ability_loadout_score(_abilities, _weights = undefined, _caps = undefined, _defaultWeight = 0) {
    var _totals = ability_loadout_effective_stats(_abilities);
    var _total = 0;
    var _names = variable_struct_get_names(_totals);
    
    for (var i = 0; i < array_length(_names); i++) {
        var _name = _names[i];
        var _w = _defaultWeight;
        if (!is_undefined(_weights) && variable_struct_exists(_weights, _name)) {
            _w = _weights[$ _name];
        }
        if (_w == 0) continue;
        
        var _value = _totals[$ _name];
        var _counted = _value;
        
        if (_value > 0 && !is_undefined(_caps) && variable_struct_exists(_caps, _name)) {
            _counted = min(_value, _caps[$ _name]);
        }
        
        _total += _counted * _w;
    }
    
    return _total;
}

/// @function ability_recommend(candidates, equipped, [weights], [caps], [defaultWeight])
/// @description For each candidate, builds a trial loadout of
///              equipped + candidate and scores that WHOLE loadout with
///              ability_loadout_score, so a candidate gets credit both
///              for its own (synergy-boosted) stats AND for any boost it
///              gives to abilities already equipped. Results are sorted
///              by the resulting total score, and each entry also
///              reports "gain" - how much higher the loadout score is
///              with this candidate than with the current loadout alone.
/// @param {Array<Struct.Ability>} _candidates - abilities the player doesn't have yet
/// @param {Array<Struct.Ability>} _equipped - abilities the player currently has
/// @param {Struct} [_weights] - optional scoring weights
/// @param {Struct} [_caps] - optional per-stat caps, e.g. { damage: 10 }. Stats
///        not listed are uncapped.
/// @param {Real} [_defaultWeight] - weight for any stat not listed in _weights.
///        Default 1 (sum everything equally). Pass 0 if you only want the
///        stats named in _weights to count at all.
/// @return {Array<Struct>} candidates sorted descending by score,
///         each entry = { ability, score, gain, effective }
function ability_recommend(_candidates, _equipped, _weights = undefined, _caps = undefined, _defaultWeight = 0) {
    var _loadout = convert_array_to_stats(_equipped);
	var _baseline = ability_loadout_score(_loadout, _weights, _caps, _defaultWeight);
    var _equippedResolved = ability_loadout_effective_stats(_loadout);
    var _scored = [];
    
    for (var i = 0; i < array_length(_candidates); i++) {
        var _ability = _candidates[i];
		if(array_contains(_equipped,_ability)) {
			if(variable_struct_exists(_ability,"maxStacks")) {
				var _count = 0;
				for (var j = 0; j < array_length(_equipped); j++) {
					if(variable_struct_exists(_equipped[j], "maxStacks") && _equipped[j].sprite == _ability.sprite) { _count++; }
				}
				if(_count >= _ability.maxStacks) {
					show_debug_message("Already have too many of passive")
					show_debug_message(_ability.text)
					continue; }
			} else { 
					show_debug_message("Already have too many of ability")
					show_debug_message(_ability.name)
				continue; } // its an ability they already have so cant take another one
		}
        
        var _trial = array_create(0);
        for (var k = 0; k < array_length(_loadout); k++) {
            array_push(_trial, _loadout[k]);
        }
        array_push(_trial, _ability.stats);
        
        var _score = ability_loadout_score(_trial, _weights, _caps, _defaultWeight);
        
        array_push(_scored, {
            ability: _ability,
            score: _score,
            gain: _score - _baseline,
            effective: _ability.stats.get_effective_stats(_equippedResolved)
        });
    }
  
		if(array_length(_scored) == 0) {
			show_debug_message("Empty recommendations")
			show_debug_message("Loadout:")
		    scr_print_loadout(_equipped);
			show_debug_message("Candidates:")
		    scr_print_loadout(_candidates)
		}
	
    array_sort(_scored, function(_a, _b) { return _b.score - _a.score; });
    return _scored;
}

#endregion

function convert_array_to_stats(abilities) {
	var stats = [];
	var i = 0;
	repeat(array_length(abilities)) {
		array_push(stats,abilities[i].stats);
		i++;
	}
	return stats;
}

function scr_print_loadout(_loadout) {
	for (var i = 0; i < array_length(_loadout); i++) {
		var _ability = _loadout[i];
		if(variable_struct_exists(_ability,"name")) {
			show_debug_message(_ability.name)
		} else if(variable_struct_exists(_ability,"text")) {
			show_debug_message(_ability.text)
		} else {
			show_debug_message(_ability)
		}
	}
}