// full-screen flip — copies the fully-rendered room content (everything
// drawn so far this frame, before Draw GUI) into our own surface, then
// spins that flat image around its own center by flip_angle degrees —
// the exact same rotate-around-center technique obj_battlebox already
// uses for its own spin (scr_rotate_point), just applied to the whole
// screen instead of one sprite. As flip_angle eases from 0 to 180 this
// reads as the screen physically spinning over, landing upside-down.
//
// This runs in Draw GUI Begin rather than Draw End specifically because
// Draw GUI space is a fixed 1:1 screen-pixel projection, unaffected by
// the room camera's own zoom/scale — drawing this same surface from Draw
// End would still be inside the camera's projection, so the camera's zoom
// gets applied to it a second time, which is what was causing the whole
// screen to balloon in size on every flip. Draw GUI Begin fires before
// the normal Draw GUI content, so the UI/textboxes still land on top,
// right-side-up.
if (flip_angle != 0)
{
    var _sw = surface_get_width(application_surface);
    var _sh = surface_get_height(application_surface);

    if (!surface_exists(flip_surface) || surface_get_width(flip_surface) != _sw || surface_get_height(flip_surface) != _sh)
    {
        if (surface_exists(flip_surface)) surface_free(flip_surface);
        flip_surface = surface_create(_sw, _sh);
    }

    surface_copy(flip_surface, 0, 0, application_surface);

    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();

    var _half_w = _gui_w / 2;
    var _half_h = _gui_h / 2;
    var _off = scr_rotate_point(-_half_w, -_half_h, flip_angle);
    var _draw_x = _half_w + _off.x;
    var _draw_y = _half_h + _off.y;

    // scale the surface (native pixel size) to GUI size so it draws at the
    // same on-screen size the automatic app_surface blit normally would
    var _xscale = _gui_w / _sw;
    var _yscale = _gui_h / _sh;

    draw_surface_ext(flip_surface, _draw_x, _draw_y, _xscale, _yscale, flip_angle, c_white, 1);
}