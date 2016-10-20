///initialize globals 

// Create some globals

/* 
this is a hack because ds_exists(id, ds_type_list)
is returning true when id is a number...weird...
*/
enum TYPE {
     primitive,
     list,
     instance
}


// SHOULD NOT NEED ENUMS beneath here
enum TEAM {
    home,
    guest
}


enum PLAYER {
    pitcher,
    batter,
    fielder
}



enum INNING_ACTION {
    struck_out,
    fly_out,
    thrown_out,
    tagged_out,
    walk,
    single,
    double,
    triple,
    home_run
}


enum INNING_STATE {
    none,
    top,
    bottom,
    top_side_out,
    bottom_side_out
}


enum TURN {
    offense,
    defense,
    pitch
}

enum PLATE {
    none = 0 ,
    pitch = 1,
    swing_or_steal = 2,
    swing = 3,
    field = 4
}

enum ACTION {
    wait_for_pitch,
    swing,
    pitch,
    field,
    steal
}

enum ATBAT {
    swing_strike,
    took_strike,
    walk,
    hit,
    contact,
    over
}

enum DROP_TARGET {
    pitcher,
    fielder,
    batter,
    first_base,
    second_base,
    third_base,
    home_base
}




// -- UI Globals

global.show_debug = true;
global.debug = false;

global.currentActivePlayers = noone;
//global.currentActiveTargets = 0; //array of targets that cards can be discarded

//
//global.inningState = INNING_STATUS_BATTER_ON_DECK;
//global.inningNumber = 0;
//global.inningHalf = INNING_HALF_TOP;

global.turnState = noone;
global.plateState = PLATE.pitch;
//global.atBatState = ATBAT_STATE_NONE;

//global.drop_targets = noone;  // the current active drop targets depends on turnState


//global.currentPitch = noone;
//global.pitch_sequence = ds_list_create();

global.inningNumber = 1;

//Create the deck
global.deck = scr_create_deck();


global.gameStatus = ds_map_create();
global.gameStatus[? "homeScore"] = 0;
global.gameStatus[? "guestScore"] = 0;
global.gameStatus[? "inningNumber"] = 0;
