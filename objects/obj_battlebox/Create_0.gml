image_speed = 0;
rise_speed = 0.5; // lower = slower rise. Try 0.2–0.5 to taste
image_index = 0;
depth = -200; // adjust so it's above background but you can decide vs soul/hammers later

state = "rising"; // rising -> idle -> closing -> done
on_open_callback_done = false;

box_base_x = x;
box_base_y = y;

scale_speed   = 0.06;
target_scale_x = 1;
target_scale_y = 1;