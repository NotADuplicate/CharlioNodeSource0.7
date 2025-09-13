/// @desc Set up rotation
Light_Type = "Spot Light";
// Inherit the parent event
event_inherited();

pause = false;
dir = 1;

alarm_set(1, game_get_speed(gamespeed_fps) * 3);