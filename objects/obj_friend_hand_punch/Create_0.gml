if (!variable_instance_exists(id, "side")) side = "left";

speed = 14;
hand_scale = 1.1; // was 2 — tune this, not image_xscale/yscale directly
sprite_index = spr_friend_hand_rock;
image_xscale = hand_scale;
image_yscale = hand_scale;
already_hit = false;
depth = -5010; // stays in front of the box even while the box is pulled to the front (see attack1 below)

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