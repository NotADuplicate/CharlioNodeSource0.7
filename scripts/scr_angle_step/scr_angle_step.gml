/// @function scr_angle_step(current, target, increment)
/// @description Steps `current` towards `target` by up to `increment` degrees,
///              taking whichever direction (CW/CCW) is shorter. Never
///              overshoots past `target`, and wraps correctly across 0/360.
/// @param {Real} _current   - current direction, in degrees
/// @param {Real} _target    - target direction, in degrees
/// @param {Real} _increment - max degrees to move this call
/// @return {Real} new direction in degrees, in [0, 360)
function scr_angle_step(_current, _target, _increment) {
    var _diff = angle_difference(_target, _current); // shortest signed diff, -180..180
	if(_diff < _increment) { return _target; }
    var _step = clamp(_diff, -_increment, _increment);
    return (_current + _step + 360) mod 360;
}