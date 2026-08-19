sprite_index = spr_yarn;
image_speed = 0;
depth = -370;

yarn_scale = 2;
image_xscale = yarn_scale;
image_yscale = yarn_scale;
yarn_radius = 32; // roughly the sprite's half-size at yarn_scale 2

gravity = 0.35;
bounce_damping_min = 0.55; // how much speed survives a bounce, at least
bounce_damping_max = 0.85; // ...and at most — kept modest so it can't get too lively
max_speed = 14;
spin_factor = 1.6;

sound_cooldown = 0;

// spawns already inside the box (see obj_friend_attack3), so there's no
// separate "falling in from above" phase to manage — it's just live,
// bouncing physics from the moment it exists
vx = random_range(-2, 2);
vy = 0;