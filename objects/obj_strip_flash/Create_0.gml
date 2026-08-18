if (!variable_instance_exists(id, "orientation")) orientation = "vertical";
if (!variable_instance_exists(id, "position_frac")) position_frac = 0.5;

thickness = 40;
blinks = 4;
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