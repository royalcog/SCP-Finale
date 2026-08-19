function scr_get_box_interior()
{
    var _bb = obj_battlebox;
    var _pad_x = 15;
    var _border = 8;

    var _w = _bb.sprite_width  * _bb.image_xscale;
    var _h = _bb.sprite_height * _bb.image_yscale;
    var _pad_x_s    = _pad_x  * _bb.image_xscale;
    var _border_x_s = _border * _bb.image_xscale;
    var _border_y_s = _border * _bb.image_yscale;

    return {
        x1: _bb.x + _pad_x_s + _border_x_s,
        y1: _bb.y + _border_y_s,
        x2: _bb.x + _w - _pad_x_s - _border_x_s,
        y2: _bb.y + _h - _border_y_s
    };
}