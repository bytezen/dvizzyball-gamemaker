/*
    argument0 -- integer between [1,52] that represents the numerical ordering of the card
                 by suit.
                 
    this script assumes the suit ordering is spades, hearts, clubs, diamonds
*/

if (argument0 >= 1 && argument0 <=52 ) {
    var suit, i;
    suit[3] = "diamonds";
    suit[2] = "clubs";
    suit[1] = "hearts";
    suit[0] = "spades";

    i = argument0 div 13;  
    //boundary case for kings (value = multiple of 13)
    if( argument0 mod 13 == 0 ) {
        i = i - 1;  //set kings equal to the previous suit
    }
    i = max(i,0);
    i = min(i,3);  
    return suit[i];    
}
