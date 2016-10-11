/*
    handle state updates for at bat actions.

    argument0 -- action
    argument1 -- value
        
    * pitch
    * swing
    * steal
    * field
    
*/

var action = argument0;
var payload = argument1;

console('... scr_reducer_plate handling ...');

switch(action) {
    //case ACTION.batter_up:
        //clear targets
        // reset targets for pitcher
        // reset turnState
        // reset plateState
        //make sure pitcher Hand = 3 cards
        // make sure fielder Hand = 3 cards
        // make sure batter Hand = 3 cards  
     //   break;
    case ATBAT_ACTION_PITCH:
        console("... ... handling action: " + action);
        break;

        /*        
    case ACTION.wait_for_pitch:
        global.drop_targets = 0;
        global.drop_targets[0] = instance_find(obj_pitch_deck,0);
        global.turnState = TURN.defense;
        global.plateState = PLATE.pitch;
        //clear the active targets
 
        break;
        */
    case ACTION.pitch:
        // add this pitch to the pitch sequence
        ds_list_add(global.pitch_sequence,payload);
        global.currentPitch = payload;    
        global.turnState = BATTER; //TURN.offense;
                
        // now its the batters turn
        // if there are runners than the batter can steal or swing
        // otherwise they can only swing
        if( scr_runners_on_base() ) {
            global.plateState = PLATE.swing_or_steal;
        } else {
            global.plateState = PLATE.swing;
        }
        
        global.drop_targets = 0;
        global.drop_targets[0] = instance_find(obj_batter_deck, 0);
        
                
        break;
    case ACTION.swing:
        show_error("ACTION.swing not implemented ", false);    
        break;
    case ACTION.steal:
        show_error("ACTION.steal not implemented ", false);    
        break;
    case ACTION.field:
        show_error("ACTION.field not implemented ", false);
        break;
    default:
        console("unknown reducer_plate action: " + string(action));

}
