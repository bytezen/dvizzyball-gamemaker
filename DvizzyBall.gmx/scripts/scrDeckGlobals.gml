///scrDeckGlobals()


var list, index ; 
global.decks = ds_map_create();

//Pitcher Deck initialize
global.decks[? PITCHER] = ds_list_create();
list = global.decks[? PITCHER];
index = 0;

repeat(PITCHER_DECK_SIZE) {
    list[| index++] = 0;
}



//Fielder Deck initialize
list = ds_list_create();
index = 0;
repeat(FIELDER_DECK_SIZE) {
    list[| index++] = 0;
}

global.decks[? FIELDER] = list;


//Batter Deck initialize
list = ds_list_create();
index = 0;
repeat(BATTER_DECK_SIZE) {
    list[| index++] = 0;
}

global.decks[? BATTER] = list;




