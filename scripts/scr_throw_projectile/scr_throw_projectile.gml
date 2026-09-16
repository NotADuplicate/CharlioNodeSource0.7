function scr_throw_projectile(num, dir, heldSpr, projectile, lag){
	with(obj_gun) {
		if(self.num == num) {
			throwSprite = heldSpr;
			throwing = true;
			throwProjectile = projectile;
			throwProjectileDir = dir;
			throwTimer = lag;
			alarm[5] = lag;
		}
	}
}