switch (phase)
{
    case "darken":
        darken_alpha += darken_speed;
        if (darken_alpha >= 1)
        {
            darken_alpha = 1;
            phase = "rush";

            var _cam = view_camera[0];
            var _vx = camera_get_view_x(_cam);
            var _vw = camera_get_view_width(_cam);

            fist_room_x = _vx + _vw + spawn_margin;
            fist_room_y = target_inst.y;
            fist_start_x = fist_room_x;
            fist_slow_x = target_inst.x + ((fist_start_x - target_inst.x) / 2);
        }
    break;

    case "rush":
        var _speed = (fist_room_x > fist_slow_x) ? fast_speed : slow_speed;
        fist_room_x -= _speed;

        if (fist_room_x <= target_inst.x)
        {
            fist_room_x = target_inst.x;
            phase = "impact";
            audio_play_sound(snd_impact, 1, false);
            knockback_dir = point_direction(fist_start_x, fist_room_y, target_inst.x, target_inst.y);
            knockback_speed = knockback_max;
        }
    break;

    case "impact":
        darken_alpha -= darken_speed * 2;
        if (darken_alpha < 0) darken_alpha = 0;

        if (instance_exists(target_inst))
        {
            target_inst.x += lengthdir_x(knockback_speed, knockback_dir);
            target_inst.y += lengthdir_y(knockback_speed, knockback_dir);
        }
        knockback_speed -= knockback_friction;
        if (knockback_speed < 0) knockback_speed = 0;

        if (knockback_speed <= 0)
        {
            phase = "flyoff";
        }
    break;

    case "flyoff":
        darken_alpha -= darken_speed * 2;
        if (darken_alpha < 0) darken_alpha = 0;

        fist_room_x -= normal_speed;

        var _cam = view_camera[0];
        if (fist_room_x < camera_get_view_x(_cam) - offscreen_margin)
        {
            instance_destroy();
        }
    break;
}