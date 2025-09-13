// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_makeBind(xp,yp,let,key,button,str){
	inst = instance_create(xp,yp,rebind_example);
	inst.letter = let;
	inst.myKey = key;
	inst.myButton = button;
	inst.txt = str;
}