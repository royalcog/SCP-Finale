function scr_get_box_interior()
{
    var _bb = obj_battlebox;
    var _pad_x = 15; // sprite's own idle-frame padding
    var _border = 8; // your new uniform border

    return {
        x1: _bb.x + _pad_x + _border,
        y1: _bb.y + _border,
        x2: _bb.x + _bb.sprite_width - _pad_x - _border,
        y2: _bb.y + _bb.sprite_height - _border
    };
}