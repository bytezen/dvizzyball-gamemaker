///scr_has_valid_turn(id)

/*
    argument0 - instance id
    
    returns true if the instance has the current turnState in its
            array of  valid_turns
*/
var store = instance_find(store_atbat, 0);

return scr_contains( store.data[? "playerTurn"], valid_turns) >= 0
