if (panning)
{
    pan_timer++;
    var _t = clamp(pan_timer / pan_duration, 0, 1);
    cam_x = lerp(pan_start_x, pan_target_x, _t);

    if (_t >= 1)
    {
        panning = false;
    }
}

var _shake_x = 0;
var _shake_y = 0;
if (shake_timer > 0)
{
    shake_timer--;
    _shake_x = random_range(-shake_intensity, shake_intensity);
    _shake_y = random_range(-shake_intensity, shake_intensity);
}

camera_set_view_pos(view_camera[0], cam_x + _shake_x, cam_y + _shake_y);