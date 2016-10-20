///scr_card_toString(id)

var card = argument0;
var str="{value: " + string(card.value) + 
        " rank: " + string(scr_card_rank(card.value)) + 
        " suit: " + scr_card_suit(card.value) + "}";
        
return str;

