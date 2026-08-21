// full-screen flip — copies the fully-rendered room content (everything
// drawn so far this frame, before Draw GUI) into our own surface, then
// paints a vertically-squished copy of it back on top. As flip_progress
// goes 0 -> 1 this reads as the whole screen physically flipping over
// (squishing to a line, then unsquishing upside-down) rather than an
// instant swap. Draw GUI still runs after this, so the UI/textboxes stay
// right-side-up on top of the flipped room.
if (flip_progress != 0)
{
    var _sw = surface_get_width(application_surface);
    var _sh = surface_get_height(application_surface);

    if (!surface_exists(flip_surface) || surface_get_width(flip_surface) != _sw || surface_get_height(flip_surface) != _sh)
    {
        if (surface_exists(flip_surface)) surface_free(flip_surface);
        flip_surface = surface_create(_sw, _sh);
    }

    surface_copy(flip_surface, 0, 0, application_surface);

    var _yscale = cos(pi * flip_progress); // 1 -> 0 -> -1
    var _draw_y = (_yscale >= 0) ? 0 : _sh;

    draw_surface_ext(flip_surface, 0, _draw_y, 1, _yscale, 0, c_white, 1);
}