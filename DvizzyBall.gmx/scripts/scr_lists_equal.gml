///scr_compare_lists(listA, listB)

var a = argument0;
var b = argument1;
var len = ds_list_size(a);
 
console(" ??? list-equal list A = " + scr_list_to_string(a) + " B= " + scr_list_to_string(b));

if( len != ds_list_size(b) ) {
console(" ??? list-equal ??? -- returning false");
    return false;
} 

for(var i=0; i < len; i++) {
    if( a[| i] != b[| i]) {
console(" ??? list-equal ??? -- returning false");    
        return false;
    }
}
console(" ??? list-equal ??? -- returning true");
return true;
