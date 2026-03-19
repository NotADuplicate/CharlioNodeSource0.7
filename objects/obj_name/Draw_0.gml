/// @description Draw name
draw_self();
if(!typing)
	draw_text_transformed(x,y-8,string_hash_to_newline(global.name),1.5,1.5,0);
else if(string_length(keyboard_string) == 0) {
	draw_text_transformed(x,y-8,string_hash_to_newline("Enter Name"),1.5,1.5,0);
} else {
	draw_text_transformed(x,y-8,string_hash_to_newline(keyboard_string),1.5,1.5,0);
}