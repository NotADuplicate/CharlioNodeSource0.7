/// @description Start expanding from the top
height = 0;
xp = 50;
xp2 = 1000;
yp = 40;
global.shop = false;
global.shopState = "Passives";
tabs = true;
depth = 1;

firstDraw = true;
wipe = true;
borderColor = c_black;
rectColor = c_dkgray;
otherRectColor = c_dkgray
tabsColor = c_gray;


recentlyHeld = 0;
global.shopSurf = surface_create(950,700);

//instance_create(0,0,ins_sort);

instance_create(100,600,select_right)
instance_create(200,600,select_Q)
instance_create(300,600,select_space)

instance_create(0,0,obj_utilityHeld);
/*instance_create(300,500,sound_control);
instance_create(300,400,shake_control);
instance_create(200,300,obj_fullscreen);

scr_makeBind(150,300,"Q","Qkey","Qbutton","Second Ability");
scr_makeBind(300,300,"space","spacekey","spacebutton","Third Ability");
scr_makeBind(450,300,"R","Rkey","Rbutton","Fourth Ability");

instance_create(300,400,unbind_button);