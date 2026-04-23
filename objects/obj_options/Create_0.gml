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

scr_makeBind(500,140, "RC", "rightkey", "rightbutton", "First Ability")
scr_makeBind(500,210,"Q","Qkey","Qbutton","Second Ability");
scr_makeBind(500,280,"space","spacekey","spacebutton","Third Ability");
scr_makeBind(500,350,"R","Rkey","Rbutton","Fourth Ability");
scr_makeBind(500,420,"M","mapKey","mapbutton","Map");
scr_makeBind(500,490,"P","shopKey","shopbutton","Shop");
scr_makeBind(500,560,"B","backKey","backbutton","Back");

instance_create(500,630,unbind_button);