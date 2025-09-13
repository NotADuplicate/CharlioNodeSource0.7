// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_anglesDist(){
	dir1 = argument0;
	dir2 = argument1;
	dirDiff = abs(dir1-dir2);
	if(dirDiff > 180) 
		dirDiff = abs(dirDiff-360);
	return(dirDiff);
}