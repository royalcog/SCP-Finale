timer = 0;

// pendulum motion: oscillates smoothly around "straight down" (our own
// angle convention: 0 = down, 90 = right, 180 = up, 270 = left — matches
// GameMaker's image_angle direction), swinging out toward horizontal on
// each side and back, like a real pendulum, for as long as this attack lasts
swing_amplitude = 90;    // how far it swings to each side (90 = fully horizontal)
swing_period = 150;      // frames for one full left-right-left cycle
pendulum_duration = 600; // total frames this attack lasts before ending

angle = 0; // starts hanging straight down, at rest
prev_angle = 0;
swing_direction = 0; // tracks whether it's currently swinging toward +angle or -angle

sprite_index = spr_friend_tail;
image_speed = 0;
depth = -370;

tail_scale = 9; // much bigger, per request
tail_raw_width = sprite_get_width(sprite_index);
tail_raw_height = sprite_get_height(sprite_index);
tail_length = tail_raw_height * tail_scale;
tail_half_width = (tail_raw_width * tail_scale) / 2;

pivot_x = x;
pivot_y = y;
if (instance_exists(obj_battlebox))
{
    var _interior = scr_get_box_interior();
    pivot_x = lerp(_interior.x1, _interior.x2, 0.5);
    pivot_y = _interior.y1 - 20; // nudged up a bit from the box's top edge
    x = pivot_x;
    y = pivot_y;
}

color_blue = c_aqua;
color_orange = c_orange;
color_mode = choose("blue", "orange");

// offscreen buffer used to recolor the tail sprite in real time (see
// Draw event) — sized generously around the pivot so the fully-extended,
// scaled-up tail always fits inside it regardless of swing angle
tail_surf = -1;
tail_surf_size = (tail_length + tail_half_width) * 2 + 40;

if (instance_exists(obj_friend)) { obj_friend.visible = false; }