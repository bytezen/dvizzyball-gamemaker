///scr_pitch_thrown(id)

/*
 pitcher has chosen a card to play; now check to see if it is a walk
 if not then it's the batters turn to decide what to do

 argument0 -- id
 
 access the value instance property to get the value of the pitch card 
*/

var instance = argument0;


//with( instance ) {
//    card_value = value;
//}
 
//var value = scr_card_rank(argument0);




//Check for a walk
if( scr_is_walk() ) {
    // we need to handle a walk situation
} else {
    //scr_reducer_plate(ACTION.pitch, value);
    scrDispatch( ATBAT_ACTION_PITCH, instance);
/*
    // add this pitch to the pitch sequence
    ds_list_add(global.pitch_sequence,value);
    
    // now its the batters turn
    // if there are runners than the batter can steal or swing
    // otherwise they can only swing
    if( scr_runners_on_base() ) {
        global.plateState = PLATE.swing_or_steal;
    } else {
        global.plateState = PLATE.swing;
    }
*/    
}
