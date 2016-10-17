///scr_deal_to_player(current_hand_list, player)

//return the needed cards

var cardList = argument0;
var player = argument1;

var i, deckSize, newHand;


cards = noone;
newHand = ds_list_create();
ds_list_copy(newHand, cardList);

switch( player ) {
    case PITCHER:
        deckSize = PITCHER_DECK_SIZE;
        break;
    case FIELDER:
        deckSize = FIELDER_DECK_SIZE;
        break;
    case BATTER:
        deckSize = BATTER_DECK_SIZE;
        break;
    default:
        show_error("***unknown player. cannot create deck***",true);
}


for( i = ds_list_size(cardList); i < deckSize; i++) {
    newHand[| i] = scr_deal_card(true);     
    console("     new hand: " + string(newHand[|      i]));                    
}            

return newHand;

