panning = false;
pan_start_x = 0;
pan_target_x = 0;
pan_timer = 0;
pan_duration = 60;

// screen shake — cam_x/cam_y are the "true" logical camera position;
// shake is applied as a temporary offset on top each step so it settles
// back to the real position instead of drifting
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
shake_timer = 0;
shake_intensity = 0;