/// @description Insert description here
// You can write your code in this editor
event_inherited();
polygon = polygon_from_instance(id);
// Plain walls in both game modes are stationary; doors remain dynamic.
if(object_index == pirate_wall || object_index == ball_wall) flags |= eShadowCasterFlags.Static;
hp = 0;
depth = 5;
