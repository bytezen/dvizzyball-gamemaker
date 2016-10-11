///scr_add_store_listener(store,listener_id)
console("===== Adding store listeners ...." )
var store = argument0;
var listener = argument1;

ds_list_add(store.listeners, listener);

//with(store) {
//  ds_list_add(listeners, listener);
//}
