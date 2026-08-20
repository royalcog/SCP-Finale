timer++;

prev_angle = angle;
angle = swing_amplitude * dsin(360 * timer / swing_period);

var _direction_now = sign(angle - prev_angle);
if (_direction_now != 0 && swing_direction != 0 && _direction_now != swing_direction)
{
    color_mode = choose("blue", "orange");
}
if (_direction_now != 0) swing_direction = _direction_now;

if (instance_exists(obj_soul))
{
    var _tip_offset = scr_rotate_point(0, tail_length, angle);
    var _tip_x = pivot_x + _tip_offset.x;
    var _tip_y = pivot_y + _tip_offset.y;

    var _dist = scr_point_segment_distance(obj_soul.x, obj_soul.y, pivot_x, pivot_y, _tip_x, _tip_y);

    if (_dist <= tail_half_width + 10)
    {
        // threshold-based instead of a strict != check — the soul's own
        // wall-clamp logic runs every frame regardless of input, and even
        // when it's mathematically a no-op, floating-point rounding in
        // that round-trip can shift x/y by a sub-pixel amount every
        // single frame. A strict != comparison would then see that as
        // "moving" constantly, even while standing still — which is
        // exactly what was making orange's "stand still to be safe" rule
        // impossible to ever satisfy
        var _is_moving = point_distance(obj_soul.x, obj_soul.y, obj_soul.xprevious, obj_soul.yprevious) > 0.05;
        var _should_hit = ((color_mode == "blue") && _is_moving) || ((color_mode == "orange") && !_is_moving);

        if (_should_hit)
        {
            scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
        }
    }
}

if (timer >= pendulum_duration)
{
    instance_destroy();
}