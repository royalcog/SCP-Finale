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

sprite_index = spr_friend_tail;
image_speed = 0;
depth = -370;

tail_scale = 2.2;
tail_raw_width = sprite_get_width(sprite_index);
tail_raw_height = sprite_get_height(sprite_index);
tail_length = tail_raw_height * tail_scale;
tail_half_width = (tail_raw_width * tail_scale) / 2;

// pivot stays fixed right at the box's top-center for the whole attack —
// like a clock mounted just above it, with the tail hanging down into it
pivot_x = x;
pivot_y = y;
if (instance_exists(obj_battlebox))
{
    var _interior = scr_get_box_interior();
    pivot_x = lerp(_interior.x1, _interior.x2, 0.5);
    pivot_y = _interior.y1;
    x = pivot_x;
    y = pivot_y;
}

color_blue = c_aqua;
color_orange = c_orange;
color_mode = choose("blue", "orange"); // re-rolled every time it swings back through the box's center

mask_surface = -1; // created lazily in Draw, sized to comfortably fit the tail's full swing

if (instance_exists(obj_friend)) { obj_friend.visible = false; }