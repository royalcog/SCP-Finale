sprite_index = spr_yarn;
image_speed = 0;
depth = -370;

yarn_scale = 2;
image_xscale = yarn_scale;
image_yscale = yarn_scale;
yarn_radius = 42; // tuned for yarn_scale 3, not the raw sprite bbox

gravity = 0.35;
bounce_damping = 0.82;
max_speed = 14;
spin_factor = 1.6;

sound_cooldown = 0;
entered_box = false;

// The whole simulation runs in the box's own local (unrotated) frame —
// like this is happening inside a spinning drum: "down" itself gets
// rotated into local space fresh every step, so a plain axis-aligned
// bounce against scr_get_box_interior()'s fixed local walls just works no
// matter how fast the box is spinning. Storing velocity here (instead of
// re-deriving it from world space each frame) is what actually fixes the
// yarn either riding the wall or spamming the bounce sound — a persistent
// local velocity only changes on gravity and on a real wall contact, so it
// can't drift out of sync with the rotation.
local_x = 0;
local_y = 0;
local_vx = random_range(-1, 1);
local_vy = 0;

if (instance_exists(obj_battlebox))
{
    var _start = scr_world_to_box_local(x, y);
    local_x = _start.x;
    local_y = _start.y;
}