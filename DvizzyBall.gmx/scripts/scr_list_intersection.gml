/*
  argument0 -- list 1
  argument1 -- list 2

  given two lists returns an array that contains values in both
*/

var a, b, len, i, ret, index, val;

if( ds_list_size(argument0) <= ds_list_size(argument1) ) {
    a = argument0;
    b = argument1;
} else {
    b = argument0;
    a = argument1;
}

index = 0; 
for(i=0; i < ds_list_size(a); i++ ) {
    val = ds_list_find_value(a,i);
    
    if( scr_contains( val, b ) > -1 ) {
     ret[index] =  val;
     index++;
    }
}

return ret;


