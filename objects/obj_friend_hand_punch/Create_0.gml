if (!variable_instance_exists(id, "side")) side = "left";

speed = 14;
hand_scale = 1.1;
sprite_index = spr_friend_hand_rock;
image_xscale = hand_scale;
image_yscale = hand_scale;
already_hit = false;
depth = -380;

var _interior = scr_get_box_interior();
var _cx = lerp(_interior.x1, _interior.x2, 0.5);
var _cy = lerp(_interior.y1, _interior.y2, 0.5);
var _perp = variable_instance_exists(id, "fixed_coord") ? fixed_coord : undefined;

switch (side)
{
    case "left":
        y = is_undefined(_perp) ? _cy : _perp;
        x = _interior.x1 - 250;
        target_val = _interior.x2 + 250;
    break;
    case "right":
        y = is_undefined(_perp) ? _cy : _perp;
        x = _interior.x2 + 250;
        target_val = _interior.x1 - 250;
    break;
    case "up":
        x = is_undefined(_perp) ? _cx : _perp;
        y = _interior.y1 - 250;
        target_val = _interior.y2 + 250;
    break;
    case "down":
        x = is_undefined(_perp) ? _cx : _perp;
        y = _interior.y2 + 250;
        target_val = _interior.y1 - 250;
    break;
}

switch (side)
{
    case "left":  draw_angle = 0;   break; // fist faces right (moving +x)
    case "right": draw_angle = 180; break; // fist faces left (moving -x)
    case "down":  draw_angle = 90;  break; // fist faces up (moving -y)
    case "up":    draw_angle = 270; break; // fist faces down (moving +y)
}

start_val = (side == "left" || side == "right") ? x : y;
progress = 0;