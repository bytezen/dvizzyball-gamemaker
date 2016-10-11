/// return the array of factors between 1 and value
/*
   argument0 -- number
*/

var value, ret, ind, i ;
value = scr_card_rank(argument0);
ind = 0;
i = 1;

repeat(value) 
{
    if (scr_is_divisible(value,i) ) { 
        ret[ind] = i;
        ind++; 
    }
    i++;   
}

return ret;
