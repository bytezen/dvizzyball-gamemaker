/*
  argument0 -- shuffle flag should the deck be at the end and need to be recreated.
  return a card from the deck if there are more;
*/


if( ds_stack_size(global.deck) <= 0 ) {
    scr_create_deck();
}

return ds_stack_pop(global.deck); 
