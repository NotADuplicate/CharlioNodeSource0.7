/// @description Get name
global.name = get_string("What's your name?",choose("Nerd","Fool","Chief","Bro","Homie","King","Homeslice","Dude","Gamer"));
while(string_length(global.name) > 12) {
    global.name = get_string("Please select something 12 characters or less",choose("Nerd","Fool","Chief","Bro","Homie","King","Homeslice","Dude","Gamer"));
}

ini_open("Ball.sav")
ini_write_string("Save1","Name",global.name)
ini_close()