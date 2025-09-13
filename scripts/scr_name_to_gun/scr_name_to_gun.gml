// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_name_to_gun(name){
switch(name) {
    case "Void Gun":
        return obj_void;
    break;
    case "Pop Gun":
        return obj_ARbullet;
    break;
    case "Melee":
        return obj_melee;
    break;
    case "Pistol":
        return obj_bullet;
    break;
    case "Grenade Launcher":
        return obj_grenade;
    break;
    case "Minigun":
        return obj_minigun;
    break;
    case "Boomerang":
        return obj_boomerang;
    break;
    case "Curve Gun":
        return obj_curve;
    break;
    case "Charge Pistol":
        return virgin_bullet;
    break;
    case "Shotgun":
        return obj_shotgun;
    break;
    case "Rifle":
        return other_bolt;
    break;
}
}