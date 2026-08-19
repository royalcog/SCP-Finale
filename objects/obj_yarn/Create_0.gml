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
min_bounce_speed = 3;      // a decayed bounce never fully dies out — keeps it
                            // actually bouncing for the whole attack instead of
                            // settling to rest and just riding along with the spin
max_speed = 14;
spin_factor = 1.6;

sound_cooldown = 0;

// Everything happens entirely in the box's own local (unrotated) frame —
// position AND velocity both live here, permanently. As far as the physics
// is concerned, the box never rotates at all: it's just an ordinary ball
// bouncing around a plain, stationary rectangle — a completely standard
// reflection, nothing exotic, nothing that depends on how fast or which
// way the box happens to be spinning. All the "spinning with the box" look
// comes for free at the very end, purely from mapping this local position
// into world space via scr_box_local_to_world() for drawing. This is what
// the previous version was missing — it kept doing physics against a wall
// that was itself actively rotating mid-calculation, which is inherently
// fragile. Here the wall never moves, period.
local_vx = random_range(-2, 2);
local_vy = 0;
local_x = 0;
local_y = 0;

if (instance_exists(obj_battlebox))
{
    var _start = scr_world_to_box_local(x, y);
    local_x = _start.x;
    local_y = _start.y;
}