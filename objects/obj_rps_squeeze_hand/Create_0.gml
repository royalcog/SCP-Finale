if (!variable_instance_exists(id, "side")) side = "left";
if (!variable_instance_exists(id, "gap_half")) gap_half = 20;
if (!variable_instance_exists(id, "hold_time")) hold_time = 45;

move_speed = 14;
hand_scale = 1.1;
sprite_index = spr_friend_hand_paper;
image_xscale = hand_scale;
image_yscale = hand_scale;
already_hit = false;
depth = -380;

var _interior = scr_get_box_interior();
var _cx = lerp(_interior.x1, _interior.x2, 0.5);
var _cy = lerp(_interior.y1, _interior.y2, 0.5);

switch (side)
{
    case "left":
        x = _interior.x1 - 250; y = _cy;
        start_val = x; target_val = _cx - gap_half;
        image_angle = 0;
    break;
    case "right":
        x = _interior.x2 + 250; y = _cy;
        start_val = x; target_val = _cx + gap_half;
        image_angle = 180;
    break;
    case "up":
        x = _cx; y = _interior.y1 - 250;
        start_val = y; target_val = _cy - gap_half;
        image_angle = 270;
    break;
    case "down":
        x = _cx; y = _interior.y2 + 250;
        start_val = y; target_val = _cy + gap_half;
        image_angle = 90;
    break;
}
draw_angle = image_angle;

phase = "in";
hold_timer = 0;