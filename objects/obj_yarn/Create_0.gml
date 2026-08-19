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
// minimum real speed moving away from it. This minimum has to scale with
// how fast the box is actually spinning and how far the ball is from the
// box's center — a point far from center sweeps a lot more distance per
// degree of rotation than one near the middle, so a single fixed number
// was enough for a small test box but not for the real one (worked out
// via simulation: the box is 332x300, so a corner can sweep upward of 7px
// a frame from rotation alone at top spin speed — a flat 1.2px/frame
// minimum was nowhere near enough to outrun that).
wall_nudge = 5;
min_escape_speed_base = 2;
escape_safety_factor = 3.5; // extra margin on top of the raw rotation-sweep speed
last_box_angle = 0;
if (instance_exists(obj_battlebox)) last_box_angle = obj_battlebox.box_angle;

// spawns already inside the box (see obj_friend_attack3), so there's no
// separate "falling in from above" phase to manage — it's just live,
// bouncing physics from the moment it exists
vx = random_range(-2, 2);
vy = 0;