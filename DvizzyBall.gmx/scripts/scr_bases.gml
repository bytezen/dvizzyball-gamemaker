///scr_bases(pitch, swing
 
var pitch = argument0;
var swing = argument1;

if( pitch != noone ) {
    if( scr_isHomeRun(pitch,swing) ) {
        return 4;
    } else if(scr_isHit(pitch,swing)) {
        return clamp( swing, 1, 3);
    } else {
        return 0;
    }
} else {
    return 0;
}
