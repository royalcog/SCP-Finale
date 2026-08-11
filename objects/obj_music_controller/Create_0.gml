// If a music controller already exists, destroy this new one immediately!
if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

// Only initialize if this is the absolute first music controller
global.song = noone;
global.music = noone;

global.beat = 0;
global.offset = 0;
global.song_start = current_time; // Set a default value to prevent crashes

persistent = true;