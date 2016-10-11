///scr_batter_swing(id)

/*

    argument0 -- id
     
    batter has played a swing card; 
    we are going to allow invalid cards and count them as strikes...so
    (1) need to check that this is a valid play
    (2) if it is valid then allow defense to field
 
*/

var instance = argument0;
var card_value;

 
with( instance ) {
  card_value = value;
}

var rank = scr_card_rank(card_value);

// case (1)
var madeContact = scr_is_divisible(global.currentPitch, rank)
//console(" current pitch = " + string(global.currentPitch) + " swing value = " + string(value) + " MADE CONTACT = " + string(madeContact));


if(!madeContact) {
    scrDispatch(INNING_ACTION_STRIKE, id);
    
    /*
    TODO: Move this logic to the inning controller
    if( global.strikes > 2 ) {
        scr_struck_out();
        if( global.outs > 2) {
        
        } else {
            scr_ready_for_pitch();
        }
    } else {
        scr_ready_for_pitch();
    }
    */
} else {
    //this uses the old call reducer directly method
    //TODO: change to something like
    scrDispatch( ATBAT_ACTION_CONTACT, rank )
    //scr_reducer_atbat(ATBAT.contact,rank);
}

//TODO:
// Inning controller will manage the at bat state
// scr_reducer_atbat(ATBAT.over,noone);
