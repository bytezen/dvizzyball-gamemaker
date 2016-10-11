///scr_register_action(action, script)

var action = argument0;
var script = argument1;
var map = global.actionStoreMap;

if( !ds_exists( map ,ds_type_map) ) {
    global.actionStoreMap = ds_map_create();
    map = global.actionStoreMap;
}


if( ds_map_exists(map,action) ) { // dont overwrite existing keys
    var arr = 0;
    if( is_array(map[? action]) ) { // append to the end of arrays if possible
        arr = map[? action];
    } else {  // create an array to store the existing value and a new one
        arr[0] = map[? action];
    }
    arr[ array_length_1d( arr ) ] = script;
    map[? action] = arr;           
} else {
    map[? action] = script; 
}

