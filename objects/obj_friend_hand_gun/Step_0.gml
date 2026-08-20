if (instance_exists(obj_battlebox))
{
    var _interior = scr_get_box_interior();
    var _top = _interior.y1;
    var _bottom = _interior.y2;

    y += move_dir * move_speed;

    if (y >= _bottom) { y = _bottom; move_dir = -1; }
    if (y <= _top)    { y = _top;    move_dir = 1; }
}

// recoil is purely a tilt — position/drift along the edge is untouched
recoil_angle = lerp(recoil_angle, 0, recoil_recover_rate);
image_angle = base_angle + recoil_angle;

shoot_timer--;
if (shoot_timer <= 0 && instance_exists(obj_soul))
{
    var _muzzle_offset = scr_rotate_point(muzzle_local_x * image_xscale, muzzle_local_y * image_yscale, image_angle);
    var _muzzle_x = x + _muzzle_offset.x;
    var _muzzle_y = y + _muzzle_offset.y;

    instance_create_depth(_muzzle_x, _muzzle_y, -375, obj_friend_bullet, {
        target_x: obj_soul.x,
        target_y: obj_soul.y
    });

    recoil_angle = recoil_kick; // kick happens right after the bullet spawns, so the shot itself fires from the un-recoiled muzzle
    shoot_timer = irandom_range(shoot_interval_min, shoot_interval_max);
}