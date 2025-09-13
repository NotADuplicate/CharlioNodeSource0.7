function scr_word() {
	clue = scr_clue()
	var word = "Poop"
	switch(clue) {
		case "Food":
			word = choose("Potato","Chicken","Soup","Salad","Toast","Crab","Carrot","Bananna","Apple","Cheese","Hot dog","Chocolate","Bacon","Grape","Lemon","Ham");
		break;
		case "Location":
			word = choose("Cabin","Airport","Church","School","Beach","Mountain","Cave","New York","Los Angeles","London","Chicago","Bathroom","Bedroom","Kitchen","Movie theatre","Stadium","Museum");
		break;
		case "Occupation":
			word = choose("Pilot","Doctor","Scientist","Athlete","Nurse","Actor","Musician","Programmer","Engineer","Astronaut","CEO","Banker","Accountant","Writer","Waiter");
		break;
		case "Body Part":
			word = choose("Finger","Foot","Toe","Neck","Hair","Penis","Eye","Eyelash","Eyebrow","Toenail","Finger nail","Butt","Hand","Shoulder","Knee","Head");
		break;
		case "Animal":
			word = choose("Dog","Cat","Sheep","Cow","Moose","Racoon","Robin","Hawk","Eagle","Pig","Deer","Bear","Monkey","Human","Alien");
		break;
		case "Game/Sport":
			word = choose("Basketball","Soccer","Edward Zero Hands","Football","Hockey","SCP","League of Legends","Swimming","Dodge ball","Horse racing","Running","Climbing");
		break;
		case "Emotion":
			word = choose("Happy","Angry","Sad","Excited","Cringe","Depression","Tired");
		break;
		case "Miscellaneous":
			word = choose("Gay","Oak","Monitor","Printer","Television","Door","Closet","Balloon","Leaf","Poison Ivy")
		case "Username (In This game)":
			word = global.names[irandom_range(1,array_length_1d(global.names)-1)]
		break;
	}
	return(word);


}
