switch (phase)
{
    case "swinging":
        timer++;
        var _t = clamp(timer / swing_duration, 0, 1);
        angle = lerp(start_angle, end_angle, _t);

        if (instance_exists(obj_soul))
        {
            var _tip_offset = scr_rotate_point(0, tail_length, angle);
            var _tip_x = pivot_x + _tip_offset.x;
            var _tip_y = pivot_y + _tip_offset.y;

            var _dist = scr_point_segment_distance(obj_soul.x, obj_soul.y, pivot_x, pivot_y, _tip_x, _tip_y);

            if (_dist <= tail_half_width + 10)
            {
                var _is_moving = (obj_soul.x != obj_soul.xprevious) || (obj_soul.y != obj_soul.yprevious);
                var _should_hit = ((color_mode == "blue") && _is_moving) || ((color_mode == "orange") && !_is_moving);

                if (_should_hit)
                {
                    scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
                }
            }
        }

        if (_t >= 1)
        {
            phase = "done";
        }
    break;

    case "done":
        instance_destroy();
    break;
}