image_speed = 0;
rise_speed = 0.5;
image_index = 0;
depth = -200;

state = "rising";
on_open_callback_done = false;

box_base_x = x;
box_base_y = y;

scale_speed   = 0.06;
target_scale_x = 1;
target_scale_y = 1;

// used to detect when something requests a new stretch/shrink
prev_target_scale_x = target_scale_x;
prev_target_scale_y = target_scale_y;