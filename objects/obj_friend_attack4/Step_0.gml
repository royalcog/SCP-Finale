timer++;

prev_angle = angle;
angle = swing_amplitude * dsin(360 * timer / swing_period);

// every time it swings back through dead center (straight down — the
// deepest point of its arc into the box) counts as "going through the
// box" — re-roll the color for the pass that's about to begin
if (sign(angle) != sign(prev_angle) && prev_angle != 0)
{
    color_mode = choose("blue", "orange");
}

if (instance_exists(obj_soul))
{
    var _tip_offset = scr_rotate_point(0, tail_length, angle);
    var _tip_x = pivot_x + _tip_offset.x;
    var _tip_y = pivot_y + _tip_offset.y;

    var _dist = scr_point_segment_distance(obj_soul.x, obj_soul.y, pivot_x, pivot_y, _tip_x, _tip_y);

    if (_dist <= tail_half_width + 10)
    {
        // blue: getting hit while MOVING is what costs you; stand still
        // and you're safe. orange: the opposite.
        var _is_moving = (obj_soul.x != obj_soul.xprevious) || (obj_soul.y != obj_soul.yprevious);
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