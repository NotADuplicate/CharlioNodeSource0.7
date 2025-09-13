/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_text(x,y,"Disconnect")
if(room == room1) {
	if(global.connected)
		draw_text(512,y-200,"")
	else
		draw_text(512,y-200,"Connection Failed")
}