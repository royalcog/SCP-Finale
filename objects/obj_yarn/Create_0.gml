sprite_index = spr_yarn;
image_speed = 0;
depth = -370;

yarn_scale = 2;
image_xscale = yarn_scale;
image_yscale = yarn_scale;
yarn_radius = 32; // roughly the sprite's half-size at yarn_scale 2

gravity = 0.35;
bounce_damping = 0.82;
max_speed = 14;
spin_factor = 1.6;

sound_cooldown = 0;
entered_box = false;

// genuine world-space physics — x/y and vx/vy stay real, honest values the
// whole time. On a wall hit we just reflect off whatever direction that
// wall is facing RIGHT NOW (recomputed from the box's live box_angle),
// the same way a ball bounces off a mirror that happens to be tilted —
// instead of simulating the ball as if it's riding along inside the box's
// own rotating reference frame, which was dragging its position around in
// a circle independent of any real bounce.
vx = random_range(-1, 1);
vy = 0;