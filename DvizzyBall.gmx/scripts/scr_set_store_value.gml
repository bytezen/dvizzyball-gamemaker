///scr_set_store_value(dataStoreObject, key, newval)

var store = argument0;
var key = argument1;
var newval = argument2;
var oldval = noone;

// for now only supports lists, strings and numbers and booleans

/*
console("Checking newval data type: " );
newval = 1;
console("     islist =" + string(ds_exists(newval, ds_type_list)));
*/

/*
weird real numbers will cause type_map and type_list to return true
*/
/*
if( ds_exists(newval, ds_type_grid) ||
   ds_exists(newval, ds_type_map) ||
   ds_exists(newval, ds_type_priority) ||
   ds_exists(newval, ds_type_queue) ||
   ds_exists(newval, ds_type_stack) ) {
   
   show_error(" unsupported data structure type: " + string(newval), false);
   return noone;
}
*/

//get the data map from the store objevt 
var update = false;

console(" { set_store_value } for key: " );

if( ds_map_exists(store.data, key) ) {
    console("         --> " + string(key));
    oldval = ds_map_find_value(store.data,key);
    
    /*
    if ds_exists(oldval, ds_type_list) {
       console("         {oldValue } = " + scr_list_to_string(oldval) );
       console("         {newValue } = " + scr_list_to_string(newval));
    }
    */
    
    
    if (is_int32(newval) || 
       is_int64(newval) ||
       is_real(newval)  || 
       is_bool(newval)  || 
       is_string(newval)) {
      update = !(oldval == newval );
    } else if(ds_exists(oldval,ds_type_list) ) {
       update = !scr_lists_equal(oldval, newval);
    } 
        
    if( update ) {       
        store.data[? key] =  newval;
        
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
