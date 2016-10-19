/// scr_inning_execute_state()

//var state = global.inningStatus[? "state"];
var store = instance_find(store_inning,0);
var state = store.data[? "state"];

switch( state ) {
    case STATE_NONE:
        //console("{inning_execute_state} executing: " + global.inningStatus[? "state"] );
        break;
    case INNING_STATE_START:
        console("{inning_execute_state} executing: " + store.data[? "state"] );  
        scr_deal_pitcher();
        scr_deal_fielder();
        scr_deal_batter();
        
        scrChangeState(INNING_STATE_PLAYING_AN_AT_BAT);        
        break;
    case INNING_STATE_BATTER_UP:
        //nextState = INNING_STATE_PLAYING_AN_AT_BAT;
        break;
    case INNING_STATE_PLAYING_AN_AT_BAT:
        break;
    case INNING_STATE_SIDE_OUT:
        break;
    case INNING_STATE_INNING_OVER:
        break;
    case INNING_STATE_AT_BAT_OVER:
        nextState = INNING_STATE_SIDE_OUT;
        break;
}

