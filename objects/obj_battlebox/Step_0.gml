switch (state)
{
    case "rising":
	    image_index += rise_speed;
	    if (image_index >= image_number - 1)
	    {
	        image_index = image_number - 1;
	        state = "idle";

	        if (!on_open_callback_done)
	        {
	            on_open_callback_done = true;
	            var _soul = instance_create_depth(x + sprite_width/2, y + sprite_height/2, depth - 1, obj_soul);
	        }
	    }
	break;

    case "idle":
        // just sits on last frame, doing nothing, until you tell it to close
    break;

    case "closing":
        image_index -= rise_speed
        if (image_index <= 0)
        {
            image_index = 0;
            state = "done";
            instance_destroy();
        }
    break;
}