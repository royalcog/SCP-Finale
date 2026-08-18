if (!variable_instance_exists(id, "world_x")) world_x = x;
if (!variable_instance_exists(id, "world_y")) world_y = y;

size = 24; // small square, not a full strip
blinks = 3;
blink_on_time  = 8;
blink_off_time = 6;
phase = "on";
timer = blink_on_time;
blink_count = 0;
alpha = 1;