/// @description Insert description here
// You can write your code in this editor
///Create buffer
var size = 1024;
var type = buffer_grow;
var alignment = 1;
global.ammobuffer = buffer_create(size,type,alignment);

//basic loadout
room_goto(room1)