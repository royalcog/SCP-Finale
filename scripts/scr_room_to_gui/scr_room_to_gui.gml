function scr_get_gui_scale()
{
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    return {
        vx: camera_get_view_x(view_camera[0]),
        vy: camera_get_view_y(view_camera[0]),
        sx: _gui_w / camera_get_view_width(view_camera[0]),
        sy: _gui_h / camera_get_view_height(view_camera[0])
    };
}

function scr_room_to_gui(_x, _y)
{
    var _g = scr_get_gui_scale();
    return { x: (_x - _g.vx) * _g.sx, y: (_y - _g.vy) * _g.sy, sx: _g.sx, sy: _g.sy };
}