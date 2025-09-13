/// @description Decide if seen
if(position_meeting(x,y,obj_cover) == false) {
	if(seen > 0 && invPass)
		seen--;
	else
		seen = 0;
}
else {
	cov = instance_position(x,y,obj_cover)
	if(cov.seen = false)
		seen = 30
	else
		seen = 0;
}
if(sameTeam && seen != 0)
	image_alpha = .5;
else if(ghosting > 0) {
	image_alpha = .5;
}
else
	image_alpha = 1;
	
if(ghosting > 0)
	ghosting--;