/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_black)
draw_text(x,y-18,"Lobby " + string(lobbyNum));
draw_text(x,y+5,string(numPlayers) + "/6");
draw_set_color(c_white)