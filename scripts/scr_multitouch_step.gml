{
    // (C)Copyright 2015 Juman Byun
    // Licensed to you by GWGameDev Community Permissive License
    var device = 0;
    for (device = 0; device <= 4; device += 1)
    {
        // pressed
        if( device_mouse_check_button_pressed(device, mb_left) = true ){
            multitouch_dragging_count += 1;
            multitouch_dragstart_x[device] = device_mouse_x(device);
            multitouch_dragstart_y[device] = device_mouse_y(device);
            multitouch_dragstart_time[device] = get_timer();
            scr_multitouch_callback_pressed(device
                ,device_mouse_x(device)
                ,device_mouse_y(device));
            // { USER ROUTINE FROM HERE
            // Use scr_multitouch_callback_pressed() whenever possible
            // } USER ROUTINE TILL HERE
        }
        
        // dragging
        if( device_mouse_check_button(device,mb_left) = true )
        {            
            scr_multitouch_callback_dragging(device
                ,device_mouse_x(device)
                ,device_mouse_y(device)
                ,multitouch_dragstart_x[device]
                ,multitouch_dragstart_y[device]
                );
            // { USER ROUTINE FROM HERE
            // Use scr_multitouch_callback_pressed() whenever possible
            // } USER ROUTINE TILL HERE
        }
        
        // released
        if( device_mouse_check_button_released(device, mb_left) = true ){
            multitouch_dragging_count -= 1;
            scr_multitouch_callback_released(device
                ,device_mouse_x(device), device_mouse_y(device)
                ,multitouch_dragstart_x[device]
                ,multitouch_dragstart_y[device]
                ,get_timer() - multitouch_dragstart_time[device]
                );
                
            // { USER ROUTINE FROM HERE
            // Use scr_multitouch_callback_released() whenever possible
            // } USER ROUTINE TILL HERE
        }
    }
    
}
