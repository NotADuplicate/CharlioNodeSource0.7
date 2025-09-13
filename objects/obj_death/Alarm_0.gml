/// @description Convert num to string
if(typeof(num) != "string") {
    if(num == obj_client.index)
        num = "Yourself";
    else
        num = global.names[num];
}

