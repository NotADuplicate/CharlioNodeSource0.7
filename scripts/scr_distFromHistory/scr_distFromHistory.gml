function scr_distFromHistory(xp, yp){
	var shortestDist = 50;
	var newDist = 0;
	for(i = 0; i < array_length(obj_bigBall.ballHistory); i++) {
		newDist = abs(xp-obj_bigBall.ballHistory[i].xp) + abs(yp-obj_bigBall.ballHistory[i].yp)
		if(newDist < shortestDist) { shortestDist = newDist; }
	}
	return shortestDist;
}