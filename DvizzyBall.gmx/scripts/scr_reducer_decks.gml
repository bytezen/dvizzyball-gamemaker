///scr_reducer_cards(action, payload)

var action = argument0;
var payload = argument1;
var store = instance_find(obj_deck_store,0);
var newHand = noone;

console(" HANDLING ACTION; " + action);
var _player;

switch(action) {
    case CARD_ACTION_DEAL_PITCHER:
         
         console(" -- ACTION -- Dealing PITCHER --");
         _player = PITCHER;

         
        //how many cards do we need
        //var pitcherDeck = ds_map_find_value(store.data, PITCHER);
        //newHand = scr_deal_to_player( pitcherDeck ,PITCHER);
        //scr_set_store_value(store, PITCHER, newHand);
        
        break;
    case CARD_ACTION_DEAL_FIELDER:
        console(" -- ACTION -- Dealing BATTER --");
        _player = FIELDER;         
        break;
    case CARD_ACTION_DEAL_BATTER:         
        console(" -- ACTION -- Dealing BATTER --");
        _player = BATTER;
        //var batterDeck = ds_map_find_value(store.data, BATTER);
        //newHand = scr_deal_to_player(batterDeck, BATTER);
        //scr_set_store_value(store, BATTER, newHand);                
        
        break;
}

_deck = ds_map_find_value(store.data, _player);
// the deck may have fewer cards than the player needs
// this script will fill it out
newHand = scr_deal_to_player(_deck ,_player);
scr_set_store_value(store, _player, newHand);


