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
    
   //HACK:
   //Use the property type map to choose an equality test 
   if( store.propTypes[? key] == TYPE.list ){ //    ds_exists(newval,ds_type_list) ) {
       console("          -- comparing old and new value lists..."); 
       update = !scr_lists_equal(oldval, newval);
    } else if (store.propTypes[? key] == TYPE.primitive || store.propTypes[? key] == TYPE.instance ) { //is_int32(newval) ||    
      console("          -- comparing old and new value primitives...");        
      update = !(oldval == newval );
    } 
    console("                ... update = " + string(update));  
    
    
    if( update ) {       
        //update the store
        store.data[? key] =  newval;
        //see if there are any listeners for this property
        //that need to be notified.
    
        
        if( ds_map_exists(store.listeners,key) ) {
        
            var listeners = ds_map_find_value(store.listeners, key);
            for(var i=0; i < ds_list_size(listeners); i++) {
                script_execute(listeners[| i].store_change_handler, listeners[| i], oldval, newval);
            }
        }
    } else {
      return noone;
    }    
} else {
  show_error("unknown key: " + string(key) + " for store: " + string(store), false);
  return noone;
}
