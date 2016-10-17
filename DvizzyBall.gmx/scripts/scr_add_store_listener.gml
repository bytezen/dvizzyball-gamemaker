///scr_add_store_listener(store,property,listener_id)
console("===== Adding store listeners ...." )
var store = argument0;
var prop = argument1;
var listener = argument2;


var list = noone;

if( !ds_map_exists(store.listeners, prop)) {
  store.listeners[? prop] = ds_list_create();
}
 
list = store.listeners[? prop];

ds_list_add(list, listener);

//ds_list_add(store.listeners, listener);
//}
