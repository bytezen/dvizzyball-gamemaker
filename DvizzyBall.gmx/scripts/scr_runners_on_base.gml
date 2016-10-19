/*
    return true if there are runners on base
*/

var store = instance_find(store_inning,0);

return  store.data[? "firstBase"] != noone ||   
        store.data[? "secondBase"] != noone ||      
        store.data[? "thirdBase"] != noone;
        
//return global.first_base != noone || global.second_base != noone || global.third_base != noone;
