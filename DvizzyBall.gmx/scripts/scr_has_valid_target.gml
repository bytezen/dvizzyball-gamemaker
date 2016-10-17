/// scr_has_valid_target(id)

/* 
  argument0 - child of obj_card
  
  returns true if the instance has at least one valid_target 
  that equals at least one of the global.valid_targets
  
*/

var inst = argument0;
var i;
var store = instance_find(store_atbat,0);


with( inst ) {
    
  for( i=0; i < ds_list_size(valid_targets); i++) {
       if( ds_list_find_index(store.data[? "validDropObjects"], valid_targets[| i]) > -1 ) {
           return true;
       }
  }
}
return false;


/*
for( i = 0 ; i < array_length_1d(valid_targets) ; i++) {
    if( scr_contains(valid_targets[i], global.drop_targets) >= 0 ) {
        return true; 
    }
 }   
 return false;
 */
  
