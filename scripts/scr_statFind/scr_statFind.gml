// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_statFind(i,val){
	switch(i) {
		case 0:
			stat = ("statAmmmo")
		break;
		case 5:
			stat = ("statDmg")
		break;
		case 2:
			stat = ("statMobi")
		break;
		case 3:
			stat = ("statPush")
		break;
		case 4:
			stat = ("statSup")
		break;
		case 6:
			stat = ("statZone")
		break;
		case 7:
			stat = ("statCC")
		break;
		case 8:
			stat = ("statDef")
		break;
		case 1:
			stat = "statCooldown"
	}
	if(val = -1)
		return(variable_instance_get(self,stat))
	else
		variable_instance_set(self,stat,val)
}