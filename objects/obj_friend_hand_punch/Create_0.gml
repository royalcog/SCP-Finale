side = "left"; // which edge it enters from and travels toward the opposite edge
speed = 14;
sprite_index = spr_friend_hand_rock;
image_xscale = 2;
image_yscale = 2;
already_hit = false;
depth = -380;

var _interior = scr_get_box_interior();
var _cx = lerp(_interior.x1, _interior.x2, 0.5);
var _cy = lerp(_interior.y1, _interior.y2, 0.5);

switch (side)
{
    case "left":
        x = _interior.x1 - 250; y = _cy;
        target_val = _interior.x2 + 250;
    break;
    case "right":
        x = _interior.x2 + 250; y = _cy;
        target_val = _interior.x1 - 250;
    break;
    case "up":
        x = _cx; y = _interior.y1 - 250;
        target_val = _interior.y2 + 250;
    break;
    case "down":
        x = _cx; y = _interior.y2 + 250;
        target_val = _interior.y1 - 250;
    break;
}