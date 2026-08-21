// full-screen flip — copies the fully-rendered room content (everything
// drawn so far this frame, before Draw GUI) into our own surface, then
// spins that flat image around its own center by flip_angle degrees —
// the exact same rotate-around-center technique obj_battlebox already
// uses for its own spin (scr_rotate_point), just applied to the whole
// screen instead of one sprite. As flip_angle eases from 0 to 180 this
// reads as the screen physically spinning over, landing upside-down.
// Draw GUI still runs after this, so the UI/textboxes stay right-side-up
// on top of the flipped room.
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

    var _half_w = _sw / 2;
    var _half_h = _sh / 2;
    var _off = scr_rotate_point(-_half_w, -_half_h, flip_angle);
    var _draw_x = _half_w + _off.x;
    var _draw_y = _half_h + _off.y;

    draw_surface_ext(flip_surface, _draw_x, _draw_y, 1, 1, flip_angle, c_white, 1);
}