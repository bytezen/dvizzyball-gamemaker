/*
 argument0 -- numerator
 argument1 -- denominator
 
 return true if denomintor is a factor of numerator
*/
 
var num = argument0;
var den = argument1;

//show_debug_message( "is divisible: " + string(argument0) + " / " + string(argument1) );
return num mod den == 0; 
