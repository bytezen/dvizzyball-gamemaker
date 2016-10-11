///scr_list_to_string(id)

var list = argument0;
var str = "{";
for(var i=0; i < ds_list_size(list); i++) {
   if(i > 0)  str += ", "; 
   str += string(list[| i]);
}
str += "}";
return str;
