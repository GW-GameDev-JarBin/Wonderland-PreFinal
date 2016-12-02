var touch = argument0; // touch device number. DO NOT MODIFY. Internal variable
var touch_x = argument1; // DO NOT MODIFY. Internal variable.
var touch_y = argument2; // DO NOT MODIFY. Internal variable.
    
// Write your own routine from here
touch_previous_x = touch_x;
touch_previous_y = touch_y;
    
//obj_example.sprite_index = spr_2;


if (instance_exists(obj_attack))
{
    //x = obj_attack.x;
    
    if point_in_rectangle(touch_previous_x, touch_previous_y, 
    obj_attack.x - 85, obj_attack.y - 85, 
    obj_attack.x + 85, obj_attack.y + 85)
    {
        // attack button is pressed
        obj_player.act = true
        //obj_player.image_speed = 0.2;
        script_execute(scr_attack_state);
        //state = scr_move_state;
        audio_play_sound(snd_sword_swing, 10, false);
        
    }
    

}

if (instance_exists(obj_dash))
{
    //x = obj_attack.x;
    
    if point_in_rectangle(touch_previous_x, touch_previous_y, 
    obj_dash.x - 85, obj_dash.y - 85, 
    obj_dash.x + 85, obj_dash.y + 85)
    {
       if(instance_exists(obj_player))
       {
            //obj_player.state = scr_dash_state;
            //obj_player.act = false
            if (instance_exists(obj_controller_level_7))
            {
                obj_player.state = scr_dash_state_level_7;
                script_execute(obj_player.state);
            }
            else if (instance_exists(obj_controller_level_8))
            {
                obj_player.state = scr_dash_state_level_8;
                script_execute(obj_player.state);
            }
            else if (instance_exists(obj_controller_level_9))
            {
                obj_player.state = scr_dash_state_level_9;
                script_execute(obj_player.state);
            }
            else if (instance_exists(obj_controller_level_10))
            {
                obj_player.state = scr_dash_state_level_10;
                script_execute(obj_player.state);
            }
            
            else
            {
                obj_player.state = scr_dash_state;
                script_execute(obj_player.state);
            }
            //obj_player.act = true;
            audio_play_sound(snd_dash_sound, 10, false);
       }
        
    }
    

}

if (instance_exists(obj_lever))
{
    //x = obj_attack.x;
    user_x = touch_previous_x;
    user_y = touch_previous_y;
       
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
    
    
        else 
        {
            // if the mouse is not far enough to pull the lever
            obj_lever.image_index = 0
            
            obj_player.image_speed = 0;
        
            global.dir = 0
        
            obj_player.act = false
        }
    
    }
}

