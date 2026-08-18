orientation   = "vertical"; // "vertical" = tall strip, hands punch through it horizontally
                             // "horizontal" = wide strip, hands punch through it vertically
position_frac = 0.5;        // 0..1 across the box interior
thickness     = 40;
blinks        = 4;
blink_on_time  = 10;
blink_off_time = 8;
phase = "on";
timer = blink_on_time;
blink_count = 0;
alpha = 1;

var _interior = scr_get_box_interior();
world_pos = (orientation == "vertical")
    ? lerp(_interior.x1, _interior.x2, position_frac)
    : lerp(_interior.y1, _interior.y2, position_frac);