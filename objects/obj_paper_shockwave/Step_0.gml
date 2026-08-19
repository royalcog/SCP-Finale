switch (phase)
{
    case "moving":
        pos_x += (side == "left") ? move_speed : -move_speed;

        var _reached_mid = (side == "left") ? (pos_x >= mid_x) : (pos_x <= mid_x);
        if (_reached_mid)
        {
            pos_x = mid_x;
            phase = "fading";
        }

        if (!already_hit && instance_exists(obj_soul)
            && obj_soul.x > min(start_x, pos_x) && obj_soul.x < max(start_x, pos_x)
            && obj_soul.y > band_y1 && obj_soul.y < band_y2)
        {
            already_hit = true;
            scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
        }
    break;

    case "fading":
        alpha -= fade_speed;
        if (alpha <= 0) instance_destroy();
    break;
}