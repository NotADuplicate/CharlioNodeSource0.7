/// @description Get hit
scr_player_move(point_direction(other.x,other.y,x,y),Abilities.shatter.knockback)
scr_damage(Abilities.shatter.damage,other.num,false);
instance_destroy(other)