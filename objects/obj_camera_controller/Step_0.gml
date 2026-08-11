if (panning)
{
    pan_timer++;
    var _t = clamp(pan_timer / pan_duration, 0, 1);
    var _new_x = lerp(pan_start_x, pan_target_x, _t);
    camera_set_view_pos(view_camera[0], _new_x, camera_get_view_y(view_camera[0]));

    if (_t >= 1)
    {
        panning = false;
    }
}