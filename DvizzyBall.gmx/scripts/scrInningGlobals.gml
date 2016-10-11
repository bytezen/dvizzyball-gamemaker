///scrInningGlobals()

global.inningStatus = ds_map_create();

global.inningStatus[? "state"] = STATE_NONE;
global.inningStatus[? "outs"] = 0;
global.inningStatus[? "balls"] = 0;
global.inningStatus[? "strikes"] = 0;
global.inningStatus[? "inningHalf"] = INNING_HALF_TOP;
global.inningStatus[? "homeTeamRuns"] = 0;
global.inningStatus[? "visitingTeamRuns"] = 0; 
global.inningStatus[? "firstBase"] = noone;
global.inningStatus[? "secondBase"] = noone;
global.inningStatus[? "thirdBase"] = noone;
 

global.atBatState = ATBAT_STATE_NONE;
