/*
    returns the current Players turn based on the game state
*/

switch( global.plateState) {
    case PLATE.pitch:
        return PLAYER.pitcher;    
    case PLATE.field:
        return PLAYER.fielder;
    case PLATE.swing:
    case PLATE.swing_or_steal:
        return PLAYER.batter;
    default:
        return noone;
}

/*
var ret, offense, defense;

//whose at bat and whose pitching
switch( global.inningState ) {
    case INNING.top:
    case INNING.top_side_out:
        offense = TEAM.guest;
        defense = TEAM.home;
        break;
    case INNING.bottom:
    case INNING.bottom_side_out:
        defense = TEAM.guest;
        offense = TEAM.home;
        break;
    default:
        defense = noone;
        offense = noone;
}
*/

return ret;
