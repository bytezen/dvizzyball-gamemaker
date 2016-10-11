/*
    argument0 -- ATBAT action
    argument1 -- card
*/

var action = argument0;
var payload = argument1;

console('...scr_reducer_atbat handling action: ' + action);

switch(action) {
    case INNING_ACTION_PLAY_BALL:
        global.drop_targets = 0;
        global.drop_targets[0] = instance_find(obj_pitch_deck,0);
        global.turnState = PITCHER;
        break;
    case ATBAT_ACTION_PITCH:
        console('... ... action: ' + action);
        ds_list_add(global.pitch_sequence,value);
        
        global.currentPitch = payload;    
        //global.turnState = BATTER; //TURN.offense;
        //global.drop_targets = 0 ;
        //global.drop_targets[0] = 
                
        // now its the batters turn
        // if there are runners than the batter can steal or swing
        // otherwise they can only swing
        if( scr_runners_on_base() ) {
            global.plateState = PLATE.swing_or_steal;
            global.turnState = BASE_RUNNER;
            
            //TODO:
            //   add drop targets for each base that is a valid base to steal
        } else {
            global.turnState = BATTER;
            global.plateState = PLATE.swing;            
            global.drop_targets[0] = instance_find(obj_batter_deck, 0);  
            global.drop_targets[1] = instance_find(obj_drop_take_strike, 0);      
            
        }
        
        
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
        
        break;
    case ATBAT_ACTION_TAKE_STRIKE:
        console('... ... action: ' + action);
        // clear the current pitch ...
        var pitchInstance = global.currentPitch;
        show_debug_message("length of pitch hand = " + string(array_length_1d(global.decks[? PITCHER])));
        global.currentPitch = noone;
    
        with(pitchInstance) { instance_destroy(); }

        show_debug_message("length of pitch hand = " + string(array_length_1d(global.decks[? PITCHER])));        
             // clear the current value from the strike drop target
        // scoot the pitch cards over
        // scoot the batter cards over
        // change the state of the ATBAT to take a pitch
        break;    
        /*
    case ATBAT.swing_strike:
        
        show_error("ATBAT.swing_strike not implemented ", false);        
        break;
    case ATBAT.took_strike:
        show_error("ATBAT.took_strike not implemented ", false);        
        break;
    case ATBAT.walk:
        show_error("ATBAT.walk not implemented ", false);        
        break;
    case ATBAT.hit:
       show_error("ATBAT.hit not implemented ", false);       
        //var bases = scr_bases(global.currentPitch, value);
        break;
        */
    case ATBAT_ACTION_CONTACT:  // the ball is in play; defense can try to field
        //global.currentRunnerInPlay = value;
        global.turnState = FIELDER;
        var bases = scr_bases(global.currentPitch, value);
        //global.playerState = FIELDER;
        //global.plateState = PLATE.field;
        
        //the batter can be thrown out no matter what:
        
        // for now all cards move! 
        // eventually give need to determine if there are force plays?
        
        //for potential home run you only have a play on hit
        //for triple you have a play at third and at home (n times, depending on the number of runners that were on base) 
        global.drop_targets = 0;
        global.drop_targets[0] = instance_find(obj_fielder_deck,0);
        /*
        global.drop_targets[0] = instance_find(obj_first_base,0);
        global.drop_targets[1] = instance_find(obj_second_base,0);
        global.drop_targets[2] = instance_find(obj_third_base,0);
        global.drop_targets[3] = instance_find(obj_home_base,0);
        */
        break;
    case ATBAT.over:
        console("at bat resolved");
        global.inningStatus = INNING_STATUS_BATTER_ON_DECK;
        break;        
    default:
        show_error("unknown atbat action: " + string(action), true);
}
