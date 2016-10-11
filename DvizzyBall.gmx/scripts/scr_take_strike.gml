///scr_take_strike(id)

// Want to dispatch that a strike looking has been recorded

show_debug_message(" take strike change handler " );
scrDispatch(INNING_ACTION_STRIKE, argument0);
scrDispatch(ATBAT_ACTION_TAKE_STRIKE, argument0);


