/// @description Float away
y-=1
alpha-=.02
if(alpha < .05)
	instance_destroy();