/*
    argument0 -- ATBAT action
    argument1 -- card
*/

var action = argument0;
var payload = argument1;
var store = instance_find(store_atbat,0);
var deckStore = instance_find(obj_deck_store, 0);

console('...scr_reducer_atbat handling action: ' + action);

switch(action) {
    //case ATBAT_ACTION_BATTER_TURN_COMPLETE:
         // when this action is called then all of the batter, steals,
         // the swing or pitch taken
         // properties should be set in a model cache.
         // This action will handle (a) clearing the cache and (b) copying the cache
         // values to the store values that will trigger UI and game updates
         // Don't forget to change the ATBAT_STATE to defense
                  
      //   break;
    case ATBAT_ACTION_CARD_DROPPED:
        store.data[? "currentSelectedCard"] = noone;
         break;
    case ATBAT_ACTION_SELECT_CARD:
         store.data[? "currentSelectedCard"] = id;
         break;
    case INNING_ACTION_PLAY_BALL:
        //global.drop_targets = 0;
        //global.drop_targets[0] = instance_find(obj_pitch_deck,0);
        
        ds_list_clear(store.data[? "validDropObjects"]);
        ds_list_add(store.data[? "validDropObjects"], instance_find(obj_pitch_deck,0));
        store.data[? "playerTurn"] = PITCHER;
        store.data[? "state"] = ATBAT_STATE_PITCHING;
        //global.turnState = PITCHER;
        break;
    case ATBAT_ACTION_PITCH:
        // expected payload: integer
        console('... ... action: ' + action + " payload: " + string(payload));

        
        // update the pitch sequence
        var oldSequence = store.data[? "pitchSequence"];
        var newSequence = ds_list_create();
        
        ds_list_copy(newSequence, oldSequence);
        
        ds_list_add(newSequence, payload);
        
        scr_set_store_value(store, "pitchSequence", newSequence);
                        
        //update the current pitch
        scr_set_store_value(store, "currentPitch", payload);
        
        //update the pitcher's hand
        var oldhand = deckStore.data[? PITCHER];
        var newhand = ds_list_create();
        ds_list_copy(newhand, oldhand);

        
        for(var i=0; i < ds_list_size(newhand); i++) {
          if(payload == newhand[| i]) {
             ds_list_delete(newhand, i);
             break;
          }
        }
        scr_set_store_value(deckStore,"PITCHER",newhand);
        
        
        //cleanup old lists
        ds_list_destroy(oldSequence);
        ds_list_destroy(oldhand);
                
                
        // now its the batters turn
        // if there are runners than the batter can steal or swing
        // otherwise they can only swing
        if( scr_runners_on_base() ) {
            store.data[? "state"] = ATBAT_STATE_HITTING_OR_STEALING;

            global.plateState = PLATE.swing_or_steal;
            global.turnState = BASE_RUNNER;
            
            //TODO:
            //   add drop targets for each base that is a valid base to steal
        } else {
            store.data[? "playerTurn"] = BATTER; 
            //setup new drop targets
            ds_list_clear(store.data[? "validDropObjects"]);
            ds_list_add(store.data[? "validDropObjects"], instance_find(obj_batter_deck,0))
            ds_list_add(store.data[? "validDropObjects"], instance_find(obj_drop_take_strike,0));

            store.data[? "state"] = ATBAT_STATE_HITTING;
            //global.turnState = BATTER;
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
        // clear the batter deck or strike deck
        // clear the pitch deck
        // set the atbat state to pitching
        // this should happen independently of inning over?
        // the inning will handle any re-deals and such if necessary
        
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
//        global.inningStatus = INNING_STATUS_BATTER_ON_DECK;
        break;        
    default:
        show_error("unknown atbat action: " + string(action), true);
}
