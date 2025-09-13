/// @description set alarm and range
alarm[1] = 1;
link = self;
ballLinked = false;
alarm[2] = 60;
timer = Abilities.chainbreaker.duration;
i = 0;
repeat(10) {
	chained[i] = false;
	i++;
}