///scr_contains(item, list_Or_Array)

/* 
    argument0 -- value
    argument1 -- list
    
    return the index of the item in the list or array if it exists
            otherwise return -1
*/

var value = argument0;
var collection = argument1;
var i, len = 0;


            

if( is_array(collection) ) {
    len = array_length_1d(collection);

    for(i = 0; i < len; i++) {
        if( collection[i] == value ) {
            return i;
        }
    }
    
    return -1;
} 
else if( ds_exists(collection,ds_type_list) ) {
    return ds_list_find_index(argument1, argument0);
} else {
    return -1;
}


