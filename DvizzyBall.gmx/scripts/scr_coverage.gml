/*
    argument0 -- list
    argument1 -- list
    
    return the percentage of argument0 that is shared with argument1
*/

var intersection = scr_list_intersection(argument0, argument1);

return array_length_1d(intersection) / ds_list_size(argument0);
