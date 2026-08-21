if (!variable_instance_exists(id, "side")) side = "left";

sprite_index = spr_friend_hand_gun;
image_index = 0;
image_speed = 0;

hand_scale = 0.85; // bigger — was 0.6

// muzzle location (238, 85) given in the sprite's own unscaled/unflipped
// pixel space, stored relative to the sprite's origin (120, 106) so it
// can be scaled/flipped/rotated right along with the hand itself
muzzle_local_x = 238 - 120;
muzzle_local_y = 85 - 106;

move_speed = 1.6; // drift speed along its edge
move_dir = 1;
move_vel = 0;       // current eased velocity (lerps toward move_dir * move_speed)
move_ease = 0.08;   // how quickly velocity eases into a new direction after a turnaround

recoil_angle = 0;          // eases back to 0 after each shot's kick
recoil_kick = 25;          // degrees kicked back the instant it fires — tune to taste
recoil_recover_rate = 0.15;

shoot_timer = irandom_range(30, 60); // staggered first shot
shoot_interval_min = 50;
shoot_interval_max = 100;

// corner guns (used during the dark, box-less phases of attacks 8/9) sit
// at a screen corner and slide along one adjacent screen edge, rather than
// living on the box's left/right edge like the original side-mounted guns
is_corner = (side == "top_left" || side == "top_right" || side == "bottom_left" || side == "bottom_right");

if (is_corner)
{
    var _view_x = camera_get_view_x(view_camera[0]);
    var _view_y = camera_get_view_y(view_camera[0]);
    var _view_w = camera_get_view_width(view_camera[0]);
    var _view_h = camera_get_view_height(view_camera[0]);
    var _margin = 40; // stay a bit inset from the actual screen edge

    var _left    = _view_x + _margin;
    var _right   = _view_x + _view_w - _margin;
    var _top     = _view_y + _margin;
    var _bottom  = _view_y + _view_h - _margin;
    var _center_x = _view_x + _view_w / 2;
    var _center_y = _view_y + _view_h / 2;

    // each corner slides along ONE adjacent edge, all four circulating the
    // same rotational direction around the screen
    switch (side)
    {
        case "top_left":
            x = _left;  y = _top;
            movement_axis = "y";
            move_dir = 1;  // starts moving down
        break;
        case "bottom_right":
            x = _right; y = _bottom;
            movement_axis = "y";
            move_dir = -1; // starts moving up
        break;
        case "top_right":
            x = _right; y = _top;
            movement_axis = "x";
            move_dir = -1; // starts moving left
        break;
        case "bottom_left":
            x = _left;  y = _bottom;
            movement_axis = "x";
            move_dir = 1;  // starts moving right
        break;
    }

    // no mirror flip here — rotation alone aims the muzzle, so it can face
    // any direction, not just left/right
    image_xscale = hand_scale;
    image_yscale = hand_scale;
    base_angle = point_direction(x, y, _center_x, _center_y);
}
else
{
    // original box-edge behavior (attack 5's finger guns)
    movement_axis = "y";
    image_xscale = (side == "left") ? hand_scale : -hand_scale; // mirror so the muzzle points into the box from either side
    image_yscale = hand_scale;
    base_angle = 0;

    if (instance_exists(obj_battlebox))
    {
        var _interior = scr_get_box_interior();
        x = (side == "left") ? _interior.x1 : _interior.x2;
        y = (side == "left") ? _interior.y1 : _interior.y2;
    }

    if (side == "right") move_dir = -1;
}

image_angle = base_angle;
depth = -380;
move_vel = move_dir * move_speed; // start at full speed — only turnarounds ease