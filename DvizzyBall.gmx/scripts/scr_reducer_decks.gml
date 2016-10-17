///scr_reducer_cards(action, payload)

var action = argument0;
var payload = argument1;
var store = instance_find(obj_deck_store,0);
var newHand = noone;

console(" HANDLING ACTION; " + action);

switch(action) {
    case CARD_ACTION_DEAL_PITCHER:
         console(" -- ACTION -- Dealing PITCHER --");
         
        //how many cards do we need
        var pitcherDeck = ds_map_find_value(store.data, PITCHER);
        newHand = scr_deal_to_player( pitcherDeck ,PITCHER);
        scr_set_store_value(store, PITCHER, newHand);
        
        /* 
        var _ind = 0;
        var hand = store.data[? PITCHER];
        console(" ** NEW PITCHER VALUES ** ");
        repeat(3) {
            console("   ^^^^^ " + string( hand[| _ind]));
            _ind++;
         }
         console(" *************************** ");
         console("");
         */

        break;
    case CARD_ACTION_DEAL_FIELDER:
         
        break;
    case CARD_ACTION_DEAL_BATTER:         
        console(" -- ACTION -- Dealing BATTER --");
        var batterDeck = ds_map_find_value(store.data, BATTER);
        newHand = scr_deal_to_player(batterDeck, BATTER);
        scr_set_store_value(store, BATTER, newHand);                
        
        break;
}

