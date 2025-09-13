/// @description Heal
/*
instance_destroy();
other.hp += 20;
if(other.hp > 100)
    other.hp = 100;
other.image_alpha = other.hp/100;

/* */
///Ammo
instance_destroy();
scr_ammo(-1);

/* */
///Maybe activate ult
if(global.passive = "Ultimate" && global.ammo == 7) {
    obj_player.alarm[6] = 1;
    scr_ammo(-7);
}

/* */
/*  */
