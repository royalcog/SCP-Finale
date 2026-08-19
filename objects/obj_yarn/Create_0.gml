sprite_index = spr_yarn;
image_speed = 0;
depth = -370;

yarn_radius = 15;

// starts falling in from above the box under real gravity
vspeed_x = random_range(-1, 1);
vspeed_y = 0;
gravity = 0.35;
bounce_damping = 0.82;
max_speed = 14;
spin_factor = 1.6;

// true once it's actually crossed into the box's play area — before that
// it just free-falls (so it visibly "falls into" the box instead of
// bouncing off an invisible ceiling above it)
entered_box = false;