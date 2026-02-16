/// @description Start expanding from the top
height = 0;
xp = 50;
xp2 = 1000;
yp = 40;
global.options = false;
global.optionState = "General";

scr_load_options();

firstDraw = true;
wipe = false;
borderColor = c_black;
rectColor = c_dkgray;
tabsColor = c_gray;

global.optionsSurf = surface_create(950,700);

instance_create(300,500,sound_control);
instance_create(300,300,music_control);
instance_create(300,400,shake_control);
instance_create(200,300,obj_fullscreen);
instance_create(500,300,obj_mapToggle);
instance_create(700,300,obj_chatToggle);
instance_create(475,550,options_disconnect);


scr_makeBind(150,300,"Q","Qkey","Qbutton","Second Ability");
scr_makeBind(300,300,"space","spacekey","spacebutton","Third Ability");
scr_makeBind(450,300,"R","Rkey","Rbutton","Fourth Ability");
scr_makeBind(600,300,"M","mapKey","mapbutton","Map");
//instance_create(600,300,rebind_map);

instance_create(300,400,unbind_button);