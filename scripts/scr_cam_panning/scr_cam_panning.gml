function scr_camera_pan_to(_target_x, _duration)
{
    with (obj_camera_controller)
    {
        pan_start_x = camera_get_view_x(view_camera[0]);
        pan_target_x = _target_x;
        pan_timer = 0;
        pan_duration = _duration;
        panning = true;
    }
}

function scr_start_pan_and_reveal_left()
{
    scr_extend_bg_left(10, "Tiles_1");
    scr_camera_pan_to(camera_get_view_x(view_camera[0]) - 150, 180);
    scr_call_after_frames(scr_mid_pan_reveal, 90);
}

function scr_start_pan_and_reveal_right()
{
    scr_extend_bg_right(10, "Tiles_1");
    scr_camera_pan_to(camera_get_view_x(view_camera[0]) + 150, 180);
    scr_call_after_frames(scr_mid_pan_reveal, 90);
}

function scr_mid_pan_reveal()
{
    if (instance_exists(obj_mewmew)) && obj_mewmew.needtoflip == true
    {
        obj_mewmew.image_xscale *= -1;
		obj_mewmew.needtoflip = false;
    }
    // gerson stays silhouette here — his sprite only changes in scr_gerson_lantern_on
}