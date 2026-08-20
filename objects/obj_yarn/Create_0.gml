sprite_index = spr_yarn;
image_speed = 0;
depth = -370;

yarn_scale = 2;
image_xscale = yarn_scale;
image_yscale = yarn_scale;

// margin based on the actual sprite size — but the sprite also spins for
// the tumble effect, so half its width/height alone isn't enough: at some
// rotation angles a CORNER swings out further than that (up to the full
// diagonal from center), even though the center point stays safely
// inside. Using the diagonal half-length instead means it stays fully
// contained no matter which way it's currently facing.
margin = point_distance(0, 0, sprite_get_width(sprite_index) * yarn_scale / 2, sprite_get_height(sprite_index) * yarn_scale / 2);

gravity = 0.35;
bounce_damping_min = 0.55; // how much speed survives a bounce, at least
bounce_damping_max = 0.85; // ...and at most — kept modest so it can't get too lively
min_bounce_speed = 3;      // a decayed bounce never fully dies out — keeps it
                            // actually bouncing for the whole attack instead of
                            // settling to rest and just riding along with the spin
max_speed = 14;
spin_factor = 1.6;

sound_cooldown = 0;

// Position AND velocity both live in the box's own local (unrotated)
// frame, permanently — collision is a completely ordinary bounce against
// a plain, stationary rectangle, nothing rotation-dependent about it at
// all. Gravity is the one exception: real gravity always points straight
// down on screen, so each step we take that fixed world-down direction
// and rotate it into whatever the local frame currently is — that's what
// makes it actually look like it's falling/bouncing normally, instead of
// falling toward wherever the box's own floor happens to be pointing.
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