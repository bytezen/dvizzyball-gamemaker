///scr_create_deck()

var shuffle = SHUFFLE_DECK;


var i, cards, ret;
cards = ds_list_create();
ret = ds_stack_create();

i = 1;

repeat(52) 
{
    ds_list_add(cards, i);
    i++;
}

if(shuffle) ds_list_shuffle(cards);

i = 51;
repeat(52) {
    ds_stack_push(ret, ds_list_find_value(cards,i));
    i--;
} 

return ret;
