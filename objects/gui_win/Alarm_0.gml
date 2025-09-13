/// @description Figure out who won
if(num == -1) {//team game
	if(teamwin) {
		str = "Right Team";
	}
	else
		str = "Left Team";
}
else if(num == 0) 
    str = "No one";
else
    str = global.names[num];

