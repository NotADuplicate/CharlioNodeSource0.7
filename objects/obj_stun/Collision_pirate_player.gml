///Stun players on low hp
if(other.num != num && other.hp < 100) {
	other.reload = 900;
	if(other.beast)
		other.reload = 150;
}