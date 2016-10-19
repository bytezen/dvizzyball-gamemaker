///scr_reducer_inning(action, payload)

/* 
    handle store updates for the inning
    
    argument0 -- action
    argument1 -- payload
    
*/

var action = argument0;
var payload = argument1;
var store = instance_find(store_inning, 0);


switch (action) {
    case INNING_ACTION_CHANGE_STATE:
        console('... {INNING_REDUCER} handling action: ' + action);
        console("... ... state = " + payload);
        scr_set_store_value(store, "state", payload);
        //global.inningStatus[? "state"] = payload;
        
        break;
    case INNING_ACTION_PLAY_BALL:
        console('... {INNING_REDUCER} handling action: ' + action);
        //is this where we should handle dealing the cards??
        //var ctrl = instance_find(obj_game_controller,0);
        //scr_deal_all();
        //scr_deal_pitcher(ctrl);
        //scr_deal_fielder(ctrl);
        //scr_deal_batter(ctrl);
        /*        
        global.inningStatus[? "state"] = INNING_STATE_BATTER_UP;
        global.inningStatus[? "outs"] = 0;
        global.inningStatus[? "strikes"] = 0;
        global.inningStatus[? "homeTeamRuns"] = 0;
        global.inningStatus[? "visitingTeamRuns"] = 0;        
    */
        
        break;
                
    case INNING_ACTION_STRUCK_OUT:
        console('... {INNING_REDUCER} handling action: ' + action);    
        console("...action " + action +"  !!! STRUCK 'EM OUT !!!");
        break;
    case INNING_ACTION_STRIKE:  
        console('... {INNING_REDUCER} handling action: ' + action);    
        console("action: " + action + "  ...STRIKE...");
        // update the global inning state
        var strikes = store.data[? "strikes"];
        scr_set_store_value(store, "strikes", strikes + 1);
        //global.inningStatus[? "strikes"]++;
        
        console(" total strikes = " + string(store.data[? "strikes"]));
        break;
//    case INNING_ACTION_SINGLE:
//        break;
    default:
        break;
}
