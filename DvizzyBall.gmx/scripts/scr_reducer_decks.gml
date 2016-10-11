///scr_reducer_cards(action, payload)

var action = argument0;
var payload = argument1;
var store = instance_find(obj_deck_store,0);

console(" HANDLING ACTION; " + action);

switch(action) {
    case CARD_ACTION_DEAL_PITCHER:
         console(" -- ACTION -- Dealing PITCHER --");
         
        //how many cards do we need
        var pitcherDeck = noone;
        /*
        var store = dataStore.store;
        pitcherDeck = ds_map_find_value(store, PITCHER);        
        
        var cardCount = ds_list_size(pitcherDeck);
        if( cardCount < PITCHER_DECK_SIZE ) {
            console("    card count = " + string(cardCount));
            var newHand = ds_list_create();
            ds_list_copy(newHand, pitcherDeck);
            for(var i=cardCount; i < PITCHER_DECK_SIZE; i++) {
                newHand[| i] = scr_deal_card(true);     
                console("     new hand: " + string(newHand[|      i]));                    
            }            
            
            //add data to store
            scr_set_store_value(dataStore, PITCHER, newHand);            
        }
*/
        
                
        with(store) {
            pitcherDeck = ds_map_find_value(data, PITCHER);
            //ds_map_find_value(store, PITCHER);
            
            var cardCount = ds_list_size(pitcherDeck);
            if( cardCount < PITCHER_DECK_SIZE ) {
                console("    card count = " + string(cardCount));
                var newHand = ds_list_create();
                ds_list_copy(newHand, pitcherDeck);
                for(var i=cardCount; i < PITCHER_DECK_SIZE; i++) {
                    newHand[| i] = scr_deal_card(true);     
                    console("     new hand: " + string(newHand[|      i]));                    
                }            
                
                //add data to store
                scr_set_store_value(id, PITCHER, newHand);            
            }
            var _ind = 0;
            var hand = store.data[? PITCHER];
            console(" ** NEW PITCHER VALUES ** ");
            repeat(3) {
                console("   ^^^^^ " + string( hand[| _ind]));
                _ind++;
             }
             console(" *************************** ");
             console("");
        }


        break;
    case CARD_ACTION_DEAL_FIELDER:
        break;
    case CARD_ACTION_DEAL_BATTER:
        break;
}

