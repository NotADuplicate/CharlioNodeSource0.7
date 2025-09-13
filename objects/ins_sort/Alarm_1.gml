/// @description Sort by order they exist in
order = 1;
with(inst_utility) {
	/*if(statOrder[other.statNum] == 0) {
		x = -100;
		y = 0;
	}
	else {*/
		x = 52 + ((other.order-1) mod 10)*59
		y = 4110 + 65*floor(other.order/10 - 0.01)
//	}
	order = other.order;
	other.order++;
	drawOnce = 1;
}