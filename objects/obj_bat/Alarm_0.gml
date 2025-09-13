/// @description Link to player
link = global.players[num];

dmg = 50 + round(1.5*x)
show_debug_message("Bat Damage: " + string(dmg))
x = link.x;
y = link.y;
active = true;
image_angle -= 120
visible = true;