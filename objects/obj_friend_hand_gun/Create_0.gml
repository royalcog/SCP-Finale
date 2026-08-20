if (!variable_instance_exists(id, "side")) side = "left";

sprite_index = spr_friend_hand_gun;
image_index = 0;
image_speed = 0;

hand_scale = 0.85; // bigger — was 0.6
image_xscale = (side == "left") ? hand_scale : -hand_scale; // mirror so the muzzle points into the box from either side
image_yscale = hand_scale;

depth = -380;

// muzzle location (238, 85) given in the sprite's own unscaled/unflipped
// pixel space, stored relative to the sprite's origin (120, 106) so it
// can be scaled/flipped/rotated right along with the hand itself
muzzle_local_x = 238 - 120;
muzzle_local_y = 85 - 106;

move_speed = 1.6; // drift speed along the box edge — faster than before
move_dir = 1;
move_vel = 0;       // current eased velocity (lerps toward move_dir * move_speed)
move_ease = 0.08;   // how quickly velocity eases into a new direction after a turnaround

base_angle = 0;
recoil_angle = 0;          // eases back to 0 after each shot's kick
recoil_kick = -25;         // degrees kicked back the instant it fires — tune to taste
recoil_recover_rate = 0.15;
image_angle = base_angle;

shoot_timer = irandom_range(60, 120); // staggered first shot
shoot_interval_min = 90;
shoot_interval_max = 180;

if (instance_exists(obj_battlebox))
{
    var _interior = scr_get_box_interior();
    x = (side == "left") ? _interior.x1 : _interior.x2;
    y = (side == "left") ? _interior.y1 : _interior.y2;
}

if (side == "right") move_dir = -1;

move_vel = move_dir * move_speed; // start at full speed — only turnarounds ease