///scr_on_hand_change(id, player, oldval, newval)

var inst = argument0;
var old = argument1;
var new = argument2;

var deckSize, player;

switch(inst.object_index) {
   case obj_pitcher_hand_controller:
        deckSize = PITCHER_DECK_SIZE;
        player = PITCHER;
        break;
   case obj_batter_hand_controller:
        deckSize = BATTER_DECK_SIZE;
        player = BATTER;
        break;
   case obj_fielder_hand_controller:
        deckSize = FIELDER_DECK_SIZE;
        player = FIELDER;
        break;
   default:
        show_error("unknown player. setting deck size to 0.",false);
        deckSize = 0;
}
        
console('LISTENER:: got the event --- ' + player + ' hand changed!!!!');
console('     hand = ' +   scr_list_to_string(inst.store.data[? player]));

//Set the values for the views of this instance to the new values
for(var i=0; i < ds_list_size( new ); i++ ) {
     inst.view[| i].value = new[| i];
     //reset the position
     inst.view[| i].x = inst.view[| i].startx;
     inst.view[| i].y = inst.view[| i].starty;
}

  //delete view instanaces that we don;t need
for(var ii= ds_list_size(new); ii < deckSize; ii++) {
     with( inst.view[| ii] ) {
           instance_destroy();
     }
     ds_list_delete(inst.view,ii);
}
