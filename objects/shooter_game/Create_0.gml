
/// @description Set vars
timer = 0;
reload = 0;
backlog = 0;
spray = 0;
healuse = 1;
totalspray = 0;//how much ammo is queued up
extra = true; //only use ammo every other bullet

///Create buffer
var size = 1024;
var type = buffer_grow;
var alignment = 1;
buffer = buffer_create(size,type,alignment);
socket = obj_client.socket;

