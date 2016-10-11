///scrDispatch(action, payload)

/*
    
*/

var action = argument0;
var payload = argument1;

var script = global.actionStoreMap[? action];

if( !is_undefined(script) ) {
    if( is_array(script) ) {
        for( var i=0; i < array_length_1d(script); i++) {        
            console("{DISPATCH} " + action);
            script_execute( script[i], action, payload);
        }
    } else {    
        console("{DISPATCH} " + action);
        script_execute( script, action, payload  );
    }
}
