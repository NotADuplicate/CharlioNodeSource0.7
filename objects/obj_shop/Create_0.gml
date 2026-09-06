/// @description Start expanding from the top
height = 0;
xp = 50;
xp2 = 1000;
yp = 40;
global.shop = false;
global.shopState = "Passives";
global.keepUtility = false; //sets to true when you do something with utility, when false it clears utility var
tabs = true;
depth = 1;

firstDraw = true;
wipe = true;
borderColor = c_black;
rectColor = c_dkgray;
otherRectColor = c_dkgray
tabsColor = c_gray;

//AI colors
rectColor   = make_color_rgb(22, 24, 23);   // #161817 main background
tabsColor   = make_color_rgb(39, 38, 32);   // #272620 selected tab
borderColor = make_color_rgb(201, 157, 60); // #C99D3C gold
tabGlowColor = make_color_rgb(103, 79, 27); // #674F1B


recentlyHeld = 0;
global.shopSurf = surface_create(950,700);

//instance_create(0,0,ins_sort);

instance_create(700,630,select_right)
instance_create(795,630,select_Q)
instance_create(890,630,select_space)

instance_create(0,0,obj_utilityHeld);
lastUtilityClass = noone;
lastFreeSecond = -1;
/*instance_create(300,500,sound_control);
instance_create(300,400,shake_control);
instance_create(200,300,obj_fullscreen);

scr_makeBind(150,300,"Q","Qkey","Qbutton","Second Ability");
scr_makeBind(300,300,"space","spacekey","spacebutton","Third Ability");
scr_makeBind(450,300,"R","Rkey","Rbutton","Fourth Ability");

instance_create(300,400,unbind_button);