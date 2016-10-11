///scr_reducer_turn_manager(action, payload)

var action = argument0;
var payload = argument1;

console('...scr_reducer_turn_manager handling ...');

switch(action) {
    case CHANGE_PLAYER_TURN:
        global.turnState = payload;
        break;
    case ATBAT_ACTION_PITCH:
        console('... ... action: ' + action);
            
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
        global.turnState =  BATTER;// TURN.offense;
        break;         
    default:
        console("... **** Unknown action for reducer_turn_manager: " + action);
        break;
        
}
