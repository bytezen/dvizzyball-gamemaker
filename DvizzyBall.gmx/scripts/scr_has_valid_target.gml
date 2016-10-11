/// scr_has_valid_target(id)

/* 
  argument0 - child of obj_card
  
  returns true if the instance has at least one valid_target 
  that equals at least one of the global.valid_targets
  
*/

var inst = argument0;
var i;


with( inst ) {
for( i = 0 ; i < array_length_1d(valid_targets) ; i++) {
    if( scr_contains(valid_targets[i], global.drop_targets) >= 0 ) {
        return true; 
    }
 }   
 return false;
}  
