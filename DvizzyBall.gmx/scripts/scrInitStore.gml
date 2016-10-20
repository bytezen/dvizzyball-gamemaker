///scrStore()

/*
    initialize the data store action mapping
    
*/

global.actionStoreMap = ds_map_create();
var map = global.actionStoreMap;
//var arr = 0;

//ds_map_add( global.actionStoreMap, INNING_ACTION_STRUCK_OUT, scr_reducer_inning);
//map[? INNING_ACTION_STRUCK_OUT] = scr_reducer_inning;
scr_register_action(INNING_ACTION_STRUCK_OUT, scr_reducer_inning);

scr_register_action(INNING_ACTION_STRIKE, scr_reducer_inning);
scr_register_action(ATBAT_ACTION_TAKE_STRIKE, scr_reducer_atbat);
//map[? INNING_ACTION_STRIKE] = scr_reducer_inning;

//arr= 0;
//arr[0] = scr_reducer_plate;
//arr[1] = scr_reducer_turn_manager;
//map[? ATBAT_ACTION_PITCH] = arr;
scr_register_action(ATBAT_ACTION_PITCH, scr_reducer_atbat);
scr_register_action(ATBAT_ACTION_CONTACT, scr_reducer_atbat);
scr_register_action(ATBAT_ACTION_SELECT_CARD, scr_reducer_atbat);
scr_register_action(ATBAT_ACTION_CARD_DROPPED, scr_reducer_atbat);
scr_register_action(ATBAT_ACTION_BATTER_SAFE, scr_reducer_atbat);

//arr = 0;
//arr[0] = scr_reducer_inning;
//arr[1] = scr_reducer_drag_n_drop;
//map[? INNING_ACTION_PLAY_BALL] = arr;

scr_register_action(INNING_ACTION_PLAY_BALL, scr_reducer_inning);
//scr_register_action(INNING_ACTION_PLAY_BALL, scr_reducer_drag_n_drop);
scr_register_action(INNING_ACTION_PLAY_BALL, scr_reducer_atbat);

scr_register_action(INNING_ACTION_CHANGE_STATE, scr_reducer_inning);
//map[? INNING_ACTION_CHANGE_STATE] = 

scr_register_action(CARD_ACTION_DEAL_PITCHER, scr_reducer_decks);
scr_register_action(CARD_ACTION_DEAL_FIELDER, scr_reducer_decks);
scr_register_action(CARD_ACTION_DEAL_BATTER, scr_reducer_decks);

