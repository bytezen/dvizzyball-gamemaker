///scr_deal_to_player(action,player)

var action = argument0;
var player = argument1;

var map = global.decks;
var cards, i;
i = 0;
cards = noone;

if( ds_map_exists( global.decks, player ) ) {
    cards = global.decks[? player];
    repeat( ds_list_size( cards ) ) {

        if( cards[| i] == FACE_DOWN || cards[| i] == HIDDEN_CARD ) {
            cards[| i] = scr_deal_card(true);
            i++;
        }        
    }
}

/*
switch( player ) {
    case PITCHER:
        cards = map[? PITCHER];
        break;
    case FIELDER:
        cards = map[? FIELDER];    
        break;
    case BATTER:
        break;

}

if( cards != noone) {
    repeat( ds_list_size( cards ) ) {

    }         
}
*/
