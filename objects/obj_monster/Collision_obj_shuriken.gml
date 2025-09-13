/// @description Insert description here
// You can write your code in this editor
scr_monster_dmg(50,other.num,false)
damagedNum = other.num
instance_destroy(other);
		with(ball_game) {
			node_send(buffer,"eventName","Status", "Target", other.damagedNum,"Status Num", 49)
		}