/*
    argument0 -- integer between [1,52] that represents the numerical ordering of the card
                 by suit.
*/

if (argument0 >= 1 && argument0 <=52 ) {
    var rank = argument0 mod 13;
    if rank == 0 { rank = 13; }
    return rank;    
}
