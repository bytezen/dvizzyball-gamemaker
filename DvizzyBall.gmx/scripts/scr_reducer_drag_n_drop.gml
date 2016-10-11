///scr_reducer_drag_n_drop(action, payload)

var action = argument0;
var payload = argument1;

console('... scr_drag_n_drop handling ...');

switch(action) {    
    case INNING_ACTION_PLAY_BALL:
        console('... ... action: ' + action);
        global.drop_targets = 0;
        global.drop_targets[0] = instance_find(obj_pitch_deck,0);        
        break;
    default:
        console("Unknown action for drag_n_drop reducer: " + action);
        break;
}
