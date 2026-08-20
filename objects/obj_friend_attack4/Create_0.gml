phase = "swinging";
timer = 0;

swing_duration = 100; // frames for the one left-to-right swing

// our own rotation convention here: 0 = pointing straight down (how the
// sprite hangs when unrotated), 90 = right, 180 = up, 270 = left — this
// matches GameMaker's image_angle direction exactly
start_angle = 270; // pointing left
end_angle = 450;   // pointing right (270 + 180) — sweeps through 0/360 (straight down) on the way, a single 180-degree pass

angle = start_angle;

sprite_index = spr_friend_tail;
image_speed = 0;
depth = -370;

tail_scale = 2.2;
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
    pivot_y = _interior.y1;
    x = pivot_x;
    y = pivot_y;
}

color_blue = c_aqua;
color_orange = c_orange;
color_mode = choose("blue", "orange"); // chosen once for this swing

if (instance_exists(obj_friend)) { obj_friend.visible = false; }