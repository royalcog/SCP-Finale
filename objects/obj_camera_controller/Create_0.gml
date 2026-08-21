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

// full-screen flip — a post-process rotation of the whole rendered frame
// as a single flat image (not an actual camera rotation), so nothing that
// manually converts room coords to GUI space (hand punches, strip flashes,
// etc.) gets thrown out of alignment with the soul/battlebox while it's
// active. flip_angle spins the captured frame around its own center —
// 0 = normal, 180 = fully flipped (upside-down) — the same rotate-around-
// center technique obj_battlebox already uses for its own spin.
flip_angle = 0;
flip_start = 0;
flip_target = 0;
flip_timer = 0;
flip_duration = 1;
flipping = false;
flip_surface = -1;