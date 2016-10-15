///scr_on_pitcher_hand_change(id, oldval, newval)
/*
  argument0 -- the object that set this handler
*/

var inst = argument0;
var old = argument1;
var new = argument2;

console('got the event --- pitcher hand changed!!!!');
console('     hand = ' +   scr_list_to_string(inst.store.data[? PITCHER]));

with(inst) {
  for(var i=0; i < ds_list_size( new ); i++ ) {
     view[| i].value = new[| i];
  }
  
  //delete view instanaces that we don;t need
  for(var ii= ds_list_size(new); ii < PITCHER_DECK_SIZE; ii++) {
     with( view[| ii] ) {
           instance_destroy();
     }
     ds_list_delete(view,ii);
  }
  //iterate through the views and set the values to new value??
  //for(var i=0; i < array_length_1d(view); i++) {
  //    view[| i].value = new[| i];
  //}
}
