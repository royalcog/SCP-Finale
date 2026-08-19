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

// after a bounce, push the resting position a few pixels back inside the
// wall (instead of leaving it exactly ON the boundary) and guarantee a
// minimum real speed moving away from it — otherwise, once the box is
// spinning fast, the wall's orientation can rotate out from under the
// ball again before it's actually moved clear, re-triggering the same
// "collision" every frame and pinning it against that edge
wall_nudge = 3;
min_escape_speed = 1.2;

// spawns already inside the box (see obj_friend_attack3), so there's no
// separate "falling in from above" phase to manage — it's just live,
// bouncing physics from the moment it exists
vx = random_range(-2, 2);
vy = 0;