///scr_has_valid_turn(id)

/*
    argument0 - instance id
    
    returns true if the instance has the current turnState in its
            array of  valid_turns
*/

return scr_contains( global.turnState, valid_turns) >= 0
