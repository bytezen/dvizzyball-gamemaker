/*
    return true if there are runners on base
*/


return  global.inningStatus[? "firstBase"] != noone ||   
        global.inningStatus[? "secondBase"] != noone ||      
        global.inningStatus[? "thirdBase"] != noone;
        
//return global.first_base != noone || global.second_base != noone || global.third_base != noone;
