///scr_fielder_make_play(id)

var instance = argument0;
var card_value, obj;


with( instance ) {
      card_value = value;
      obj = object_index;
}

var rank = scr_card_rank(card_value);

//if this is a legitimate out then dispatch it to be handled it
if( obj == obj_fielder_deck ) {
    console("woo hoo dropped onto the fielder deck");
}

// if not then dispatch error

