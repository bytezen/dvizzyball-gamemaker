///scr_on_pitcher_hand_change(id, oldval, newval)
/*
  argument0 -- the object that set this handler
*/

var inst = argument0;
var old = argument1;
var new = argument2;

console('got the event --- pitcher hand changed!!!!');
with(inst) {
  //iterate through the views and set the values to new value??
  for(var i=0; i < array_length_1d(view); i++) {
      view[i].value = new[| i];
  }
}
