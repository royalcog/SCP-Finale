if (!variable_instance_exists(id, "target_x")) target_x = x;
if (!variable_instance_exists(id, "target_y")) target_y = y;

start_x = x;
start_y = y;

travel_frames = 40;
travel_timer = 0;

blink_duration = 100; // ~1.6s telegraph blink before it explodes
blink_timer = 0;
blink_visible = true;
blink_interval = 6;
blink_toggle_timer = blink_interval;

shrapnel_count = 10;
shrapnel_speed = 4;
shrapnel_lifespan = 45;

phase = "travel"; // "travel" -> "blink" -> explode + destroy

sprite_index = -1;
depth = -375;