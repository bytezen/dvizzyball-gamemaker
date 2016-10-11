///scr_set_obj_card_value(id,value)

var card_id = argument0;
var value = argument1;

if( value >= 0 ) {
    with(card_id) {
        card_id.value = value;
        card_id.rank = scr_card_rank(value);
        card_id.suit = scr_card_suit(value);
}
}
