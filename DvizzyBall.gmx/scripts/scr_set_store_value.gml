///scr_set_store_value(dataStoreObject, key, newval)

var store = argument0;
var key = argument1;
var newval = argument2;
var oldval = noone;

// for now only supports lists, strings and numbers and booleans

if( ds_exists(newval, ds_type_grid) ||
   ds_exists(newval, ds_type_map) ||
   ds_exists(newval, ds_type_priority) ||
   ds_exists(newval, ds_type_queue) ||
   ds_exists(newval, ds_type_stack) ) {
   
   show_error(" unsupported data structure type: " + string(newval), false);
   return noone;
}

//get the data map from the store objevt 
var update = false;
           
if( ds_map_exists(store.data, key) ) {
    console(" { set_store_value } for key: " + string(key));
    oldval = ds_map_find_value(store.data,key);
    
    console("{oldValue } = " + scr_list_to_string(oldval) );
    console("{newValue } = " + scr_list_to_string(newval));
    
    //compare lists
    if(ds_exists(oldval,ds_type_list) ) {
       console("  running logic to compare old value and new value...");
       update = !scr_lists_equal(oldval, newval);
    } else {
      update = !(oldval == newval );
    }
    
    //console(" { set_store_value }  update = " + string(update));
    
    if( update ) {
        show_debug_message("need to update value in store from: " + scr_list_to_string(oldval) + " - to - " + scr_list_to_string(newval));      
        store.data[? key] =  newval;
        console(" dataStore listeners length = " + string( ds_list_size(store.listeners) ) );
        with( store ) {
              for(var i=0; i < ds_list_size(listeners); i++) {
                  //with( listeners[| i]) {
                     script_execute(listeners[| i].store_change_handler, listeners[| i], oldval, newval);                        
                  //}
              }
        }
    } else {
      return noone;
    }    
} else {
  show_error("unknown key: " + string(key) + " for store: " + string(store), false);
  return noone;
}
