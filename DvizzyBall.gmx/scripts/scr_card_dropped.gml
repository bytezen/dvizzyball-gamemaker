///scr_card_dropped(id)


var card = store_atbat.data[? "currentSelectedCard"];
var validTarget = store_atbat.data[? "validDropObjects"]
var drop_hit = noone;
var over_valid_target = false;
var i;

for( i=0; i < ds_list_size(validTarget); i++) {
   if( position_meeting(mouse_x, mouse_y, validTarget[| i]) ) {
       drop_hit = validTarget[| i];
   }
}

if( drop_hit != noone ) {
    drop_hit.value = card.value;
    drop_hit.sprite_index = spr_card;
    drop_hit.image_index = drop_hit.value;
    script_execute(drop_hit.on_change_handler, drop_hit);
} else { // restore the selected Card to its original origin
  card.x = card.startx;
  card.y = card.starty;
}


scrDispatch(ATBAT_ACTION_CARD_DROPPED, id);
