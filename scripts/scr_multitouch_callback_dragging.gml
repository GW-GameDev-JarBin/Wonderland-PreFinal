{
    var touch = argument0;   // DO NOT MODIFY. Internal variable.
    var touch_x = argument1; // DO NOT MODIFY. Internal variable.
    var touch_y = argument2; // DO NOT MODIFY. Internal variable.   
    var touch_startx = argument3; // DO NOT MODIFY. Internal variable.
    var touch_starty = argument4; // DO NOT MODIFY. Internal variable.

    
    var dx = touch_x - touch_previous_x; // DO NOT MODIFY. Convenience variable.
    var dy = touch_y - touch_previous_y; // DO NOT MODIFY. Convenience variable.

    // { Customize from here
    
    // Examples: Uncomment one example at a time: Teleport-anywhere, Drag-anywhere
    
    // obj_example.y = touch_y; // Teleport-anywhere example line 1
    // obj_example.y = touch_x; // Teleport-anywhere example line 2

    //obj_example.x += dx; // Drag-anywhere example line 1
    //obj_example.y += dy; // Drag-anywhere example line 2
    
    //dis = point_distance(obj_lever.x, obj_lever.y, user_x, user_y) 
    //if (dis >= 32 && dis <= 160)
   if (instance_exists(obj_lever))
   {
    //x = obj_attack.x;
    user_x = touch_x;
    user_y = touch_y;
    
  
    dis = point_distance(obj_lever.x, obj_lever.y, user_x, user_y) 
    if(instance_exists(obj_player)){  
    // distance test
  
        if (dis >= 32 && dis <= 160)
        {
            obj_lever.image_index = 1
        
            // address mouse
            global.dir = floor(point_direction(obj_lever.x, obj_lever.y, user_x, user_y))  
        
            // inclination angle
            obj_lever.image_angle = global.dir 
        
            obj_player.act = true
            obj_player.image_speed = 0.2;
        }
     
        
    
        /*
        else 
        {
            // if the mouse is not far enough to pull the lever
            obj_lever.image_index = 0
            
            obj_player.image_speed = 0;
        
            global.dir = 0
        
            obj_player.act = false
        }
        */
    }
}

    
    // } Customize until here 
    touch_previous_x = touch_x; // DO NOT MODIFY.
    touch_previous_y = touch_y; // DO NOT MODIFY.
}
