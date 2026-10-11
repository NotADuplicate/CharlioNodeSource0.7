/// @description Draw HP
//if(global.gameMode != "Royale") {
if(seen == 0 || sameTeam) {
	draw_self();

	if(blocking) 
		draw_sprite(spr_defense,0,x,y);
}
		
if(shield > 0) {
	draw_sprite_ext(spr_sponge,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,shield/100);
	shield--;
}