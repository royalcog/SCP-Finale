// full-screen flip — copies the fully-rendered frame (room content AND all
// normal Draw GUI content — the lighting/darkness cutout around the box,
// hand-punch/strip-flash/RPS-hand sprites, damage numbers, etc.) into our
// own surface, then spins that flat image around its own center by
// flip_angle degrees — the same rotate-around-center technique
// obj_battlebox already uses for its own spin (scr_rotate_point), just
// applied to the whole screen instead of one sprite.
//
// This has to run in Draw GUI END (after everything else has drawn),
// not Draw GUI Begin — a lot of this project's battle visuals (the box's
// lighting cutout, hand-punch sprites, strip flashes) are drawn manually
// in normal Draw GUI space rather than through the room camera. Capturing
// too early left all of that behind, unflipped, while only the plain room
// content spun — which is why the box looked disconnected from its own
// darkness cutout and the RPS hands looked misaligned/doubled during the
// flip. Capturing at the very end means everything that's visually on
// screen gets flipped together as one image, with nothing left behind.
//
// The only cost: anything drawn in Draw GUI (like an active textbox) would
// flip too if one were open here — but nothing calls a textbox during the
// shake/flip/laugh/attack2 window in this attack, so that's not an issue
// in practice.
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