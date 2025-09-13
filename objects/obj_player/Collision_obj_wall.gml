/// @description Get pushed
x += sign(x-other.x)*5;
y += sign(y-other.y)*5;
if(global.passive == "Juggernaut") {
    other.x -= sign(x-other.x)*4;
    other.y -= sign(y-other.y)*4;
    other.hp--;
}
    

