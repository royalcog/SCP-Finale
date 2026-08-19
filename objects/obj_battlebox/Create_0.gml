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

prev_target_scale_x = target_scale_x;
prev_target_scale_y = target_scale_y;

// sprite_width/sprite_height are scale-INCLUSIVE (they already factor in
// this instance's own image_xscale/image_yscale) — the recenter math and
// scr_get_box_interior() both need the TRUE unscaled dimensions, so we
// cache those separately once here.
raw_width  = sprite_get_width(sprite_index);
raw_height = sprite_get_height(sprite_index);